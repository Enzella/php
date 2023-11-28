<!DOCTYPE html>
<html>

<head>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI';
        }

        h1 {
            text-align: center;
            margin-bottom: 5px;
        }

        .form-group {
            display: flex;
            justify-content: space-arounds;
            width: 100%;
        }

        .form-group>div {
            width: 400px;
            margin: 20px 50px;

        }

        form {
            display: block;
            max-width: 1000px;
            margin: 0 auto;
            border: 2px solid #ccc;
            border-radius: 5px;
            background-color: #f9f9f9;
            overflow: hidden;
        }


        label {
            display: block;
            margin-top: 10px;
        }

        input[type="text"],
        input[type="number"],
        textarea,
        input[type="date"] {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            margin-bottom: 10px;
            border: 2px solid #ccc;
            border-radius: 5px;
            height: 40px;
        }

        input[type="submit"],
        input[type="reset"] {
            width: 40%;
            margin-left: 65px;
            font-size: 15px;
        }

        input[type="submit"] {
            background-color: #0074cc;
            color: #fff;
            border: none;
            border-radius: 5px;
            padding: 10px 20px;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #0056b3;
        }

        input[type="reset"] {
            background-color: #999;
            color: #000;
            border: none;
            border-radius: 5px;
            padding: 10px 20px;
            cursor: pointer;
        }

        input[type="reset"]:hover {
            background-color: #808080;
        }

        .link-button {
            background-color: #ccc;
            color: #000;
            border: none;
            border-radius: 5px;
            padding: 10px 20px;
            cursor: pointer;
            width: 50%;
            margin: 10px 250px 20px 250px;
        }

        .link-button:hover {
            background-color: grey;
        }

        a {
            font-size: 20px;
            color: black;
        }
    </style>
</head>

<body>
    <!-- Form để nhập thông tin sản phẩm -->
    <form action="<?php echo $form_action; ?>" method="post" enctype="multipart/form-data">
        <div class="form-group">
            <div>
                <label for="producer_id">ID nhà cung cấp:</label>
                <input type="number" name="producer_id" value="<?= $producer_id ?? ($update_product['producer_id'] ?? '') ?>" required min="0">

                <label for="name">Tên sản phẩm:</label>
                <input type="text" name="name" value="<?= $name ?? ($update_product['name'] ?? '') ?>" required>

                <label for="image">Link hình ảnh:</label>
                <input type="text" name="image" value="<?= $image ?? ($update_product['image'] ?? '') ?>" required>

                <label for="import_price">Giá nhập:</label>
                <input type="text" name="import_price" value="<?= $import_price ?? ($update_product['import_price'] ?? '') ?>" required>

                <label for="sale_price">Giá bán:</label>
                <input type="text" name="sale_price" value="<?= $sale_price ?? ($update_product['sale_price'] ?? '') ?>" required>

                <label for="new_price">Giá mới:</label>
                <input type="text" name="new_price" value="<?= $new_price ?? ($update_product['new_price'] ?? '') ?>">

                <label for="change_price">Giá lên đời:</label>
                <input type="text" name="change_price" value="<?= $change_price ?? ($update_product['change_price'] ?? '') ?>" >

                <label for="promotion_price">Giá khuyến mãi:</label>
                <input type="text" name="promotion_price" value="<?= $promotion_price ?? ($update_product['promotion_price'] ?? '') ?>">

                <label for="adv">Tóm tắt quảng cáo:</label>
                <textarea name="adv"><?= $adv ?? ($update_product['adv'] ?? '') ?></textarea>

                <label for="sku_code">Mã máy:</label>
                <input type="text" name="sku_code" value="<?= $sku_code ?? ($update_product['sku_code'] ?? '') ?>" required>

                <label for="monitor">Màn hình:</label>
                <input type="text" name="monitor" value="<?= $monitor ?? ($update_product['monitor'] ?? '') ?>" required>

            </div>
            <div>
            <label for="front_camera">Camera trước:</label>
                <input type="text" name="front_camera" value="<?= $front_camera ?? ($update_product['front_camera'] ?? '') ?>" required>

                <label for="rear_camera">Camera sau:</label>
                <input type="text" name="rear_camera" value="<?= $rear_camera ?? ($update_product['rear_camera'] ?? '') ?>" required>

                <label for="CPU">CPU:</label>
                <input type="text" name="CPU" value="<?= $CPU ?? ($update_product['CPU'] ?? '') ?>" required>

                <label for="GPU">GPU:</label>
                <input type="text" name="GPU" value="<?= $GPU ?? ($update_product['GPU'] ?? '') ?>" required>

                <label for="RAM">RAM:</label>
                <input type="text" name="RAM" value="<?= $RAM ?? ($update_product['RAM'] ?? '') ?>" required>

                <label for="ROM">ROM:</label>
                <input type="text" name="ROM" value="<?= $ROM ?? ($update_product['ROM'] ?? '') ?>" required>

                <label for="OS">Hệ điều hành:</label>
                <input type="text" name="OS" value="<?= $OS ?? ($update_product['OS'] ?? '') ?>" required>

                <label for="pin">Pin:</label>
                <input type="text" name="pin" value="<?= $pin ?? ($update_product['pin'] ?? '') ?>" required>

                <label for="information_details">Chi tiết thông tin:</label>
                <textarea name="information_details" ><?= $information_details ?? ($update_product['information_details'] ?? '') ?></textarea>

                <label for="product_introduction">Giới thiệu sản phẩm:</label>
                <textarea name="product_introduction" ><?= $product_introduction ?? ($update_product['product_introduction'] ?? '') ?></textarea>

                <label for="rate">Đánh giá:</label>
                <input type="number" name="rate" value="<?= $rate ?? ($update_product['rate'] ?? '') ?>" required>
            </div>
        </div>
        <div>
            <input type="submit" value="<?php echo $button_label; ?>">
            <input type="reset" name="reset" value="Reset">
            <input type="hidden" name="back_to_view" value="1" />
        </div>
        <div>
            <!-- Trong HTML của trang có nút chuyển trang -->
            <button class="link-button" onclick="window.location.href='view.php?back_to_view=1'">Quay trở về trang xem danh sách sản phẩm</button>
        </div>
    </form>
</body>

</html>