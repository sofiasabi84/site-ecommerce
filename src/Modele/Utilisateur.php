<?php
class Utilisateur {
    private $db;

    public function __construct($db){
        $this->db = $db;
    }

    public function emailExiste($email){
        $query = "SELECT id FROM utilisateur WHERE email = :email";
        $stmt = $this->db->prepare($query);
        $stmt->bindValue(':email', $email, PDO::PARAM_STR);
        $stmt->execute();
        return $stmt->fetch() !== false;
    }

    public function insert($email, $mdp, $idRole, $nom, $prenom){
        if ($this->emailExiste($email)) {
            throw new Exception("Cet email est déjà utilisé.");
        }

        $query = "INSERT INTO utilisateur (email, mdp, idRole, nom, prenom) 
                  VALUES (:email, :mdp, :idRole, :nom, :prenom)";
        $stmt = $this->db->prepare($query);
        $stmt->bindValue(':email', $email, PDO::PARAM_STR);
        $stmt->bindValue(':mdp', $mdp, PDO::PARAM_STR);
        $stmt->bindValue(':idRole', $idRole, PDO::PARAM_INT);
        $stmt->bindValue(':nom', $nom, PDO::PARAM_STR);
        $stmt->bindValue(':prenom', $prenom, PDO::PARAM_STR);
        return $stmt->execute();
    }
}
