<?php
// Establish database connection
$servername = "localhost";
$username = "root";
$password = "";
$database = "quickdonate_db";

$conn = new mysqli($servername, $username, $password, $database);
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Process form data
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $donator_name = $_POST['donator_name'];
    $donator_phone = $_POST['donator_phone'];
    $donation_amount = $_POST['donation_amount'];
    $charity_id = $_POST['charity_id'];

    // Insert donator data into DONATOR_T table
    $sql_donator = "INSERT INTO DONATOR_T (D_Name, D_Phone) VALUES ('$donator_name', '$donator_phone')";
    $conn->query($sql_donator);

    // Retrieve the newly inserted donator's ID
    $donator_id = $conn->insert_id;

    // Insert payment data into PAYMENT_T table
    $sql_payment = "INSERT INTO PAYMENT_T (Amount, DonatorID, Date) VALUES ('$donation_amount', '$donator_id', CURDATE())";
    $conn->query($sql_payment);

    // Update CHARITY_T table with the donation amount
    $sql_update_charity = "UPDATE CHARITY_T SET DonationAmount = DonationAmount + '$donation_amount' WHERE OrganizationID = '$charity_id'";
    $conn->query($sql_update_charity);

    echo "Donation successful!";
}

// Close database connection
$conn->close();
?>
