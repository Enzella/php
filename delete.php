<?php
include('connect.php');

if (isset($_GET['table']) && isset($_GET['id'])) {
    $table = $_GET['table'];
    $id = $_GET['id'];

    $query = "DELETE FROM `$table` WHERE `id` = '$id'";
    $result = $conn->query($query);

    if ($result) {
        echo "Xóa thông tin thành công ";
    } else {
        echo "Lỗi: Không thể xóa thông tin từ bảng $table với ID $id";
    }
} else {
    echo "Lỗi: Thiếu tên bảng hoặc ID";
}


$conn->close();
?>
