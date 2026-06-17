<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: *");
header("Access-Control-Allow-Methods: GET, POST, OPTIONS");

include "db.php";

$name = $_POST['name'];
$roll = $_POST['roll_no'];
$email = $_POST['email'];
$cgpa = $_POST['cgpa'];

$sql = "INSERT INTO students
(name, roll_no, email, cgpa)
VALUES
('$name','$roll','$email','$cgpa')";

if($conn->query($sql)){
    echo json_encode([
        "success"=>true,
        "message"=>"Student Added"
    ]);
}
else{
    echo json_encode([
        "success"=>false
    ]);
}

?>