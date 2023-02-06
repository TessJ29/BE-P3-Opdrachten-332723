<?php

class Instructeur
{
    private $db;

    public function __construct()
    {
        $this->db = new Database();
    }

    public function getInstructeurs()
    {
        $this->db->query("SELECT            Instructeur.Voornaam
                                            ,Instructeur.Tussenvoegsel
                                            ,Instructeur.Achternaam
                                            ,Instructeur.Mobiel
                                            ,Instructeur.DatumInDienst
                                            ,Instructeur.AantalSterren
                                            ,Instructeur.Id
                                            FROM Instructeur
                                            ORDER BY Instructeur.AantalSterren desc");


        $result = $this->db->resultSet();

        return $result;
    }

    public function getVoertuigInfo($instructeurId)
    {
        $this->db->query("SELECT Voertuig.Kenteken
                                ,Voertuig.Type
                                ,Voertuig.Bouwjaar
                                ,Voertuig.Brandstof
                                ,TypeVoertuig.TypeVoertuig
                                ,TypeVoertuig.Rijbewijscategorie
                                ,Voertuig.Id as VoertuigId
                                ,TypeVoertuig.Id as VoertuigTypeId
                                ,Instructeur.Id as InstructeurId
                                ,Instructeur.Voornaam
                                ,Instructeur.Tussenvoegsel
                                ,Instructeur.Achternaam
                                ,Instructeur.DatumInDienst
                                ,Instructeur.AantalSterren
                                FROM VoertuigInstructeur
                                INNER JOIN Voertuig
                                ON VoertuigInstructeur.VoertuigId = Voertuig.Id
                                INNER JOIN Instructeur
                                ON VoertuigInstructeur.InstructeurId = Instructeur.Id
                                INNER JOIN TypeVoertuig
                                ON Voertuig.TypeVoertuigId = TypeVoertuig.Id
                                WHERE Instructeur.Id = :Id
                                GROUP BY TypeVoertuig.Rijbewijscategorie
                                ");


        $this->db->bind(':Id', $instructeurId);

        $result = $this->db->resultSet();

        return $result;
    }


    public function getVoertuig()
    {
        // $this->db->query("SELECT Voertuig.Kenteken
        //                     ,Voertuig.Type
        //                     ,Voertuig.Bouwjaar
        //                     ,Voertuig.Brandstof
        //                     ,TypeVoertuig.TypeVoertuig
        //                     ,TypeVoertuig.Rijbewijscategorie
        //                     ,Voertuig.Id as VoertuigId
        //                     ,TypeVoertuig.Id as VoertuigTypeId
        //                     ,Instructeur.Id as InstructeurId
        //                     ,Instructeur.Achternaam
        //                     FROM VoertuigInstructeur
        //                     INNER JOIN Voertuig
        //                     ON VoertuigInstructeur.VoertuigId = Voertuig.Id
        //                     INNER JOIN Instructeur
        //                     ON VoertuigInstructeur.InstructeurId = Instructeur.Id
        //                     INNER JOIN TypeVoertuig
        //                     ON Voertuig.TypeVoertuigId = TypeVoertuig.Id
        //                     ");
        $this->db->query("SELECT Voertuig.Kenteken
        ,Voertuig.Type
        ,Voertuig.Bouwjaar
        ,Voertuig.Brandstof
        ,TypeVoertuig.TypeVoertuig
        ,TypeVoertuig.Rijbewijscategorie
        ,Voertuig.Id as VoertuigId
        ,TypeVoertuig.Id as VoertuigTypeId
        FROM VoertuigInstructeur
        INNER JOIN Voertuig
        ON VoertuigInstructeur.VoertuigId = Voertuig.Id
        INNER JOIN TypeVoertuig
        ON Voertuig.TypeVoertuigId = TypeVoertuig.Id
        ");

        $result = $this->db->resultSet();
        return $result;
    }

    public function addVoertuigInstructeur($post)
    {
        $sql = "INSERT INTO VoertuigInstructeur
                                    VoertuigInstructeur.VoertuigId as VoertuigId
                                    ,VoertuigInstructeur.InstructeurId as InstructeurId
                                    ,VoertuigInstructeur.DatumToekenning
                        VALUES      (:VoertuigId, :InstructeurId, :DatumToekenning)";
    
    $this->db->query($sql);
    $this->db->bind(':VoertuigId', $post['VoertuigId'], PDO::PARAM_INT);
    $this->db->bind(':InstructeurId', $post['InstructeurId'], PDO::PARAM_INT);
    $this->db->bind(':DatumToekenning', $post['DatumToekenning'], PDO::PARAM_STR);
    return $this->db->execute();
    }


    public function getInstructeurById($instructeurId)
    {
        $this->db->query("SELECT Voornaam
                                ,Tussenvoegsel
                                ,Achternaam
                                ,DatumInDienst
                                ,AantalSterren
                                ,Id
                            FROM Instructeur
                            WHERE Id = :Id
");

        $this->db->bind(':Id', $instructeurId);

        $result = $this->db->resultSet();
        return $result;
    }
}
