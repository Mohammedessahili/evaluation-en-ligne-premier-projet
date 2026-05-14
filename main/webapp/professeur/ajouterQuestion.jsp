<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="model.User" %>

<%
    User user = (User) session.getAttribute("user");

    if(user == null || !user.getRole().equals("professeur")) {
        response.sendRedirect("../login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ajouter Question</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="d-flex flex-column min-vh-100 bg-light">
<div class="flex-grow-1">
<div class="container mt-5">

    <div class="row justify-content-center">

        <div class="col-md-7">

            <div class="card shadow p-5">

                <h1 class="text-primary mb-4 text-center">
                    Ajouter Question
                </h1>
				<%
					    String success = request.getParameter("success");
					
					    if(success != null) {
					%>
					
					<div class="alert alert-success">
					    Question ajoutée avec succès !
					</div>
					
					<%
					    }
					%>
                <form action="../Question" method="post">

                    <div class="mb-3">
                        <label class="form-label">
                            Question
                        </label>

                        <input type="text"
                               name="question"
                               class="form-control"
                               required>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">
                            Choix 1
                        </label>

                        <input type="text"
                               name="choix1"
                               class="form-control"
                               required>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">
                            Choix 2
                        </label>

                        <input type="text"
                               name="choix2"
                               class="form-control"
                               required>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">
                            Choix 3
                        </label>

                        <input type="text"
                               name="choix3"
                               class="form-control"
                               required>
                    </div>

                    <div class="mb-4">
                        <label class="form-label">
                            Bonne réponse
                        </label>

                        <input type="text"
                               name="bonneReponse"
                               class="form-control"
                               required>
                    </div>

                    <div class="d-flex justify-content-between">

                        <a href="dashboard.jsp"
                           class="btn btn-secondary">
                            Retour
                        </a>

                        <button type="submit"
                                class="btn btn-primary">
                            Ajouter
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