<?php
session_start();
if (!isset($_SESSION['username'])) {
    header("Location: login.php");
    exit();
}
$username = $_SESSION['username'];
echo "Bạn đã đăng nhập với tên đăng nhập: " . $username;

include 'db_connectdt.php';
include 'role.php';


?>

<!DOCTYPE html>
<html>
<head>
    <title>Thông tin tài khoản</title>
</head>
<body>
    <h2>Thông tin tài khoản</h2>
    <p>Tên đăng nhập: <?php echo $username; ?></p>
    <!-- Hiển thị các thông tin tài khoản khác -->
    <?php
        if ($username =='admin') {
            echo '<a href="admin.php">Trang quản lý</a>';
        } elseif($username !='admin'){
            
        }
    ?>
    <a href="logout.php">Đăng xuất</a>
    
    <a href="index.php">Trở lại trang chủ</a>
</body>
</html>