<?php

// Ne pas toucher ! NE RIEN CHANGER POUR LE MOMENTS
function connexionControleur($twig, $db){
    $form = array();

    if (isset($_POST['btConnecter'])){
        $form['valide'] = true;
        $inputEmail = $_POST['inputEmail'];
        $inputPassword = $_POST['inputPassword'];
        $utilisateur = new Utilisateur($db);
        $unUtilisateur = $utilisateur->connect($inputEmail);

        if ($unUtilisateur != null){
            if(!password_verify($inputPassword, $unUtilisateur['mdp'])){
                $form['valide'] = false;
                $form['message'] = 'Login ou mot de passe incorrect';
            }
            else{
                $form['email'] = $unUtilisateur['email'];
                $form['role'] = isset($unUtilisateur['role']) ? $unUtilisateur['role'] : null;
            }
        }
        else{
            $form['valide'] = false;
            $form['message'] = 'Login ou mot de passe incorrect';
        }
    }
    echo $twig->render('connexion.html.twig', array('form'=>$form));
}

