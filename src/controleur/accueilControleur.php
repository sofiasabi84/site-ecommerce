<?php

// ICI TU MAIS TOUS LES CONTROLLEUR QUI ONT PAS BESOIN DE CODE PHP POUR L’INSTANT 

function accueilControleur() {
    global $twig, $db;

    $message = '';

    if ($_SERVER['REQUEST_METHOD'] === 'POST' && !empty($_POST['email'])) {
        $email = filter_var($_POST['email'], FILTER_VALIDATE_EMAIL);

        if ($email) {
            // Vérifie si email déjà inscrit
            $stmt = $db->prepare("SELECT COUNT(*) FROM newsletter WHERE email = ?");
            $stmt->execute([$email]);

            if ($stmt->fetchColumn() == 0) {
                // Insère l'email
                $stmt = $db->prepare("INSERT INTO newsletter (email) VALUES (?)");
                $stmt->execute([$email]);
                $message = "Merci pour votre inscription !";
            } else {
                $message = "Cet email est déjà inscrit.";
            }
        } else {
            $message = "Email invalide.";
        }
    }

    echo $twig->render('accueil.html.twig', ['message' => $message]);
}

function contactControleur() {
    global $twig;
    echo $twig->render('contact.html.twig');
}

function mentionControleur() {
    global $twig;
    echo $twig->render('mentions_legales.html.twig');
}

function aproposControleur() {
    global $twig;
    echo $twig->render('a_propos.html.twig');
}
