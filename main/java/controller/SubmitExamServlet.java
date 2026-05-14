package controller;

import java.io.IOException;
import java.util.List;

import dao.ResultatDao;
import jakarta.servlet.http.HttpSession;
import model.User;

import dao.QuestionDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Question;

@WebServlet("/SubmitExam")
public class SubmitExamServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        QuestionDao dao = new QuestionDao();
        List<Question> questions = dao.listerQuestions();

        int score = 0;

        for(Question q : questions) {

            String reponseEtudiant =
                    request.getParameter("q_" + q.getId());

            if(reponseEtudiant != null &&
               reponseEtudiant.equals(q.getBonneReponse())) {

                score++;
            }
        }
        HttpSession session = request.getSession(false);

        if(session != null) {
            User user = (User) session.getAttribute("user");

            if(user != null) {
                ResultatDao resultatDao = new ResultatDao();
                resultatDao.ajouterResultat(user.getEmail(), score, questions.size());
            }
        }
        request.setAttribute("score", score);
        request.setAttribute("total", questions.size());

        request.getRequestDispatcher("etudiant/resultat.jsp")
               .forward(request, response);
    }
}