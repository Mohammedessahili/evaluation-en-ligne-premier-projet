package controller;

import java.io.IOException;

import dao.QuestionDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/DeleteQuestion")
public class DeleteQuestionServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));

        QuestionDao dao = new QuestionDao();

        dao.supprimerQuestion(id);

        response.sendRedirect("professeur/listeQuestions.jsp?deleted=1");
    }
}