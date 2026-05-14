<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Question" %>
<%@ page import="dao.QuestionDao" %>
<%@ page import="model.User" %>

<%
    User user = (User) session.getAttribute("user");

    if(user == null || !user.getRole().equals("professeur")) {
        response.sendRedirect("../login.jsp");
        return;
    }

    QuestionDao dao = new QuestionDao();
    List<Question> questions = dao.listerQuestions();

    String deleted = request.getParameter("deleted");
    String updated = request.getParameter("updated");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Liste des Questions</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">

<link href="https://cdn.datatables.net/2.0.8/css/dataTables.bootstrap5.css" rel="stylesheet">
</head>

<body class="bg-light">

<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
    <div class="container-fluid">

        <a class="navbar-brand" href="dashboard.jsp">
            <i class="bi bi-mortarboard-fill"></i>
            Espace Professeur
        </a>

        <div class="d-flex">
            <a href="dashboard.jsp" class="btn btn-outline-light me-2">
                Dashboard
            </a>

            <a href="ajouterQuestion.jsp" class="btn btn-outline-light me-2">
                <i class="bi bi-plus-circle"></i>
                Ajouter
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

<div class="container mt-5">

    <div class="card shadow p-4 border-0">

        <div class="d-flex justify-content-between align-items-center mb-4">
            <h1 class="text-primary">
                Liste des Questions
            </h1>

            <a href="ajouterQuestion.jsp" class="btn btn-success">
                <i class="bi bi-plus-circle"></i>
                Nouvelle Question
            </a>
        </div>

        <% if(deleted != null) { %>
            <div class="alert alert-danger">
                Question supprimée avec succès !
            </div>
        <% } %>

        <% if(updated != null) { %>
            <div class="alert alert-success">
                Question modifiée avec succès !
            </div>
        <% } %>

        <table id="questionsTable" class="table table-bordered table-hover table-striped">

            <thead class="table-dark">
                <tr>
                    <th>ID</th>
                    <th>Question</th>
                    <th>Choix 1</th>
                    <th>Choix 2</th>
                    <th>Choix 3</th>
                    <th>Bonne réponse</th>
                    <th>Action</th>
                </tr>
            </thead>

            <tbody>

            <%
                for(Question q : questions) {
            %>

                <tr>
                    <td><%= q.getId() %></td>
                    <td><%= q.getQuestion() %></td>
                    <td><%= q.getChoix1() %></td>
                    <td><%= q.getChoix2() %></td>
                    <td><%= q.getChoix3() %></td>
                    <td><%= q.getBonneReponse() %></td>

                    <td>
                        <a href="modifierQuestion.jsp?id=<%= q.getId() %>"
                           class="btn btn-warning btn-sm">
                            <i class="bi bi-pencil-square"></i>
                            Modifier
                        </a>

                        <a href="../DeleteQuestion?id=<%= q.getId() %>"
                           class="btn btn-danger btn-sm"
                           onclick="return confirm('Voulez-vous supprimer cette question ?')">
                            <i class="bi bi-trash"></i>
                            Supprimer
                        </a>
                    </td>
                </tr>

            <%
                }
            %>

            </tbody>

        </table>

    </div>

</div>

<footer class="bg-dark text-white mt-5 py-4">
    <div class="container text-center">
        <p class="mb-1">© 2026 Système Évaluation En Ligne</p>
        <small>Développé par Prof Mohammed Essahili</small>
    </div>
</footer>

<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script src="https://cdn.datatables.net/2.0.8/js/dataTables.js"></script>
<script src="https://cdn.datatables.net/2.0.8/js/dataTables.bootstrap5.js"></script>

<script>
    new DataTable('#questionsTable', {
        language: {
            search: "Rechercher :",
            lengthMenu: "Afficher _MENU_ entrées par page",
            info: "Affichage de _START_ à _END_ sur _TOTAL_ entrées",
            infoEmpty: "Aucune entrée disponible",
            infoFiltered: "(filtré de _MAX_ entrées au total)",
            zeroRecords: "Aucun résultat trouvé",
            emptyTable: "Aucune donnée disponible",
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