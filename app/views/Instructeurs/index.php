<?php require(APPROOT . '/views/includes/header.php');?>
<link rel="stylesheet" href="<?=URLROOT;?>/css/style.css">



<u><h1><?php echo $data['title']; ?></h1></u>
<p>Aantal instructeurs: <?php echo $data['aantal'];?></p>


<table border='1'>
    <thead>
        <th>Voornaam</th>
        <th>Tussenvoegsel</th>
        <th>Achternaam</th>
        <th>Mobiel</th>
        <th>Datum in dienst</th>
        <th>Aantal sterren</th>
        <th>Voertuigen</th>
    </thead>
    <tbody>
        <?= $data['rows']; ?>
    </tbody>
</table>