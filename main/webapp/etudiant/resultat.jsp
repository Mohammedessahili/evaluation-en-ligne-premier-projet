<%@ page contentType="text/html;charset=UTF-8" %>
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
<title>Résultat</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="d-flex flex-column min-vh-100 bg-light">
<div class="flex-grow-1">
<div class="container vh-100 d-flex justify-content-center align-items-center">

    <div class="card shadow p-5 text-center" style="width: 500px;">

        <h1 class="text-primary mb-4">
            Résultat de l'Examen
        </h1>

        <div class="display-3 fw-bold text-success mb-3">

            <%= request.getAttribute("score") %>
            /
            <%= request.getAttribute("total") %>

        </div>

        <p class="text-muted mb-4">
            Merci d'avoir passé votre examen
        </p>

        <a href="etudiant/dashboard.jsp"
           class="btn btn-primary w-100">
            Retour Dashboard
        </a>

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