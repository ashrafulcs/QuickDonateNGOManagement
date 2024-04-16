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
    $volunteerName = $_POST['volunteer_name'];
    $contactInfo = $_POST['contact_info'];

    // Insert data into the VOLUNTEER_T table
    $sql = "INSERT INTO VOLUNTEER_T (VolunteerName) VALUES ('$volunteerName')";
    if ($conn->query($sql) === TRUE) {
        // Retrieve the last inserted ID
        $volunteerID = $conn->insert_id;

        // Insert data into the EMPLOYEE_T table
        $sql = "INSERT INTO EMPLOYEE_T (EmployeeName, EmployeeContact) VALUES ('$volunteerName', '$contactInfo')";
        if ($conn->query($sql) === TRUE) {
            // Success
            echo "Thank you for signing up!";
        } else {
            echo "Error: " . $sql . "<br>" . $conn->error;
        }
    } else {
        echo "Error: " . $sql . "<br>" . $conn->error;
    }
}

// Close the database connection
$conn->close();
?>
