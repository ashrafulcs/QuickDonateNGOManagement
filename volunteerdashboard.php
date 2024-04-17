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

// Query to fetch a random project assigned to the volunteer
$sql = "SELECT Project_Name, Project_Description FROM PROJECT_T ORDER BY RAND() LIMIT 1";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
    // Output data of each row
    while($row = $result->fetch_assoc()) {
        echo "<p><strong>Name:</strong> " . $row["Project_Name"]. "</p>";
        echo "<p><strong>Description:</strong> " . $row["Project_Description"]. "</p>";
    }
} else {
    echo "No project assigned.";
}

// Close the database connection
$conn->close();
?>
