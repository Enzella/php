<?php
session_start();


if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $username = $_POST['username'];
    $password = $_POST['password'];
    if (empty($username) || empty($password)) {
        $errorMsg = "Tên đăng nhập và mật khẩu không được để trống.";
        echo "<div class='errors just-center text-red'>$errorMsg</div>";
        exit();
    }
    $md5Password = md5($password); // Hash the user input password

    $conn = mysqli_connect('localhost', 'root', '', 'phone') or die("Couldn't connect to database" . mysqli_connect_error());
    //for vietnamese
    mysqli_set_charset($conn, 'utf8');

    $query = "SELECT * FROM user WHERE username = '$username' AND password = '$md5Password'";
    $result = mysqli_query($conn, $query);
    $count = mysqli_num_rows($result);

    if ($count == 1) {
        $user = mysqli_fetch_assoc($result);
        $_SESSION['username'] = $user['username'];
        $_SESSION['admin'] = $user['admin'];
        header("Location: /Admin/admin.php");
        // if ($user['admin'] == 0) {
        //     header("Location: /NHOM/Admin/admin.php"); // Redirect to admin page
        // } elseif ($user['admin'] == 1) {
        //     header("Location: /NHOM/index.html"); // Redirect to index page
        // } else {
        //     echo "Phân quyền không hợp lệ.";
        // }
        // exit();
    } else {
        echo "Tên đăng nhập hoặc mật khẩu không đúng.";
    }

    mysqli_close($conn);
}
?>