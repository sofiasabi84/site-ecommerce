<?php

require_once __DIR__ . '/../../config/connexion.php'; // ← important

class Newsletter
{
    private $pdo;

    public function __construct()
    {
        $this->pdo = Connexion::getInstance();
    }

    public function ajouterEmail($email)
    {
        // Vérifie si l'email existe déjà
        $sql = "SELECT COUNT(*) FROM newsletter WHERE email = ?";
        $stmt = $this->pdo->prepare($sql);
        $stmt->execute([$email]);

        if ($stmt->fetchColumn() > 0) {
            return false;
        }

        // Insère l'email
        $sql = "INSERT INTO newsletter (email) VALUES (?)";
        $stmt = $this->pdo->prepare($sql);
        return $stmt->execute([$email]);
    }
}
