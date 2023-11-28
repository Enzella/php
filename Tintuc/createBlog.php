<?php
include '/xampp/htdocs/nhom/DatabaseSQL/db_connectdt.php';

if(isset($_POST['submit'])){
    $blog_name=$_POST['name'];
    $blog_conent=$_POST['conent'];
    $Des=$_POST['Des'];
    $fileName = $_FILES['hinhanh']['name'];
    $template = $_FILES['hinhanh']['tmp_name'];
    $folder = "/xampp/htdocs/NHOM/Content/web/img" . $fileName;
     $createDate = date("Y-m-d H:i:s");
     $UpDate = date("Y-m-d H:i:s");
    $sql = "INSERT INTO tintuc(`matt`, `tieude`, `hinhanh`, `ndngan`, `noidung`) VALUES (NULL,'$blog_name','$fileName','$blog_conent','$Des')";
    $result = mysqli_query($conn,$sql);
    if(move_uploaded_file($template,$folder)){
        echo "<script>
        alert('uploaded file uploaded');
        <script>";
        header("location:tintuc.php");
       }
       else {
        echo " co loi khi Upload  thanh cong";
       }
    if($result){
       header("location:tintuc.php");
    }
    else {
        var_dump($result);
    }

}
?>
<?php include '/xampp/htdocs/NHOM/header/TinTucHeader.php' ?>
<div class="row ml-3" >
    <div class="col-lg-12 mt-3">
       <form action="" method="POST" enctype="multipart/form-data">
        <div class="card">
            <div class="card-header"><strong>Tạo Tin tức</strong></div>
            <div class="card-body card-block">
                <div class="form-group"><label for="name" class=" form-control-label">Tên tin tức</label><input type="text" name="name" id="name" placeholder="Nhập tên sản phẩm" class="form-control"></div>
               
                <div class="form-group"><label for="conent" class=" form-control-label">Chi tiết ngắn</label><input type="text" id="conent" name="conent" placeholder="" class="form-control"></div>
                <div class="form-group"><label for="Des" class=" form-control-label">Nội dung tin tức</label><input type="text" name="Des" id="Des" placeholder="" class="form-control"></div>
               
                <div class="form-group"><label for="image" class=" form-control-label">Hình ảnh</label><input type="file" name="hinhanh" id="hinhanh" placeholder="image" class="form-control"></div>
            </div>
        </div>
        <a class="btn btn-primary" href="/Tintuc/TinTuc_detail.php?php echo $row['matt']?>" role="button">Hủy</a>
        <input class="btn btn-success" type="submit" name="submit" value="Tạo mới">
    </form>
    </div>
    <?php include '/xampp/htdocs/NHOM/footer/TinTucFooter.php' ?>
</div>