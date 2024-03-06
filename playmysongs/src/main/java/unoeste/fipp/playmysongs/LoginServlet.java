                                                                                                                   package unoeste.fipp.playmysongs;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import unoeste.fipp.playmysongs.security.User;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "loginServlet", value = "/login-servlet")
public class LoginServlet extends HttpServlet {


    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        System.out.println("Oi");
        String nome = request.getParameter("username");
        if(nome!=null){
            String pswd = request.getParameter("pswd");
            if(pswd!=null){
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