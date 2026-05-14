<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="model.User" %>
<%@ page import="dao.QuestionDao" %>
<%@ page import="dao.ResultatDao" %>
<%@ page import="dao.UserDao" %>

<%
    User user = (User) session.getAttribute("user");

    if(user == null || !user.getRole().equals("professeur")) {
        response.sendRedirect("../login.jsp");
        return;
    }

    QuestionDao qdao = new QuestionDao();
    ResultatDao rdao = new ResultatDao();
    UserDao udao = new UserDao();

    int totalQuestions = qdao.countQuestions();
    int totalEtudiants = udao.countEtudiants();
    int taux = rdao.tauxReussite();

    int scoreFaible = rdao.countScoresBetween(0, 5);
    int scoreMoyen = rdao.countScoresBetween(6, 10);
    int scoreBien = rdao.countScoresBetween(11, 15);
    int scoreExcellent = rdao.countScoresBetween(16, 20);

    double moyenne = rdao.moyenneGenerale();
    String meilleur = rdao.meilleurEtudiant();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Dashboard Professeur</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

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

<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
    <div class="container-fluid">

        <a class="navbar-brand" href="dashboard.jsp">
            <i class="bi bi-mortarboard-fill"></i>
            Espace Professeur
        </a>

        <div class="d-flex">
            <a href="ajouterQuestion.jsp" class="btn btn-outline-light me-2">
                <i class="bi bi-plus-circle"></i>
                Ajouter
            </a>

            <a href="listeQuestions.jsp" class="btn btn-outline-light me-2">
                <i class="bi bi-list-check"></i>
                Questions
            </a>

            <a href="listeResultats.jsp" class="btn btn-outline-light me-2">
                <i class="bi bi-bar-chart-fill"></i>
                Résultats
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

        <h1 class="text-primary">Espace Professeur</h1>

        <p class="text-muted mb-4">
            Bienvenue <%= user.getNom() %>
        </p>

        <div class="row mb-4">

            <div class="col-md-4 mb-3">
                <div class="card shadow border-0 text-center p-4">
                    <i class="bi bi-list-check display-4 text-primary"></i>
                    <h2 class="mt-3"><%= totalQuestions %></h2>
                    <p class="text-muted">Questions</p>
                </div>
            </div>

            <div class="col-md-4 mb-3">
                <div class="card shadow border-0 text-center p-4">
                    <i class="bi bi-people-fill display-4 text-success"></i>
                    <h2 class="mt-3"><%= totalEtudiants %></h2>
                    <p class="text-muted">Étudiants</p>
                </div>
            </div>

            <div class="col-md-4 mb-3">
                <div class="card shadow border-0 text-center p-4">
                    <i class="bi bi-bar-chart-fill display-4 text-danger"></i>
                    <h2 class="mt-3"><%= taux %>%</h2>
                    <p class="text-muted">Réussite</p>
                </div>
            </div>

        </div>

        <div class="row mb-4">

            <div class="col-md-6 mb-3">
                <div class="card shadow border-0 text-center p-4 h-100">
                    <i class="bi bi-graph-up-arrow display-4 text-success"></i>
                    <h2 class="mt-3"><%= String.format("%.2f", moyenne) %></h2>
                    <p class="text-muted">Moyenne Générale</p>
                </div>
            </div>

            <div class="col-md-6 mb-3">
                <div class="card shadow border-0 text-center p-4 h-100">
                    <i class="bi bi-trophy-fill display-4 text-warning"></i>
                    <h5 class="mt-3"><%= meilleur %></h5>
                    <p class="text-muted">Meilleur Étudiant</p>
                </div>
            </div>

        </div>

        <div class="row mt-4">

            <div class="col-md-4 mb-3">
                <div class="card shadow border-0 h-100">
                    <div class="card-body text-center p-5">
                        <i class="bi bi-plus-circle-fill display-3 text-primary"></i>
                        <h3 class="mt-3">Ajouter</h3>
                        <p class="text-muted">Ajouter une nouvelle question.</p>
                        <a href="ajouterQuestion.jsp" class="btn btn-primary px-4">Ajouter</a>
                    </div>
                </div>
            </div>

            <div class="col-md-4 mb-3">
                <div class="card shadow border-0 h-100">
                    <div class="card-body text-center p-5">
                        <i class="bi bi-list-check display-3 text-success"></i>
                        <h3 class="mt-3">Questions</h3>
                        <p class="text-muted">Gérer toutes les questions.</p>
                        <a href="listeQuestions.jsp" class="btn btn-success px-4">Voir</a>
                    </div>
                </div>
            </div>

            <div class="col-md-4 mb-3">
                <div class="card shadow border-0 h-100">
                    <div class="card-body text-center p-5">
                        <i class="bi bi-bar-chart-line-fill display-3 text-dark"></i>
                        <h3 class="mt-3">Résultats</h3>
                        <p class="text-muted">Consulter les résultats étudiants.</p>
                        <a href="listeResultats.jsp" class="btn btn-dark px-4">Voir</a>
                    </div>
                </div>
            </div>

        </div>

        <div class="card shadow border-0 p-4 mb-5 mt-4">
            <h3 class="mb-4 text-primary">Statistiques des Scores</h3>
            <canvas id="scoresChart"></canvas>
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
                    <li><a href="../index.jsp" class="text-decoration-none text-light">Accueil</a></li>
                    <li><a href="ajouterQuestion.jsp" class="text-decoration-none text-light">Ajouter</a></li>
                    <li><a href="listeQuestions.jsp" class="text-decoration-none text-light">Questions</a></li>
                    <li><a href="listeResultats.jsp" class="text-decoration-none text-light">Résultats</a></li>
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

<script>
const ctx = document.getElementById('scoresChart');

new Chart(ctx, {
    type: 'bar',

    data: {
        labels: ['0-5', '6-10', '11-15', '16-20'],

        datasets: [{
            label: 'Nombre Étudiants',
            data: [
                <%= scoreFaible %>,
                <%= scoreMoyen %>,
                <%= scoreBien %>,
                <%= scoreExcellent %>
            ],
            backgroundColor: [
                '#dc3545',
                '#ffc107',
                '#0d6efd',
                '#198754'
            ],
            borderRadius: 10,
            borderWidth: 1
        }]
    },

    options: {
        responsive: true,
        scales: {
            y: {
                beginAtZero: true
            }
        }
    }
});
</script>

</body>
</html>