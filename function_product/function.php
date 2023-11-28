<!DOCTYPE html>
<html lang="en">

<head>
    <title>ADMIN</title>
    <style>
        #msg {
            color: blue;
            padding: 5px 10px;
            font-size: 20px;
            text-align: center;
        }

        #msgerror {
            color: red;
            padding: 5px 10px;
            font-size: 20px;
            text-align: center;
        }

        h1 {
            font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI';
        }
    </style>

</head>

<body>
    <?php

    // Hàm để chỉnh sửa sản phẩm
    function editProduct($conn, $id, $update_product, $data)
    {
        $fieldsChanged = false;

        // Lặp qua các trường để kiểm tra sự thay đổi
        foreach ($update_product as $field => $value) {
            // Kiểm tra xem trường hiện tại có thay đổi so với giá trị từ biểu mẫu hay không
            if (isset($data[$field]) && $data[$field] !== $value) {
                if (($data[$field] !== '' || $value !== '') && $data[$field] != $value) {
                    $fieldsChanged = true;
                    break; // Nếu có ít nhất một trường thay đổi, thoát khỏi vòng lặp
                }
            }
        }

        // Nếu có sự thay đổi, thực hiện UPDATE
        if ($fieldsChanged) {

            $update_query = "UPDATE products SET producer_id = '" . $data['producer_id'] . "', name = '" . $data['name'] . "', image = '" . $data['image'] . "', import_price = '" . $data['import_price'] . "', sale_price = '" . $data['sale_price'] . "', new_price = '" . $data['new_price'] . "', change_price = '" . $data['change_price'] . "',
            promotion_price = '" . $data['promotion_price'] . "', adv = '" . $data['adv'] . "', sku_code = '" . $data['sku_code'] . "', monitor = '" . $data['monitor'] . "', front_camera = '" . $data['front_camera'] . "',
            rear_camera = '" . $data['rear_camera'] . "', CPU = '" . $data['CPU'] . "', GPU = '" . $data['GPU'] . "', RAM = " . $data['RAM'] . ", ROM = " . $data['ROM'] . ", OS = '" . $data['OS'] . "', pin = '" . $data['pin'] . "', information_details = '" . $data['information_details'] . "', product_introduction = '" . $data['product_introduction'] . "', rate = " . $data['rate'] . " WHERE id = $id";

            if ($conn->query($update_query) === TRUE) {
                ob_start();  // Bắt đầu bộ nhớ đệm đầu ra

                echo '<div id="msg">Cập nhật sản phẩm thành công!!!</div>';

                ob_flush();  // Xuất dữ liệu từ bộ nhớ đệm

                header("refresh:1;url=view.php");
                exit();
            } else {
                echo '<div id="msgerror">Lỗi: ' . $conn->error . '</div>';
            }
        }
    }

    function addProduct($conn, $data)
    {
        $insert_query = "INSERT INTO products (producer_id, name, image, import_price, sale_price, new_price, change_price, promotion_price, adv, sku_code, monitor, front_camera, rear_camera, CPU, GPU, RAM, ROM, OS, pin, information_details, product_introduction, rate) 
    VALUES ('" . $data['producer_id'] . "', '" . $data['name'] . "', '" . $data['image'] . "', '" . $data['import_price'] . "', '" . $data['sale_price'] . "', '" . $data['new_price'] . "', '" . $data['change_price'] . "', '" . $data['promotion_price'] . "', '" . $data['adv'] . "', '" . $data['sku_code'] . "', '" . $data['monitor'] . "', '" . $data['front_camera'] . "', '" . $data['rear_camera'] . "', '" . $data['CPU'] . "', '" . $data['GPU'] . "', " . $data['RAM'] . ", " . $data['ROM'] . ", '" . $data['OS'] . "', '" . $data['pin'] . "', '" . $data['information_details'] . "', '" . $data['product_introduction'] . "', " . $data['rate'] . ")";

        if ($conn->query($insert_query) === TRUE) {
            echo '<div id="msg">Thêm sản phẩm thành công!!!</div>';
        } else {
            echo '<div id="msgerror">Lỗi: ' . $conn->error . '</div>';
        }
    }

    // Hàm để xóa sản phẩm
    function deleteProduct($conn, $idToDelete)
    {
        $delete_query = "DELETE FROM products WHERE id = $idToDelete";

        if ($conn->query($delete_query) === TRUE) {
            echo '<div id="msg">Xóa sản phẩm thành công!!!</div>';
        } else {
            echo '<div id="msgerror">Lỗi: ' . $conn->error . '</div>';
        }
    }

    // Khởi tạo biến và thiết lập giá trị mặc định
    $button_label = "Thêm sản phẩm";
    $form_action = "function.php";
    $update_product = null;

    // Kiểm tra xem có tham số GET "id" hay không
    if (isset($_GET['id'])) {
        $id = $_GET['id'];
        $button_label = "Chỉnh sửa sản phẩm";
        $form_action = "function.php?id=$id";

        require('../connect.php');


        $update_query = "SELECT * FROM products WHERE id=$id";
        $result = $conn->query($update_query);

        if ($result->num_rows > 0) {
            $update_product = $result->fetch_assoc();
        }

        $conn->close();
    }

    echo '<h1>' . $button_label . '</h1>';

    // Xử lý khi gửi biểu mẫu POST
    if ($_SERVER["REQUEST_METHOD"] == "POST") {
        // Lấy giá trị từ biểu mẫu và gán vào các biến tương ứng
        $producer_id = isset($_POST['producer_id']) ? $_POST['producer_id'] : 0;
        $name = isset($_POST['name']) ? $_POST['name'] : "";
        $image = isset($_POST['image']) ? $_POST['image'] : "";
        $import_price = isset($_POST['import_price']) ? $_POST['import_price'] : "";
        $sale_price = isset($_POST['sale_price']) ? $_POST['sale_price'] : "";
        $new_price = isset($_POST['new_price']) ? $_POST['new_price'] : "";
        $change_price = isset($_POST['change_price']) ? $_POST['change_price'] : "";
        $promotion_price = isset($_POST['promotion_price']) ? $_POST['promotion_price'] : "";
        $adv = isset($_POST['adv']) ? $_POST['adv'] : "";
        $sku_code = isset($_POST['sku_code']) ? $_POST['sku_code'] : "";
        $monitor = isset($_POST['monitor']) ? $_POST['monitor'] : "";
        $front_camera = isset($_POST['front_camera']) ? $_POST['front_camera'] : "";
        $rear_camera = isset($_POST['rear_camera']) ? $_POST['rear_camera'] : "";
        $CPU = isset($_POST['CPU']) ? $_POST['CPU'] : "";
        $GPU = isset($_POST['GPU']) ? $_POST['GPU'] : "";
        $RAM = isset($_POST['RAM']) ? (int)$_POST['RAM'] : "";
        $ROM = isset($_POST['ROM']) ? (int)$_POST['ROM'] : "";
        $OS = isset($_POST['OS']) ? $_POST['OS'] : "";
        $pin = isset($_POST['pin']) ? $_POST['pin'] : "";
        $information_details = isset($_POST['information_details']) ? $_POST['information_details'] : "";
        $product_introduction = isset($_POST['product_introduction']) ? $_POST['product_introduction'] : "";
        $rate = isset($_POST['rate']) ? (float)$_POST['rate'] : 0;

        require('../connect.php');


        if (isset($_POST['action']) && $_POST['action'] == 'delete') {
            $idToDelete = isset($_POST['idToDelete']) ? $_POST['idToDelete'] : null;
            deleteProduct($conn, $idToDelete);
        } else {
            if ($update_product) {
                editProduct($conn, $id, $update_product, $_POST);
            } else {
                addProduct($conn, $_POST);
            }
        }

        // Kiểm tra xem người dùng đã chọn nút/quay lại trang xem hay không
        if (isset($_POST['back_to_view']) || isset($_GET['back_to_view'])) {
            header("Location: view.php");
            exit();
        }

        $conn->close();
    }

    if (isset($_GET['action']) && isset($_GET['id'])) {
        $action = $_GET['action'];
        $id = $_GET['id'];

        // Nếu action là "delete"
        if ($action == 'delete') {
            require('../connect.php');
            deleteProduct($conn, $id);

            $conn->close();
            header("Location: view.php");
            exit();
        }
    }

    // Include form_product.php để hiển thị form sản phẩm
    include 'form_product.php';

    ?>

</body>

</html>