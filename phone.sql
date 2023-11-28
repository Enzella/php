-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 28, 2023 at 07:25 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `phone`
--

-- --------------------------------------------------------

--
-- Table structure for table `advertises`
--

CREATE TABLE `advertises` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED DEFAULT NULL,
  `title` varchar(191) NOT NULL,
  `image` varchar(191) NOT NULL,
  `at_home_page` tinyint(1) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `create_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `update_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `advertises`
--

INSERT INTO `advertises` (`id`, `product_id`, `title`, `image`, `at_home_page`, `start_date`, `end_date`, `create_at`, `update_at`) VALUES
(1, NULL, 'Quảng cáo Điện thoại Xiaomi Redmi 12 4GB (1).', '', 0, '2023-10-31', '2023-11-30', '2023-10-31 10:44:42', '2023-10-31 10:44:42'),
(2, NULL, 'Quảng cáo Điện thoại Xiaomi Redmi 12 4GB (2).', '', 0, '2023-10-31', '2023-12-31', '2023-10-31 10:44:42', '2023-10-31 10:44:42');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `comment_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `content` text NOT NULL,
  `create_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `update_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `comment_id`, `user_id`, `product_id`, `content`, `create_at`, `update_at`) VALUES
(1, 1, 1, 1, 'Quá tuyệt vời, xuất sắc, tiện nghi.', '2023-10-31 09:10:50', '2023-10-31 09:10:50'),
(2, 2, 2, 1, 'Vẫn chưa về hàng hả Shop?', '2023-10-31 09:10:50', '2023-10-31 09:10:50'),
(3, 3, 3, 1, 'có cài rom quốc tế ko, có sẵn tiếng việt ko?', '2023-10-31 09:10:50', '2023-10-31 09:10:50'),
(4, 4, 4, 1, 'máy này chơi genshin đc ko ạ :v', '2023-10-31 09:10:50', '2023-10-31 09:10:50'),
(5, 5, 5, 1, 'Good', '2023-10-31 09:10:50', '2023-10-31 09:10:50'),
(6, 6, 6, 1, 'Cho mình hỏi sản phẩm này có sẵn tiếng Việt và các dịch vụ của google không ạ hay phải đợi unlock', '2023-10-31 09:10:50', '2023-10-31 09:10:50'),
(7, 7, 7, 1, 'Còn hàng ko em', '2023-10-31 09:10:50', '2023-10-31 09:10:50'),
(8, 8, 8, 1, 'Xiaomi Redmi 12 5G Global (Snapdragon 4 Gen 2) có nhập hàng về tphcm chưa ạ?', '2023-10-31 09:10:50', '2023-10-31 09:10:50'),
(9, 9, 9, 1, 'Vẫn chưa về hàng hả Shop?', '2023-10-31 09:10:50', '2023-10-31 09:10:50');

-- --------------------------------------------------------

--
-- Table structure for table `notices`
--

CREATE TABLE `notices` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `content` varchar(191) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `create_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `update_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notices`
--

INSERT INTO `notices` (`id`, `user_id`, `content`, `status`, `create_at`, `update_at`) VALUES
(1, 1, 'Khuyến mãi giảm giá 30% cho điện thoại Samsung Galaxy A series!', 1, '2023-10-31 10:07:31', '2023-10-31 10:07:31'),
(2, 1, 'Đã cập nhật mới! Model iPhone 13 Pro Max sẽ ra mắt vào tuần tới.', 0, '2023-10-31 10:07:31', '2023-10-31 10:07:31'),
(3, 1, 'Thiết kế mới của Oppo Reno7 sẽ được giới thiệu vào tháng sau.', 0, '2023-10-31 10:07:31', '2023-10-31 10:07:31'),
(4, 1, 'OnePlus Nord CE 2 sẽ ra mắt trong sự kiện toàn cầu.', 0, '2023-10-31 10:07:31', '2023-10-31 10:07:31');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `payment_method_id` bigint(20) UNSIGNED NOT NULL,
  `order_code` varchar(191) NOT NULL,
  `name` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `phone` varchar(191) NOT NULL,
  `address` varchar(191) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `create_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `update_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `payment_method_id`, `order_code`, `name`, `email`, `phone`, `address`, `status`, `create_at`, `update_at`) VALUES
(1, 2, 2, 'COD01', 'My Tam', 'tam@gmail.com', '0123456789', 'cam lam, khanh hoa', 1, '2023-10-31 10:36:18', '2023-10-31 10:36:18'),
(2, 3, 1, 'COD02', 'Thanh', 'thanh@gmail.com', '0123789456', 'nha trang', 1, '2023-10-31 10:36:18', '2023-10-31 10:36:18'),
(3, 1, 1, 'Mã đơn hàng', 'Tên', 'email@example.com', '0123456789', 'Địa chỉ', 1, '2023-11-18 22:37:21', '2023-11-18 22:37:21'),
(4, 1, 1, '51341', 'ác', 'duc.pm.62cntt@ntu.edu.vn', '123456789', '', 1, '2023-11-18 23:10:10', '2023-11-18 23:10:10'),
(5, 1, 1, '78274', 'ác', 'duc.pm.62cntt@ntu.edu.vn', '123456789', '', 1, '2023-11-18 23:11:41', '2023-11-18 23:11:41'),
(6, 1, 1, '49462', 'ác', 'duc.pm.62cntt@ntu.edu.vn', '123456789', '', 1, '2023-11-18 23:13:09', '2023-11-18 23:13:09'),
(7, 1, 1, '16122', 'ác', 'duc.pm.62cntt@ntu.edu.vn', '123456789', '', 1, '2023-11-18 23:13:29', '2023-11-18 23:13:29'),
(8, 1, 1, '59599', 'ác', 'duc.pm.62cntt@ntu.edu.vn', '123456789', '', 1, '2023-11-18 23:14:04', '2023-11-18 23:14:04'),
(9, 1, 1, '67827', 'ác', 'duc.pm.62cntt@ntu.edu.vn', '123456789', '', 1, '2023-11-18 23:17:25', '2023-11-18 23:17:25'),
(10, 1, 1, '68949', 'abcd', 'duc.pm.62cntt@ntu.edu.vn', '081234567', '20 - 180 - Số 2, Phường Lộc Thọ, Thành phố Nha Trang', 1, '2023-11-18 23:17:45', '2023-11-18 23:17:45'),
(11, 1, 1, '24715', 'abcd', 'duc.pm.62cntt@ntu.edu.vn', '081234567', '20 - 180 - Số 2, Phường Lộc Thọ, Thành phố Nha Trang', 1, '2023-11-18 23:21:04', '2023-11-18 23:21:04'),
(12, 1, 1, '30022', 'abcd', 'duc.pm.62cntt@ntu.edu.vn', '081234567', '20 - 180 - Số 2, Phường Lộc Thọ, Thành phố Nha Trang', 1, '2023-11-18 23:27:07', '2023-11-18 23:27:07'),
(13, 1, 1, '47116', 'abcd', 'duc.pm.62cntt@ntu.edu.vn', '081234567', '20 - 180 - Số 2, Phường Lộc Thọ, Thành phố Nha Trang', 1, '2023-11-18 23:27:23', '2023-11-18 23:27:23');

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `product_detail_id` bigint(20) UNSIGNED NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `create_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `update_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_details`
--

INSERT INTO `order_details` (`id`, `order_id`, `product_detail_id`, `quantity`, `price`, `create_at`, `update_at`) VALUES
(1, 1, 3, 1, 3590000, '2023-10-31 10:40:27', '2023-10-31 10:40:27'),
(2, 2, 1, 1, 3590000, '2023-10-31 10:40:27', '2023-10-31 10:40:27'),
(3, 3, 1, 10, 100000, '2023-11-18 22:37:21', '2023-11-18 22:37:21'),
(4, 9, 1, 10, 10000, '2023-11-18 23:17:25', '2023-11-18 23:17:25'),
(5, 10, 1, 10, 10000, '2023-11-18 23:17:45', '2023-11-18 23:17:45'),
(6, 13, 1, 0, 325000000, '2023-11-18 23:27:23', '2023-11-18 23:27:23');

-- --------------------------------------------------------

--
-- Table structure for table `payment_methods`
--

CREATE TABLE `payment_methods` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `describe` varchar(191) NOT NULL,
  `create_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `update_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payment_methods`
--

INSERT INTO `payment_methods` (`id`, `name`, `describe`, `create_at`, `update_at`) VALUES
(1, 'Offline', 'Trả bằng tiền mặt.', '2023-10-31 10:27:59', '2023-10-31 10:27:59'),
(2, 'Online', 'Thanh toán qua thẻ ngân hàng.', '2023-10-31 10:26:53', '2023-10-31 10:26:53');

-- --------------------------------------------------------

--
-- Table structure for table `producers`
--

CREATE TABLE `producers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `infomation` longtext NOT NULL,
  `create_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `update_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `producers`
--

INSERT INTO `producers` (`id`, `name`, `infomation`, `create_at`, `update_at`) VALUES
(1, 'Xiaomi', 'Xiaomi Corporation (“Xiaomi”) được thành lập vào tháng 4 năm 2010 và được niêm yết trên Bảng niêm yết chính (Main Board) của Thị trường Chứng khoán Hồng Kông từ ngày 9 tháng 7 năm 2018 (1810.HK).\r\nXiaomi là một công ty sản xuất thiết bị điện tử tiêu dùng và thiết bị thông minh với các sản phẩm điện thoại thông minh và phần cứng thông minh được kết nối dựa trên cốt lõi là Mạng Internet kết nối vạn vật (IoT).\r\n\r\nThực hiện tầm nhìn “Làm bạn với người dùng và trở thành công ty tuyệt vời nhất trong trái tim của người dùng”, Xiaomi liên tục theo đuổi sự đổi mới và trải nghiệm\r\nngười dùng với sự tập trung kiên định vào chất lượng và hiệu quả. Công ty không ngừng nỗ lực phát triển tạo ra những sản phẩm tuyệt vời với mức giá trung thực để cho mọi\r\nngười trên thế giới tận hưởng cuộc sống tốt hơn thông qua công nghệ tiên tiến.\r\n\r\nTheo Canalys, thị phần của Xiaomi về lượng điện thoại thông minh xuất xưởng xếp thứ 3 trên toàn cầu trong Quý 2 năm 2022. Tính đến ngày 30 tháng 6 năm 2022,\r\ncông ty cũng đã thiết lập nền tảng AIoT (AI + IoT) cho người dùng hàng đầu thế giới với 526,9 triệu thiết bị thông minh được kết nối với nền tảng của mình,\r\nkhông bao gồm điện thoại thông minh, máy tính bảng và máy tính xách tay. Các sản phẩm của Xiaomi có mặt tại hơn 100 quốc gia và khu vực trên toàn thế giới.\r\nVào tháng 8 năm 2022, Xiaomi đã lọt vào danh sách Fortune Global 500 lần thứ tư, xếp thứ 266, tăng 72 hạng so với năm 2021.\r\n\r\nXiaomi là một thành phần của Hang Seng Index, Hang Seng China Enterprises Index, Hang Seng TECH Index và Hang Seng China 50 Index.', '2023-10-31 07:09:58', '2023-10-31 07:09:58'),
(2, 'Oppo', 'Công ty OPPO được thành lập vào năm 2004 tại Đông Hoản, Quảng Đông, Trung Quốc bởi Tony Chen. Ban đầu, công ty chuyên sản xuất các thiết bị điện tử tiêu dùng như máy nghe nhạc MP3, DVD/Blu-ray và điện thoại di động Android. Năm 2010, OPPO mở rộng hoạt động sang các thị trường quốc tế với doanh nghiệp nước ngoài đầu tiên được đặt tại Thái Lan.\r\n\r\nHiện nay, OPPO là một trong top 5 hãng sản xuất điện thoại di động lớn nhất thế giới, đạt thị phần 8,1% vào đầu năm 2019. Tại Việt Nam, OPPO là hãng điện thoại di động đứng thứ 2, với thị phần lên tới 25,2% vào cuối năm 2019.', '2023-10-31 07:09:58', '2023-10-31 07:09:58'),
(3, 'Apple', 'Apple Inc. là một Tập đoàn công nghệ đa quốc gia của Mỹ có trụ sở chính tại Cupertino, California. Được đồng sáng lập bởi 3 doanh nhân là Steve Jobs, Steve Wozniak và Ronald Wayne vào tháng 4 năm 1976.\r\n\r\nCông ty chuyên sản xuất các thiết bị điện tử như điện thoại thông minh, máy tính bảng, máy tính xách tay, máy tính để bàn, đồng hồ thông minh và phụ kiện điện tử và các dịch vụ trực tuyến. \r\n\r\nCác sản phẩm của Apple được phân loại thành các dòng chính sau:\r\n\r\niPhone: dòng điện thoại thông minh của Apple.\r\n\r\niPad: dòng máy tính bảng của Apple.\r\n\r\nMac: dòng máy tính xách tay và máy tính để bàn của Apple.\r\n\r\nWatch: dòng đồng hồ thông minh của Apple.\r\n\r\nAirPods: dòng tai nghe không dây của Apple.', '2023-10-31 07:42:17', '2023-10-31 07:42:17');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `producer_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `image` varchar(191) NOT NULL,
  `import_price` varchar(20) NOT NULL,
  `sale_price` varchar(20) NOT NULL,
  `new_price` varchar(20) NOT NULL,
  `change_price` varchar(20) NOT NULL,
  `promotion_price` varchar(20) NOT NULL,
  `adv` varchar(255) NOT NULL,
  `sku_code` varchar(191) NOT NULL,
  `monitor` varchar(191) NOT NULL,
  `front_camera` varchar(191) NOT NULL,
  `rear_camera` varchar(191) NOT NULL,
  `CPU` varchar(191) NOT NULL,
  `GPU` varchar(191) NOT NULL,
  `RAM` varchar(20) NOT NULL,
  `ROM` varchar(20) NOT NULL,
  `OS` varchar(191) NOT NULL,
  `pin` varchar(191) NOT NULL,
  `information_details` longtext NOT NULL,
  `product_introduction` longtext NOT NULL,
  `rate` double NOT NULL,
  `create_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `update_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `producer_id`, `name`, `image`, `import_price`, `sale_price`, `new_price`, `change_price`, `promotion_price`, `adv`, `sku_code`, `monitor`, `front_camera`, `rear_camera`, `CPU`, `GPU`, `RAM`, `ROM`, `OS`, `pin`, `information_details`, `product_introduction`, `rate`, `create_at`, `update_at`) VALUES
(1, 3, 'Điện thoại Samsung Galaxy A52 5G', 'https://cdn.tgdd.vn/Products/Images/42/235440/samsung-galaxy-a52-5g-thumb-blue-600x600-200x200.jpg', '20,000,000', '22,000,000', '21,000,000', '', '1,000,000', 'VNPAY - Ưu đãi hấp dẫn khi thanh toán với VNPAY', 'sam-a52-5g', 'Super AMOLED, 6.5', '32 MP', 'Chính 64 MP & Phụ 12 MP, 5 MP, 5 MP', 'Qualcomm Snapdragon 750G 5G', 'Adreno 619', '6', '128', 'Android 11', '4500 mAh25 W', '', '', 4.5, '2023-10-31 01:36:43', '2023-10-31 01:36:43'),
(2, 1, 'Điện thoại iPhone 14 Pro Max', 'https://cdn.tgdd.vn/Products/Images/42/251192/iphone-14-pro-max-tim-thumb-600x600.jpg', '30,000,000', '35,000,000', '', '28,000,000', '2,000,000', 'VNPAY - Ưu đãi hấp dẫn khi thanh toán với VNPAY', 'ip-14-pro-max', 'OLED, 6.7', '12 MP', 'Chính 108 MP & Phụ 12 MP, 12 MP, TOF 3D LiDAR scanner', 'Apple A18 Bionic', 'Apple GPU (18-core graphics)', '8', '256', 'iOS 17', '5000 mAh30 W', '', '', 4.8, '2023-10-31 01:36:43', '2023-10-31 01:36:43'),
(3, 2, 'Điện thoại Xiaomi Redmi Note 11 Pro', 'https://cdn.tgdd.vn/Products/Images/42/246640/xiaomi-redmi-note-11-pro-5g-xam-thumb-600x600.jpg', '15,000,000', '17,000,000', '16,000,000', '14,000,000', '500,000', 'VNPAY - Ưu đãi hấp dẫn khi thanh toán với VNPAY', 'mi-rn11-pro', 'IPS LCD, 6.67', '16 MP', 'Chính 108 MP & Phụ 8 MP, 5 MP, 2 MP', 'MediaTek Dimensity 920', 'Mali-G68 MC4', '8', '128', 'Android 13', '5000 mAh33 W', '', '', 4.3, '2023-10-31 01:36:43', '2023-10-31 01:36:43'),
(4, 3, 'Điện thoại Samsung Galaxy S22 Ultra', 'https://hoanghamobile.com/Uploads/2022/02/09/image-removebg-preview-19.png', '35,000,000', '40,000,000', '', '33,000,000', '2,000,000', 'VNPAY - Ưu đãi hấp dẫn khi thanh toán với VNPAY', 'sam-s22-ultra', 'Dynamic AMOLED 2X, 6.8', '40 MP', 'Chính 108 MP & Phụ 10 MP, 10 MP, 12 MP', 'Exynos 2200', 'Mali-G78 MP14', '12', '512', 'Android 13', '5000 mAh45 W', '', '', 4.9, '2023-10-31 01:36:43', '2023-10-31 01:36:43'),
(5, 1, 'Điện thoại iPhone 14 Pro', 'https://cdn.tgdd.vn/Products/Images/42/247508/iphone-14-pro-tim-thumb-600x600.jpg', '25,000,000', '30,000,000', '', '23,000,000', '1,500,000', 'VNPAY - Ưu đãi hấp dẫn khi thanh toán với VNPAY', 'ip-14-pro', 'OLED, 6.1', '12 MP', 'Chính 108 MP & Phụ 12 MP, 12 MP, TOF 3D LiDAR scanner', 'Apple A18 Bionic', 'Apple GPU (18-core graphics)', '6', '128', 'iOS 17', '4000 mAh30 W', '', '', 4.6, '2023-10-31 01:36:43', '2023-10-31 01:36:43'),
(6, 3, 'Điện thoại Samsung Galaxy A72', 'https://cdn.tgdd.vn/Products/Images/42/226101/samsung-galaxy-a72-thumb-balck-600x600-200x200.jpg', '18,000,000', '20,000,000', '19,000,000', '16,000,000', '1,000,000', 'VNPAY - Ưu đãi hấp dẫn khi thanh toán với VNPAY', 'sam-a72', 'Super AMOLED, 6.7', '32 MP', 'Chính 64 MP & Phụ 12 MP, 8 MP, 5 MP', 'Qualcomm Snapdragon 720G', 'Adreno 618', '8', '128', 'Android 11', '5000 mAh25 W', '', '', 4.5, '2023-10-31 01:36:43', '2023-10-31 01:36:43'),
(7, 2, 'Điện thoại Xiaomi Redmi Note 11', 'https://cdn.tgdd.vn/Products/Images/42/245261/Xiaomi-redmi-note-11-blue-600x600.jpg', '12,000,000', '14,000,000', '13,000,000', '11,000,000', '500,000', 'VNPAY - Ưu đãi hấp dẫn khi thanh toán với VNPAY', 'mi-rn11', 'IPS LCD, 6.43', '13 MP', 'Chính 50 MP & Phụ 8 MP, 2 MP, 2 MP', 'MediaTek Helio G88', 'Mali-G52 MC2', '6', '64', 'Android 13', '5000 mAh22.5 W', '', '', 4.1, '2023-10-31 01:36:43', '2023-10-31 01:36:43'),
(8, 1, 'Điện thoại iPhone 14', 'https://cdn.hoanghamobile.com/i/productlist/dsp/Uploads/2022/09/08/anh-chup-man-hinh-2022-09-08-luc-01-57-13-removebg-preview.png', '20,000,000', '25,000,000', '23,000,000', '18,000,000', '1,500,000', 'VNPAY - Ưu đãi hấp dẫn khi thanh toán với VNPAY', 'ip-14', 'OLED, 6.1', '12 MP', 'Chính 64 MP & Phụ 12 MP, 12 MP, TOF 3D LiDAR scanner', 'Apple A18 Bionic', 'Apple GPU (18-core graphics)', '6', '256', 'iOS 17', '4000 mAh30 W', '', '', 4.6, '2023-10-31 01:36:43', '2023-10-31 01:36:43'),
(9, 3, 'Điện thoại Samsung Galaxy S21 FE', 'https://hoanghamobile.com/Uploads/2023/02/01/s21-fe-14.png', '22,000,000', '25,000,000', '24,000,000', '20,000,000', '1,000,000', 'VNPAY - Ưu đãi hấp dẫn khi thanh toán với VNPAY', 'sam-s21-fe', 'Super AMOLED, 6.4', '32 MP', 'Chính 64 MP & Phụ 12 MP, 5 MP, 5 MP', 'Qualcomm Snapdragon 888', 'Adreno 660', '8', '256', 'Android 12', '4500 mAh25 W', '', '', 4.8, '2023-10-31 01:36:43', '2023-10-31 01:36:43'),
(10, 2, 'Điện thoại Xiaomi Poco X4', 'https://cdn.mobilecity.vn/mobilecity-vn/images/2022/02/xiaomi-poco-x4-pro-5g-vang.jpg.webp', '10,000,000', '12,000,000', '11,000,000', '9,000,000', '500,000', 'VNPAY - Ưu đãi hấp dẫn khi thanh toán với VNPAY', 'poco-x4', 'IPS LCD, 6.67', '20 MP', 'Chính 64 MP & Phụ 8 MP, 2 MP, 2 MP', 'Qualcomm Snapdragon 732G', 'Adreno 618', '6', '128', 'Android 13', '5160 mAh33 W', '', '', 4.4, '2023-10-31 01:36:43', '2023-10-31 01:36:43'),
(11, 4, 'Điện thoại Oppo A16', 'https://ngocthanhmobile.com/uploads/2022/08/oppo-a16-den.png', '5,000,000', '6,000,000', '5,500,000', '', '1,000,000', 'VNPAY - Ưu đãi hấp dẫn khi thanh toán với VNPAY', 'oppo-a16', 'IPS LCD, 6.52', '8 MP', 'Chính 13 MP & Phụ 2 MP, 2 MP', 'MediaTek Helio G35', 'PowerVR GE8320', '4', '64', 'Android 11', '5000 mAh10 W', '', '', 4, '2023-11-16 12:48:38', '2023-11-16 12:48:38'),
(12, 5, 'Điện thoại Vivo Y33s', 'https://cdn.tgdd.vn/Products/Images/42/249102/Vivo-y33s-yellow-thumb-600x600.jpg', '7,000,000', '8,000,000', '7,500,000', '', '1,000,000', 'VNPAY - Ưu đãi hấp dẫn khi thanh toán với VNPAY', 'vivo-y33s', 'IPS LCD, 6.58', '16 MP', 'Chính 50 MP & Phụ 2 MP, 2 MP', 'MediaTek Helio G80', 'Mali-G52 MC2', '6', '128', 'Android 11', '5000 mAh18 W', '', '', 4.1, '2023-11-16 12:48:38', '2023-11-16 12:48:38'),
(13, 6, 'Điện thoại Realme GT Neo 2', 'https://cdn.tgdd.vn/Files/2021/09/22/1384753/6_600x600.jpg', '10,000,000', '12,000,000', '11,000,000', '10,000,000', '2,000,000', 'VNPAY - Ưu đãi hấp dẫn khi thanh toán với VNPAY', 'realme-gt-neo-2', 'Super AMOLED, 6.62', '16 MP', 'Chính 64 MP & Phụ 8 MP, 2 MP', 'Qualcomm Snapdragon 870 5G', 'Adreno 650', '8', '128', 'Android 11', '5000 mAh50 W', '', '', 4.6, '2023-11-16 12:48:38', '2023-11-16 12:48:38'),
(14, 7, 'Điện thoại Nokia C30', 'https://cdn.tgdd.vn/Products/Images/42/239748/nokia-c30-xam-1-600x600.jpg', '3,000,000', '4,000,000', '3,500,000', '', '1,000,000', 'VNPAY - Ưu đãi hấp dẫn khi thanh toán với VNPAY', 'nokia-c30', 'IPS LCD, 6.82', '5 MP', 'Chính 13 MP & Phụ 2 MP', 'Unisoc SC9863A', 'Mali-G52 MC2', '2', '32', 'Android 11', '6000 mAh10 W', '', '', 3.5, '2023-11-16 12:48:38', '2023-11-16 12:48:38'),
(15, 8, 'Điện thoại Xiaomi Mi 11T', 'https://cdn.tgdd.vn/Products/Images/42/248293/Xiaomi-11T-White-1-2-3-600x600.jpg', '15,000,000', '17,000,000', '16,000,000', '', '2,000,000', 'VNPAY - Ưu đãi hấp dẫn khi thanh toán với VNPAY', 'xiaomi-mi-11t', 'IPS LCD, 6.67', '20 MP', 'Chính 64 MP & Phụ 8 MP, 5 MP', 'Qualcomm Snapdragon 870 5G', 'Adreno 650', '8', '128', 'Android 11', '5000 mAh33 W', '', '', 4.3, '2023-11-16 12:48:38', '2023-11-16 12:48:38'),
(16, 4, 'Điện thoại Samsung Galaxy A72 5G', 'https://cdn.tgdd.vn/Products/Images/42/226101/samsung-galaxy-a72-thumb-balck-600x600-600x600.jpg', '21,000,000', '23,000,000', '22,000,000', '', '1,000,000', 'VNPAY - Ưu đãi hấp dẫn khi thanh toán với VNPAY', 'sam-a72-5g', 'Super AMOLED, 6.7', '32 MP', 'Chính 64 MP & Phụ 12 MP, 8 MP, 5 MP', 'Qualcomm Snapdragon 778G 5G', 'Adreno 642L', '8', '128', 'Android 11', '5000 mAh25 W', '', '', 4.5, '2023-10-31 01:36:43', '2023-10-31 01:36:43'),
(17, 5, 'Điện thoại iPhone 15 Pro Max', 'https://hoanghamobile.com/Uploads/2023/09/13/iphone-15-pro-max-natural-titanium-pure-back-iphone-15-pro-max-natural-titanium-pure-front-2up-screen-usen-1.png', '35,000,000', '40,000,000', '38,000,000', '32,000,000', '2,000,000', 'VNPAY - Ưu đãi hấp dẫn khi thanh toán với VNPAY', 'ip-15-pro-max', 'OLED, 6.9', '12 MP', 'Chính 128 MP & Phụ 12 MP, 12 MP, TOF 3D LiDAR scanner', 'Apple A19 Bionic', 'Apple GPU (20-core graphics)', '12', '512', 'iOS 18', '5500 mAh30 W', '', '', 4.9, '2023-10-31 01:36:43', '2023-10-31 01:36:43'),
(18, 6, 'Điện thoại Xiaomi Redmi Note 12 Pro', 'https://cdn.hoanghamobile.com/i/productlist/dsp/Uploads/2023/03/24/redminote12pro5g-0.png', '16,000,000', '18,000,000', '17,000,000', '15,000,000', '500,000', 'VNPAY - Ưu đãi hấp dẫn khi thanh toán với VNPAY', 'mi-rn12-pro', 'IPS LCD, 6.8', '16 MP', 'Chính 108 MP & Phụ 8 MP, 5 MP, 2 MP', 'MediaTek Dimensity 1200', 'Mali-G78 MC12', '8', '256', 'Android 14', '5500 mAh33 W', '', '', 4.4, '2023-10-31 01:36:43', '2023-10-31 01:36:43'),
(19, 2, 'Điện thoại Oppo Reno 7 Pro', 'https://cdn.tgdd.vn/Products/Images/42/271717/oppo-reno7-z-5g-thumb-1-1-600x600.jpg', '22,000,000', '25,000,000', '24,000,000', '20,000,000', '1,000,000', 'VNPAY - Ưu đãi hấp dẫn khi thanh toán với VNPAY', 'oppo-r7-pro', 'AMOLED, 6.8', '32 MP', 'Chính 64 MP & Phụ 8 MP, 2 MP, 2 MP', 'Qualcomm Snapdragon 870 5G', 'Adreno 650', '12', '256', 'Android 12', '4500 mAh65 W', '', '', 4.6, '2023-10-31 01:36:43', '2023-10-31 01:36:43'),
(20, 3, 'Samsung Galaxy Z Fold5 5G', 'https://cdn.tgdd.vn/Products/Images/42/310805/samsung-galaxy-z-fold5-%20xanh-600x600.jpg', '30,000,000', '35,000,000', '33,000,000', '28,000,000', '2,000,000', 'VNPAY - Ưu đãi hấp dẫn khi thanh toán với VNPAY', 'sam-z-fold5-5g', 'Dynamic AMOLED 2X, 7.6', '10 MP', 'Chính 108 MP & Phụ 12 MP, 12 MP, 12 MP', 'Qualcomm Snapdragon 8 Gen 2', 'Adreno 730', '12', '256', 'Android 13', '4400 mAh', '', '', 4.7, '2023-11-16 12:42:52', '2023-11-16 12:42:52'),
(21, 1, 'Điện thoại Xiaomi Redmi 12 4GB', 'https://cdn.tgdd.vn/Products/Images/42/307245/xiaomi-redmi-12-xanh-1.jpg', '15,000,000', '17,000,000', '16,000,000', '14,000,000', '1,000,000', '', 'mi-r12-4', 'IPS LCD, 6.79\\\", Full HD+', '8 MP', 'Chính 50 MP & Phụ 8 MP, 2 MP', 'MediaTek Helio G88', 'Mali-G52', '4', '128', 'Android 13', '5000 mAh18 W', 'Màn hình\r\nCông nghệ màn hình: IPS LCD\r\nĐộ phân giải: Full HD+ (1080 x 2460 Pixels)\r\nMàn hình rộng: 6.79\" - Tần số quét 90 Hz\r\nĐộ sáng tối đa: 550 nits\r\nMặt kính cảm ứng:  Kính cường lực Corning Gorilla Glass 3\r\n\r\nCamera sau\r\nĐộ phân giải: Chính 50 MP & Phụ 8 MP, 2 MP\r\nQuay phim: HD 720p@30fpsFullHD 1080p@30fps\r\nĐèn Flash: Có\r\nTính năng:\r\nTrôi nhanh thời gian (Time Lapse)\r\nGóc siêu rộng (Ultrawide)\r\nZoom kỹ thuật số\r\nXóa phông\r\nBan đêm (Night Mode)\r\nChuyên nghiệp (Pro)\r\nHDR\r\nSiêu độ phân giải\r\nLàm đẹp\r\nSiêu cận (Macro)\r\nGoogle Lens\r\nBộ lọc màu\r\n\r\nCamera trước\r\nĐộ phân giải: 8 MP\r\nTính năng:\r\nTrôi nhanh thời gian (Time Lapse)\r\nLàm đẹp\r\nQuay video Full HD\r\nQuay video HD\r\nXóa phông\r\nBộ lọc màu\r\n\r\nHệ điều hành & CPU\r\nHệ điều hành: Android 13\r\nChip xử lý (CPU): MediaTek Helio G88 8 nhân\r\nTốc độ CPU: 2.0 GHz\r\nChip đồ họa (GPU): Mali-G52\r\n\r\nBộ nhớ & Lưu trữ\r\nRAM: 4 GB\r\nDung lượng lưu trữ: 128 GB\r\nDung lượng còn lại (khả dụng) khoảng: 115 GB\r\nThẻ nhớ: MicroSD, hỗ trợ tối đa 1 TB\r\nDanh bạ: Không giới hạn\r\n\r\nKết nối\r\nMạng di động: Hỗ trợ 4G\r\nSIM: 2 Nano SIM (SIM 2 chung khe thẻ nhớ)\r\nWifi: \r\nWi-Fi 802.11 a/b/g/n/ac\r\nWi-Fi hotspot\r\nDual-band (2.4 GHz/5 GHz)\r\nGPS:\r\nBEIDOU\r\nGPS\r\nGLONASS\r\nGALILEO\r\nBluetooth: v5.3\r\nCổng kết nối/sạc: Type-C\r\nJack tai nghe: 3.5 mm\r\nKết nối khác: Hồng ngoại\r\n\r\nPin & Sạc\r\nDung lượng pin: 5000 mAh\r\nLoại pin: Li-Po\r\nHỗ trợ sạc tối đa: 18 W\r\nSạc kèm theo máy: 18 W\r\nCông nghệ pin:\r\nSạc pin nhanh\r\nTiết kiệm pin\r\nSiêu tiết kiệm pin\r\n\r\nTiện ích\r\nBảo mật nâng cao: Mở khoá vân tay cạnh viền Mở khoá khuôn mặt\r\nTính năng đặc biệt: \r\nCử chỉ thông minh\r\nMở rộng bộ nhớ RAM\r\nChặn cuộc gọi\r\nChặn tin nhắn\r\nChạm 2 lần tắt/sáng màn hình\r\nThu nhỏ màn hình sử dụng một tay\r\nĐa cửa sổ (chia đôi màn hình)\r\nKhông gian thứ hai\r\nTrợ lý ảo Google Assistant\r\nKháng nước, bụi: IP53\r\nGhi âm: Ghi âm mặc định Ghi âm cuộc gọi\r\nRadio: Có\r\nXem phim: Có\r\nNghe nhạc: Có\r\n\r\nThông tin chung\r\nThiết kế: Nguyên khối\r\nChất liệu: Khung nhựa & Mặt lưng kính\r\nKích thước, khối lượng: Dài 168.6 mm - Ngang 76.28 mm - Dày 8.17 mm - Nặng 198.5 g\r\nThời điểm ra mắt: 06/2023', 'Xiaomi Redmi 12 mẫu điện thoại mới nhất được nhà Xiaomi tung ra vào tháng 06/2023 khiến cho cộng đồng đam mê công nghệ vô cùng thích thú. Máy khoác lên mình một vẻ ngoài cá tính, màn hình lớn đem đến trải nghiệm đã mắt cùng một hiệu năng ổn định với mọi tác vụ.\r\nVẻ ngoài đơn giản\r\nThiết kế của Xiaomi Redmi 12 4GB được lấy cảm hứng từ sự tối giản khi mặt lưng được làm từ kính bóng bẩy đi cùng với thân máy khá mỏng nhẹ mang đến vẻ ngoài thời trang, trẻ trung cùng khả năng cầm nắm tốt hơn khi sử dụng trong thời gian dài.\r\nMặt trước của điện thoại thiết kế kiểu nốt ruồi, đồng thời các viền xung quanh được hãng tối ưu khá mỏng hứa hẹn mang đến cho bạn góc nhìn rộng hơn giúp việc giải trí trở nên trọn vẹn.\r\nMàn hình lớn giải trí vui\r\nVới mong muốn đem lại sự thư giãn sau giờ làm việc căng thẳng hoặc một góc nhìn rõ ràng sắc nét hơn. Xiaomi đã trang bị tấm nền IPS LCD với kích thước lên đến 6.79 inch cùng độ phân giải Full HD+ (1080 x 2460 Pixels) giúp bạn xem các nội dung trên YouTube hoặc Netflix tốt hơn. Màn hình này cho chất lượng hiển thị tốt, màu sắc chân thực, độ tương phản cao và góc nhìn rộng.\r\nRedmi 12 hiển thị hình ảnh khá tốt khi ở ngoài trời nắng, không bị mờ khi máy có độ sáng tối đa lên đến 550 nits một con số ổn trong phân khúc. Ngoài ra, màn hình này còn được hỗ trợ tần số quét 90 Hz giúp cho các thao tác vuốt chạm trên máy được diễn ra mượt mà và nhanh chóng hơn.\r\nTrải nghiệm ổn định với các tác vụ thường ngày\r\nCung cấp sức mạnh cho máy là chip xử lý Helio G88 đến từ nhà MediaTek, có tốc độ xử lý 2.0 GHz cho khả năng xử lý khá ổn định và mượt mà với các tác vụ lướt web, nghe nhạc, xem phim, chỉnh sửa ảnh,… thậm chí bạn có thể chơi với các tựa game như: Liên Quân Mobile, PUBG Mobile ở mức cấu hình tầm trung.\r\nĐiện thoại RAM 4 GB tuy mức RAM không quá cao nhưng hãng cũng đã tích hợp tính năng mở rộng RAM nên vấn đề đa nhiệm trên máy không còn quá bận tâm nữa. Khi các thao tác chuyển đổi qua lại giữa tab không phải đợi load lại cũng như gặp hiện tượng giật lag.\r\nCụm camera chất lượng để trải nghiệm\r\nCụm camera sau của Redmi 12 bao gồm camera chính 50 MP, 2 camera phụ 8 MP và 2 MP, hỗ trợ quay phim và chụp ảnh chất lượng cao với các hiệu ứng làm đẹp thông minh, cân bằng tốt màu sắc và ánh sáng cho bức ảnh chân thực, có độ nét cao.\r\nPhía trước điện thoại bạn sẽ có ngay camera selfie với độ phân giải 8 MP đi cùng với nhiều tính năng như: làm đẹp, bộ lọc màu,... giúp bạn có những bức ảnh tự sướng đẹp mắt mà không cần dùng đến ứng dụng bên thứ 3.\r\nViên pin 5000 mAh thoải mái dùng cả ngày\r\nMột chi tiết đáng chú ý khác của Xiaomi Redmi 12 là viên pin lớn 5000 mAh, điện thoại có thể dễ dàng cung cấp đủ năng lượng để giữ cho thiết bị hoạt động suốt cả ngày, ngay cả khi sử dụng nhiều.\r\nBên cạnh đó, máy cũng hỗ trợ sạc nhanh 18 W, vì vậy bạn có thể nhanh chóng lấp đầy dung lượng của thiết bị mà không cần phải mất quá nhiều thời gian chờ đợi.\r\nXiaomi Redmi 12 sẽ là sự lựa chọn phù hợp với những bạn đang có nhu cầu tìm kiếm một chiếc điện thoại có vẻ ngoài đẹp mắt, màn hình lớn cho hình ảnh sắc nét cùng một hiệu năng ổn định với các tác vụ hằng ngày.', 4, '2023-11-16 19:27:52', '2023-11-16 19:27:52');

-- --------------------------------------------------------

--
-- Table structure for table `product_details`
--

CREATE TABLE `product_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `color` varchar(191) NOT NULL,
  `import_quantity` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `promotion_start_date` date NOT NULL,
  `promotion_end_date` date NOT NULL,
  `create_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `update_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_details`
--

INSERT INTO `product_details` (`id`, `product_id`, `color`, `import_quantity`, `quantity`, `promotion_start_date`, `promotion_end_date`, `create_at`, `update_at`) VALUES
(1, 21, 'Màu Đen', 100, 30, '2023-10-31', '2023-11-14', '2023-10-31 08:52:33', '2023-10-31 08:52:33'),
(2, 20, 'Màu Xanh', 100, 100, '2023-10-31', '2023-11-14', '2023-10-31 08:52:33', '2023-10-31 08:52:33'),
(3, 19, 'Màu Trắng', 100, 50, '2023-10-31', '2023-11-14', '2023-10-31 08:52:33', '2023-10-31 08:52:33');

-- --------------------------------------------------------

--
-- Table structure for table `product_images`
--

CREATE TABLE `product_images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_detail_id` bigint(20) UNSIGNED NOT NULL,
  `image_name` varchar(191) NOT NULL,
  `Image_path` varchar(191) NOT NULL,
  `create_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `update_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_images`
--

INSERT INTO `product_images` (`id`, `product_detail_id`, `image_name`, `Image_path`, `create_at`, `update_at`) VALUES
(1, 1, 'xiaomi redmi 12 4GB màu đen', '', '2023-10-31 08:57:25', '2023-10-31 08:57:25'),
(2, 2, 'xiaomi redmi 12 4GB màu xanh', '', '2023-10-31 08:57:25', '2023-10-31 08:57:25'),
(3, 3, 'xiaomi redmi 12 4GB màu trắng', '', '2023-10-31 08:57:25', '2023-10-31 08:57:25');

-- --------------------------------------------------------

--
-- Table structure for table `product_votes`
--

CREATE TABLE `product_votes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `rate` double NOT NULL,
  `content` varchar(191) NOT NULL,
  `create_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `update_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_votes`
--

INSERT INTO `product_votes` (`id`, `user_id`, `product_id`, `rate`, `content`, `create_at`, `update_at`) VALUES
(1, 4, 1, 5, 'Rất đẹp.', '2023-10-31 09:01:23', '2023-10-31 09:01:23'),
(3, 6, 1, 3, 'Tạm ổn.', '2023-10-31 09:01:23', '2023-10-31 09:01:23');

-- --------------------------------------------------------

--
-- Table structure for table `promotions`
--

CREATE TABLE `promotions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `content` varchar(191) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `create_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `update_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `promotions`
--

INSERT INTO `promotions` (`id`, `product_id`, `content`, `start_date`, `end_date`, `create_at`, `update_at`) VALUES
(2, 20, 'Quà tặng kèm khi mua Xiaomi Redmi 12 trong tháng này.', '2023-10-31', '2023-11-14', '2023-10-31 10:53:52', '2023-10-31 10:53:52'),
(3, 19, 'Giảm giá 25% ngày Quốc Khánh', '2023-11-22', '2023-11-24', '2023-10-31 10:53:52', '2023-10-31 10:53:52');

-- --------------------------------------------------------

--
-- Table structure for table `tintuc`
--

CREATE TABLE `tintuc` (
  `matt` int(11) NOT NULL,
  `tieude` varchar(255) NOT NULL,
  `ndngan` text NOT NULL,
  `noidung` text NOT NULL,
  `hinhanh` varchar(255) NOT NULL,
  `ngaydangtin` date NOT NULL,
  `tacgia` varchar(50) NOT NULL,
  `trangthai` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `tintuc`
--

INSERT INTO `tintuc` (`matt`, `tieude`, `ndngan`, `noidung`, `hinhanh`, `ngaydangtin`, `tacgia`, `trangthai`) VALUES
(1, 'Lumia 1020 tiếp tục giảm giá, chỉ còn dưới 10 triệu đồng 22222222', 'Chỉ với 111111111111111111111111đ1233333333333111111111111111ồng, chúng ta đã có thể sở hữu chiếc điện thoại chụp hình tốt nhất hiện nay - Lumia 1020.', '<p><a class=11111111111 124124 124 1222222222111', 'img20140520084020image-1400472196-LG-G3-2.jpg', '2023-11-28', 'Zing', 0),
(2, 'Samsung quay lại sản xuất điện thoại nắp gập cao cấp với G9098', 'Chiếc điện thoại có tên G9098 của Samsung dành riêng cho nhà mạng China Mobile', '<p>Điện thoại nắp trượt (slide) hay gập kiểu vỏ s&ograve; (flip) từng l&agrave; những sản phẩm thời thượng của thập ni&ecirc;n trước. Nhưng khi m&agrave; kỷ nguy&ecirc;n của&nbsp;<a class=\"auto-link\" href=\"http://www.techz.vn/C/dien-thoai\" style=\"border: 0px; outline: 0px; vertical-align: baseline; background-color: transparent; margin: 0px; padding: 0px; text-decoration: none; color: rgb(41, 41, 41);\" target=\"_blank\">điện thoại</a>&nbsp;m&agrave;n h&igrave;nh cảm ứng lớn l&ecirc;n ng&ocirc;i, c&aacute;c nh&agrave; sản xuất cũng kh&ocirc;ng c&ograve;n tung ra những mẫu điện thoại c&oacute; thiết kế độc đ&acirc;&oacute; n&agrave;y nữa.</p>\r\n\r\n<p>Mặc d&ugrave; kh&ocirc;ng được ưa chuộng nhiều nhưng kh&ocirc;ng phải n&oacute; kh&ocirc;ng c&ograve;n được y&ecirc;u th&iacute;ch v&agrave; điện thoại gập cũng c&oacute; những ưu điểm ri&ecirc;ng. Samsung được cho l&agrave; đang quay trở lại sản xuất một chiếc điện thoại nắp gập d&agrave;nh ri&ecirc;ng cho nh&agrave; mạng lớn nhất thế giới China Mobile. Sản phẩm c&oacute; t&ecirc;n m&atilde;n G9098, c&oacute; thiết kế mặt trược vu&ocirc;ng vắn vốn đ&atilde; kh&ocirc;ng xuất hiện tr&ecirc;n c&aacute;c sản phẩm của Samsung từ sau chiếc Galaxy SII, mặt sau bằng nhựa giả da như tr&ecirc;n chiếc Note III.</p>\r\n\r\n<p><img alt=\"Samsung quay lại sản xuất điện thoại nắp gập cao cấp với G9098\" src=\"http://cache.media.techz.vn/upload/2014/05/20/image-1400556669-Samsung-G9098.jpg\" style=\"background-color:transparent; border:0px; display:block; height:auto; margin:0px auto; max-width:100%; outline:0px; padding:0px; vertical-align:baseline\" title=\"Samsung quay lại sản xuất điện thoại nắp gập cao cấp với G9098\" /></p>\r\n\r\n<p>Điểm độc đ&aacute;o của chiếc điện thoại n&agrave;y ở chỗ, n&oacute; c&oacute; 2 m&agrave;n h&igrave;nh 3,67 inch b&ecirc;n trong v&agrave; b&ecirc;n ngo&agrave;i, đều l&agrave; Super AMOLED độ ph&acirc;n giải 480 x 800 pixel. M&aacute;y được trang bị vi xử l&yacute; l&otilde;i tứ 2,3GHz (c&oacute; thể l&agrave; Snapdragon 800), RAM 2GB, camera ch&iacute;nh 13MP, phụ 2MP, c&oacute; khe cắm thẻ nhớ v&agrave; đi k&egrave;m vi&ecirc;n pin 1900mAh.</p>\r\n\r\n<p>Với cấu h&igrave;nh tr&ecirc;n th&igrave; Samsung G9098 kh&ocirc;ng phải l&agrave; một sản phẩm b&igrave;nh d&acirc;n, v&agrave; chắc chắn l&agrave; cao cấp nhất trong c&aacute;c d&ograve;ng điện thoại nắp gập hiện nay. M&aacute;y sẽ chỉ được b&aacute;n tại thị trường Trung Quốc v&agrave; gi&aacute; cả vẫn chưa được tiết lộ.</p>\r\n', '20140520083543image-1400556662-Samsung-G9098-2.jpg', '2014-05-20', 'Techz', 0),
(3, 'HTC One M8 Prime có khả năng chống nước, cấu hình siêu khủng', 'Khả năng rất cao, chúng ta sẽ có 2 mẫu smartphone siêu cao cấp ‘Prime’ đến từ 2 nhà sản xuất khác nhau...', '<p>Sau những th&ocirc;ng tin v&agrave; h&igrave;nh ảnh kh&aacute; chi tiết về&nbsp;<a class=\"auto-link\" href=\"http://www.techz.vn/topic/samsung-galaxy-s5-162.html\" style=\"border: 0px; outline: 0px; vertical-align: baseline; background-color: transparent; margin: 0px; padding: 0px; text-decoration: none; color: rgb(41, 41, 41);\" target=\"_blank\">Samsung Galaxy S5</a>&nbsp;Prime bằng vỏ kim loại. Trang tin chuy&ecirc;n r&ograve; rỉ @evleaks lại tiếp tục tiết lộ mẫu flagship tiếp theo của&nbsp;<a class=\"auto-link\" href=\"http://www.techz.vn/topic/htc-65.html\" style=\"border: 0px; outline: 0px; vertical-align: baseline; background-color: transparent; margin: 0px; padding: 0px; text-decoration: none; color: rgb(41, 41, 41);\" target=\"_blank\">HTC</a>, thật th&uacute; vị l&agrave; m&aacute;y cũng c&oacute; t&ecirc;n m&atilde; &lsquo;Prime&rsquo;.</p>\n\n<p><img alt=\"HTC One M8 Prime có khả năng chống nước, cấu hình siêu khủng\" src=\"http://cache.media.techz.vn/upload/2014/05/20/image-1400543309-HTC-One-M8-Prime-features-01.png\" style=\"background-color:transparent; border:0px; display:block; height:auto; margin:0px auto; max-width:100%; outline:0px; padding:0px; vertical-align:baseline\" title=\"HTC One M8 Prime có khả năng chống nước, cấu hình siêu khủng\" /></p>\n\n<p>Những th&ocirc;ng tin n&agrave;y được đăng tải kh&aacute; cụ thể tr&ecirc;n trang tweet của @evleaks, đặc biệt chất liệu h&igrave;nh th&agrave;nh ch&iacute;nh&nbsp;<a class=\"auto-link\" href=\"http://www.techz.vn/topic/htc-m8-213.html\" style=\"border: 0px; outline: 0px; vertical-align: baseline; background-color: transparent; margin: 0px; padding: 0px; text-decoration: none; color: rgb(41, 41, 41);\" target=\"_blank\">HTC M8</a>&nbsp;Prime sẽ được kết tinh từ &ldquo;nh&ocirc;m v&agrave; silicon lỏng&rdquo;. Kh&ocirc;ng những thế M8 Prime c&ograve;n c&oacute; thể chống thấm nước, m&agrave;n h&igrave;nh 5.5 inch độ ph&acirc;n giải l&ecirc;n tới Quad HD (1440<a class=\"auto-link\" href=\"http://www.techz.vn/topic/moto-x2-214.html\" style=\"border: 0px; outline: 0px; vertical-align: baseline; background-color: transparent; margin: 0px; padding: 0px; text-decoration: none; color: rgb(41, 41, 41);\" target=\"_blank\">x2</a>560 pixels), vi xử l&yacute; 4 nh&acirc;n Snapdragon 805 tốc độ 2.5GHz, 3GB RAM, hỗ trợ mạng kết nối &lsquo;si&ecirc;u tốc&rsquo; LTE-A Cat. 6.</p>\n\n<p><img alt=\"HTC One M8 Prime có khả năng chống nước, cấu hình siêu khủng\" src=\"http://cache.media.techz.vn/upload/2014/05/20/image-1400543391-HTC-One-M8-3-700x393.jpg\" style=\"background-color:transparent; border:0px; display:block; height:auto; margin:0px auto; max-width:100%; outline:0px; padding:0px; vertical-align:baseline\" title=\"HTC One M8 Prime có khả năng chống nước, cấu hình siêu khủng\" /></p>\n\n<p>Thời điểm Qualcomm tr&igrave;nh l&agrave;ng loại chipset Snapdragon 805 c&oacute; thể phải chờ đến sự kiện&nbsp;<a class=\"auto-link\" href=\"http://www.techz.vn/su-kien-cong-nghe/15/mwc-2014-mobile-world-congress-2014.html\" style=\"border: 0px; outline: 0px; vertical-align: baseline; background-color: transparent; margin: 0px; padding: 0px; text-decoration: none; color: rgb(41, 41, 41);\" target=\"_blank\">MWC 2014</a>diễn ra v&agrave;o th&aacute;ng 2, v&igrave; vậy vẫn c&ograve;n kh&aacute; l&acirc;u để ch&uacute;ng ta được chi&ecirc;m ngưỡng dung nhan ch&iacute;nh thức từ M8 Prime. Ngo&agrave;i ra, mạng kết nối LTE-A Cat. 6. c&oacute; khả năng download l&ecirc;n đến 300Mbps, chắc hẳn đ&acirc;y l&agrave; thiết bị đầu ti&ecirc;n của HTC đạt đến &#39;cảnh giới&#39; n&agrave;y.</p>\n\n<p>Mặc d&ugrave; trang bị nhiều&nbsp;<a class=\"auto-link\" href=\"http://www.techz.vn/\" style=\"border: 0px; outline: 0px; vertical-align: baseline; background-color: transparent; margin: 0px; padding: 0px; text-decoration: none; color: rgb(41, 41, 41);\" target=\"_blank\">c&ocirc;ng nghệ</a>&nbsp;v&agrave; cải tiến vượt trội như vậy, nhưng v&oacute;c d&aacute;ng của One M8 Prime hứa hẹn sẽ kh&ocirc;ng mấy đổi kh&aacute;c so với mẫu M8 hiện tại (v&agrave;&nbsp;<a class=\"auto-link\" href=\"http://www.techz.vn/tag/HTC-One-mini\" style=\"border: 0px; outline: 0px; vertical-align: baseline; background-color: transparent; margin: 0px; padding: 0px; text-decoration: none; color: rgb(41, 41, 41);\" target=\"_blank\">One Mini</a>&nbsp;2).</p>\n', '20140520083628image-1400543386-HTC-One-M8-Harman-Kardon-Edition-rear.jpg', '2014-05-20', 'Techz', 0),
(4, 'Đánh giá camera 5 Mpx không đèn LED của Lumia 630', 'Nằm trong phân khúc thấp của thị trường smartphone, Lumia 630 chỉ được trang bị một camera 5 Mpx, không có cả đèn LED hỗ trợ chụp ban đêm. Tuy nhiên, Lumia 630 vẫn có thể chụp được những tấm ảnh có chất lượng khá tốt, độ nét sâu...', '<p>Nằm trong phân khúc thấp của thị trường <a class=', '20140520083722image-1400556298-camera-nokia-lumia-630.jpg', '2014-05-20', '', 0),
(5, 'Cận ngày ra mắt, LG G3 tiếp tục lộ giá bán', 'Chỉ còn khoảng 1 tuần nữa, ‘bom tấn’ LG G3 sẽ chính thức đổ bộ...', '<p>Vào thời điểm này, những thông tin về <a class=', '20140520083628image-1400543386-HTC-One-M8-Harman-Kardon-Edition-rear.jpg', '2023-11-01', 'Techz', 0),
(6, 'Sẽ không thể vừa sử dụng Xperia Z2, vừa đeo kính râm', 'Sự phân cực trên màn hình và trên kính sẽ khiến người dùng không thể nhìn thấy gì từ màn hình của chiếc Xperia Z2...', '<p>Mới đ&acirc;y, một người d&ugrave;ng tr&ecirc;n Xperia Blog đ&atilde; ph&aacute;t hiện ra một chi tiết kh&aacute; bất ngờ, đ&oacute; l&agrave; chiếc&nbsp;<a class=\"auto-link\" href=\"http://www.techz.vn/topic/sony-xperia-z2-228.html\" style=\"border: 0px; outline: 0px; vertical-align: baseline; background-color: transparent; margin: 0px; padding: 0px; text-decoration: none; color: rgb(41, 41, 41);\" target=\"_blank\">Sony Xperia Z2</a>&nbsp;gặp vấn đề khi người d&ugrave;ng đeo k&iacute;nh r&acirc;m. Cụ thể, với một số loại k&iacute;nh r&acirc;m m&agrave; người d&ugrave;ng sử dụng, khi m&agrave;n h&igrave;nh ở chế độ xoay ngang, ch&uacute;ng ta sẽ kh&ocirc;ng thể nh&igrave;n thấy g&igrave; tr&ecirc;n m&agrave;n h&igrave;nh, v&igrave; n&oacute; đ&atilde; &hellip; tối đen.</p>\n\n<p>C&oacute; vẻ như kh&ocirc;ng li&ecirc;n quan lắm, nhưng điều n&agrave;y l&agrave; c&oacute; thực, bạn c&oacute; thể xem video v&agrave; ảnh so s&aacute;nh dưới đ&acirc;y:</p>\n\n<p>&nbsp;</p>\n\n<p>Điều n&agrave;y chỉ xảy ra với c&aacute;c loại k&iacute;nh m&aacute;t ph&acirc;n cực khi đeo k&iacute;nh ở đ&uacute;ng tư thế, v&agrave; ho&agrave;n to&agrave;n c&oacute; thể giải th&iacute;ch. Tất cả&nbsp;<a class=\"auto-link\" href=\"http://www.techz.vn/C/dien-thoai\" style=\"border: 0px; outline: 0px; vertical-align: baseline; background-color: transparent; margin: 0px; padding: 0px; text-decoration: none; color: rgb(41, 41, 41);\" target=\"_blank\">điện thoại</a>&nbsp;hiện nay đều được trang bị một m&agrave;ng lọc ph&acirc;n cực tr&ecirc;n m&agrave;n h&igrave;nh để đảm bảo g&oacute;c nh&igrave;n tốt khi nh&igrave;n nghi&ecirc;ng v&agrave; c&aacute;c tia s&aacute;ng từ m&agrave;n h&igrave;nh kh&ocirc;ng chiếu trực tiếp đến mắt người, g&acirc;y ch&oacute;i v&agrave; nhức mắt khi sử dụng. K&iacute;nh r&acirc;m cũng vậy, lớp m&agrave;ng ph&acirc;n cực tr&ecirc;n k&iacute;nh d&acirc;m n&agrave;y c&oacute; thể so s&aacute;nh như một chiếc cửa chớp v&ocirc; h&igrave;nh, chỉ cho &aacute;nh s&aacute;ng ph&acirc;n cực theo một hướng n&agrave;o đ&oacute; đi qua.</p>\n\n<p><img alt=\"Sẽ không thể vừa sử dụng Xperia Z2, vừa đeo kính râm\" src=\"http://cache.media.techz.vn/upload/2014/05/19/image-1400486092-Xperia-Z2-kinh-ram-2.jpg\" style=\"background-color:transparent; border:0px; display:block; height:auto; margin:0px auto; max-width:100%; outline:0px; padding:0px; vertical-align:baseline\" title=\"Sẽ không thể vừa sử dụng Xperia Z2, vừa đeo kính râm\" /></p>\n\n<p>Thật tr&ugrave;ng hợp l&agrave; sự ph&acirc;n cực n&agrave;y v&agrave; ph&acirc;n cực tr&ecirc;n m&agrave;n h&igrave;nh chiếc Xperia Z2 ở chế độ xoay ngang m&agrave;n h&igrave;nh l&agrave; ngược nhau, v&igrave; vậy ch&uacute;ng ta chỉ thấy m&agrave;n h&igrave;nh đen v&igrave; &aacute;nh s&aacute;ng kh&ocirc;ng thể truyền từ m&agrave;n h&igrave;nh điện thoại tới mắt. Điều n&agrave;y &iacute;t nhất sẽ khiến ch&uacute;ng ta gặp kh&oacute; khăn khi muốn chụp h&igrave;nh hoặc lướt web ở ngo&agrave;i trời nắng, khi vừa đeo k&iacute;nh vừa sử dụng. V&igrave; vậy bạn h&atilde;y c&acirc;n nhắc khi mua Z2, hoặc chọn 1 loại k&iacute;nh ph&ugrave; hợp.</p>\n', '20140520083934image-1400486083-Xperia-Z2-kinh-ram.jpg', '2014-05-20', 'Techz', 0),
(7, 'LG G3 đã lộ diện hoàn toàn: Đâu còn gì để mấ1234', 'Với những người đã từng trót năng lòng với G2, chắc hẳn ai cũng sẽ cảm thấy xốn xang khi chứng kiến sự xuất hiện phiên bản tiếp theo của mẫu điện thoại này...', '<p>Sau màn ra mắt của <a class=', '20140520084020image-1400472196-LG-G3-2.jpg', '2014-05-20', 'Techz', 0),
(8, '1234', '12344 đẹp trai cu to4 đẹp trai cu to4 đẹp trai cu to4 đẹp trai cu to', '<p>Nằm1 trong phân khúc thấp của thị trường <a class=1234 đẹp trai cu to', 'banner.png', '0000-00-00', '', 0),
(9, 'real', '12344123124', '1234123123', '20140520083628image-1400543386-HTC-One-M8-Harman-Kardon-Edition-rear.jpg', '2023-11-01', '', 0),
(10, '1231', 'Nằm t1rong phân khúc thấp của thị trường smartphone, Lumia 630 chỉ được trang bị một camera 5 Mpx, không có cả đèn LED hỗ trợ chụp ban đêm. Tuy nhiên, Lumia 630 vẫn có thể chụp được những tấm ảnh có chất lượng khá tốt, độ nét sâu...', '<p>Nằm1 trong phân khúc thấp của thị trường <a class=1234', '20140520084020image-1400472196-LG-G3-2.jpg', '2023-11-01', '', 0),
(11, 'Đánh giá came12234ra 5 Mpx không đèn LED của Lumia 630', '1234', '<p>Nằm1 trong phân khúc thấp của thị trường <a class=', '20140520084020image-1400472196-LG-G3-2.jpg', '0000-00-00', '', 0),
(12, 'Đánh giá came12234ra 5 Mpx không đèn LED của Lumia 630', '1234', '<p>Nằm1 trong phân khúc thấp của thị trường <a class=', '', '0000-00-00', '', 0),
(13, 'real', '1234', '<p>Nằm1 trong phân khúc thấp của thị trường <a class=1234', '', '0000-00-00', '', 0),
(14, 'Đánh giá came12234ra 5 Mpx không đèn LED của Lumia 630', '12344123124', '<p>Nằm1 trong phân khúc thấp của thị trường <a class=1234 đẹp trai cu to', '20140520083543image-1400556662-Samsung-G9098-2.jpg', '2023-11-01', '', 0),
(15, 'Đánh giá came12234ra 5 Mpx không đèn LED của Lumia 630', '12344123124', '<p>Nằm1 trong phân khúc thấp của thị trường <a class=1234 đẹp trai cu to', '', '0000-00-00', '', 0),
(16, 'Đánh giá camera 11111111111Mpx không đèn LED của Lumia 630', '1234', '<p>Nằm1 trong phân khúc thấp của thị trường <a class=1234 đẹp trai cu nhỏ', '20140520083543image-1400556662-Samsung-G9098-2.jpg', '2023-11-14', '', 0),
(18, 'real223', '123441231242', '<p>Nằm1 trong phân khúc thấp của thị trường <a class=22', 'img20140520083628image-1400543386-HTC-One-M8-Harman-Kardon-Edition-rear.jpg', '0000-00-00', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(191) NOT NULL,
  `name` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `phone` varchar(191) NOT NULL,
  `address` varchar(191) NOT NULL,
  `avatar_image` varchar(191) NOT NULL,
  `admin` tinyint(1) NOT NULL,
  `password` varchar(191) NOT NULL,
  `create_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `update_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `ngaysinh` date DEFAULT NULL,
  `gioitinh` varchar(191) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `name`, `email`, `phone`, `address`, `avatar_image`, `admin`, `password`, `create_at`, `update_at`, `ngaysinh`, `gioitinh`) VALUES
(0, '', 'Minh Pham', 'abc@gmail.com', '013455789', 'Le Thanh Ton', 'abc.jpg', 0, '7aee2ef08fb1401c0fe2d8c440640e83', '2023-11-18 22:14:49', '2023-11-18 22:14:49', NULL, '1'),
(1, '', 'admin', 'thanhvo.081102@gmail.com', '1234567890', 'nha trang', 'avatar1.jpg', 0, '21232f297a57a5a743894a0e4a801fc3', '2023-10-31 06:44:54', '2023-10-31 06:44:54', NULL, '1'),
(2, '', 'Jane Smith', 'jane@example.com', '9876543210', '456 Elm St', 'avatar2.jpg', 0, 'password2', '2023-10-31 06:44:54', '2023-10-31 06:44:54', NULL, ''),
(3, '', 'Alice Johnson', 'alice@example.com', '1112223333', '789 Oak St', 'avatar3.jpg', 0, 'password3', '2023-10-31 06:44:54', '2023-10-31 06:44:54', NULL, ''),
(4, '', 'Bob Brown', 'bob@example.com', '4445556666', '101 Pine St', 'avatar4.jpg', 0, 'password4', '2023-10-31 06:44:54', '2023-10-31 06:44:54', NULL, ''),
(5, '', 'Ella Davis', 'ella@example.com', '7778889999', '202 Cedar St', 'avatar5.jpg', 0, 'password5', '2023-10-31 06:44:54', '2023-10-31 06:44:54', NULL, ''),
(6, '', 'Mike Wilson', 'mike@example.com', '3339991111', '303 Maple St', 'avatar6.jpg', 0, '218dd27aebeccecae69ad8408d9a36bf', '2023-10-31 06:44:54', '2023-10-31 06:44:54', NULL, '1'),
(7, '', 'Sophia Lee', 'sophia@example.com', '6667778888', '404 Birch St', 'avatar7.jpg', 0, 'password7', '2023-10-31 06:44:54', '2023-10-31 06:44:54', NULL, ''),
(8, '', 'Oliver White', 'oliver@example.com', '2228884444', '505 Spruce St', 'avatar8.jpg', 0, 'password8', '2023-10-31 06:44:54', '2023-10-31 06:44:54', NULL, ''),
(9, '', 'Ava Martin', 'ava@example.com', '9991112222', '606 Willow St', 'avatar9.jpg', 0, 'password9', '2023-10-31 06:44:54', '2023-10-31 06:44:54', NULL, ''),
(11, 'teo', 'Lê Văn Tèo', 'enzellax1@gmail.com', '0912356781', '1234', '', 0, '233beafad32902c3c1cbe0539025fe26', '2023-11-27 17:00:00', '2023-11-27 18:47:43', '2023-11-07', '0'),
(15, 'teo12', 'Lê Văn Tèo', 'enzellax1@gmail.com', '0912356781', '1234', '', 1, '0d9a9d524341aebc2a707a269d6f0434', '2023-11-27 17:00:00', '2023-11-28 00:00:45', '2023-11-29', '0');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `advertises`
--
ALTER TABLE `advertises`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_product_id` (`product_id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `comment_id` (`comment_id`);

--
-- Indexes for table `notices`
--
ALTER TABLE `notices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `payment_method_id` (`payment_method_id`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_detail_id` (`product_detail_id`);

--
-- Indexes for table `payment_methods`
--
ALTER TABLE `payment_methods`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `producers`
--
ALTER TABLE `producers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_ibfk_1` (`producer_id`);

--
-- Indexes for table `product_details`
--
ALTER TABLE `product_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `product_images`
--
ALTER TABLE `product_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_detail_id` (`product_detail_id`);

--
-- Indexes for table `product_votes`
--
ALTER TABLE `product_votes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `promotions`
--
ALTER TABLE `promotions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `tintuc`
--
ALTER TABLE `tintuc`
  ADD PRIMARY KEY (`matt`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `advertises`
--
ALTER TABLE `advertises`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `notices`
--
ALTER TABLE `notices`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `tintuc`
--
ALTER TABLE `tintuc`
  MODIFY `matt` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `advertises`
--
ALTER TABLE `advertises`
  ADD CONSTRAINT `fk_product_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `comments_ibfk_3` FOREIGN KEY (`comment_id`) REFERENCES `comments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `comments_ibfk_4` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`payment_method_id`) REFERENCES `payment_methods` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `orders_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `order_details`
--
ALTER TABLE `order_details`
  ADD CONSTRAINT `order_details_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  ADD CONSTRAINT `order_details_ibfk_2` FOREIGN KEY (`product_detail_id`) REFERENCES `product_details` (`id`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`producer_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `product_details`
--
ALTER TABLE `product_details`
  ADD CONSTRAINT `product_details_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `product_images`
--
ALTER TABLE `product_images`
  ADD CONSTRAINT `product_images_ibfk_1` FOREIGN KEY (`product_detail_id`) REFERENCES `product_details` (`id`);

--
-- Constraints for table `product_votes`
--
ALTER TABLE `product_votes`
  ADD CONSTRAINT `product_votes_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `product_votes_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `promotions`
--
ALTER TABLE `promotions`
  ADD CONSTRAINT `promotions_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
