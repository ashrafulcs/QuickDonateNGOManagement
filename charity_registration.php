<?php
// Database credentials
$servername = "localhost";
$username = "root";
$password = "";
$database = "quickdonate_db";

// Create connection
$conn = new mysqli($servername, $username, $password, $database);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Form submission handling
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Collect form data
    $orgName = $_POST['org_name'];
    $orgLocation = $_POST['org_location'];
    $recipientName = $_POST['recipient_name'];

    // Insert data into the CHARITY_T table
    $sql = "INSERT INTO CHARITY_T (O_Name, O_Location, RecipientID) VALUES ('$orgName', '$orgLocation', (SELECT RecipientID FROM RECIPIENT_T WHERE RecipientName='$recipientName'))";
    if ($conn->query($sql) === TRUE) {
        // Success
        echo "Thank you for registering your charity organization!";
    } else {
        echo "Error: " . $sql . "<br>" . $conn->error;
    }
}

// Close the database connection
$conn->close();
?>
