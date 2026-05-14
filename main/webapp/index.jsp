<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="fr">
<head>
<meta charset="UTF-8">
<title>Système d'Évaluation en Ligne</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<body class="bg-light">

<div class="container vh-100 d-flex justify-content-center align-items-center">

    <div class="card shadow p-5 text-center" style="max-width: 500px; width: 100%;">

        <h1 class="text-primary mb-3">
            Évaluation en Ligne
        </h1>

        <p class="text-muted mb-4">
            Choisissez votre espace de connexion
        </p>

        <a href="login.jsp?role=professeur" class="btn btn-primary btn-lg mb-3 w-100">
            Je suis Professeur
        </a>

        <a href="login.jsp?role=etudiant" class="btn btn-success btn-lg w-100">
            Je suis Étudiant
        </a>

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