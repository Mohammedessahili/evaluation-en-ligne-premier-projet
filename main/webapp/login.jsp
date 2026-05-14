<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%
    String role = request.getParameter("role");

    if(role == null) {
        role = "etudiant";
    }
%>

<!DOCTYPE html>
<html lang="fr">
<head>
<meta charset="UTF-8">
<title>Connexion</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

</head>

<body class="bg-light">

<div class="container vh-100 d-flex justify-content-center align-items-center">

    <div class="card shadow p-5" style="width: 450px;">

        <h2 class="text-center mb-4 text-primary">
            Connexion <%= role %>
        </h2>

        <form action="Auth" method="post">

            <div class="mb-3">
                <label class="form-label">
                    Email
                </label>

                <input type="email"
                       name="email"
                       class="form-control"
                       required>
            </div>

            <div class="mb-4">
                <label class="form-label">
                    Mot de passe
                </label>

                <input type="password"
                       name="password"
                       class="form-control"
                       required>
            </div>

            <button type="submit"
                    class="btn btn-primary w-100">
                Se connecter
            </button>

        </form>

        <div class="text-center mt-3">
            <a href="index.jsp">
                Retour
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