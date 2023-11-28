<?php
include '/xampp/htdocs/NHOM/DatabaseSQL/db_connectdt.php';
$id = $_GET['id'];
$sql = "DELETE FROM `user` WHERE id = '$id'";
$result = mysqli_query($conn, $sql);
if ($result) {
    header("Location: admin.php");
} else {
    echo "Lỗi";
    echo $result;
}
?>