package controller;

import java.io.IOException;

import dao.QuestionDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Question;

@WebServlet("/Question")
public class QuestionServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        String question = request.getParameter("question");
        String choix1 = request.getParameter("choix1");
        String choix2 = request.getParameter("choix2");
        String choix3 = request.getParameter("choix3");
        String bonne = request.getParameter("bonne");

        Question q = new Question();

        q.setQuestion(question);
        q.setChoix1(choix1);
        q.setChoix2(choix2);
        q.setChoix3(choix3);
        q.setBonneReponse(bonne);

        QuestionDao dao = new QuestionDao();

        if(dao.ajouterQuestion(q)) {

        	response.sendRedirect("professeur/ajouterQuestion.jsp?success=1");

        } else {

            response.getWriter().println("Erreur ajout question");
        }
    }
}