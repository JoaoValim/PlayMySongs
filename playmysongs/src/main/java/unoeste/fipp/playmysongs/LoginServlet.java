                                                                                                                   package unoeste.fipp.playmysongs;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import unoeste.fipp.playmysongs.security.User;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

                                                                                                                   @WebServlet(name = "loginServlet", value = "/login-servlet")
public class LoginServlet extends HttpServlet {

    public static boolean validarEmail(String email) {
        // Expressão regular para validar um endereço de email
        String regex = "^[a-zA-Z0-9_+&*-]+(?:\\.[a-zA-Z0-9_+&*-]+)*@(?:[a-zA-Z0-9-]+\\.)+[a-zA-Z]{2,7}$";

        // Compilar a expressão regular em um objeto Pattern
        Pattern pattern = Pattern.compile(regex);

        // Criar um objeto Matcher
        Matcher matcher = pattern.matcher(email);

        // Verificar se o email corresponde à expressão regular
        return matcher.matches();
    }

    public boolean validarPswd(String nome,String pswd){
        String[] partes = nome.split("@");
        return pswd.compareToIgnoreCase(partes[0])==0;
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String nome = request.getParameter("username");
        if(nome!=null && validarEmail(nome)){
            String pswd = request.getParameter("pswd");
            if(pswd!=null && validarPswd(nome,pswd)){
                User user = new User(nome);
                HttpSession session = request.getSession();
                session.setMaxInactiveInterval(60);
                session.setAttribute("user",user);
                response.sendRedirect("./index.jsp");
                return;
            }
        }
        response.sendRedirect("./index.jsp");
        return;
    }

    public void destroy() {
    }
}