<?php
include '/xampp/htdocs/nhom/DatabaseSQL/db_connectdt.php';
$matt = $_GET['matt'];
$sql = "DELETE FROM `tintuc` WHERE matt = '$matt'";
$result = mysqli_query($conn, $sql);
if ($result) {
    header("Location: TinTuc.php");
} else {
    echo "Lỗi";
    echo $result;
}
?>