<?php
// Start the session
session_start();

// Predefined usernames and passwords
$validCredentials = array(
    "employee" => "1234",
    "charity" => "1234",
    "donator" => "1234",
    "volunteer" => "1234",
    "ceo" => "1234"
);

// Check if form is submitted
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Collect form data
    $username = $_POST['username'];
    $password = $_POST['password'];

    // Check if username exists and password matches
    if (array_key_exists($username, $validCredentials) && $password === $validCredentials[$username]) {
        // Set session variables
        $_SESSION["username"] = $username;
        $_SESSION["logged_in"] = true;

        // Redirect to dashboard based on user role
        switch ($username) {
            case "employee":
                header("Location: employeedashboard.html");
                break;
            case "charity":
                header("Location: charitydashboard.html");
                break;
            case "donator":
                header("Location: donatordashboard.html");
                break;
            case "volunteer":
                header("Location: volunteerdashboard.html");
                break;
            case "ceo":
                header("Location: ceodashboard.html");
                break;
        }
        exit();
    } else {
        // Invalid username or password
        echo "Invalid username or password.";
    }
}
?>
