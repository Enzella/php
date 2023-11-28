<?php
include('connect.php');
include('includes/header.php');
include('includes/navbar.php');

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    // Lấy thông tin từ biểu mẫu
    $product_id = $_POST['product_id'];
    $content = $_POST['content'];
    $start_date = $_POST['start_date'];
    $end_date = $_POST['end_date'];

    // Thực hiện thêm thông tin quảng cáo vào cơ sở dữ liệu
    $query = "INSERT INTO promotions (product_id, content, start_date, end_date) VALUES ('$product_id', '$content', '$start_date', '$end_date')";
    if ($conn->query($query) === TRUE) {
        // Hiển thị thông báo thành công
        echo "Thêm quảng cáo thành công.";
       
        exit;
    } else {
        echo "Lỗi: " . $conn->error;
    }
}
?>

<div class="container">
    <h2>Add Promotion</h2>
    <form method="POST" action="add_promotion.php">
        <div class="form-group">
            <label for="product_id">Product ID:</label>
            <input type="text" class="form-control" id="product_id" name="product_id" required>
        </div>
        <div class="form-group">
            <label for="content">Content:</label>
            <textarea class="form-control" id="content" name="content" required></textarea>
        </div>
        <div class="form-group">
            <label for="start_date">Start Date:</label>
            <input type="date" class="form-control" id="start_date" name="start_date" required>
        </div>
        <div class="form-group">
            <label for="end_date">End Date:</label>
            <input type="date" class="form-control" id="end_date" name="end_date" required>
        </div>
        <button type="submit" class="btn btn-primary">Add</button>
    </form>
</div>

<?php
include('includes/scripts.php');
include('includes/footer.php');
?>