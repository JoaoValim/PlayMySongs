package unoeste.fipp.playmysongs;

import java.io.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.text.Normalizer;
import java.util.Collection;

@MultipartConfig(
        location="/",
        fileSizeThreshold=1024*1024,    // 1MB *
        maxFileSize=1024*1024*100,      // 100MB **
        maxRequestSize=1024*1024*10*10  // 100MB ***
)
@WebServlet(name = "uploadServlet", value = "/up-servlet")
public class UploadServlet extends HttpServlet {

    public static String formatFileName(String input) {
        // Remover acentuações
        String normaliza = Normalizer.normalize(input, Normalizer.Form.NFD);
        String semAcentos = normaliza.replaceAll("[^\\p{ASCII}]", "");

        // Substituir espaços por underlines
        String formatado = semAcentos.trim();

        return formatado;
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String nome, estilo, cantor;
                File pastaMusicas = new File(getServletContext().getRealPath("/")+"/musicas");
        if (!pastaMusicas.exists()) {
            pastaMusicas.mkdir();
        }
        nome = request.getParameter("nomeMusica");
        estilo = request.getParameter("estilo");
        cantor = request.getParameter("cantor");
        String nomeArquivo = formatFileName(nome) + "_" + formatFileName(estilo) + "_" + formatFileName(cantor) + ".mp3";
        // Obter o Part do arquivo
        Part arquivoPart = request.getPart("file");
        // Criar o caminho completo do arquivo
        String caminhoCompleto = pastaMusicas + File.separator + nomeArquivo;
        // Salvar o arquivo no servidor
        try (InputStream arquivoInputStream = arquivoPart.getInputStream();
             FileOutputStream arquivoOutputStream = new FileOutputStream(caminhoCompleto)) {
            byte[] buffer = new byte[1024];
            int bytesRead;
            while ((bytesRead = arquivoInputStream.read(buffer)) != -1) {
                arquivoOutputStream.write(buffer, 0, bytesRead);
            }
            System.out.println("Arquivo salvo com sucesso em: " + caminhoCompleto);
        } catch (IOException e) {
            System.err.println("Erro ao salvar o arquivo: " + e.getMessage());
        }
        response.sendRedirect("./enviamusica.jsp");
        return;
    }
}