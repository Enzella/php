
 
<?php
$server = "localhost";
$username = "root";
$password = "";
$database = "phone";

// Kết nối đến CSDL
$conn = new mysqli($server, $username, $password, $database);


// Kiểm tra kết nối
if ($conn->connect_error) {
    die("Kết nối thất bại: " . $conn->connect_error);
}

$conn->query("SET SESSION wait_timeout = 28800");



if ($_SERVER["REQUEST_METHOD"] == "POST") {
// Tạo mã ngẫu nhiên cho ID
//$id = uniqid();
// Lấy dữ liệu từ form đăng ký
$username = $_POST['username'];
$password = $_POST['password'];
$confirm_password = $_POST['confirm_password'];
$fullname = $_POST['name'];
$email = $_POST['email'];
$gender = $_POST['gioitinh'];
$birthdate = $_POST['ngaysinh'];
$phone = $_POST['phone'];
$address = $_POST['address'];

// Kiểm tra xem các trường có được điền đầy đủ hay không
// if (empty($username) || empty($password) || empty($confirm_password) || empty($fullname) || empty($email) || empty($gender) || empty($birthdate) || empty($phone) || empty($address)) {
//     die("Vui lòng điền đầy đủ thông tin.");
// }


// Kiểm tra xem mật khẩu và xác nhận mật khẩu có khớp nhau không
if ($password !== $confirm_password) {
    die("Mật khẩu và xác nhận mật khẩu không khớp.");
}

// Kiểm tra xem tên người dùng đã tồn tại trong cơ sở dữ liệu chưa
$sql = "SELECT * FROM user WHERE username = '$username'";
$result = $conn->query($sql);
if ($result->num_rows > 0) {
    die("Tên người dùng đã tồn tại. Vui lòng chọn tên khác.");
}
 // Mã hóa mật khẩu
 if (isset($_POST['password']))
 {
  $password = $_POST['password'];
  $md5Password=md5($password);
 }
}
// Thực hiện thêm người dùng vào cơ sở dữ liệu
$sql = "INSERT INTO `user` (name, username, password, ngaysinh, gioitinh, email, phone, address, create_at, update_at, admin)
        VALUES (?, ?, ?, ?, ?, ?, ?, ?, CURDATE(), NOW(), 0)";

$stmt = $conn->prepare($sql);
$stmt->bind_param("ssssssss", $fullname, $username, $md5Password, $birthdate, $gender, $email, $phone, $address);
if ($stmt->execute()) {
    echo "Đăng ký thành công";
} else {
    echo "Đăng ký thất bại: " . $stmt->error;
}
mysqli_close($conn);



?>