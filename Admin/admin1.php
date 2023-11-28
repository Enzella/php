<?php
include '/xampp/htdocs/NHOM/DatabaseSQL/db_connectdt.php';
include '/xampp/htdocs/NHOM/Login/login_code.php';
$sql = "SELECT * FROM user";
$result = $conn->query($sql);
?>

<!DOCTYPE html>
<html>
<head>
    <title>Trang quản lý tài khoản</title>
    <link rel="stylesheet" type="text/css" href="admin.css">
</head>
<body>
    <h2>Trang quản lý tài khoản</h2>
    <form action="createAdmin.php" method="POST">
        <h3>Thêm người dùng</h3>
        <a href="createAdmin.php">Thêm tài khoản người dùng</a>
    </form>
    <h3>Danh sách người dùng</h3>
    <table>
        <thead>
            <tr>
                <th>Id</th>
                <th>Họ và tên</th>
                <th>Tên đăng nhập</th>
                <th>Mật khẩu</th>
                <th>Địa chỉ</th>
                <th>Phân Quyền</th>
                <th>Chức năng</th>
                <th>Ngày tạo</th>
            </tr>
        </thead>
        <tbody>
            <?php
                if ($result->num_rows > 0) {
                    while ($row = $result->fetch_assoc()) {
                        echo "<tr>";
                        echo "<td>" . $row['id'] . "</td>";
                        echo "<td>" . $row['name'] . "</td>";
                        echo "<td>" . $row['username'] . "</td>";
                        echo "<td>" . $row['password'] . "</td>";
                        echo "<td>" . $row['address'] . "</td>";
                        echo "<td>";
                        if ($row['admin'] == 0) {
                            echo "Admin";
                        } elseif ($row['admin'] == 1) {
                            echo "Tài khoản thường";
                        }
                        echo "</td>";
                        echo "<td>";
                        echo "<a href='admin_detail.php?id=" . $row['id'] . "'>Xem chi tiết</a>";
                        echo "<td>" . date('Y-m-d') . "</td>";
                    }
                } else {
                    echo "<tr><td colspan='4'>Không có người dùng.</td></tr>";
                }
            ?>
        </tbody>
    </table>
    <a href="index.php">trở lại trang chủ</a> 
</body>
</html>