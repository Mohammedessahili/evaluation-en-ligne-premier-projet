package controller;

import java.io.IOException;

import jakarta.servlet.http.HttpSession; 
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import dao.UserDao;
import model.User;
@WebServlet("/Auth")
public class AuthServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public AuthServlet() {
        super();
    }

    
    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");

        String password = request.getParameter("password");

        UserDao userDao = new UserDao();

        User user = userDao.login(email, password);

        if(user != null) {
        	HttpSession session =request.getSession();
        	session.setAttribute("user", user);
        	session.setAttribute("role",user.getRole());
        	if(user.getRole().equals("professeur")) {

        	    response.sendRedirect("professeur/dashboard.jsp");

        	} else if(user.getRole().equals("etudiant")) {

        	    response.sendRedirect("etudiant/dashboard.jsp");

        	} else {

        	    response.sendRedirect("login.jsp");
        	}
        }
    }
}