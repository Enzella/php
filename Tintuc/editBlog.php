<?php
include '/xampp/htdocs/nhom/DatabaseSQL/db_connectdt.php';

$matt = $_GET['matt'];

if (isset($_POST['submit'])) {
    $blog_name = $_POST['name'];
    $blog_content = $_POST['content'];
    $Des = $_POST['Des'];
    $fileName = $_FILES['image']['name'];
    $fileTmpName = $_FILES['image']['tmp_name'];
    $folder = "/xampp/htdocs/nhom/Content/web/img";
    $createDate = date("Y-m-d H:i:s");
    $updateDate = date("Y-m-d H:i:s");

    $sql = "UPDATE `tintuc` SET `tieude`='$blog_name', `ndngan`='$blog_content', `noidung`='$Des',`ngaydangtin`='$updateDate'";

    if (!empty($fileName)) {
        $uploadedFile = $folder . $fileName;
        if (move_uploaded_file($fileTmpName, $uploadedFile)) {
            $sql .= ", `hinhanh`='$fileName'";
        } else {
            echo "Có lỗi khi tải lên tệp.";
        }
    }

    $sql .= " WHERE matt='$matt'";

    $result = $conn->query($sql);

    if ($result) {
        header("Location: TinTuc.php");
        
        exit();
    } else {
        echo "Có lỗi khi cập nhật tin tức.";
    }
}

$sql = "SELECT * FROM tintuc WHERE matt='$matt' LIMIT 1";
$result = $conn->query($sql);

if (!$result || $result->num_rows == 0) {
    echo "Không tìm thấy tin tức.";
    exit();
}

$row = $result->fetch_assoc();
?>
<?php include '/xampp/htdocs/nhom/header/TinTucHeader.php' ?>
<div class="row ml-3">
    <div class="col-lg-12 mt-3">
        <form action="" method="POST" enctype="multipart/form-data">
            <div class="card">
                <div class="card-header"><strong>Cập nhật Tin tức</strong></div>
                <div class="card-body card-block">
                    <div class="form-group">
                        <label for="name" class="form-control-label">Tiêu đề</label>
                        <input type="text" name="name" id="name" placeholder="Nhập tên sản phẩm" class="form-control" value="<?php echo $row['tieude']; ?>">
                    </div>
                    <div class="form-group">
                        <label for="image" class="form-control-label">Hình ảnh</label>
                        <input type="file" name="image" id="image" placeholder="image" class="form-control">
                    </div>
                    <div class="form-group">
                        <label for="content" class="form-control-label">Nội dung ngắn</label>
                        <input type="text" name="content" id="content" placeholder="Nội dung ngắn" class="form-control" value="<?php echo $row['ndngan']; ?>">
                    </div>
                    <div class="form-group">
                        <label for="Des" class="form-control-label">Nội dung</label>
                        <input type="text" name="Des" id="Des" placeholder="Nội dung" class="form-control" value="<?php echo $row['noidung']; ?>">
                    </div>
                    <?php if (!empty($row['hinhanh'])): ?>
                        <img width="200px" src="<?php echo $row['hinhanh']; ?>">
                    <?php endif; ?>
                </div>
                <div class="card-footer">
                    <a class="btn btn-primary" href="TinTuc.php" role="button">Hủy</a>
                    <input class="btn btn-success" type="submit" name="submit" value="Cập nhật">
                </div>
            </div>

            </form>
        </div>
    </div>
        </form>
        <?php include '/xampp/htdocs/nhom/footer/TinTucFooter.php' ?>
    </div>
</div>