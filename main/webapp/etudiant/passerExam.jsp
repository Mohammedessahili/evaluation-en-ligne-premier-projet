<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Question" %>
<%@ page import="dao.QuestionDao" %>
<%@ page import="model.User" %>

<%
    User user = (User) session.getAttribute("user");

    if(user == null || !user.getRole().equals("etudiant")) {
        response.sendRedirect("../login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Passer Examen</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script>
    let timeLeft = 120;

    function startTimer() {
        let timer = document.getElementById("timer");

        let interval = setInterval(function() {
            let minutes = Math.floor(timeLeft / 60);
            let seconds = timeLeft % 60;

            timer.innerHTML = minutes + ":" + (seconds < 10 ? "0" : "") + seconds;

            if(timeLeft <= 0) {
                clearInterval(interval);
                document.getElementById("examForm").submit();
            }

            timeLeft--;
        }, 1000);
    }

    window.onload = startTimer;
</script>
</head>
<body class="d-flex flex-column min-vh-100 bg-light">
<div class="flex-grow-1">
<div class="container mt-5">

    <div class="row justify-content-center">

        <div class="col-md-8">

            <div class="card shadow p-5">

                <h1 class="text-primary text-center mb-5">
                    Passer Examen
                </h1>
				<div class="alert alert-warning text-center">
   						 Temps restant : <strong id="timer">2:00</strong>
				</div>
                <form id="examForm" action="../SubmitExam" method="post">

                <%
                    QuestionDao dao = new QuestionDao();
                    List<Question> questions = dao.listerQuestions();

                    for(Question q : questions) {
                %>

                    <div class="card mb-4 border-0 shadow-sm">

                        <div class="card-body">

                            <h5 class="mb-4">
                                <%= q.getQuestion() %>
                            </h5>

                            <div class="form-check mb-2">
                                <input class="form-check-input"
                                       type="radio"
                                       name="q_<%= q.getId() %>"
                                       value="1">

                                <label class="form-check-label">
                                    <%= q.getChoix1() %>
                                </label>
                            </div>

                            <div class="form-check mb-2">
                                <input class="form-check-input"
                                       type="radio"
                                       name="q_<%= q.getId() %>"
                                       value="2">

                                <label class="form-check-label">
                                    <%= q.getChoix2() %>
                                </label>
                            </div>

                            <div class="form-check mb-2">
                                <input class="form-check-input"
                                       type="radio"
                                       name="q_<%= q.getId() %>"
                                       value="3">

                                <label class="form-check-label">
                                    <%= q.getChoix3() %>
                                </label>
                            </div>

                        </div>

                    </div>

                <%
                    }
                %>

                    <div class="text-center">

                        <button type="submit"
                                class="btn btn-primary btn-lg">
                            Envoyer Examen
                        </button>

                    </div>

                </form>

            </div>

        </div>

    </div>

</div>
</div>
<footer class="bg-dark text-white mt-5 py-4">
    <div class="container">

        <div class="row">

            <div class="col-md-6">
                <h5>Système Évaluation En Ligne</h5>

                <p class="text-light">
                    Plateforme moderne pour la gestion
                    des examens et des évaluations
                    des étudiants.
                </p>
            </div>

            <div class="col-md-3">
                <h5>Navigation</h5>

                <ul class="list-unstyled">

                    <li>
                        <a href="#"
                           class="text-decoration-none text-light">
                           Accueil
                        </a>
                    </li>

                    <li>
                        <a href="#"
                           class="text-decoration-none text-light">
                           Examens
                        </a>
                    </li>

                    <li>
                        <a href="#"
                           class="text-decoration-none text-light">
                           Résultats
                        </a>
                    </li>

                </ul>
            </div>

            <div class="col-md-3">
                <h5>Contact</h5>

                <p class="text-light mb-1">
                    Prof Mohammed Essahili
                </p>

                <p class="text-light mb-1">
                    Safi - Maroc
                </p>

                <p class="text-light">
                    2026
                </p>
            </div>

        </div>

        <hr class="bg-light">

        <div class="text-center">
            © 2026 Tous droits réservés
        </div>

    </div>
</footer>
</body>
</html>