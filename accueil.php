<?php
session_start();

// Si l'utilisateur n'est pas connecté, on le renvoie au login
if (!isset($_SESSION["user_id"])) {
    header("Location: login.php");
    exit;
}

// Nom de l'utilisateur
$userName = "Utilisateur";
if (isset($_SESSION["user_name"])) {
    $userName = $_SESSION["user_name"];
}
?>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Accueil - Clinique</title>
</head>
<body>

    <header>
        <h1>Clinique – Accueil</h1>
        <p>
            Bonjour, <?php echo htmlspecialchars($userName); ?>
            | <a href="logout.php">Déconnexion</a>
        </p>
        <hr>
    </header>

    <main>
        <h2>Tableau de bord</h2>
        <p>Choisissez une section :</p>

        <ul>
            <li><a href="services.php">Services</a></li>
            <li><a href="doctors.php">Doctors</a></li>
            <li><a href="make_appointment.php">Prendre un rendez-vous</a></li>
            <li><a href="my_appointments.php">Mes rendez-vous</a></li>
        </ul>
    </main>

</body>
</html>
