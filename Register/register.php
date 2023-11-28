
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
 ?>
 
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    <link rel="stylesheet" href="header/header.html">
    <link rel="import" href="footer/footer.html">
    <link rel="stylesheet" href="styleregister.css">

    <title>Đăng ký</title>
</head>

    <header>
        <?php include('/xampp/htdocs/NHOM/header/header.html'); ?>

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

        <div class="center" style="text-align:center; color:black;">
            <h2 style="color:black;">Đăng ký tài khoản</h2>
            <p style="color:black;">Chú ý các nội dung có dấu * bạn cần phải nhập</p>

        </div>

        <div id="registerForm" class="hh-form">
            <form method="post" action="register_code.php">
                <input type="hidden" name="ReturnUrl" />
                <input name="__RequestVerificationToken" type="hidden" value="F1be38nC928LRJD7Jz9zormNPERqhqcaqKyfcTRy8u7OpYv23MqqePLLViJPJgBfzJsaTqznBnNUyDuIKxLvdV6UP3A1" />

                <div class="form-controls">
                    <label>Tài khoản:</label>
                    <div class="controls">
                        <input type="text" name="username" id="username" placeholder="Tài khoản *" data-required="1" />
                    </div>
                </div>


                <div class="form-controls">
                    <label>Họ tên:</label>
                    <div class="controls">
                        <input type="text" name="name" id="name" placeholder="Họ tên *" data-required="1" />
                    </div>
                </div>
                <div class="form-controls">
                    <label>Mật khẩu:</label>
                    <div class="controls">
                        <input type="password" name="password" id="password" placeholder="Mật khẩu *" data-required="1" />
                    </div>
                </div>

                <div class="form-controls">
                    <label>Nhập lại mật khẩu:</label>
                    <div class="controls">
                        <input type="password" name="confirm_password" id="confirm_password" placeholder="Nhập lại mật khẩu *" data-required="1" />
                    </div>
                </div>



                <div class="form-controls">
                    <label>Email:</label>
                    <div class="controls">
                        <input type="text" name="email" id="email" placeholder="email *" data-required="1" />
                    </div>
                </div>

                <div class="form-controls">
                    <label>Giới tính:</label>
                    <div class="controls">
                        <label class="radio-ctn">
                            <input type="radio" name="gioitinh" value="0" >
                            <span class="checkmark"></span>
                            <span value="0"><strong>Nam</strong></span>
                        </label>

                        <label class="radio-ctn">
                            <input type="radio" name="gioitinh" value="1" >
                            <span class="checkmark"></span>
                            <span value="1"><strong>Nữ</strong></span>
                        </label>
                    </div>
                </div>


                <div class="form-controls">
                    <label>Ngày tháng năm sinh:</label>
                    <div class="controls">
                        <input type="date" value="" name="ngaysinh" id="ngaysinh" placeholder="Ngày tháng năm sinh" />
                    </div>
                </div>


                <div class="form-controls">
                    <label>Điện thoại:</label>
                    <div class="controls">
                        <input type="tel" name="phone" id="phone" placeholder="Điện thoại *" data-required="1" />
                    </div>
                </div>

                <div class="form-controls">
                    <label>Địa chỉ:</label>
                    <div class="controls">
                        <input type="text" name="address" id="address" placeholder="Địa chỉ *" data-required="1" />
                    </div>
                </div>





                <div class="form-controls">
                    <div class="controls submit-controls">
                        <button type="submit">ĐĂNG KÝ TÀI KHOẢN</button>
                    </div>
                </div>


                <div class="form-controls">
                    <div class="submit-controls">
                        <p><strong style="color:black;">Bằng việc đăng kí này, bạn đã chấp nhận các chính sách của Hoàng Hà Mobile</strong></p>
                    </div>
                </div>
                <div class="row">
                            <p ><a class="" href="/Login/login.php">Quay lại trang đăng nhập</a></p>
                        </div>
            </form>
        </div>
    </div>


</body>
</html>