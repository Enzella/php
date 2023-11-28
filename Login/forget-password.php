<?php
// Kết nối cơ sở dữ liệu
include '/xampp/htdocs/Bt_nhom/DatabaseSQL/db_connectdt.php';
$newPassword = '';

// Xử lý khi người dùng bấm nút "Quên mật khẩu"
if (isset($_POST['submit'])) {
    // Lấy email từ biểu mẫu
    $email = $_POST['email'];

    // Tạo mật khẩu ngẫu nhiên
    $newPassword = generateRandomPassword();

    // Mã hóa mật khẩu theo MD5
    $hashedPassword = md5($newPassword);

    // Cập nhật mật khẩu mới trong cơ sở dữ liệu cho người dùng có email tương ứng
    $query = "UPDATE user SET password = '$hashedPassword' WHERE email = '$email'";
    mysqli_query($conn, $query);

    // Gửi email chứa mật khẩu mới đến người dùng
    $subject = "Mật khẩu mới";
    $message = "Mật khẩu mới của bạn là: $newPassword";
    
}

// Hàm tạo mật khẩu ngẫu nhiên
function generateRandomPassword() {
    $characters = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    $length = 8;
    $randomPassword = '';
    for ($i = 0; $i < $length; $i++) {
        $randomPassword .= $characters[rand(0, strlen($characters) - 1)];
    }
    return $randomPassword;
}
?>



?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    <link rel="stylesheet" href="header.css">
    <link rel="import" href="footer.html">
    <link rel="stylesheet" href="stylelogin.css">

    <title>Document</title>
</head>

<body>
    <header>
        <?php include '/xampp/htdocs/Bt_nhom/header/header.html'; ?>
    </header>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>

<body>
<div class="container">
        <div class="login-form">
            <div class="login-bg">
                <img src="/Content/web/img/login-bg.png" />
            </div>
            <div class="form">
    <h1>Quên mật khẩu</h1>
    <h1 name="new_password" id="new_password">Mật khẩu mới của bạn:<?php echo $newPassword; ?></h1>
    <div class="internal">
        <form method="post" action="">
            <div class="row">
                <div class="label">Email</div>
                <div class="input">
                    <input type="text" name="email" id="email" />
                </div>
            </div>
            <div class="row">
                <div class="button-group">
                    <button class="btn btn-submit" type="submit" name="submit">Gửi mật khẩu mới</button>
                </div>
            </div>
            <a href="login.php" >Quay lại trang đăng nhập</a>
    </div>
</div>
</body>
</html>