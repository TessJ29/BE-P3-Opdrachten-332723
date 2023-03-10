<?php

class Instructeurs extends Controller
{
    private $instructeurModel;

    public function __construct()
    {
        $this->instructeurModel = $this->model('Instructeur');

    }

    public function index()
    {
        $result = $this->instructeurModel->getInstructeurs();
// var_dump($result);
// echo count($result);
$aantal = count($result);
        $rows = '';
        foreach ($result as $value) {
            $d = new DateTimeImmutable($value->DatumInDienst, new DateTimeZone('Europe/Amsterdam'));
            $rows .= "<tr>
                        <td>$value->Voornaam</td>
                        <td>$value->Tussenvoegsel</td>
                        <td>$value->Achternaam</td>
                        <td>$value->Mobiel</td>
                        <td>{$d->format('d-m-Y')}</td>
                        <td>$value->AantalSterren</td>
                        <td><a href='" . URLROOT . "/Instructeurs/VoertuigInfo/{$value->Id}'><img src='" . URLROOT . "/img/car-icon.png' class='caricon' alt='carIcon'></a></td>

                      </tr>";
        }
        
        $data = [
            'title' => "Instructeurs in dienst",
            'rows' => $rows,
            'aantal' => $aantal
        ];
        
        $this->view('Instructeurs/index', $data);
    }

    public function VoertuigInfo($instructeurId)
    {   
        $result = $this->instructeurModel->getVoertuigInfo($instructeurId);
        $result2 = $this->instructeurModel->getInstructeurById($instructeurId);
// var_dump($result);

if (empty($result)) {
    $NotAvailable = "Er zijn op dit moment nog geen voertuigen toegewezen aan deze instructeur";
    header('Refresh:3; url=' . URLROOT . 'Instructeurs/index/');

    } else {
        $NotAvailable = '';
    }

    if ($result2) {
        $date = new DateTimeImmutable($result2[0]->DatumInDienst, new DateTimeZone('Europe/Amsterdam'));
        $date = $date->Format('d-m-Y');
        $instructeurId = $result2[0]->Id;
        $naam = $result2[0]->Voornaam . " " . $result2[0]->Tussenvoegsel . " " . $result2[0]->Achternaam;
        $sterren = $result2[0]->AantalSterren;
    } else {
        $naam = '';
        $sterren = '';
        $date = '';
    }

    // var_dump($result);

        $rows = '';

        foreach ($result as $value) {
            $rows .= "<tr>
                        <td>$value->TypeVoertuig</td>
                        <td>$value->Type</td>
                        <td>$value->Kenteken</td>
                        <td>$value->Bouwjaar</td>
                        <td>$value->Brandstof</td>
                        <td>$value->Rijbewijscategorie</td>
                    </tr>";
        }

        $data = [
            'title' => "Door instructeur gebruikte voertuigen",
            'rows' => $rows,
            'naam' => $naam,
            'date' => $date,
            'sterren' => $sterren,
            'notAvailable' => $NotAvailable,
            'instructeurId' => $instructeurId

        ];
        $this->view('Instructeurs/VoertuigInfo', $data);
    }

    public function instName()
    {
        
    }
}