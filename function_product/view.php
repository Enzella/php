<!DOCTYPE html>
<html>

<head>
    <title>ADMIN</title>
    <style>
        * {
            padding: 0;
            margin: 0;
        }

        table {
            border-collapse: collapse;
            width: 100%;
            white-space: nowrap;
        }

        h1 {
            padding: 10px;
            text-align: center;
        }

        th,
        td {
            border: 1px solid #333;
            padding: 5px;
            text-align: center;
           
        }

        th {
            background-color: #f2f2f2;
            font-weight: bold;
            position: sticky;
            top: 0;
            z-index: 1;
        }

        th:first-child,
        td:first-child {
            position: sticky;
            left: 0;
            background-color: #f2f2f2;
            background-color: grey;
        }


        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        .add-button {
            background-color: #0074cc;
            color: #fff;
            border: none;
            border-radius: 5px;
            padding: 8px 16px;
            text-decoration: none;
        }

        .add-button-container {
            display: flex;
            justify-content: flex-start;
            margin-bottom: 10px;
            padding: 10px 0 0 15px;

        }

        form {
            display: flex;
            margin-bottom: 20px;
        }

        .edit-button {
            background-color: green;
            /* Màu xanh cho nút sửa */
            color: #fff;
            border: none;
            border-radius: 5px;
            padding: 8px 16px;
            text-decoration: none;
            cursor: pointer;
            margin-bottom: 5px;
        }

        .delete-button {
            background-color: #ff0000;
            /* Màu đỏ cho nút xóa */
            color: #fff;
            border: none;
            border-radius: 5px;
            padding: 8px 16px;
            text-decoration: none;
            cursor: pointer;
        }
        form{
            margin: 0 10px 10px 10px;
        }
        .cancel{
            width: 80px; font-weight: bold;
        }
    </style>



    <script>
        function confirmDelete(url) {
            var result = confirm("Bạn có chắc muốn xóa sản phẩm này không?");
            if (result) {
                window.location.href = url;
            } else {
                alert("Hủy bỏ xóa sản phẩm.");
            }
        }
    </script>

</head>

<body>
    <h1>Danh sách sản phẩm</h1>

    <div class="add-button-container">
        <a href='function.php' class="add-button">Thêm sản phẩm</a>
    </div>
    <form method="post" action="">
        <input type="text" name="search" value="<?php if (isset($search)) echo $search  ?>" placeholder="Tìm kiếm theo tên hoặc ID" style="padding: 8px; margin: 5px; border: 1px solid">
        <input type="submit" value="Tìm kiếm" style="border:1px solid; margin-right: 5px; width: 80px; font-weight: bold;">
        <?php
        // Kiểm tra xem đã thực hiện tìm kiếm hay chưa
        if (isset($_POST['search'])) {
            echo '<button class="cancel" type="submit" name="cancelSearch">Hủy bỏ</button>';
        }
        ?>
    </form>
    <!-- Hiển thị bảng sản phẩm -->
    <table>
        <tr>
            <th>STT</th>
            <th>ID nhà cung cấp</th>
            <th>Tên sản phẩm</th>
            <th>Hình ảnh</th>
            <th>Giá nhập</th>
            <th>Giá bán</th>
            <th>Giá mới</th>
            <th>Giá lên đời</th>
            <th>Giá khuyến mãi</th>
            <th>Tóm tắt quảng cáo</th>
            <th>Mã máy</th>
            <th>Màn hình</th>
            <th>Camera trước</th>
            <th>Camera sau</th>
            <th>CPU</th>
            <th>GPU</th>
            <th>RAM</th>
            <th>ROM</th>
            <th>OS</th>
            <th>Pin</th>
            <th>Thông tin chi tiết</th>
            <th>Giới thiệu sản phẩm</th>
            <th>Đánh giá</th>
            <th>Thao tác</th>
        </tr>
        <?php
        // Kết nối đến cơ sở dữ liệu
        require('../connect.php');


        // Truy vấn cơ sở dữ liệu để lấy danh sách sản phẩm từ bảng "products"
        $query = "SELECT * FROM products";
        $result = $conn->query($query);

        //tìm kiếm
        if (isset($_POST['search'])) {
            $search = $_POST['search'];
            $search = mysqli_real_escape_string($conn, $search); // Tránh SQL injection

            // Kiểm tra xem $search có phải là số hay không
            if (is_numeric($search)) {
                $query = "SELECT * FROM products WHERE id = $search";
            } else {
                $query = "SELECT * FROM products WHERE name LIKE '%$search%'";
            }
        } else {
            $query = "SELECT * FROM products";
        }

        $result = $conn->query($query);


        $result = $conn->query($query);
        // Hiển thị sản phẩm trong bảng và thêm nút Sửa và Xóa
        while ($row = $result->fetch_assoc()) {
            echo "<tr>";
            echo "<td>{$row['id']}</td>";
            echo "<td>{$row['producer_id']}</td>";
            echo "<td>{$row['name']}</td>";

            $image = $row["image"];
            if (mb_strlen($image, 'utf-8') > 10) {
                $image = mb_substr($image, 0, 10, 'utf-8') . '...';
            }
            echo "<td>{$image}</td>";

            echo "<td>{$row['import_price']}</td>";
            echo "<td>{$row['sale_price']}</td>";
            echo "<td>{$row['new_price']}</td>";
            echo "<td>{$row['change_price']}</td>";
            echo "<td>{$row['promotion_price']}</td>";

            $adv = $row["adv"];
            if (mb_strlen($adv, 'utf-8') > 10) {
                $adv  = mb_substr($adv, 0, 10, 'utf-8') . '...';
            }
            echo "<td>{$adv}</td>";

            echo "<td>{$row['sku_code']}</td>";
            echo "<td>{$row['monitor']}</td>";
            echo "<td>{$row['front_camera']}</td>";

            $rear = $row["rear_camera"];
            if (mb_strlen($rear, 'utf-8') > 10) {
                $rear  = mb_substr($rear, 0, 10, 'utf-8') . '...';
            }
            echo "<td>{$rear}</td>";

            echo "<td>{$row['CPU']}</td>";
            echo "<td>{$row['GPU']}</td>";
            echo "<td>{$row['RAM']}</td>";
            echo "<td>{$row['ROM']}</td>";
            echo "<td>{$row['OS']}</td>";
            echo "<td>{$row['pin']}</td>";

            $detail_info = $row["information_details"];
            if (mb_strlen($detail_info, 'utf-8') > 10) {
                $detail_info = mb_substr($detail_info, 0, 10, 'utf-8') . '...';
            }
            echo "<td>{$detail_info}</td>"; // Corrected variable name

            $product_intro = $row["product_introduction"]; // Corrected variable name
            if (mb_strlen($product_intro, 'utf-8') > 10) {
                $product_intro = mb_substr($product_intro, 0, 10, 'utf-8') . '...';
            }
            echo "<td>{$product_intro}</td>";

            echo "<td>{$row['rate']}</td>";
            echo "<td>
        <button class='edit-button' onclick=\"location.href='function.php?id={$row['id']}'\">SỬA</button>
        <button class='delete-button' onclick=\"confirmDelete('function.php?action=delete&id={$row['id']}')\">XÓA</button>
      </td>";
            echo "</tr>";
        }
        $conn->close();
        ?>
    </table>


</body>

</html>