package unoeste.fipp.playmysongs;

import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@MultipartConfig(
        location="/",
        fileSizeThreshold=1024*1024,    // 1MB *
        maxFileSize=1024*1024*100,      // 100MB **
        maxRequestSize=1024*1024*10*10  // 100MB ***
)
@WebServlet(name = "pesquisarServlet", value = "/pesquisar-servlet")
public class PesquisarServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String nome = request.getParameter("filtro");
        if(nome!=null){
            String escolha = request.getParameter("escolha");
            Pesquisar p = new Pesquisar(nome,escolha.charAt(0));
            HttpSession session = request.getSession();
            session.setAttribute("filtro",p);
        }
        response.sendRedirect("./index.jsp");
        return;
    }
}