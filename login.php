<?php
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
  $pass = $_POST["password"];

  $req = $bdd->prepare("SELECT id, name, email, password_hash, role FROM users WHERE email = :email");
  $req->execute(["email" => $email]);
  $user = $req->fetch();

  if ($user && password_verify($pass, $user["password_hash"])) {

    $_SESSION["user_id"] = $user["id"];
    $_SESSION["user_name"] = $user["name"];
    $_SESSION["role"] = $user["role"];

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
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Sign In</title>
  <link rel="stylesheet" href="style.css">
</head>
<body>

<div class="page">

  <!-- LEFT PANEL -->
  <section class="left">
    <div class="logo">CLINIQUE LOGO</div>

    <h1>Bienvenue</h1>
    <p class="subtitle">
      Connecte-toi pour gérer tes rendez-vous.
    </p>
  </section>

  <!-- RIGHT PANEL -->
  <section class="right">

    <div class="card big">
      <div class="tabs">
        <a class="tab active" href="./login.php">Sign In</a>
        <a class="tab" href="./register.php">Sign Up</a>
      </div>

      <h2>Sign In</h2>
      <p class="hint">Accède à ton compte.</p>

      <?php if ($error_msg): ?>
        <div class="alert"><?= htmlspecialchars($error_msg) ?></div>
      <?php endif; ?>

      <form method="POST">
        <label>Email</label>
        <input type="email" name="email" required>

        <label>Mot de passe</label>
        <input type="password" name="password" required>

        <button type="submit" class="btn">SIGN IN</button>
      </form>
    
      <a class="tab" href="./register.php">Sign Up</a>
      <p class="bottom">
        Pas de compte ? <a href="./register.php">Créer un compte</a>
      </p>
    </div>

  </section>

</div>

</body>
</html>
