-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 08, 2025 at 01:14 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `parcelease`
--

-- --------------------------------------------------------

--
-- Table structure for table `branches`
--

CREATE TABLE `branches` (
  `branch_id` int(11) NOT NULL,
  `branch_name` varchar(100) NOT NULL,
  `latitude` decimal(10,6) NOT NULL,
  `longitude` decimal(10,6) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `branches`
--

INSERT INTO `branches` (`branch_id`, `branch_name`, `latitude`, `longitude`, `created_at`) VALUES
(1, 'Branch A', 40.712776, -74.005974, '2025-02-24 17:06:36'),
(2, 'Branch B', 34.052235, -118.243683, '2025-02-24 17:06:36'),
(3, 'Branch C', 41.878113, -87.629799, '2025-02-24 17:06:36'),
(4, 'Branch D', 29.760427, -95.369804, '2025-02-24 17:06:36'),
(5, 'Branch E', 37.774929, -122.419418, '2025-02-24 17:06:36');

-- --------------------------------------------------------

--
-- Table structure for table `chatbot_messages`
--

CREATE TABLE `chatbot_messages` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `response` text DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `drivers`
--

CREATE TABLE `drivers` (
  `driver_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `vehicle_number` varchar(50) NOT NULL,
  `license_number` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `status` enum('Active','Inactive') DEFAULT 'Active',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `driver_status` enum('Available','Not Available') DEFAULT 'Not Available',
  `status_` enum('Pending','Approved','rejected') DEFAULT 'Pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `drivers`
--

INSERT INTO `drivers` (`driver_id`, `name`, `email`, `phone`, `vehicle_number`, `license_number`, `password`, `status`, `created_at`, `driver_status`, `status_`) VALUES
(1, 'pavan', 'pavaneswar224@gmail.com ', '6305240281', '785', '678', 'pavan123', '', '2025-02-24 04:32:10', 'Available', 'Approved');

-- --------------------------------------------------------

--
-- Table structure for table `email_verification`
--

CREATE TABLE `email_verification` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `otp` varchar(6) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `email_verification`
--

INSERT INTO `email_verification` (`id`, `email`, `otp`, `created_at`) VALUES
(1, 'dhanasaipavan345@gmail.com', '488069', '2025-02-24 09:11:22'),
(2, 'pavaneswar224@gmail.com', '238190', '2025-02-24 09:12:53');

-- --------------------------------------------------------

--
-- Table structure for table `faqs`
--

CREATE TABLE `faqs` (
  `id` int(11) NOT NULL,
  `question` text NOT NULL,
  `answer` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `faqs`
--

INSERT INTO `faqs` (`id`, `question`, `answer`, `created_at`) VALUES
(1, 'How can I track my parcel?', 'You can track your parcel using the Parcel ID on the tracking page.', '2025-02-23 18:33:57'),
(2, 'What payment methods do you accept?', 'We accept credit/debit cards, UPI, and net banking.', '2025-02-23 18:33:57'),
(3, 'How long does delivery take?', 'Delivery times depend on the destination and chosen service.', '2025-02-23 18:33:57'),
(4, 'Can I change my delivery address?', 'Yes, you can modify the address before dispatch.', '2025-02-23 18:33:57'),
(5, 'What should I do if my package is lost?', 'Contact support immediately with your tracking ID.', '2025-02-23 18:33:57');

-- --------------------------------------------------------

--
-- Table structure for table `incitybookings`
--

CREATE TABLE `incitybookings` (
  `id` int(11) NOT NULL,
  `parcel_id` varchar(50) NOT NULL,
  `user_id` int(11) NOT NULL,
  `pickup_location` text NOT NULL,
  `drop_location` text NOT NULL,
  `weight` varchar(50) NOT NULL,
  `package_type` varchar(50) NOT NULL,
  `vehicle_type` varchar(50) NOT NULL,
  `delivery_time` varchar(50) NOT NULL,
  `amount` varchar(50) NOT NULL,
  `status` varchar(50) DEFAULT 'Pending',
  `sender_name` varchar(100) NOT NULL,
  `sender_phone` varchar(20) NOT NULL,
  `receiver_name` varchar(100) NOT NULL,
  `receiver_phone` varchar(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `incitybookings`
--

INSERT INTO `incitybookings` (`id`, `parcel_id`, `user_id`, `pickup_location`, `drop_location`, `weight`, `package_type`, `vehicle_type`, `delivery_time`, `amount`, `status`, `sender_name`, `sender_phone`, `receiver_name`, `receiver_phone`, `created_at`) VALUES
(5, 'P67e4054f41117', 10, 'kadiri', 'kanduluru', '3', 'Small', 'Van', 'ASAP', '30.00', 'Pending', '6305240281', '9676694032', '22221113333', '6305240213', '2025-03-26 13:46:55'),
(6, 'P67e40850c29a5', 10, 'kadiri', 'kanduluru ', '7', 'Large', 'Truck', 'ASAP', '70.00', 'Pending', 'pavan', '6305240281', 'amma', '8187081690', '2025-03-26 13:59:44'),
(7, 'Pb6c85ca9e7af4', 10, 'hsheh', 'hdrjh', '6', 'Large', 'Van', 'ASAP', '60.00', 'Pending', 'hdjrj', '95956', 'bdbeb', '8965', '2025-03-30 16:01:44'),
(12, 'P7235ad5ce12e4', 10, '', '', '14', 'Large', 'Van', 'ASAP', '140.00', 'Pending', 'heueu', '65653', 'dvhdh', '9865', '2025-03-30 16:09:22'),
(13, 'P89883f7d23154', 10, 'dhdjjdj', 'fjdjj', '15', 'Large', 'Van', 'ASAP', '150.00', 'Pending', 'djjdj', '596565', 'bdbdj', '595665656', '2025-03-30 16:13:09'),
(14, 'P919da2ae64aa4', 29, 'bshsh', 'hshsh', '5', 'Medium', 'Van', 'ASAP', '50.00', 'confirmed', 'ehueue', '6464664', 'shhshsu', '65646466', '2025-04-28 21:00:01'),
(15, 'P8d8d02648b154', 29, 'ggh', 'gwyw', '3', 'Medium', 'Van', 'ASAP', '30.00', 'Pending', 'wgywy', '54646', 'fagsh', '4554848', '2025-05-04 07:36:35'),
(16, 'P3b8629ade5ca4', 29, 'heyeu', 'hehrhdh', '3', 'Medium', 'Van', 'ASAP', '30.00', 'Pending', 'bdhdh', '5656565626', 'svhehe', '455452', '2025-05-18 16:30:02'),
(17, 'P103894e913b24', 29, 'saveetha engineering', 'kg ', '2', 'Medium', 'Bike', 'ASAP', '20.00', 'Pending', 'pav', '61646', 'dnjs', '2332659', '2025-05-21 08:38:23');

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `status` enum('Unread','Read') DEFAULT 'Unread',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `optimized_routes`
--

CREATE TABLE `optimized_routes` (
  `id` int(11) NOT NULL,
  `parcel_id` int(11) DEFAULT NULL,
  `assigned_truck` int(11) DEFAULT NULL,
  `branch_from` int(11) DEFAULT NULL,
  `branch_to` int(11) DEFAULT NULL,
  `optimized_route` text DEFAULT NULL,
  `estimated_time` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `parcels`
--

CREATE TABLE `parcels` (
  `parcel_id` varchar(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `pickup_location` varchar(2555) NOT NULL,
  `drop_location` varchar(2555) NOT NULL,
  `weight` decimal(10,2) NOT NULL,
  `status` varchar(20) DEFAULT 'Pending',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `driver_id` int(11) DEFAULT NULL,
  `sender_name` varchar(255) NOT NULL,
  `sender_phone` varchar(20) NOT NULL,
  `sender_remarks` text DEFAULT NULL,
  `receiver_name` varchar(255) NOT NULL,
  `receiver_phone` varchar(20) NOT NULL,
  `deliverytype` varchar(50) NOT NULL,
  `receiver_remarks` text DEFAULT NULL,
  `package_type` varchar(100) NOT NULL,
  `thing_type` varchar(100) NOT NULL,
  `amount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `vehicle_type` varchar(50) DEFAULT NULL,
  `delivery_time` varchar(100) DEFAULT NULL,
  `distance` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `parcels`
--

INSERT INTO `parcels` (`parcel_id`, `user_id`, `pickup_location`, `drop_location`, `weight`, `status`, `created_at`, `driver_id`, `sender_name`, `sender_phone`, `sender_remarks`, `receiver_name`, `receiver_phone`, `deliverytype`, `receiver_remarks`, `package_type`, `thing_type`, `amount`, `vehicle_type`, `delivery_time`, `distance`) VALUES
('P0365cb6d54224', 29, '2JP9+PJ6, Govindapura, Nagavara, Bengaluru, Karnataka 560045, India', 'HSR Trinity Block C, 6, Bandepalya, Garvebhavi Palya, Bengaluru, Karnataka 560068, India', 5.00, 'Confirmed', '2025-05-21 08:37:13', NULL, 'pavam', '649595', 'dvhege', 'ysheye', '959595', 'expressdelivery', 'dghdhd', 'Medium', '', 50.00, NULL, 'bw12to15', NULL),
('P0accf9f322bc4', 29, '86/7, 4th Main Rd, near citizen hospital, Kalasipalya, Bengaluru, Karnataka 560002, India', '16/4/33, Childrens Park Rd, Laxmi Nagar, Ramji Nagar, Nellore, Andhra Pradesh 524002, India', 3.00, 'Confirmed', '2025-05-24 15:52:45', NULL, 'hehwh', '16616', 'vsgsg', 'hdhehu', '5556', 'normal', 'hwhw', 'Medium', '', 30.00, NULL, '2025-06-01 12:37:10', 0),
('P0f021fd6046e4', 29, '', '', 4.00, 'Pending', '2025-05-20 10:47:34', NULL, 'yeu', '32326', 'hshs', 'heu3u', '62626', 'normal', 'bdhdh', 'Medium', '', 40.00, NULL, '2025-06-01 12:37:10', NULL),
('P12345', 6, 'chennai', 'chennai', 60.00, 'Pickup', '2025-02-22 19:34:00', 1, '', '', NULL, '', '', '', NULL, '', '', 0.00, NULL, NULL, NULL),
('P128756', 10, 'no', 'no', 8.00, 'cancelled', '2025-05-15 16:24:38', 5, 'pavan', '6305240281', 'no', 'no', '6305240281', 'expressdelivery', 'no', 's', 'medicine', 0.00, 'jvjdn', 'now', NULL),
('P1e4d6f36be2c4', 10, '', '', 1.00, 'cancelled', '2025-04-06 15:39:42', NULL, '', '', '', '', '', 'normal', '', 'Large', '', 10.00, NULL, '2025-06-01 12:37:10', NULL),
('P2213b8b3fc714', 29, 'yshhe', 'ehhehe', 3.00, 'Pending', '2025-05-20 21:25:01', NULL, 'hrhrh', '6866565', 'vsbsb', 'hshsh', '469494', 'normal', 'zbbsb', 'Medium', '', 30.00, NULL, '2025-06-01 12:37:10', NULL),
('P2298ac9400364', 29, 'h445u5j', 'yjyjyj', 4.00, 'cancelled', '2025-05-18 07:37:42', NULL, 'h5h5h5', '93923993', 'nyyjyjjyju', 'yjjyjyju6', '3939933939', 'normal', 'gy5v6gb7', 'Small', '', 40.00, NULL, '2025-06-01 12:37:10', NULL),
('P2a05192cc16f4', 29, '13/1, 4th Ln, K.S. Garden, Raja Ram Mohanroy Extension, Sudhama Nagar, Bengaluru, Karnataka 560027, India', '3yy3', 3.00, 'Pending', '2025-05-20 20:39:09', NULL, 'ehhe', '15266', 'svvs', 'ehgeg', '16626', 'normal', 'dbbe', 'Medium', '', 30.00, NULL, '2025-06-01 12:37:10', NULL),
('P2a0941f0b1dd4', 29, 'ueueu', 'heehhe', 1.00, 'cancelled', '2025-05-20 20:47:38', NULL, 'udhdjh', '65626', 'hdhdh', 'rggegeeg', '64616', 'normal', 'dbbeg', 'Medium', '', 10.00, NULL, '2025-06-01 12:37:10', NULL),
('P2b528b9a1f204', 29, '189, 3rd Block East, RBI Colony, Jayanagar, Bengaluru, Karnataka 560011, India', 'Thoppukollai, Tamil Nadu 622303, India', 4.00, 'Confirmed', '2025-05-24 13:47:25', NULL, 'pavan', '6305240281', '5689', 'bharath', '9347240843', 'expressdelivery', 'no', 'Medium', '', 40.00, NULL, 'bw12to15', NULL),
('P319b41a97a024', 29, 'sgyey', 'gegege', 4.00, 'Pending', '2025-05-20 06:07:33', NULL, 'heh3h', '646465662', 'gsgege', 'wgeggw', '6161629', 'normal', 'vsveve', 'Medium', '', 40.00, NULL, '2025-06-01 12:37:10', NULL),
('P3356295aa27a4', 10, '', '', 5.00, 'Pending', '2025-04-09 17:25:26', NULL, '', '', '', '', '', 'normal', '', 'Medium', '', 50.00, NULL, '2025-06-01 12:37:10', NULL),
('P33ae4ab9d80d4', 29, 'wuueue', 'whsjjs', 2.00, 'Pending', '2025-05-20 20:54:16', NULL, 'hejejje', '6564694', 'shhshs', 'shjshs', '4664949', 'normal', 'vsbshsh', 'Medium', '', 20.00, NULL, '2025-06-01 12:37:10', NULL),
('P34186529ab374', 29, 'jeueu', 'g3heh', 3.00, 'Pending', '2025-05-20 13:54:09', NULL, 'hdueu', '3235656', 'gxgdh', 'bdheh', '95959', 'normal', 'vdbeve', 'Small', '', 30.00, NULL, '2025-06-01 12:37:10', NULL),
('P3683cf0c00174', 29, '5ff7', '5rfoh7f7fh', 4.00, 'cancelled', '2025-05-18 07:42:13', NULL, 'gytitt', '56535', 'ctudri', 'f67t56f7f', '5339282838', 'normal', ' tcyc7vih8h', 'Small', '', 40.00, NULL, '2025-06-01 12:37:10', NULL),
('P37ac182459754', 29, '104, St Johns Rd, Hermit Colony, Sivanchetti Gardens, Bengaluru, Karnataka 560042, India', '12, Halasuru, Doddaiah Layout, Sivanchetti Gardens, Bengaluru, Karnataka 560008, India', 3.00, 'Pending', '2025-05-21 08:36:02', NULL, 'name', '6305240281', 'yup', 'noam', '19629', 'normal', 'eveg', 'Small', '', 30.00, NULL, '2025-06-01 12:37:10', NULL),
('P45a0d1fa2cfe4', 29, 'dgyey', 'hehrh', 5.00, 'Pending', '2025-05-18 16:40:16', NULL, 'bsheh', '616265', 'vdheh', 'heheh', '62629', 'normal', 'dvvrv', 'Small', '', 50.00, NULL, '2025-06-01 12:37:10', NULL),
('P49886277038e4', 29, 'ueueu', 'heehhe', 3.00, 'cancelled', '2025-05-20 20:47:23', NULL, 'udhdjh', '65626', 'hdhdh', 'rggegeeg', '64616', 'normal', 'dbbeg', 'Small', '', 30.00, NULL, '2025-06-01 12:37:10', NULL),
('P4b0a91a9e9744', 29, 'duhdh', 'dgehhe', 3.00, 'Pending', '2025-05-14 10:13:56', NULL, 'rhrji', '95656', 'bdhdh', 'ghsge', '452662', 'normal', 'vshshe', 'Small', '', 30.00, NULL, '2025-06-01 12:37:10', NULL),
('P50f338e6d6464', 29, 'ghu', 'bsheh', 4.00, 'cancelled', '2025-04-28 20:56:32', NULL, 'iidit', '68689494', 'svhshehe', 'svsbhs', '494664', 'normal', 'zvhshe', 'Medium', '', 40.00, NULL, '2025-06-01 12:37:10', NULL),
('P52471293f0e14', 29, 'Block 8, 993, Venkataswami Layout, Adugodi, Bengaluru, Karnataka 560030, India', 'bdhehh', 3.00, 'Pending', '2025-05-22 05:55:48', NULL, 'ruhru', '62626', 'gehdh', 'hehrh', '62626', 'normal', 'hfhrh', 'Medium', '', 30.00, NULL, '2025-06-01 12:37:10', NULL),
('P5b230919185a4', 29, 'wuueue', 'whsjjs', 1.00, 'Pending', '2025-05-20 20:58:42', NULL, 'hejejje', '6564694', 'shhshs', 'shjshs', '4664949', 'normal', 'vsbshsh', 'Medium', '', 10.00, NULL, '2025-06-01 12:37:10', NULL),
('P5daeebe7f1fa4', 29, 'wuueue', 'whsjjs', 3.00, 'Pending', '2025-05-20 20:53:39', NULL, 'hejejje', '6564694', 'shhshs', 'shjshs', '4664949', 'normal', 'vsbshsh', 'Medium', '', 30.00, NULL, '2025-06-01 12:37:10', NULL),
('P5ee0e63ca1f34', 29, '55/6, BT St, Anchepet, Chickpet, Bengaluru, Karnataka 560053, India', 'XJC8+557, Brunton Rd, Craig Park Layout, Ashok Nagar, Bengaluru, Karnataka 560025, India', 3.00, 'Pending', '2025-05-20 20:36:32', NULL, 'pavan', '6305240581', 'no', 'usushdh', '466464', 'normal', 'gshsh', 'Medium', '', 30.00, NULL, '2025-06-01 12:37:10', NULL),
('P63b82bae62044', 29, 'hdjrj', 'vxheh', 16.00, 'Pending', '2025-05-12 06:43:42', NULL, 'fjirj', '62626', 'dhhdhr', 'vshehe', '499464', 'normal', 'svvshe', 'Small', '', 160.00, NULL, '2025-06-01 12:37:10', NULL),
('P67bb5c45d2744', 6, 'kadiri', 'chennai', 60.00, 'cancelled', '2025-02-23 17:35:01', NULL, '', '', NULL, '', '', '', NULL, '', '', 0.00, NULL, NULL, NULL),
('P67e0f08c6a6a8', 10, 'test', 'ongole', 3.00, 'Pending', '2025-03-24 05:41:32', NULL, 'pavan4', '6305240281', 'no', 'saikumar', '9182237367', '', 'no', 'Small', '', 30.00, NULL, '2025-06-01 12:37:10', NULL),
('P67e4c665edd90', 10, 'kadiri', 'ongole', 4.00, 'Pending', '2025-03-27 03:30:45', NULL, 'pavam', '9182237367', 'no', 'test', '9676694032', '', 'no', 'Large', '', 40.00, NULL, 'bw18to20', NULL),
('P67e9390e56393', 10, 'payment', 'pavan', 4.00, 'Pending', '2025-03-30 12:29:02', NULL, 'pavan', '6305240581', 'no', 'pavan', '6305240281', 'normal', 'test', 'Medium', '', 40.00, NULL, '2025-06-01 12:37:10', NULL),
('P67e93a2fcf540', 10, 'payment', 'pavan', 4.00, 'Pending', '2025-03-30 12:33:51', NULL, 'pavan', '6305240581', 'no', 'pavan', '6305240281', 'normal', 'test', 'Medium', '', 40.00, NULL, '2025-06-01 12:37:10', NULL),
('P67e93cceb0dbe', 10, 'paymenttesting', 'op', 4.00, 'Pending', '2025-03-30 12:45:02', NULL, 'pavan', '6305248218', 'no', 'op', '6305240281', 'normal', 'nk', 'Medium', '', 40.00, NULL, '2025-06-01 12:37:10', NULL),
('P67e93dc033829', 10, 'tesr', 'tesr', 5.00, 'Pending', '2025-03-30 12:49:04', NULL, 'tesr', '6305240281', 'no', 'tesr', '6305240281', 'normal', 'test', 'Medium', '', 50.00, NULL, '2025-06-01 12:37:10', NULL),
('P67e94075af610', 10, 'testu', 'testu', 9.00, 'Pending', '2025-03-30 13:00:37', NULL, 'testu', ' 6305240281', 'no', 'teatu', '6305240281', 'normal', 'no', 'Small', '', 90.00, NULL, '2025-06-01 12:37:10', NULL),
('P67e9446045d82', 10, 'pavan', 'pavan', 3.00, 'Pending', '2025-03-30 13:17:20', NULL, 'testu', '6305240281', 'pavan', 'pavan', '6305240281', 'normal', 'pVan', 'Small', '', 30.00, NULL, '2025-06-01 12:37:10', NULL),
('P67e945a490a37', 10, 'pavan', 'no', 8.00, 'Pending', '2025-03-30 13:22:44', NULL, 'no', '9676694032', 'no', 'pavan', '6305240581', 'normal', 'no', 'Small', '', 80.00, NULL, '2025-06-01 12:37:10', NULL),
('P67e9490284b3f', 10, 'pavan', 'dhue', 6.00, 'Pending', '2025-03-30 13:37:06', NULL, 'on', '6389643446', 'bid', 'bsis', '9734', 'normal', 'sbusis', 'Medium', '', 60.00, NULL, '2025-06-01 12:37:10', NULL),
('P67e9499a32901', 10, 'jskis', 'jskwk', 5.00, 'Pending', '2025-03-30 13:39:38', NULL, 'jriei', '96565665', ' dnsk', 'jdkdk', '95656', 'normal', 'nsksk', 'Medium', '', 50.00, NULL, '2025-06-01 12:37:10', NULL),
('P67e94c9cd3882', 10, 'pavam', 'jdidoe', 4.00, 'Pending', '2025-03-30 13:52:28', NULL, 'ueiei', '686565', 'bdjei', 'ndjdofj', '9835816434', 'normal', 'vsisiw', 'Medium', '', 40.00, NULL, '2025-06-01 12:37:10', NULL),
('P67e94d230a823', 10, 'dhhdh', 'hduej', 4.00, 'Pending', '2025-03-30 13:54:43', NULL, 'hxjei', '565659', 'bdiir', 'hsieii', '976659402', 'normal', 'vshi2n2', 'Small', '', 40.00, NULL, '2025-06-01 12:37:10', NULL),
('P67e94f6d7a563', 10, 'xhxjn', 'bejei', 5.00, 'Pending', '2025-03-30 14:04:29', NULL, 'dhjdj', '895965', 'vdhe', 'bdjei', '9562323', 'normal', 'bsjei', 'Small', '', 50.00, NULL, '2025-06-01 12:37:10', NULL),
('P67e94f9ad1c86', 10, 'bxbdj', 'dbjdid', 5.00, 'Pending', '2025-03-30 14:05:14', NULL, 'xhjdj', '898995', 'BC bxbdj', 'hfhrj', '95656', 'normal', 'dvjdh', 'Medium', '', 50.00, NULL, '2025-06-01 12:37:10', NULL),
('P67e9522ee64dd', 10, 'sbjsjj', 'hdjdj', 4.00, 'Pending', '2025-03-30 14:16:14', NULL, 'dhjdiri', '45565659526', 'dhidiri', 'dfgehei', '5656656', 'normal', 'hxjdid', 'Medium', '', 40.00, NULL, '2025-06-01 12:37:10', NULL),
('P67e952545bcab', 10, 'sbjsjj', 'hdjdj', 4.00, 'Pending', '2025-03-30 14:16:52', NULL, 'dhjdiri', '45565659526', 'dhidiri', 'dfgehei', '5656656', 'normal', 'hxjdid', 'Medium', '', 40.00, NULL, '2025-06-01 12:37:10', NULL),
('P67e9531aabdc0', 10, 'hzjsj', 'dhueu', 4.00, 'Pending', '2025-03-30 14:20:10', NULL, 'dhueu', '46562.92', 'dheuie', 'gdudi', '5956656', 'normal', 'vdheidi', 'Small', '', 40.00, NULL, '2025-06-01 12:37:10', NULL),
('P721d4202d0fd4', 29, 'WPQV+5H7, Devasthanagalu, Varthur, Bengaluru, Karnataka 560087, India', 'Thoppukollai, Tamil Nadu 622303, India', 3.00, 'Confirmed', '2025-07-03 08:52:37', NULL, 'jsh', '356592929', 'hdhdh', 'bharath', '9347240843', 'normal', 'no', 'Medium', '', 30.00, NULL, 'ASAP', 310.22),
('P7458bbae44094', 10, 'dhueue', 'svhsheu', 23.00, 'Pending', '2025-04-06 15:36:19', NULL, 'hdjrj', '656566', 'dghdhe', 'gsheheh', '166162', 'normal', 'zvsgheu', 'Medium', '', 230.00, NULL, '2025-06-01 12:37:10', NULL),
('P74594be2e5e94', 29, 'pavan', 'sbvsve', 2.00, 'Pending', '2025-05-21 13:56:59', NULL, 'pavan', '4646949', 'zbbsb', 'hshsh', '94949', 'normal', 'bdbdbd', 'Medium', '', 20.00, NULL, '2025-06-01 12:37:10', NULL),
('P7576b39a95674', 29, '3, 2nd Main Rd, Sudhama Nagar, Bengaluru, Karnataka 560027, India', '9MWP+VJX, Parameswaranallur, Chidambaram, Tamil Nadu 608001, India', 3.00, 'Pending', '2025-05-21 14:05:16', NULL, 'hdhsh', '64656', 'dbbdb', 'hshehuwueuh', '62625', 'normal', 'vsve', 'Small', '', 30.00, NULL, '2025-06-01 12:37:10', NULL),
('P76383c55c7684', 29, 'Bonsai Garden, 11, Lalbagh, Mavalli, Bengaluru, Karnataka 560004, India', 'Thoppukollai, Tamil Nadu 622303, India', 2.00, 'Confirmed', '2025-05-24 13:56:31', NULL, 'me', '6305240281', 'no', 'bharath', '9347240843', 'expressdelivery', 'no', 'Medium', '', 20.00, NULL, 'bw18to20', NULL),
('P7c9d6adfa3064', 29, '8, Avenue Rd, City Market, KR Market, Mamulpet, Chickpet, Bengaluru, Karnataka 560053, India', 'kadiri', 4.00, 'Confirmed', '2025-05-26 02:57:43', NULL, 'pavan', '630524548', 'handle carefully ', 'pavan', '6305240281', 'normal', 'no', 'Medium', '', 40.00, NULL, '2025-06-01 12:37:10', 142.06),
('P7cf006a3bf684', 29, '9/8, Halasuru, Yellappa Chetty Layout, Sivanchetti Gardens, Bengaluru, Karnataka 560042, India', '389, 2nd Cross Rd, Koramangala 3 Block, Koramangala, Bengaluru, Karnataka 560034, India', 3.00, 'Pending', '2025-05-24 06:47:42', NULL, 'ehheh', '9191', 'sbbshe', 'pavam', '6305240281', 'normal', 'ji', 'Medium', '', 30.00, NULL, '2025-06-01 12:37:10', NULL),
('P7d498a22a3604', 29, 'hshsjs', 'euheue', 3.00, 'Pending', '2025-05-20 20:59:12', NULL, 'snnsjsj', '499494', 'bbsjksj', 'ehusus', '646464', 'normal', 'bzhsh', 'Medium', '', 30.00, NULL, '2025-06-01 12:37:10', NULL),
('P8035ab596d904', 29, 'hshsjs', 'euheue', 3.00, 'Pending', '2025-05-20 20:59:45', NULL, 'snnsjsj', '499494', 'bbsjksj', 'ehusus', '646464', 'normal', 'bzhsh', 'Medium', '', 30.00, NULL, '2025-06-01 12:37:10', NULL),
('P8498533048344', 10, 'dhjej', 'hduei', 4.00, 'Pending', '2025-03-30 15:42:44', NULL, 'sjidi', '566565', 'bdjdj', 'dbjdj', '94656', 'normal', 'xbdh', 'Medium', '', 40.00, NULL, '2025-06-01 12:37:10', NULL),
('P85c378917b7f4', 29, 'ydye', 'sggege', 3.00, 'Pending', '2025-05-18 07:31:19', NULL, 'yeyey', '626266', 'hdhehr', 'sgge', '194664949', 'normal', 'hsgeh', 'Small', '', 30.00, NULL, '2025-06-01 12:37:10', NULL),
('P887f8cd16ceb4', 29, 'vhdjsh', 'vdhdb', 4.00, 'Pending', '2025-05-04 06:57:51', NULL, 'brheh', '95959', 'bdbdj', 'bdhdje', '599595', 'normal', 'vdhdh', 'Medium', '', 40.00, NULL, '2025-06-01 12:37:10', NULL),
('P8913c1f38b514', 29, '15 & 16, Curley St, Richmond Town, Bengaluru, Karnataka 560025, India', '27th Cross Road, Mangammanapalya Rd, near CNR Building, Sector 7, HSR Layout, Bengaluru, Karnataka 560102, India', 1.00, 'Pending', '2025-05-22 17:13:24', NULL, 'ydheh', '65626', 'vdvev', 'heh3h', '6566291619', 'normal', 'vsvev', 'Medium', '', 10.00, NULL, '2025-06-01 12:37:10', NULL),
('P8f77f3e499984', 10, 'vxdjj', 'hehdj', 3.00, 'Pending', '2025-03-30 15:38:48', NULL, 'hrjei', '595665', 'vdjej', 'bddjh', '59656', 'normal', 'hdjdj', 'Small', '', 30.00, NULL, '2025-06-01 12:37:10', NULL),
('P90d98b8cb31e4', 29, '2H6Q+GF7, Jayamahal, Bengaluru, Karnataka 560006, India', 'W8HF+WVJ, Arcadu, Tamil Nadu 605755, India', 3.00, 'Pending', '2025-05-21 08:46:53', NULL, 'iriirjr', '656566', 'bdbdb', 'ehehehe', '235665', 'normal', 'dhdhhd', 'Medium', '', 30.00, NULL, '2025-06-01 12:37:10', NULL),
('P9cb36c26dcb64', 29, 'XH2M+MW3 LALBAGH PARK, Mavalli, Bengaluru, Karnataka 560027, India', 'Shop No 1, Survey, No 414/206/5, 206, Bannerghatta Rd, Bohra Layout, Gottigere, Bengaluru, Karnataka 560083, India', 3.00, 'Confirmed', '2025-05-20 13:34:22', NULL, 'i', '855', 'ggy', 'vguu', '866', 'normal', 'gy7', 'Medium', '', 30.00, NULL, '2025-06-01 12:37:10', NULL),
('P9ef68048a6b04', 29, 'hshsjs', 'euheue', 1.00, 'Pending', '2025-05-20 20:59:23', NULL, 'snnsjsj', '499494', 'bbsjksj', 'ehusus', '646464', 'normal', 'bzhsh', 'Medium', '', 10.00, NULL, '2025-06-01 12:37:10', NULL),
('Pa13936e3dcfe4', 29, '', 'sgysh', 3.00, 'Pending', '2025-05-04 07:33:36', NULL, '', '', '', 'eggeg', '16646', 'normal', 'gsgsh', 'Small', '', 30.00, NULL, '2025-06-01 12:37:10', NULL),
('Pa174a990996a4', 29, 'XH4H+FW3, Malvalli Tank Bund Rd, Journalist Colony, Kalasipalya, Bengaluru, Karnataka 560002, India', 'WR9C+38X, Fishing Harbor Rd, Netaji Nagar No 2, Puducherry, 605004, India', 3.00, 'Pending', '2025-05-20 10:57:49', NULL, 'yeyey', '353565', 'hdhdhd', 'uwueu', '194961', 'normal', 'sgyege', 'Medium', '', 30.00, NULL, '2025-06-01 12:37:10', NULL),
('Pa4384d1f69e54', 29, '8w7eu', 'svvev', 3.00, 'Pending', '2025-05-21 13:57:37', NULL, 'heheh', '94959', 'vdveb', 'hwhwh', '64656', 'normal', 'dvvdv', 'Small', '', 30.00, NULL, '2025-06-01 12:37:10', NULL),
('Pa7939f5851d04', 29, 'eyeg', 'heheh', 3.00, 'Pending', '2025-05-21 14:03:19', NULL, 'heh3h', '62659', 'bsbeb', 'heheh', '646466', 'normal', 'gsgeg', 'Small', '', 30.00, NULL, '2025-06-01 12:37:10', NULL),
('Pb191d43c8aa44', 29, 'bdhd', 'xbhsye', 5.00, 'Pending', '2025-05-12 06:35:27', NULL, 'dbjdjd', '95656', 'vdhdhd', 'shhsheu', '56656464', 'normal', 'dhhsueue', 'Medium', '', 50.00, NULL, '2025-06-01 12:37:10', NULL),
('Pb20890ae9e844', 29, '48/8, Kalasipalyam New Extension, Kalasipalya, Bengaluru, Karnataka 560002, India', '7R43+HQH, Mysuru, Karnataka 570010, India', 4.00, 'Pending', '2025-05-20 20:08:29', NULL, 'pavan', '6305240281', 'bi', 'ndjix', '46646', 'expressdelivery', 'sbbdj', 'Medium', '', 40.00, NULL, 'bw9to12', NULL),
('Pb2ecb2daf2404', 29, '18, Gopalapura, Rajajinagar, Bengaluru, Karnataka 560023, India', '18-4, Stringers Rd, Periamet, George Town, Chennai, Tamil Nadu 600001, India', 3.00, 'Pending', '2025-05-22 05:49:02', NULL, 'pavan', '6305240281', 'handle carefully ', 'sai', '9182237367', 'normal', 'no', 'Small', '', 30.00, NULL, '2025-06-01 12:37:10', NULL),
('Pb380f94f40a94', 29, '6, Rashtriya Vidyalaya Rd, Doddamavalli, Mavalli, Bengaluru, Karnataka 560004, India', 'Thoppukollai, Tamil Nadu 622303, India', 3.00, 'Confirmed', '2025-05-24 16:03:45', NULL, 'pavan', '8484', 'gwge', 'me', '6305280280', 'expressdelivery', 'no', 'Medium', '', 30.00, NULL, 'bw12to15', 0),
('Pb4b7523127184', 29, 'geyey', 'ehehhe', 3.00, 'Pending', '2025-05-20 20:42:18', NULL, 'hehshe', '9494949', 'sbhshd', 'dhhjdj', '65946', 'normal', 'sbbsh', 'Medium', '', 30.00, NULL, '2025-06-01 12:37:10', NULL),
('Pb71df40ba4bc4', 29, 'gyu', 'sheh', 3.00, 'Pending', '2025-05-20 09:46:53', NULL, 'ghu', '66633', 'ggdg', 'egey', '1961', 'normal', 'vsgege', 'Medium', '', 30.00, NULL, '2025-06-01 12:37:10', NULL),
('Pb96f9e1294014', 29, 'hxucuv', 'xhx', 4.00, 'Pending', '2025-05-20 13:47:20', NULL, 'gcyc', '5868', 'fxyx', 'vzzt', '83838', 'normal', 'ch gx', 'Medium', '', 40.00, NULL, '2025-06-01 12:37:10', NULL),
('Pbcba55636aed4', 29, 'hrheh', 'vdgshhe', 4.00, 'Cancelled', '2025-05-14 16:11:13', NULL, 'heheh', '65656', 'bxbdh', 'zvsvsg', '1646', 'normal', 'vzvsgs', 'Medium', '', 40.00, NULL, '2025-06-01 12:37:10', NULL),
('Pbd87f89313b54', 29, '54, Srinivas Colony, Wilson Garden, Bengaluru, Karnataka 560027, India', '18, 3rd Cross Rd, Hombegowda Nagar, Bengaluru, Karnataka 560029, India', 3.00, 'Confirmed', '2025-06-06 17:18:36', NULL, 'bdbeh', '6308646', 'teyey', 'svvsh', '6305240281', 'normal', 'egye', 'Medium', '', 30.00, NULL, 'ASAP', 3.95),
('Pbdd2a335ffc04', 29, 'hi', 'bye', 2.00, 'Pending', '2025-05-18 07:24:16', NULL, 'hello', '6305240281', 'no', 'hello', '6305240281', 'normal', 'b8', 'Medium', '', 20.00, NULL, '2025-06-01 12:37:10', NULL),
('Pc3f2af6656b44', 29, 'XH3V+PM6, BTS Main Rd, NGO Colony, Wilson Garden, Bengaluru, Karnataka 560027, India', 'Thoppukollai, Tamil Nadu 622303, India', 3.00, 'Confirmed', '2025-05-24 07:03:08', NULL, 'pavan', '6305240281', 'no', 'bharath', '9347240843', 'normal', 'no', 'Medium', '', 30.00, NULL, '2025-06-01 12:37:10', NULL),
('Pcaa187f04fd94', 29, 'ueueu', 'egegge', 6.00, 'cancelled', '2025-05-18 16:24:37', NULL, 'yeeyye', '616464', 'gsgsgs', 'evegge', '846464', 'normal', 'svsghs', 'Medium', '', 60.00, NULL, '2025-06-01 12:37:10', NULL),
('Pceb10d274c374', 29, 'hshsh', 'bshe7372', 2.00, 'Pending', '2025-05-20 13:50:48', NULL, 'ehhe', '4661', 'svhsye', 'ehey7e', '565632', 'normal', 'bdheuw78', 'Medium', '', 20.00, NULL, '2025-06-01 12:37:10', NULL),
('PCL12345', 29, 'Pune, Maharashtra, India', 'Nagpur, Maharashtra, India', 5.00, 'In Transit', '2025-05-24 04:30:00', 201, 'Amit Sharma', '9876543210', 'Handle with care, fragile item.', 'Ravi Kumar', '9123456780', 'Express', 'Leave with security if not available.', 'Box', 'Electronics', 450.00, 'Mini Truck', '2025-05-27 18:00:00', NULL),
('Pd263b3a963184', 29, 'hwue', 'eggehe', 4.00, 'Pending', '2025-05-12 06:49:46', NULL, 'shhsh', '6305240281', 'gsgeh', 'svhshe', '499464', 'normal', 'zvvsgehe', 'Medium', '', 40.00, NULL, '2025-06-01 12:37:10', NULL),
('Pe18ba60b29fd4', 10, 'ududu', 'hsue', 3.00, 'Pending', '2025-03-30 15:45:22', NULL, 'jdudu', '56656', 'dgjdi', 'vdhd', '794965', 'normal', 'gshd', 'Medium', '', 30.00, NULL, '2025-06-01 12:37:10', NULL),
('Pe4c3b10a6a654', 29, 'Shop no. 3, 1st Floor, Electronics Plaza, P. R. Lane, 3rd Cross, Sadar Patrappa Rd, Thigalarpet, Dodpete, Nagarathpete, Bengaluru, Karnataka 560002, India', 'Bandaganipalle, Andhra Pradesh, India', 3.00, 'Confirmed', '2025-07-08 11:06:35', NULL, 'pacam', '6305240281', 'handle care', 'Bharath ', '9182237367', 'normal', 'please deliver fast', 'Medium', '', 30.00, NULL, 'ASAP', 275.27),
('Pe914b85cd2434', 29, '17, 20th Cross Rd, Sampangi Rama Nagara, Sampangi Rama Nagar, Bengaluru, Karnataka 560027, India', 'No.147, 2nd D Main Rd, Koramangala 8th Block, Koramangala, Bengaluru, Karnataka 560095, India', 3.00, 'Pending', '2025-05-24 06:57:04', NULL, 'bsi', '94959', 'hshs', 'test', '9347240843', 'normal', '', 'Medium', '', 30.00, NULL, '2025-06-01 12:37:10', NULL),
('Peaaa9b4299c44', 29, '41, 2nd Cross Rd, Rajanna Layout, RBI Extension, Jayanagar, Bengaluru, Karnataka 560029, India', '48Madha Kovil Street Madha, St Anthony Koil St, Marie Oulgaret, Puducherry, 605010, India', 3.00, 'Confirmed', '2025-05-24 06:09:42', NULL, 'pavan', '6305240281', 'fast', 'sai', '9182237367', 'normal', 'no', 'Small', '', 30.00, NULL, '2025-06-01 12:37:10', NULL),
('Pebbd8be7687e4', 29, 'ueu3u', 'stye', 11.00, 'Pending', '2025-05-18 16:32:52', NULL, 'hahwh', '61646', 'vsgeh', 'evsvs', '494946', 'normal', '3vsvs', 'Medium', '', 110.00, NULL, '2025-06-01 12:37:10', NULL),
('Pfff266d868ab4', 29, 'notokay', 'heheh', 4.00, 'Pending', '2025-05-04 07:22:08', NULL, 'notokay ', '692626569', 'xhhdhej', 'dhhdh', '9161656596', 'normal', 'bsbdbdbrh', 'Medium', '', 40.00, NULL, '2025-06-01 12:37:10', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `parcel_timeline`
--

CREATE TABLE `parcel_timeline` (
  `id` int(11) NOT NULL,
  `parcel_id` varchar(111) NOT NULL,
  `status` varchar(255) NOT NULL,
  `location` varchar(255) DEFAULT NULL,
  `timestamp` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `parcel_timeline`
--

INSERT INTO `parcel_timeline` (`id`, `parcel_id`, `status`, `location`, `timestamp`) VALUES
(12, 'P76383c55c7684', 'in transit', '[\"Bonsai Garden, 11, Lalbagh, Mavalli, Bengaluru, Karnataka 560004, India\"] → kadiri', '2025-06-09 00:09:22'),
(15, 'P721d4202d0fd4', 'Delivered ', 'Thoppukollai → Kadiri → Kadiri ', '2025-07-08 01:19:16'),
(16, 'Pbd87f89313b54', 'delivered', 'Kadiri  → Kadiri', '2025-07-08 01:32:55'),
(17, 'Pe4c3b10a6a654', 'In transit', 'Bengaluru  → Bengaluru  → Chennai', '2025-07-08 16:41:07');

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `parcel_id` varchar(50) DEFAULT NULL,
  `amount` decimal(10,2) NOT NULL,
  `payment_method` varchar(100) NOT NULL,
  `payment_status` enum('Pending','Confirmed','Failed') DEFAULT 'Pending',
  `transaction_id` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`id`, `user_id`, `parcel_id`, `amount`, `payment_method`, `payment_status`, `transaction_id`, `created_at`) VALUES
(20, 29, '0', 40.00, 'online', '', 'yu886543788', '2025-05-18 07:42:18'),
(21, 29, '0', 60.00, 'online', '', 's73u373783', '2025-05-18 16:24:41'),
(22, 29, '0', 30.00, 'online', '', 'vyu7544789', '2025-05-18 16:30:11'),
(23, 29, '0', 110.00, 'online', '', 'y27282826352', '2025-05-18 16:33:00'),
(24, 29, '0', 50.00, 'online', '', 'ueueu2', '2025-05-18 16:40:24'),
(25, 29, '0', 40.00, 'online', '', '858585885', '2025-05-20 06:07:45'),
(26, 29, '0', 40.00, 'online', '', '7373838', '2025-05-20 10:47:39'),
(27, 29, '0', 30.00, 'online', '', '457843', '2025-05-20 13:34:42'),
(28, 29, '0', 40.00, 'online', '', '3456789', '2025-05-20 13:47:25'),
(29, 29, 'P34186529ab374', 30.00, 'online', '', '65789878', '2025-05-20 13:54:16'),
(30, 29, 'Pb20890ae9e844', 40.00, 'online', '', '8383663638', '2025-05-20 20:08:34'),
(31, 29, 'P5ee0e63ca1f34', 30.00, 'online', '', '647849494', '2025-05-20 20:36:36'),
(32, 29, 'P2a05192cc16f4', 30.00, 'online', '', '6789123', '2025-05-20 20:39:15'),
(33, 29, 'Pb4b7523127184', 30.00, 'online', '', '7372782828', '2025-05-20 20:42:22'),
(34, 29, 'P0058bc619e3f4', 20.00, 'online', '', '785656', '2025-05-20 20:45:54'),
(35, 29, 'P49886277038e4', 30.00, 'online', '', '56565656', '2025-05-20 20:47:28'),
(36, 29, 'P2a0941f0b1dd4', 10.00, 'online', '', '788', '2025-05-20 20:47:42'),
(37, 29, 'P5daeebe7f1fa4', 30.00, 'online', '', '1246765', '2025-05-20 20:53:46'),
(38, 29, 'P33ae4ab9d80d4', 20.00, 'online', '', '12357', '2025-05-20 20:54:21'),
(39, 29, 'P7d498a22a3604', 30.00, 'online', '', '737389394', '2025-05-20 20:59:16'),
(40, 29, 'P9ef68048a6b04', 10.00, 'online', '', 'u', '2025-05-20 20:59:28'),
(41, 29, 'P8035ab596d904', 30.00, 'online', '', 'y77', '2025-05-20 20:59:51'),
(42, 29, 'P2213b8b3fc714', 30.00, 'online', '', '123456', '2025-05-20 21:25:06'),
(43, 29, 'P37ac182459754', 30.00, 'online', '', '123463', '2025-05-21 08:36:10'),
(44, 29, 'P0365cb6d54224', 50.00, 'online', '', '135738', '2025-05-21 08:37:17'),
(45, 29, 'P103894e913b24', 20.00, 'online', '', '526272829', '2025-05-21 08:38:28'),
(46, 29, 'P90d98b8cb31e4', 30.00, 'online', '', '7277373', '2025-05-21 08:46:57'),
(47, 29, 'P74594be2e5e94', 20.00, 'online', '', '1234t6', '2025-05-21 13:57:05'),
(48, 29, 'Pa4384d1f69e54', 30.00, 'online', '', '12345', '2025-05-21 13:57:45'),
(49, 29, 'Pa7939f5851d04', 30.00, 'online', '', '12rty', '2025-05-21 14:03:24'),
(51, 29, 'Pb2ecb2daf2404', 30.00, 'online', '', 'et123', '2025-05-22 05:49:08'),
(52, 29, 'P52471293f0e14', 30.00, 'online', '', 'gahg1346', '2025-05-22 05:55:52'),
(53, 29, 'P8913c1f38b514', 10.00, 'online', '', '5twve738', '2025-05-22 17:13:29'),
(54, 29, 'Peaaa9b4299c44', 30.00, 'online', '', '123ey47', '2025-05-24 06:09:49'),
(55, 29, 'Pe914b85cd2434', 30.00, 'online', '', '1234', '2025-05-24 06:57:11'),
(56, 29, 'Pc3f2af6656b44', 30.00, 'online', '', '23663g', '2025-05-24 07:03:15'),
(57, 29, 'P76383c55c7684', 20.00, 'online', '', '52v64b', '2025-05-24 13:57:03'),
(58, 29, 'P7c9d6adfa3064', 40.00, 'online', '', '1357', '2025-05-26 02:57:51'),
(59, 29, 'Pbd87f89313b54', 30.00, 'online', '', '5764', '2025-06-06 17:19:13'),
(60, 29, 'P721d4202d0fd4', 30.00, 'online', '', '5172', '2025-07-03 08:52:43'),
(61, 29, 'P721d4202d0fd4', 30.00, 'online', '', '680', '2025-07-03 08:54:38'),
(62, 29, 'Pe4c3b10a6a654', 30.00, 'online', '', 'ub345690', '2025-07-08 11:08:08');

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `review_id` int(11) NOT NULL,
  `parcel_id` varchar(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `driver_id` int(11) NOT NULL,
  `rating` int(11) DEFAULT NULL CHECK (`rating` between 1 and 5),
  `comments` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `saved_addresses`
--

CREATE TABLE `saved_addresses` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `location` text DEFAULT NULL,
  `remarks` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `saved_addresses`
--

INSERT INTO `saved_addresses` (`id`, `user_id`, `name`, `phone`, `location`, `remarks`, `created_at`) VALUES
(1, 29, 'pavan', '6305240281', 'kadiri', 'no', '2025-05-24 06:56:11'),
(2, 29, 'bharath', '9347240843', 'Thoppukollai, Tamil Nadu 622303, India', 'no', '2025-05-24 07:03:07'),
(3, 29, 'me', '6305280280', 'Thoppukollai, Tamil Nadu 622303, India', 'no', '2025-05-24 13:56:53');

-- --------------------------------------------------------

--
-- Table structure for table `support_requests`
--

CREATE TABLE `support_requests` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `response` text DEFAULT NULL,
  `status` enum('Pending','In Progress','Resolved') DEFAULT 'Pending',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `support_requests`
--

INSERT INTO `support_requests` (`id`, `user_id`, `subject`, `message`, `response`, `status`, `created_at`) VALUES
(4, 6, 'facing issue', 'facing issue in drop location', NULL, 'Pending', '2025-02-23 18:29:02'),
(5, 10, 'nothing', 'text', 'no', 'Resolved', '2025-04-06 13:28:59'),
(6, 10, 'ok', 'ok', NULL, 'Pending', '2025-04-06 14:29:10'),
(7, 10, 'hi', 'bye', NULL, 'Pending', '2025-04-06 14:29:47'),
(8, 29, 'home problem', 'no', NULL, 'Pending', '2025-04-28 20:58:04');

-- --------------------------------------------------------

--
-- Table structure for table `tracking`
--

CREATE TABLE `tracking` (
  `id` int(11) NOT NULL,
  `parcel_id` varchar(50) NOT NULL,
  `status` enum('Pending','Pickup','In Transit','Out for Delivery','Delivered') NOT NULL,
  `current_location` varchar(255) DEFAULT NULL,
  `previous_locations` text DEFAULT NULL,
  `eta` datetime DEFAULT NULL,
  `user_id` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tracking`
--

INSERT INTO `tracking` (`id`, `parcel_id`, `status`, `current_location`, `previous_locations`, `eta`, `user_id`) VALUES
(3, 'P67ba26a86904c', 'Delivered', 'kadiri', 'kadiri, hyderabad, kadiri', NULL, '10'),
(4, 'P67bb5c45d2744', 'Pending', 'kadiri', NULL, NULL, '10'),
(5, 'P12345', 'In Transit', '12.9716 77.5946', '12.9611 77.6012, 12.9508 77.6090, 12.9405 77.6155', '2024-03-30 14:30:00', '10'),
(6, 'P67890', 'Out for Delivery', '13.0827 80.2707', '13.0725 80.2589, 13.0650 80.2458, 13.0550 80.2320', '2024-03-30 16:00:00', '10'),
(7, 'P54321', 'Delivered', '28.6139 77.2090', '28.6050 77.2005, 28.5960 77.1930, 28.5885 77.1850', '2024-03-29 18:45:00', '10'),
(8, 'P90d98b8cb31e4', 'Pending', '2H6Q+GF7, Jayamahal, Bengaluru, Karnataka 560006, India', '', '0000-00-00 00:00:00', '29'),
(9, 'P74594be2e5e94', 'Pending', 'pavan', '', '0000-00-00 00:00:00', '29'),
(10, 'Pa4384d1f69e54', 'Pending', '8w7eu', '', '0000-00-00 00:00:00', '29'),
(11, 'Pa7939f5851d04', 'Pending', 'eyeg', '', '0000-00-00 00:00:00', '29'),
(12, 'P7576b39a95674', 'Pending', '3, 2nd Main Rd, Sudhama Nagar, Bengaluru, Karnataka 560027, India', '', '0000-00-00 00:00:00', '29'),
(13, 'Pb2ecb2daf2404', 'Pending', '18, Gopalapura, Rajajinagar, Bengaluru, Karnataka 560023, India', '', '0000-00-00 00:00:00', '29'),
(14, 'P52471293f0e14', 'Pending', 'Block 8, 993, Venkataswami Layout, Adugodi, Bengaluru, Karnataka 560030, India', '', '0000-00-00 00:00:00', '29'),
(15, 'P8913c1f38b514', 'Pending', '15 & 16, Curley St, Richmond Town, Bengaluru, Karnataka 560025, India', '', '0000-00-00 00:00:00', '29'),
(16, 'Peaaa9b4299c44', 'Pending', '41, 2nd Cross Rd, Rajanna Layout, RBI Extension, Jayanagar, Bengaluru, Karnataka 560029, India', '', '0000-00-00 00:00:00', '29'),
(17, 'P7cf006a3bf684', 'Pending', '9/8, Halasuru, Yellappa Chetty Layout, Sivanchetti Gardens, Bengaluru, Karnataka 560042, India', '', '0000-00-00 00:00:00', '29'),
(18, 'Pe914b85cd2434', 'Pending', '17, 20th Cross Rd, Sampangi Rama Nagara, Sampangi Rama Nagar, Bengaluru, Karnataka 560027, India', '', '0000-00-00 00:00:00', '29'),
(19, 'Pc3f2af6656b44', 'Pending', 'XH3V+PM6, BTS Main Rd, NGO Colony, Wilson Garden, Bengaluru, Karnataka 560027, India', '', '0000-00-00 00:00:00', '29'),
(20, 'P2b528b9a1f204', 'Pending', '189, 3rd Block East, RBI Colony, Jayanagar, Bengaluru, Karnataka 560011, India', '', '0000-00-00 00:00:00', '29'),
(21, 'P76383c55c7684', 'Pending', 'Bonsai Garden, 11, Lalbagh, Mavalli, Bengaluru, Karnataka 560004, India', '', '0000-00-00 00:00:00', '29'),
(22, 'PCL12345', 'In Transit', 'Nagpur, Maharashtra, India', '[\"Pune, Maharashtra, India\", \"Ahmednagar, Maharashtra, India\"]', '2025-05-27 18:00:00', '29'),
(23, 'P0accf9f322bc4', 'Pending', '86/7, 4th Main Rd, near citizen hospital, Kalasipalya, Bengaluru, Karnataka 560002, India', '', '0000-00-00 00:00:00', '29'),
(24, 'Pb380f94f40a94', 'Pending', '6, Rashtriya Vidyalaya Rd, Doddamavalli, Mavalli, Bengaluru, Karnataka 560004, India', '', '0000-00-00 00:00:00', '29'),
(25, 'P7c9d6adfa3064', 'Pending', '8, Avenue Rd, City Market, KR Market, Mamulpet, Chickpet, Bengaluru, Karnataka 560053, India', '', '0000-00-00 00:00:00', '29'),
(26, 'Pbd87f89313b54', 'Delivered', 'Kadiri', '', '0000-00-00 00:00:00', '29'),
(27, 'P721d4202d0fd4', 'Delivered', 'Kadiri ', '', '0000-00-00 00:00:00', '29'),
(28, 'Pe4c3b10a6a654', 'In Transit', 'Chennai', '', '0000-00-00 00:00:00', '29');

-- --------------------------------------------------------

--
-- Table structure for table `trucks`
--

CREATE TABLE `trucks` (
  `id` int(11) NOT NULL,
  `driver_name` varchar(100) NOT NULL,
  `truck_number` varchar(20) NOT NULL,
  `capacity` decimal(10,2) NOT NULL,
  `availability` enum('Available','Booked') DEFAULT 'Available',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `driver_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `trucks`
--

INSERT INTO `trucks` (`id`, `driver_name`, `truck_number`, `capacity`, `availability`, `created_at`, `driver_id`) VALUES
(1, 'John Doe', 'KA-01-AB-1234', 5000.00, 'Available', '2025-02-24 06:36:37', NULL),
(2, 'Jane Smith', 'KA-02-CD-5678', 7000.00, 'Available', '2025-02-24 06:36:37', NULL),
(3, 'Mike Johnson', 'KA-03-EF-9101', 6000.00, 'Available', '2025-02-24 06:36:37', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `truck_bookings`
--

CREATE TABLE `truck_bookings` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `pickup_location` varchar(255) NOT NULL,
  `pickup_lat` double NOT NULL,
  `pickup_lng` double NOT NULL,
  `drop_location` varchar(255) NOT NULL,
  `drop_lat` double NOT NULL,
  `drop_lng` double NOT NULL,
  `total_load` varchar(50) NOT NULL,
  `purpose` text NOT NULL,
  `additional_info` text DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `status` enum('pending','confirmed','completed') DEFAULT 'pending',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `truck_bookings`
--

INSERT INTO `truck_bookings` (`id`, `user_id`, `pickup_location`, `pickup_lat`, `pickup_lng`, `drop_location`, `drop_lat`, `drop_lng`, `total_load`, `purpose`, `additional_info`, `name`, `phone`, `status`, `created_at`) VALUES
(2, 10, 'Selected Location', 13.00745600693811, 80.19281253218651, '0', 12.968421044154685, 77.59355586022139, '369', '6384649', NULL, 'pavan', '6305240501', 'pending', '2025-03-29 12:11:58'),
(3, 29, 'Selected Location', 12.958630223983334, 77.59146809577942, '0', 12.921752240419494, 77.5906852260232, '68688', '0950606', NULL, 'ycyc', '2838688', 'pending', '2025-05-04 07:35:42');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `address` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `reset_token` varchar(255) DEFAULT NULL,
  `reset_expiry` datetime DEFAULT NULL,
  `profile_pic` longblob DEFAULT NULL,
  `otp` varchar(6) NOT NULL,
  `otp_expiry` datetime DEFAULT NULL,
  `status` enum('pending','active') DEFAULT 'pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `phone`, `address`, `created_at`, `reset_token`, `reset_expiry`, `profile_pic`, `otp`, `otp_expiry`, `status`) VALUES
(6, 'test', 'dhanasaipavan356@gmail.com', 'pavan6305', '6305240292', 'kadiri,', '2025-02-22 10:35:00', NULL, NULL, 0x75706c6f6164732f64656661756c742e6a7067, '', NULL, 'pending'),
(10, 'bharath', 'kantubharath@gmail.com', 'pavan', '7396203818', NULL, '2025-03-18 06:08:49', 'cd934379caae4516ee72f1cd67766181', '2025-04-26 08:37:26', NULL, '', NULL, 'active'),
(11, 'pavan123485', 'dhanasaipavan35685@gmail.com', 'pavan630585', '6305240291', 'kadiri,', '2025-03-27 05:46:35', NULL, NULL, 0x75706c6f6164732f64656661756c742e6a7067, '742691', '2025-03-27 06:56:35', 'pending'),
(13, 'pavaneswar', 'dhanapavan434@gmail.com', 'pavan6789', '6305240281', NULL, '2025-03-28 07:38:40', NULL, NULL, NULL, '', NULL, 'active'),
(14, 'pavaneswar', 'dhanapavan4346@gmail.com', 'pavan6789', '6305240281', NULL, '2025-03-28 07:39:19', NULL, NULL, NULL, '', NULL, 'pending'),
(15, 'pavaneswar', 'dhanapavan43456@gmail.com', 'pavan6789', '6305240281', NULL, '2025-03-28 07:39:28', NULL, NULL, NULL, '', NULL, 'pending'),
(16, 'pavan123485', 'parcelease7894@gmail.com', 'pavan630585', '6305240291', NULL, '2025-03-28 07:41:47', NULL, NULL, NULL, '', NULL, 'pending'),
(17, 'pavan123485', 'parcelease78943@gmail.com', 'pavan630585', '6305240291', NULL, '2025-03-28 07:46:24', NULL, NULL, NULL, '', NULL, 'pending'),
(18, 'pavan123485', 'parcelease789438@gmail.com', 'pavan630585', '6305240291', NULL, '2025-03-28 07:46:51', NULL, NULL, NULL, '', NULL, 'pending'),
(19, 'pavan123485', 'parcelease7894388@gmail.com', 'pavan630585', '6305240291', NULL, '2025-03-28 07:47:32', NULL, NULL, NULL, '', NULL, 'pending'),
(20, 'pavan123485', 'parcelease78943885@gmail.com', 'pavan630585', '6305240291', NULL, '2025-03-28 07:48:32', NULL, NULL, NULL, '', NULL, 'pending'),
(21, 'pavan', 'example@gmail.com', 'pavan', '6305240281', NULL, '2025-03-28 07:58:38', NULL, NULL, NULL, '', NULL, 'pending'),
(22, 'pavan', 'pavaneshwarb1363.sse@saveetha.com', 'pavan', '6305240281', NULL, '2025-04-09 17:33:07', NULL, NULL, NULL, '', NULL, 'active'),
(23, 'shaheed', 'shaheed@gmail.com', 'shaheed', '9676694032', NULL, '2025-04-26 05:54:54', NULL, NULL, NULL, '', NULL, 'pending'),
(24, 'pavan', 'parcelease@gmail.com1', 'pavan', '6305240281', NULL, '2025-04-26 08:54:22', NULL, NULL, NULL, '', NULL, 'pending'),
(29, 'pavan', 'parcelease@gmail.com', '6305', '6305240281', NULL, '2025-04-28 19:11:38', NULL, NULL, NULL, '', NULL, 'active'),
(39, 'pavan', 'pavaneswar224@gmail.com', '90', '6305240281', NULL, '2025-06-06 17:38:27', NULL, NULL, NULL, '', NULL, 'active'),
(41, 'pavan', 'dhanasaipavan345@gmail.com', 'pass', '6305240281', NULL, '2025-06-29 18:43:03', NULL, NULL, NULL, '', NULL, 'pending');

-- --------------------------------------------------------

--
-- Table structure for table `user_wallet`
--

CREATE TABLE `user_wallet` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `balance` decimal(10,2) DEFAULT 0.00,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `branches`
--
ALTER TABLE `branches`
  ADD PRIMARY KEY (`branch_id`);

--
-- Indexes for table `chatbot_messages`
--
ALTER TABLE `chatbot_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `drivers`
--
ALTER TABLE `drivers`
  ADD PRIMARY KEY (`driver_id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `phone` (`phone`),
  ADD UNIQUE KEY `vehicle_number` (`vehicle_number`),
  ADD UNIQUE KEY `license_number` (`license_number`);

--
-- Indexes for table `email_verification`
--
ALTER TABLE `email_verification`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `faqs`
--
ALTER TABLE `faqs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `incitybookings`
--
ALTER TABLE `incitybookings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `parcel_id` (`parcel_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `optimized_routes`
--
ALTER TABLE `optimized_routes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `parcels`
--
ALTER TABLE `parcels`
  ADD PRIMARY KEY (`parcel_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `parcel_timeline`
--
ALTER TABLE `parcel_timeline`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `transaction_id` (`transaction_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `payments_ibfk_3` (`parcel_id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`review_id`),
  ADD KEY `parcel_id` (`parcel_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `driver_id` (`driver_id`);

--
-- Indexes for table `saved_addresses`
--
ALTER TABLE `saved_addresses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `support_requests`
--
ALTER TABLE `support_requests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `tracking`
--
ALTER TABLE `tracking`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `trucks`
--
ALTER TABLE `trucks`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `truck_number` (`truck_number`),
  ADD KEY `fk_truck_driver` (`driver_id`);

--
-- Indexes for table `truck_bookings`
--
ALTER TABLE `truck_bookings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `user_wallet`
--
ALTER TABLE `user_wallet`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `branches`
--
ALTER TABLE `branches`
  MODIFY `branch_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `chatbot_messages`
--
ALTER TABLE `chatbot_messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `drivers`
--
ALTER TABLE `drivers`
  MODIFY `driver_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `email_verification`
--
ALTER TABLE `email_verification`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `faqs`
--
ALTER TABLE `faqs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `incitybookings`
--
ALTER TABLE `incitybookings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `optimized_routes`
--
ALTER TABLE `optimized_routes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `parcel_timeline`
--
ALTER TABLE `parcel_timeline`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `review_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `saved_addresses`
--
ALTER TABLE `saved_addresses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `support_requests`
--
ALTER TABLE `support_requests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tracking`
--
ALTER TABLE `tracking`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `trucks`
--
ALTER TABLE `trucks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `truck_bookings`
--
ALTER TABLE `truck_bookings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `user_wallet`
--
ALTER TABLE `user_wallet`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `chatbot_messages`
--
ALTER TABLE `chatbot_messages`
  ADD CONSTRAINT `chatbot_messages_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `incitybookings`
--
ALTER TABLE `incitybookings`
  ADD CONSTRAINT `incitybookings_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `notifications_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `parcels`
--
ALTER TABLE `parcels`
  ADD CONSTRAINT `parcels_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`parcel_id`) REFERENCES `parcels` (`parcel_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `reviews_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `reviews_ibfk_3` FOREIGN KEY (`driver_id`) REFERENCES `drivers` (`driver_id`) ON DELETE CASCADE;

--
-- Constraints for table `support_requests`
--
ALTER TABLE `support_requests`
  ADD CONSTRAINT `support_requests_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `trucks`
--
ALTER TABLE `trucks`
  ADD CONSTRAINT `fk_truck_driver` FOREIGN KEY (`driver_id`) REFERENCES `drivers` (`driver_id`) ON DELETE SET NULL;

--
-- Constraints for table `truck_bookings`
--
ALTER TABLE `truck_bookings`
  ADD CONSTRAINT `truck_bookings_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `user_wallet`
--
ALTER TABLE `user_wallet`
  ADD CONSTRAINT `user_wallet_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
