<?php
session_start();

// Si l'utilisateur n'est pas connecté, retour au login
if (!isset($_SESSION["user_id"])) {
    header("Location: login.php");
    exit;
}

// Connexion DB 
$pdo = new PDO(
    "mysql:host=localhost;dbname=clinique_reservation",
    "root",
    "root"
);

// Récupération des docteurs
$sql = "SELECT id, full_name, specialty, email, phone_number 
        FROM doctors
        ORDER BY full_name";

$stmt = $pdo->query($sql);
$doctors = $stmt->fetchAll(PDO::FETCH_ASSOC);
?>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Docteurs - Clinique</title>
    <link rel="stylesheet" href="index.css">
</head>

<body class="doctors-page">

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

    <main class="doctors-main">

        <section class="page-header">
            <h1>Nos docteurs</h1>
            <p>Voici la liste des médecins de la clinique.</p>
        </section>

        <section class="doctors-grid">

            <?php foreach ($doctors as $doc): ?>
                
                <article class="doctor-card">

                    <h2 class="doctor-name">
                        <?= htmlspecialchars($doc["full_name"]) ?>
                    </h2>

                    <p class="doctor-specialty">
                        <?= htmlspecialchars($doc["specialty"]) ?>
                    </p>

                    <p class="doctor-contact">
                        <strong>Email :</strong>
                        <a href="mailto:<?= htmlspecialchars($doc["email"]) ?>">
                            <?= htmlspecialchars($doc["email"]) ?>
                        </a><br>

                        <strong>Téléphone :</strong>
                        <?= htmlspecialchars($doc["phone_number"]) ?>
                    </p>

                    <div class="doctor-card-footer">
                        <a href="appointment.php?doctor_id=<?= $doc["id"] ?>" 
                           class="btn-primary-blue">
                            Prendre rendez-vous
                        </a>
                    </div>

                </article>

            <?php endforeach; ?>

        </section>

    </main>

</body>
</html>