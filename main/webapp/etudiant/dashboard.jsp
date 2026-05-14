<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
<title>Dashboard Étudiant</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">

<style>
.card {
    transition: 0.3s;
}

.card:hover {
    transform: translateY(-5px);
}
</style>
</head>

<body class="d-flex flex-column min-vh-100 bg-light">

<div class="flex-grow-1">

<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container-fluid">

        <a class="navbar-brand" href="dashboard.jsp">
            <i class="bi bi-person-circle"></i>
            Espace Étudiant
        </a>

        <div class="d-flex">
            <a href="passerExam.jsp" class="btn btn-outline-light me-2">
                <i class="bi bi-pencil-square"></i>
                Passer Examen
            </a>

            <a href="mesResultats.jsp" class="btn btn-outline-light me-2">
                <i class="bi bi-clipboard-data"></i>
                Mes Résultats
            </a>

            <a href="../Logout" class="btn btn-danger">
                <i class="bi bi-box-arrow-right"></i>
                Déconnexion
            </a>
        </div>

    </div>
</nav>

<div class="container py-5">

    <div class="card shadow p-5 border-0">

        <h1 class="text-success">
            Espace Étudiant
        </h1>

        <p class="text-muted mb-4">
            Bienvenue <%= user.getNom() %>
        </p>

        <div class="row mt-4">

            <div class="col-md-6 mb-3">

                <div class="card shadow border-0 h-100">

                    <div class="card-body text-center p-5">

                        <i class="bi bi-pencil-square display-3 text-primary"></i>

                        <h3 class="mt-3">Passer Examen</h3>

                        <p class="text-muted">
                            Commencez votre évaluation en ligne.
                        </p>

                        <a href="passerExam.jsp" class="btn btn-primary px-4">
                            Commencer
                        </a>

                    </div>

                </div>

            </div>

            <div class="col-md-6 mb-3">

                <div class="card shadow border-0 h-100">

                    <div class="card-body text-center p-5">

                        <i class="bi bi-bar-chart-fill display-3 text-success"></i>

                        <h3 class="mt-3">Mes Résultats</h3>

                        <p class="text-muted">
                            Consultez vos notes et statistiques.
                        </p>

                        <a href="mesResultats.jsp" class="btn btn-success px-4">
                            Voir Résultats
                        </a>

                    </div>

                </div>

            </div>

        </div>

    </div>

</div>

</div>

<footer class="bg-dark text-white mt-auto py-4">
    <div class="container">

        <div class="row">

            <div class="col-md-6">
                <h5>Système Évaluation En Ligne</h5>
                <p class="text-light">
                    Plateforme moderne pour la gestion des examens
                    et des évaluations des étudiants.
                </p>
            </div>

            <div class="col-md-3">
                <h5>Navigation</h5>

                <ul class="list-unstyled">
                    <li>
                        <a href="../index.jsp" class="text-decoration-none text-light">
                            Accueil
                        </a>
                    </li>
                    <li>
                        <a href="passerExam.jsp" class="text-decoration-none text-light">
                            Examens
                        </a>
                    </li>
                    <li>
                        <a href="mesResultats.jsp" class="text-decoration-none text-light">
                            Résultats
                        </a>
                    </li>
                </ul>
            </div>

            <div class="col-md-3">
                <h5>Contact</h5>
                <p class="text-light mb-1">Prof Mohammed Essahili</p>
                <p class="text-light mb-1">Safi - Maroc</p>
                <p class="text-light">2026</p>
            </div>

        </div>

        <hr>

        <div class="text-center">
            © 2026 Tous droits réservés
        </div>

    </div>
</footer>

</body>
</html>