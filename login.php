<?php

ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);
session_start();

$bdd = new PDO(
  "mysql:host=localhost;dbname=clinique_reservation",
  "root",
  "root",
  [PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION]
);

$error_msg = "";

if ($_SERVER["REQUEST_METHOD"] === "POST") {

  $email = $_POST["email"];
  $pass  = $_POST["password"];

  $req = $bdd->prepare("SELECT id, name, email, user_passwd, role FROM users WHERE email = :email");
  $req->execute(["email" => $email]);
  $user = $req->fetch();

  if ($user && password_verify($pass, $user["user_passwd"])) {

    $_SESSION["user_id"]   = $user["id"];
    $_SESSION["user_name"] = $user["name"];
    $_SESSION["role"]      = $user["role"];

    header("Location: accueil.php");
    exit;

  } else {
    $error_msg = "Email ou mot de passe incorrect.";
  }
}
?>
<!DOCTYPE html>
<html lang="fr">
<head>
  <meta charset="UTF-8">
  <title>Se connecter</title>
  <link rel="stylesheet" href="index.css">
</head>
<body class="login-page">

<div class="login-box">

  <h1>Se connecter</h1>
  <p>Connecte-toi pour gérer tes rendez-vous en ligne.</p>

  <?php if ($error_msg): ?>
    <div class="alert"><?= htmlspecialchars($error_msg) ?></div>
  <?php endif; ?>

  <form method="POST" class="form-content">
    <label for="email">Email</label>
    <input type="email" id="email" name="email" required>

    <label for="password">Mot de passe</label>
    <input type="password" id="password" name="password" required>

    <button type="submit" class="primary-btn">Se connecter</button>
  </form>

  <p class="bottom-text">
    Pas de compte ? <a href="register.php">Créer un compte</a>
  </p>

</div>

</body>
</html>