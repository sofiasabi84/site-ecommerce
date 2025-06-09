<?php 

function inscrireControleur($twig, $db){
  $form = array();
  
  if (isset($_POST['btInscrire'])){
    $inputEmail = $_POST['inputEmail'];
    $inputPassword = $_POST['inputPassword'];
    $inputPassword2 = $_POST['inputPassword2'];
    $nom = $_POST['nom'];
    $prenom = $_POST['prenom'];

    if ($inputPassword != $inputPassword2){
      $form['valide'] = false;
      $form['message'] = 'Les mots de passe ne correspondent pas.';
    } else {
      try {
        $utilisateur = new Utilisateur($db);
        $utilisateur->insert(
          $inputEmail,
          password_hash($inputPassword, PASSWORD_DEFAULT),
          $nom,
          $prenom
        );
        $form['valide'] = true;          // Succès explicite
        $form['message'] = 'Inscription réussie !';
      } catch (Exception $e) {
        $form['valide'] = false;
        if (str_contains($e->getMessage(), '1062')) {
          $form['message'] = 'Cette adresse email est déjà utilisée.';
        } else {
          $form['message'] = 'Une erreur est survenue lors de l’inscription.';
        }
      }
    }

    $form['email'] = $inputEmail;
  }

  echo $twig->render('inscrire.html.twig', array('form' => $form));
}
