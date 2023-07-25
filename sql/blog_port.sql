-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th7 25, 2023 lúc 05:55 AM
-- Phiên bản máy phục vụ: 10.4.28-MariaDB
-- Phiên bản PHP: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `blog_port`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `blog_content`
--

CREATE TABLE `blog_content` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` text DEFAULT NULL,
  `author` varchar(255) NOT NULL,
  `create_at` date DEFAULT NULL,
  `update_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `blog_content`
--

INSERT INTO `blog_content` (`id`, `title`, `content`, `author`, `create_at`, `update_at`) VALUES
(15, 'Hướng dẫn xóa tất cả file trong thư mục linux ngoại trừ các file được chỉ định', '<p>H&ocirc;m nay m&igrave;nh muốn hướng dẫn c&aacute;c&nbsp; bạn c&aacute;ch x&oacute;a tất file trong một thư mục nhưng loại trừ ra c&aacute;c file c&aacute;c bạn chỉ định.<br><br>B&agrave;i viết n&agrave;y m&igrave;nh tham khảo nguồn từ:&nbsp;<a href=\"https://www.ostechnix.com/remove-files-folder-except-one-specific-file-linux/\">https://www.ostechnix.com/remove-files-folder-except-one-specific-file-linux/</a><br>Nếu c&aacute;c bạn muốn đọc tiếng Anh th&igrave; v&agrave;o lu&ocirc;n trang n&agrave;y xem, c&oacute; rất nhiều b&agrave;i viết hay, c&ograve;n nếu ngại đọc tiếng Anh th&igrave; c&oacute; thể đọc b&agrave;i viết của m&igrave;nh. (M&igrave;nh đ&atilde; xin ph&eacute;p admin trang n&agrave;y rồi n&ecirc;n c&aacute;c bạn y&ecirc;n t&acirc;m ^^).<br><br>B&agrave;i n&agrave;y th&igrave; kh&ocirc;ng phải m&igrave;nh dịch lại giống hệt m&agrave; m&igrave;nh sẽ hướng dẫn v&agrave; giải th&iacute;ch theo c&aacute;c hiểu của m&igrave;nh.<br><br>Rồi, ch&uacute;ng ta bắt đầu nh&eacute;.<br><br>Th&ocirc;ng thường khi bạn muốn x&oacute;a c&aacute;c tất cả file trong một thư mục tr&ecirc;n linux th&igrave; chỉ cần:&nbsp;<em><strong>rm -r&nbsp; &lt;đường dẫn thư mục&gt;</strong></em>, hoặc tr&ecirc;n giao diện(Chẳng hạn của Nautilus) bạn&nbsp;<strong>Ctrl + A</strong>&nbsp;xong giữ Ctrl v&agrave; click chuột tr&aacute;i v&agrave;o c&aacute;c file muốn giữ lại rồi delete, với thư mục chứa &iacute;t file th&igrave; ok nhưng nếu nhiều file liệu c&oacute; ổn kh&ocirc;ng?<br><br>B&acirc;y giờ ta c&ugrave;ng xem v&iacute; dụ dưới đ&acirc;y:<br>Giả sử ta c&oacute; thư mục test c&oacute; 10 file như sau:<br><br></p>\r\n<div class=\"separator\"><a href=\"https://3.bp.blogspot.com/-VDmBQjD47sk/WPNQAzt0N0I/AAAAAAAAAY4/E3lzDoeJDvwBZHu07-r0umPQBEA-R7LcACLcB/s1600/Selection_009.png\"><img src=\"https://3.bp.blogspot.com/-VDmBQjD47sk/WPNQAzt0N0I/AAAAAAAAAY4/E3lzDoeJDvwBZHu07-r0umPQBEA-R7LcACLcB/s1600/Selection_009.png\" border=\"0\"></a></div>\r\n<p><br><br><br><br><br><br>Giờ nếu bạn muốn x&oacute;a tất cả ngoại trừ file c&oacute; t&ecirc;n&nbsp;<em>file10.txt</em>&nbsp;th&igrave; bạn g&otilde; lệnh như sau tr&ecirc;n terminal:<br>- Đầu ti&ecirc;n:&nbsp;<strong><em>cd test/</em></strong>&nbsp;để di chuyển v&agrave;o thư mục&nbsp;<strong>test</strong><br>- Sau đ&oacute;:&nbsp;<em><strong>rm -f !(file10.txt)</strong></em>&nbsp;hoặc&nbsp;&nbsp;<em><strong>rm !(file10.txt)&nbsp;</strong></em>để x&oacute;a tất cả c&aacute;c file trong thư mục&nbsp;<strong>test</strong>&nbsp;v&agrave; để lại&nbsp;<em>file10.txt</em><br>Ngo&agrave;i ra c&aacute;c bạn cũng c&oacute; thể sử dụng lệnh find để l&agrave;m việc như tr&ecirc;n:&nbsp;<em><strong>find . ! -name file10.txt -delete&nbsp;</strong></em>lệnh n&agrave;y sẽ t&igrave;m v&agrave; x&oacute;a tất cả c&aacute;c file ngoại trừ&nbsp;<em>file10.txt&nbsp;</em><br><br>Th&ocirc;ng thường trong một thư mục ch&uacute;ng ta kh&ocirc;ng chỉ chứa mỗi một định dạng file như thế m&agrave; ch&uacute;ng ta chứa nhiều file với nhiều định dạng kh&aacute;c nhau, ta c&ugrave;ng nhau xem v&iacute; dụ dưới đ&acirc;y:<br><br>Giả sử b&acirc;y giờ thư mục&nbsp;<strong>test</strong>&nbsp;c&oacute; c&aacute;c file như sau:</p>\r\n<div class=\"separator\"><a href=\"https://2.bp.blogspot.com/-BsLuFpxNNCE/WPNSFwSErII/AAAAAAAAAZE/OLkuuaT20BMmZMDGcShrWU4Jeucl8ymRgCLcB/s1600/Selection_004.png\"><img src=\"https://2.bp.blogspot.com/-BsLuFpxNNCE/WPNSFwSErII/AAAAAAAAAZE/OLkuuaT20BMmZMDGcShrWU4Jeucl8ymRgCLcB/s1600/Selection_004.png\" border=\"0\"></a></div>\r\n<p>B&acirc;y giờ bạn chỉ muốn giữ lại c&aacute;c file c&oacute; phần mở rộng l&agrave; *.doc th&igrave; bạn sử dụng lệnh như sau:&nbsp;<em><strong>rm !(*.doc)</strong></em>, l&uacute;c n&agrave;y thư mục test sẽ chỉ c&ograve;n lại c&aacute;c file c&oacute; phần mở rộng l&agrave; *.doc m&agrave; th&ocirc;i, tương tự c&aacute;c bạn l&agrave;m với c&aacute;c file c&oacute; phần mở rộng kh&aacute;c.<br><br>Giờ bạn lại muốn giữ lại c&aacute;c file c&oacute; phần mở rộng l&agrave; *.doc v&agrave; *.mp3 th&igrave; việc n&agrave;y cũng rất đơn giản, bạn chỉ việc chạy lệnh y hệt như tr&ecirc;n nhưng phần mở rộng ta sẽ th&ecirc;m v&agrave;o v&agrave; ph&acirc;n c&aacute;ch nhau bởi dấu \"|\" (Tạm gọi l&agrave; dấu gạch đứng):&nbsp;<em><strong>rm !(*.doc | *.mp3)</strong></em>.<br><br>Rất đơn giản v&agrave; nhanh gọn đ&uacute;ng kh&ocirc;ng c&aacute;c bạn, hy vọng b&agrave;i viết gi&uacute;p &iacute;ch cho c&aacute;c bạn, c&aacute;m ơn c&aacute;c bạn đ&atilde; đọc b&agrave;i viết n&agrave;y.<br>Xin ch&agrave;o v&agrave; hẹn gặp lại trong c&aacute;c b&agrave;i viết sau.</p>', 'NguyenDinhHieu', '2023-07-20', '2023-07-20'),
(17, '    sdg 123 456  789', '<p>sdg 789</p>', '    sdg 123   ', '2023-07-23', '2023-07-23');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `comment`
--

CREATE TABLE `comment` (
  `id` int(11) NOT NULL,
  `content` text NOT NULL,
  `author` varchar(50) NOT NULL,
  `create_at` date NOT NULL,
  `id_post` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `comment`
--

INSERT INTO `comment` (`id`, `content`, `author`, `create_at`, `id_post`) VALUES
(1, 'nguyendinhhieu da cmt\r\n', 'nguyendinhheiu', '2023-07-04', 15),
(26, 'ádv', 'nguyendinhhieu', '2023-07-22', 15),
(27, 'ádv', 'nguyendinhhieu', '2023-07-23', 15);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `login`
--

CREATE TABLE `login` (
  `id` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `creat_at` datetime DEFAULT NULL,
  `update_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `login`
--

INSERT INTO `login` (`id`, `email`, `password`, `first_name`, `last_name`, `creat_at`, `update_at`) VALUES
(20, 'nguyendinhhieu800@gmail.com', '$2b$10$bqQ/FQnAGQ/wo03RvnMO9uw2rqQr5/5MiWVbD9NkAcYtcf93HsiUC', 'Hiếu', 'Nguyễn Đình', NULL, NULL);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `blog_content`
--
ALTER TABLE `blog_content`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `blog_content`
--
ALTER TABLE `blog_content`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT cho bảng `comment`
--
ALTER TABLE `comment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT cho bảng `login`
--
ALTER TABLE `login`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
