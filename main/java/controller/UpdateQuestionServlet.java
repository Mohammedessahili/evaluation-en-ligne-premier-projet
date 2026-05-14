package controller;

import java.io.IOException;

import dao.QuestionDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Question;

@WebServlet("/UpdateQuestion")
public class UpdateQuestionServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));

        Question q = new Question();

        q.setId(id);
        q.setQuestion(request.getParameter("question"));
        q.setChoix1(request.getParameter("choix1"));
        q.setChoix2(request.getParameter("choix2"));
        q.setChoix3(request.getParameter("choix3"));
        q.setBonneReponse(request.getParameter("bonne"));

        QuestionDao dao = new QuestionDao();
        dao.modifierQuestion(q);

        response.sendRedirect("professeur/listeQuestions.jsp?updated=1");
       
    }
}