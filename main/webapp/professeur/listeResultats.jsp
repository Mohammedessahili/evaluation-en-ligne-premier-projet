<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ page import="java.util.List" %>
<%@ page import="model.Resultat" %>
<%@ page import="dao.ResultatDao" %>
<%@ page import="model.User" %>

<%
    User user = (User) session.getAttribute("user");

    if(user == null){
        response.sendRedirect("../login.jsp");
        return;
    }

    if(!user.getRole().equals("professeur")){
        response.sendRedirect("../login.jsp");
        return;
    }

    ResultatDao dao = new ResultatDao();
    List<Resultat> liste = dao.listerResultats();
%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<title>Liste Résultats</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
      rel="stylesheet">

<link rel="stylesheet"
href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">

<link rel="stylesheet"
href="https://cdn.datatables.net/2.0.8/css/dataTables.dataTables.min.css">

<style>

    body{
        background:#f5f7fb;
    }

    .page-title{
        color:#0d6efd;
        font-weight:bold;
    }

    .card-custom{
        border:none;
        border-radius:15px;
    }

    .table thead{
        background:#212529;
        color:white;
    }

    footer{
        background:#212529;
    }

</style>

</head>

<body class="d-flex flex-column min-vh-100">

<div class="flex-grow-1">

<!-- NAVBAR -->

<nav class="navbar navbar-expand-lg navbar-dark bg-primary shadow">

    <div class="container-fluid">

        <a class="navbar-brand fw-bold"
           href="dashboard.jsp">

            <i class="bi bi-mortarboard-fill"></i>
            Espace Professeur

        </a>

        <div class="d-flex">

            <a href="dashboard.jsp"
               class="btn btn-outline-light me-2">

                <i class="bi bi-house-door"></i>
                Dashboard

            </a>

            <a href="ajouterQuestion.jsp"
               class="btn btn-outline-light me-2">

                <i class="bi bi-plus-circle"></i>
                Ajouter

            </a>

            <a href="listeQuestions.jsp"
               class="btn btn-outline-light me-2">

                <i class="bi bi-list-ul"></i>
                Questions

            </a>

            <a href="../Logout"
               class="btn btn-danger">

                <i class="bi bi-box-arrow-right"></i>
                Déconnexion

            </a>

        </div>

    </div>

</nav>

<!-- CONTENT -->

<div class="container py-5">

    <div class="card shadow card-custom">

        <div class="card-body p-4">

            <div class="mb-4">

                <h1 class="page-title">
                    Liste des Résultats
                </h1>

                <p class="text-muted">
                    Gestion des résultats des étudiants
                </p>

            </div>

            <div class="table-responsive">

                <table id="resultatsTable"
                       class="table table-bordered table-hover align-middle">

                    <thead>

                        <tr>

                            <th>ID</th>
                            <th>Email Étudiant</th>
                            <th>Score</th>
                            <th>Total</th>
                            <th>Pourcentage</th>
                            <th>Date</th>

                        </tr>

                    </thead>

                    <tbody>

                    <%
                        for(Resultat r : liste){

                            double pourcentage =
                            ((double) r.getScore() / r.getTotal()) * 100;
                    %>

                        <tr>

                            <td>
                                <%= r.getId() %>
                            </td>

                            <td>
                                <%= r.getEtudiantEmail() %>
                            </td>

                            <td>

                                <span class="badge bg-success fs-6">

                                    <%= r.getScore() %>

                                </span>

                            </td>

                            <td>

                                <%= r.getTotal() %>

                            </td>

                            <td style="width:250px;">

                                <div class="progress"
                                     style="height:25px;">

                                    <div class="progress-bar
                                    <%= pourcentage >= 50
                                    ? "bg-success"
                                    : "bg-danger" %>"

                                    role="progressbar"

                                    style="width:<%= pourcentage %>%">

                                        <%= (int) pourcentage %>%

                                    </div>

                                </div>

                            </td>

                            <td>

                                <%= r.getDatePassage() %>

                            </td>

                        </tr>

                    <%
                        }
                    %>

                    </tbody>

                </table>

            </div>

        </div>

    </div>

</div>

</div>

<!-- FOOTER -->

<footer class="text-white py-4 mt-5">

    <div class="container text-center">

        <h5>
            Système Évaluation En Ligne
        </h5>

        <p class="mb-1">
            Gestion moderne des examens et des résultats
        </p>

        <small>
            © 2026 Développé par Prof Mohammed Essahili
        </small>

    </div>

</footer>

<!-- JS -->

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

<script src="https://cdn.datatables.net/2.0.8/js/dataTables.min.js"></script>

<script>

new DataTable('#resultatsTable', {

    language: {

        search: "Rechercher :",

        lengthMenu:
        "Afficher _MENU_ entrées par page",

        info:
        "Affichage de _START_ à _END_ sur _TOTAL_ entrées",

        infoEmpty:
        "Aucune entrée disponible",

        infoFiltered:
        "(filtré de _MAX_ entrées au total)",

        zeroRecords:
        "Aucun résultat trouvé",

        emptyTable:
        "Aucune donnée disponible",

        paginate: {

            first: "Premier",
            previous: "Précédent",
            next: "Suivant",
            last: "Dernier"

        }

    }

});

</script>

</body>
</html>