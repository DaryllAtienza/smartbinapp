<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: Content-Type");
header("Access-Control-Allow-Methods: POST, GET, OPTIONS");

$host = 'localhost';
$db = 'user_auth';
$user = 'root'; // ✅ Replace with your actual MySQL username
$pass = '';     // ✅ Replace with your actual MySQL password

$conn = new mysqli($host, $user, $pass, $db);

if ($conn->connect_error) {
    die(json_encode(["success" => false, "message" => "Connection failed."]));
}

$data = json_decode(file_get_contents("php://input"));

if (!$data || !isset($data->email) || !isset($data->password)) {
    echo json_encode(["success" => false, "message" => "Invalid or empty input."]);
    exit();
}

$email = $conn->real_escape_string($data->email);
$password = password_hash($data->password, PASSWORD_DEFAULT); // ✅ Always hash passwords

// Check if user already exists
$result = $conn->query("SELECT * FROM users WHERE email = '$email'");
if ($result->num_rows > 0) {
    echo json_encode(["success" => false, "message" => "User already exists."]);
} else {
    // Insert new user
    $stmt = $conn->prepare("INSERT INTO users (email, password) VALUES (?, ?)");
    $stmt->bind_param("ss", $email, $password);
    if ($stmt->execute()) {
        echo json_encode(["success" => true, "message" => "Signup successful."]);
    } else {
        echo json_encode(["success" => false, "message" => "Signup failed."]);
    }
    $stmt->close();
}

$conn->close();
?>
