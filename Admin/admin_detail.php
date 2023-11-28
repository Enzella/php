<?php
include '/xampp/htdocs/NHOM/DatabaseSQL/db_connectdt.php';
?>
<!doctype html>
<html>
<head>

    <meta charset="utf-8">
    <meta name="author" content="hoanghamobile.com">
    <meta property='og:site_name' content='hoanghamobile.com' />
    <meta name="google-site-verification" content="JOFGGI7j9vWfBf-xpElM5Tec0UJ1k_CfdNjpaHm5z10" />
    <meta name="msvalidate.01" content="5C8CDF0992489498A30F9E5F6668A4D5" />
    <meta name="geo.placename" content="Hanoi, Hoàn Kiếm, Hanoi, Vietnam" />
    <meta name="geo.position" content="21.017249242314964;105.84134504199028" />
    <meta name="geo.region" content="VN-Hanoi" />
    <meta name="ICBM" content="21.017249242314964, 105.84134504199028" />

    <title>Th&#244;ng tin t&#224;i khoản</title>
    <link rel="shortcut icon" type="image/x-icon" href="/favicon.ico" />
        <link rel="preload" href="/Content/web/fonts/Segoe UI/Segoe UI.woff2" as="font" type="font/woff2" crossorigin>
        <link rel="preload" href="/Content/web/fonts/Segoe UI/Segoe UI Italic.woff2" as="font" type="font/woff2" crossorigin>
        <link rel="preload" href="/Content/web/fonts/Segoe UI/Segoe UI Bold.woff2" as="font" type="font/woff2" crossorigin>
        <link rel="preload" href="/Content/web/fonts/Segoe UI/Segoe UI Bold Italic.woff2" as="font" type="font/woff2" crossorigin>
        <link rel="preload" href="/Content/web/fonts/Segoe UI/Segoe UI Semilight.woff2" as="font" type="font/woff2" crossorigin>
        <link rel="preload" href="/Content/web/fonts/Segoe UI/Segoe UI Semilight Italic.woff2" as="font" type="font/woff2" crossorigin>
        <link rel="preload" href="/Content/web/fonts/icon/fonts/hoangha.woff" as="font" type="font/woff" crossorigin>
        <link rel="preload" as="script" href="/js-css/web_v1.2.0.3.js">
        <link rel="preload" as="style" href="/js-css/web_v1.2.0.3.css">
        <link href="/js-css/web_v1.2.0.3.css" rel="stylesheet" type="text/css">
        <link rel="stylesheet" href="/Register/styleregister.css">
        <style>
            .product-center .current-product-price label.text-green {
                display: none
            }
        </style>
    <script>
        window.insider_object = {};
    </script>

    
    
        



    <script async src="//hoanghamobilevn.api.useinsider.com/ins.js?id=10005327"></script>
</head>

<body>
<div class="container">
    <h1 style="text-align: center; font-size: 40px;">Chi tiết người dùng</h1>
    <hr>
    <br>

<div>
    <?php
    if (isset($_GET['id'])) {
        $id = $_GET['id'];
        $sql = "SELECT * FROM user WHERE id = '$id'";
        $result = $conn->query($sql);

        if ($result && $result->num_rows > 0) {
            while ($row = $result->fetch_assoc()) {
                $id = $row['id'];
                $name = $row['name'];
                $username = $row['username'];
                $password = $row['password'];
                $ngaysinh = $row['ngaysinh'];
                $gioitinh = $row['gioitinh'];
                $email = $row['email'];
                $phone = $row['phone'];
                $address = $row['address'];
                $create_at = $row['create_at'];
                $update_at = $row['update_at'];
                $admin = $row['admin'];
                ?>
                <div class="header">
                <div class="bg">
                    <div class="text">
                        <h2>CHÀO MỪNG QUAY TRỞ LẠI, <?= $name?></h2>
                        <p><i>Kiểm tra và chỉnh sửa thông tin cá nhân của bạn tại đây</i></p>
                    </div>
                </div>
                <div class="icon">
                    <img src="/Content/web/img/icon-account-info.png" />
                </div>
                <br>
                <br>  
                <?= $id ?>
                <?= $name ?>
                <?= $username ?>
                <?= $password ?>
                <?= $ngaysinh ?>
                <?= $gioitinh ?>
                <?= $email ?>
                <?= $phone ?>
                <?= $address ?>
                <?= $create_at ?>
                <?= $update_at ?>
                <?= $admin ?>
                <div class="account-layout ">
                    <div class="row equaHeight" data-obj=".col .box-bg-white">
                        <div class="col col-lg">
                            <h3>Cập nhật thông tin cá nhân</h3>
                            <div class="box-bg-white">
                                <div class="account-form">
                                    <form onsubmit="return validFormAccount(this);">
                                        <div class="form-controls">
                                            <label>Họ tên:</label>
                                            <div class="controls">
                                                <input type="text" value="<?= $name ?>" name="Title" id="Title" placeholder="Họ tên *" data-required="1" />
                                            </div>
                                        </div>

                                        <div class="form-controls">
                                            <label>Giới tính:</label>
                                            <div class="controls">
                                                <label class="radio-ctn"> 
                                                    <input checked type="radio" name="giotinh" value="true">
                                                    <span class="checkmark"></span>
                                                    <span><strong>Nam</strong></span>
                                                </label>

                                                <label class="radio-ctn"> 
                                                    <input  type="radio" name="giotinh" value="false">
                                                    <span class="checkmark"></span>
                                                    <span><strong>Nữ</strong></span>
                                                </label>
                                            </div>
                                        </div>
                                        <div class="form-controls">
                                            <label>Điện thoại:</label>
                                            <div class="controls">
                                                <input type="tel" value="<?= $phone ?>" name="phone" id="phone" placeholder="Điện thoại *" data-required="1" />
                                            </div>
                                        </div>

                                        <div class="form-controls">
                                            <label>Email:</label>
                                            <div class="controls">
                                                <input type="text" value="<?= $email ?>" name="email" id="email" placeholder="Email *" data-required="1" />
                                            </div>
                                        </div>

                                        <div class="form-controls">
                                            <label>Địa chỉ:</label>
                                            <div class="controls">
                                                <input type="text" value="<?= $address ?>" name="address" id="address" placeholder="Địa chỉ *" data-required="1" />
                                            </div>
                                        </div>
                                        
                                        <div class="form-controls">
                                            <label>Ngày tháng năm sinh:</label>
                                            <div class="controls">
                                                <input type="date" value="<?= $ngaysinh ?>" name="ngaysinh" id="ngaysinh" placeholder="Ngày tháng năm sinh" />
                                            </div>
                                        </div>
                                        <div class="form-controls">
                                            <label>Mật khẩu mới: </label>
                                            <div class="controls">
                                                <input type="text" value="<?= $password ?>" name="PasswordHash" id="PasswordHash" placeholder="Mật khẩu mới" />
                                            </div>
                                        </div>
                                        <!-- <div class="form-controls">
                                            <div class="controls submit-controls">
                                                <button type="submit">XÁC NHẬN</button>
                                            </div>
                                        </div> -->
                                    </form>
                                </div>
                            </div>
                        </div>    
                

                <td>
                    <a href="editAdmin.php?id=<?php echo $row['id']?>" class="btn text-white btn-info">
                        <i class="fa fa-pencil-square-o" aria-hidden="true"></i>
                        Chỉnh sửa
                    </a>

                    <a href="deleteAdmin.php?id=<?php echo $row['id']?>" class="btn text-white btn-danger">
                        <i class="fa fa-trash" aria-hidden="true"></i>
                        Xóa
                    </a>
                </td>
            <?php
            }
        } else {
            echo "Không tìm tài khoản.";
        }
    } else {
        echo "Mã tài khoản không được cung cấp.";
    }
    
    ?>
    <a href="admin.php">trở lại trang admin</a> 
</div>

    <footer>
        <div class="container">
            
                <div id="navSocial">
                    <div class="social">
                        <ul>
                                <li><a href="https://www.facebook.com/hoanghamobilecom" title="Facebook Ho&#224;ng H&#224; Mobile" target="_blank" class="blue"><span><i class="icon-facebook"></i></span></a></li>
                                <li><a href="https://www.youtube.com/channel/UCJm_GdFJzT8h1odq1oMu_7Q?sub_confirmation=1" title="Youtube Ho&#224;ng H&#224; Mobile Channel" target="_blank" class="red"><span><i class="icon-youtube"></i></span></a></li>
                                <li><a href="https://www.instagram.com/hoanghamobile/?hl=vi" title="Ho&#224;ng H&#224; Mobile Instagram" target="_blank" class="rainbow"><span><i class="icon-instagram"></i></span></a></li>
                                <li><a href="https://www.tiktok.com/@hoanghaangels?" title="Tiktok" target="_blank" class="black"><span><i class="icon-tiktok"></i></span></a></li>
                        </ul>
                    </div>
                </div>


            <div id="backtoTop">
                <a id="top" href="javascript:;">
                    <i class="icon-left"></i>
                </a>
            </div>
        </div>
    </footer>
    <div id="popup-modal"></div>
    <div id="sticker-modal"></div>
    <div class="search-bg"></div>


    <div class="footer-stick-right" style="position: fixed; bottom: 175px; right: 33px; display:none">
        <a href="javascript:removeStick();" style="background: #4B4B4B;color: #FFF;border-radius: 20px;font-size: 8px;width: 20px;height: 20px;display: flex;text-align: center; position:absolute; right:-5px; top:-5px;">
            <i class="iconv2-remove" style="display:block; margin:auto;"></i>
        </a>
        <div style="padding-bottom:10px;">
            <a href="/kho-san-pham-cu">
                <img src="/Content/web/img/maycugiatot.png" />
            </a>
        </div>
        <div>
            <a href="/dat-hang/thu-cu-doi-moi-iphone-chinh-hang-vn-a-hoanghamobile">
                <img src="/Content/web/img/thucugiacao.png" />
            </a>
        </div>
    </div>


        <div class="footer-zalo" style="position: fixed; bottom: 110px; right: 33px;">
            <a href="https://oa.zalo.me/262829019064124420" target="_blank"><img src="/Content/web/img/zalo.svg" /></a>
        </div>
</body>
</html>