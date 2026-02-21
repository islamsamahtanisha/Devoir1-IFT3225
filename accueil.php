<?php

ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

session_start();

if (!isset($_SESSION["user_id"])) {
    header("Location: login.php");
    exit;
}

$userName = "Utilisateur";
if (isset($_SESSION["user_name"])) {
    $userName = $_SESSION["user_name"];
}


require "db_inc.php"; 
$userId = (int) $_SESSION["user_id"];

// selection des rendez-vous
$sql = "SELECT id, doctor_id, service_id, slot_id, status, created_timestamp FROM appointments
    WHERE user_id = ?
    ORDER BY created_timestamp
    LIMIT 15";

$stmt = $pdo->prepare($sql);
$stmt->execute([$userId]);
$appointments = $stmt->fetchAll(PDO::FETCH_ASSOC);

?>


<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Accueil - Clinique</title>
    <link rel="stylesheet" href="index.css">
</head>
<body class="accueil-page">

    <!-- NAVBAR -->
    <nav class="navbar">
        <ul class="nav-links">
            <li><a href="accueil.php">Accueil</a></li>
            <li><a href="services.php">Services</a></li>
            <li><a href="doctors.php">Docteurs</a></li>
            <li><a href="appointment.php">Prendre rendez-vous</a></li>
            <li><a href="myAppointments.php">Mes rendez-vous</a></li>
            <li><a href="contact.php">Contactez-nous</a></li>
        </ul>

        <a href="logout.php" class="logout-btn">Déconnexion</a>
    </nav>


    <!------------------------ DASHBOARD-------------------->
<main class="dashboard">

    <!-- Titre -->
    <section class="dashboard-header">
        <h1>Bonjour, <?= htmlspecialchars($userName) ?></h1>
        <p>Bienvenue sur votre espace patient.</p>
    </section>

    <!-- SECTION TOP -->
    <section class="top-section">

        <!-- BOÎTE BLEUE -->
        <div class="top-left">
            <h2>Prendre un rendez-vous</h2>
            <p>Réservez une consultation en quelques clics avec nos médecins.</p>
            <a href="appointment.php">Commencer →</a>
        </div>

        <!-- BOÎTES SERVICES & DOCTEURS -->
        <div class="top-right simple-box-grid">

            <div class="simple-box">
                <h3>Services</h3>
                <p>Voir les services disponibles.</p>
                <a href="services.php">Voir →</a>
            </div>

            <div class="simple-box">
                <h3>Docteurs</h3>
                <p>Consulter la liste des médecins.</p>
                <a href="doctors.php">Voir →</a>
            </div>

        </div>

    </section> 


    <!-- MES RENDEZ-VOUS -->
    <section class="appointments-section">

        <div class="section-header">
            <h2>Mes rendez-vous</h2>
            <a href="appointment.php" class="btn-primary-blue">+ Prendre un rendez-vous</a>
        </div>

        <section class="tiles-grid">

            <?php if (empty($appointments)): ?>
                <p class="empty-state">
                    Vous n'avez aucun rendez-vous pour le moment.
                    Cliquez sur <strong>“+ Prendre un rendez-vous”</strong>.
                </p>

            <?php else: ?>
                <?php foreach ($appointments as $appt): ?>

                    <article class="tile">
                        <h3>Rendez-vous #<?= htmlspecialchars($appt["id"]) ?></h3>

                        <p class="tile-meta">
                            Service ID : <?= htmlspecialchars($appt["service_id"]) ?><br>
                            Docteur ID : <?= htmlspecialchars($appt["doctor_id"]) ?><br>
                            Slot : <?= htmlspecialchars($appt["slot_id"]) ?><br>
                            Créé le : <?= htmlspecialchars($appt["created_timestamp"]) ?>
                        </p>

                        <div class="tile-footer">
                            <span class="tile-status"><?= htmlspecialchars($appt["status"]) ?></span>
                        </div>
                    </article>

                <?php endforeach; ?>
            <?php endif; ?>

        </section>

    </section>

</main>

</body>
</html>
