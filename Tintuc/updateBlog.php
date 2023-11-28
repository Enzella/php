<?php
include '/xampp/htdocs/nhom/DatabaseSQL/db_connectdt.php';

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $id = $_POST['id'];
    $tieude = $_POST['tieude'];
    $ndngan = $_POST['ndngan'];
    $noidung = $_POST['noidung'];
    $hinhanh = $_POST['hinhanh'];
    $tacgia = $_POST['tacgia'];


    $sql = "UPDATE tintuc SET tieude = '$tieude', ndngan = '$ndngan', noidung = '$noidung', hinhanh = '$hinhanh', tacgia = '$tacgia' WHERE id = '$id'";
    
    if ($conn->query($sql) === TRUE) {
        echo "Cập nhật bài viết thành công.";
    } else {
        echo "Có lỗi xảy ra khi cập nhật bài viết: " . $conn->error;
    }
} else {
    echo "Phương thức không được chấp nhận.";
}
?>