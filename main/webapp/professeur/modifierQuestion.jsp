<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="model.User" %>
<%@ page import="model.Question" %>
<%@ page import="dao.QuestionDao" %>

<%
    User user = (User) session.getAttribute("user");

    if(user == null || !user.getRole().equals("professeur")) {
        response.sendRedirect("../login.jsp");
        return;
    }

    int id = Integer.parseInt(request.getParameter("id"));

    QuestionDao dao = new QuestionDao();
    Question q = dao.getQuestionById(id);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Modifier Question</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
</head>

<body class="d-flex flex-column min-vh-100 bg-light">

<div class="flex-grow-1">

<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
    <div class="container-fluid">

        <a class="navbar-brand" href="dashboard.jsp">
            <i class="bi bi-mortarboard-fill"></i>
            Espace Professeur
        </a>

        <div class="d-flex">
            <a href="dashboard.jsp" class="btn btn-outline-light me-2">Dashboard</a>
            <a href="listeQuestions.jsp" class="btn btn-outline-light me-2">Questions</a>
            <a href="../Logout" class="btn btn-danger">Déconnexion</a>
        </div>

    </div>
</nav>

<div class="container py-5">

    <div class="row justify-content-center">

        <div class="col-md-8">

            <div class="card shadow p-5 border-0">

                <h1 class="text-primary text-center mb-4">
                    Modifier Question
                </h1>

                <form action="../UpdateQuestion" method="post">

                    <input type="hidden" name="id" value="<%= q.getId() %>">

                    <div class="mb-3">
                        <label class="form-label">Question</label>
                        <input type="text"
                               name="question"
                               class="form-control"
                               value="<%= q.getQuestion() %>"
                               required>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Choix 1</label>
                        <input type="text"
                               name="choix1"
                               class="form-control"
                               value="<%= q.getChoix1() %>"
                               required>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Choix 2</label>
                        <input type="text"
                               name="choix2"
                               class="form-control"
                               value="<%= q.getChoix2() %>"
                               required>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Choix 3</label>
                        <input type="text"
                               name="choix3"
                               class="form-control"
                               value="<%= q.getChoix3() %>"
                               required>
                    </div>

                    <div class="mb-4">
                        <label class="form-label">Bonne réponse</label>
                        <select name="bonne" class="form-select" required>
                            <option value="1" <%= "1".equals(q.getBonneReponse()) ? "selected" : "" %>>
                                Choix 1
                            </option>

                            <option value="2" <%= "2".equals(q.getBonneReponse()) ? "selected" : "" %>>
                                Choix 2
                            </option>

                            <option value="3" <%= "3".equals(q.getBonneReponse()) ? "selected" : "" %>>
                                Choix 3
                            </option>
                        </select>
                    </div>

                    <div class="d-flex justify-content-between">

                        <a href="listeQuestions.jsp" class="btn btn-secondary">
                            Retour
                        </a>

                        <button type="submit" class="btn btn-primary">
                            Modifier
                        </button>

                    </div>

                </form>

            </div>

        </div>

    </div>

</div>

</div>

<footer class="bg-dark text-white mt-auto py-4">
    <div class="container text-center">
        <p class="mb-1">© 2026 Système Évaluation En Ligne</p>
        <small>Développé par Prof Mohammed Essahili</small>
    </div>
</footer>

</body>
</html>