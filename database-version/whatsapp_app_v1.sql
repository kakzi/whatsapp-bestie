-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 20, 2022 at 07:28 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `whatsapp_app`
--

-- --------------------------------------------------------

--
-- Table structure for table `account`
--

CREATE TABLE `account` (
  `id` int(11) NOT NULL,
  `id_pricelist` int(11) NOT NULL,
  `lembaga` varchar(256) NOT NULL,
  `operator` varchar(256) NOT NULL,
  `address` text NOT NULL,
  `wa_bisnis` varchar(256) NOT NULL,
  `wa_operator` varchar(256) NOT NULL,
  `email` varchar(256) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `api_key` text NOT NULL,
  `level` enum('1','2') NOT NULL DEFAULT '2' COMMENT '1 = admin\r\n2 = member',
  `limit_device` int(11) NOT NULL,
  `status` enum('active','inactive','expired') NOT NULL,
  `expired` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `account`
--

INSERT INTO `account` (`id`, `id_pricelist`, `lembaga`, `operator`, `address`, `wa_bisnis`, `wa_operator`, `email`, `username`, `password`, `api_key`, `level`, `limit_device`, `status`, `expired`) VALUES
(1, 3, '', '', '', '', '', '', 'admin', '$2y$10$Qsx.wDl9L8kgpOtn82q3R.O0ytml2EGHZdcsgtnwqyVqLg4ABDmRq', 'b2d95af932eedb4de92b3496f338aa5f97b36ae0', '1', 1, 'active', NULL),
(2, 1, '', '', '', '', '', '', 'user', '$2y$10$i7z6WkiwH4cxTG8GEy.9iO6a6SXpYrlVejiTgQhYRziERYBCzB3aG', '15ba76840679dd18c8c297f4f032bf8b', '2', 1, 'active', '2022-12-31 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `all_contacts`
--

CREATE TABLE `all_contacts` (
  `id` int(11) NOT NULL,
  `sender` varchar(111) NOT NULL,
  `number` varchar(111) NOT NULL,
  `name` varchar(111) NOT NULL,
  `type` enum('Personal','Group') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `all_contacts`
--

INSERT INTO `all_contacts` (`id`, `sender`, `number`, `name`, `type`) VALUES
(86, '6285155105056', '6282231338216', 'Gus Afi', 'Personal'),
(87, '6285155105056', '6285329716661', 'Narko', 'Personal'),
(88, '6285155105056', '6285785558640', 'Bmt zainul', 'Personal'),
(89, '6285155105056', '6285840557925', 'Devweb', 'Personal'),
(90, '6285155105056', '6282334777210', 'Lek Febri', 'Personal'),
(91, '6285155105056', '6285748331547', 'Ndan SUpar', 'Personal'),
(92, '6285155105056', '6285784570327', 'Bmt Ilya', 'Personal'),
(93, '6285155105056', '62895346374614', 'Swalayan', 'Personal'),
(94, '6285155105056', '6282246450745', 'Bmt rohmah Ayu', 'Personal'),
(95, '6285155105056', '6285767684100', 'AINU', 'Personal'),
(96, '6285155105056', '6285755508044', 'Sholeh IT MWC NU GAYAM', 'Personal'),
(97, '6285155105056', '6282334388191', 'BRI', 'Personal'),
(98, '6285155105056', '6289699392663', 'Santri Senior Mas Taufiq', 'Personal'),
(99, '6285155105056', '6282234822466', 'Bmt Sri Ningsih', 'Personal'),
(100, '6285155105056', '6282123318082', 'WA Bestie', 'Personal'),
(101, '6285155105056', '6282244604241', 'Iqbal', 'Personal'),
(102, '6285155105056', '6282132579880', 'Karni', 'Personal'),
(103, '6285155105056', '6281234320918', 'Handika IT MWC NU Sekar', 'Personal'),
(104, '6285155105056', '628819516992', 'Ustadz Fuad LFNU Tuban', 'Personal'),
(105, '6285155105056', '6285730524441', 'Pak Kastur', 'Personal'),
(106, '6285155105056', '6281260068398', 'BMT Prawito', 'Personal'),
(107, '6285155105056', '6282337076936', 'Ipnu Rega', 'Personal'),
(108, '6285155105056', '6285646909013', 'Bmt imron', 'Personal'),
(109, '6285155105056', '6282231376068', 'Afandi', 'Personal'),
(110, '6285155105056', '6285790315122', 'Roni Ipnu', 'Personal'),
(111, '6285155105056', '6285649436773', 'Nanik', 'Personal'),
(112, '6285155105056', '6285649443975', 'Nidhom', 'Personal'),
(113, '6285155105056', '6281230374932', 'Anang', 'Personal'),
(114, '6285155105056', '6285732448430', 'Bmt sobirin', 'Personal'),
(115, '6285155105056', '6285704936488', 'Perc Cahaya Busur Pusat', 'Personal'),
(116, '6285155105056', '6282335383968', 'Niam IT MWC NU Malo', 'Personal'),
(117, '6285155105056', '6282228940433', 'Mbak Novi', 'Personal'),
(118, '6285155105056', '6282338798785', 'Bmt Damanto', 'Personal'),
(119, '6285155105056', '6282335885618', 'Bmt munir', 'Personal'),
(120, '6285155105056', '6281235507228', 'Kak Din', 'Personal'),
(121, '6285155105056', '6281321454958', 'Busur Teuku Umar', 'Personal'),
(122, '6285155105056', '6282237504818', 'Wiwik', 'Personal'),
(123, '6285155105056', '6285749017435', 'Sayyida', 'Personal'),
(124, '6285155105056', '6285732053324', 'Mas Azzam', 'Personal'),
(125, '6285155105056', '6281358572707', 'Mas Wit', 'Personal'),
(126, '6285155105056', '6281333825213', 'Bmt arik', 'Personal'),
(127, '6285155105056', '6285102720388', 'Wifi id', 'Personal'),
(128, '6285155105056', '6282132138708', 'Mas Taqin', 'Personal'),
(129, '6285155105056', '6282328251600', 'Whatsappme', 'Personal'),
(130, '6285155105056', '6285231339959', 'Subani As', 'Personal'),
(131, '6285155105056', '6285862255525', 'Roni Bendrat', 'Personal'),
(132, '6285155105056', '6282337288726', 'IT ikhsan', 'Personal'),
(133, '6285155105056', '6281296145558', 'Vicentra Bu Yuyun Surabaya', 'Personal'),
(134, '6285155105056', '6281230567781', 'Santri Hijrah', 'Personal'),
(135, '6285155105056', '6285647703640', 'Ropek', 'Personal'),
(136, '6285155105056', '6289604190783', 'Bmt Indri', 'Personal'),
(137, '6285155105056', '6281554749526', 'Ust Fikrizuhara Muzakkin LF NU Lamongan', 'Personal'),
(138, '6285155105056', '6285733107020', 'PIB Syaiful Huda', 'Personal'),
(139, '6285155105056', '6285746943222', 'Mas Doni', 'Personal'),
(140, '6285155105056', '6281332245817', 'Pak,E Firman', 'Personal'),
(141, '6285155105056', '6287731061400', 'Flutter BWA', 'Personal'),
(142, '6285155105056', '6285731835481', 'Indihome Ali', 'Personal'),
(143, '6285155105056', '6285109701017', 'Sales Yana Indihome', 'Personal'),
(144, '6285155105056', '6281224960909', 'PC Gaming', 'Personal'),
(145, '6285155105056', '6285749817986', 'Bmt Wahyu Prananda', 'Personal'),
(146, '6285155105056', '6282298859671', 'MPedia', 'Personal'),
(147, '6285155105056', '6281328767371', 'PT. Kledo Berhati Nyaman', 'Personal'),
(148, '6285155105056', '628563455744', 'Henik', 'Personal'),
(149, '6285155105056', '6288228272972', 'Dekluh Anyar', 'Personal'),
(150, '6285155105056', '6282243508660', 'Bengkel', 'Personal'),
(151, '6285155105056', '6282140229690', 'Bmt joko', 'Personal'),
(152, '6285155105056', '6285736806238', 'Loundry', 'Personal'),
(153, '6285155105056', '6285722705703', 'Kain Bjn', 'Personal'),
(154, '6285155105056', '6285330980677', 'Pak Parmin Driver', 'Personal'),
(155, '6285155105056', '6285235470760', 'Mbak Ir', 'Personal'),
(156, '6285155105056', '6281334799212', 'Alvi N', 'Personal'),
(157, '6285155105056', '6281334058123', 'Bmt endah', 'Personal'),
(158, '6285155105056', '6281273578106', 'Busur', 'Personal'),
(159, '6285155105056', '6285704494110', 'Erdyn Smart Hafidz', 'Personal'),
(160, '6285155105056', '6285230888241', 'Alex swalayan', 'Personal'),
(161, '6285155105056', '6282233353635', 'Genyo', 'Personal'),
(162, '6285155105056', '6282232866689', 'Ustadz Syamsul LFNU PWNU Jatim', 'Personal'),
(163, '6285155105056', '6282221775532', 'Wiifi', 'Personal'),
(164, '6285155105056', '6283814305092', 'Imamdev', 'Personal'),
(165, '6285155105056', '6285335044118', 'Dek Is', 'Personal'),
(166, '6285155105056', '6282237238427', 'Rika IT MWC NU DANDER', 'Personal'),
(167, '6285155105056', '6289601654724', 'BMT Lafiana Putri', 'Personal'),
(168, '6285155105056', '6281230890382', 'Kang Ngatno', 'Personal'),
(169, '6285155105056', '6285748616072', 'Bmt St Nur Janah', 'Personal'),
(170, '6285155105056', '6281233741181', 'Bmt Arena', 'Personal'),
(171, '6285155105056', '6285230838094', 'Iwan IT MWC NU Ngambon', 'Personal'),
(172, '6285155105056', '6285559642478', 'Ridho CS', 'Personal'),
(173, '6285155105056', '6285704965271', 'LFNU Ngawi Andi Hasan', 'Personal'),
(174, '6285155105056', '6285646337969', 'Ali IT MWC Purwosari', 'Personal'),
(175, '6285155105056', '6285815508717', 'Bmt tomi', 'Personal'),
(176, '6285155105056', '6281273064139', 'JNT', 'Personal'),
(177, '6285155105056', '6285101256658', 'Evi Purwanti Gading Murni', 'Personal'),
(178, '6285155105056', '6285645081195', 'Ari', 'Personal'),
(179, '6285155105056', '6285608457928', 'Bmt evi Kusuma', 'Personal'),
(180, '6285155105056', '6285600090035', 'Mas Eka', 'Personal'),
(181, '6285155105056', '6285935180590', 'Mbah Rat 2', 'Personal'),
(182, '6285155105056', '6285257683620', 'Munawar IT MWC NU Bojonegoro', 'Personal'),
(183, '6285155105056', '6281334631322', 'Mba Anita', 'Personal'),
(184, '6285155105056', '6281132275077', 'Deprintz Yoga', 'Personal'),
(185, '6285155105056', '6285755306240', 'Eddy', 'Personal'),
(186, '6285155105056', '6282151162574', 'Indihome Hanenda', 'Personal'),
(187, '6285155105056', '6285796332571', 'Bmt Fitha', 'Personal'),
(188, '6285155105056', '6285731316600', 'Bmt Ika', 'Personal'),
(189, '6285155105056', '6285655935889', 'Kontrak Pung', 'Personal'),
(190, '6285155105056', '6282135632204', 'BMT Trya Nanas', 'Personal'),
(191, '6285155105056', '62895414248421', 'PRAMUNIAGA 1', 'Personal'),
(192, '6285155105056', '6285735482964', 'Nisa', 'Personal'),
(193, '6285155105056', '6285777364036', 'Pak Wahyudi (PRESDIR)', 'Personal'),
(194, '6285155105056', '6285606019529', 'Bmt Fanani', 'Personal'),
(195, '6285155105056', '6282288243222', 'Jetak stiker', 'Personal'),
(196, '6285155105056', '6281230676001', 'Denis', 'Personal'),
(197, '6285155105056', '6285730153673', 'Firda', 'Personal'),
(198, '6285155105056', '62895366263293', 'Fiaa', 'Personal'),
(199, '6285155105056', '6281334885504', 'JNE Agen Denis', 'Personal'),
(200, '6285155105056', '6282141553605', 'Pak Bo', 'Personal'),
(201, '6285155105056', '6281334199923', 'Ust Umi', 'Personal'),
(202, '6285155105056', '6285649623989', 'Bmt trisna', 'Personal'),
(203, '6285155105056', '6281331385498', 'Pak PLN', 'Personal'),
(204, '6285155105056', '6285606128503', 'Client Masruah', 'Personal'),
(205, '6285155105056', '6281330295870', 'Pak Hambali', 'Personal'),
(206, '6285155105056', '6285732487126', 'Ipnu Muhadi', 'Personal'),
(207, '6285155105056', '6282264658769', 'Mbak Mutttt', 'Personal'),
(208, '6285155105056', '6282231156026', 'Mbk Ip Pusat', 'Personal'),
(209, '6285155105056', '6285235116409', 'Pak Kyai Khoiri', 'Personal'),
(210, '6285155105056', '6285855125855', 'Bmt Irma', 'Personal'),
(211, '6285155105056', '6282333921633', 'Pak Moh', 'Personal'),
(212, '6285155105056', '6282145012735', 'sumariyantoiyan82', 'Personal'),
(213, '6285155105056', '6282332594961', 'Kharis IT MWC NU TRUCUK', 'Personal'),
(214, '6285155105056', '6282331670720', 'Pak Yai Rofii', 'Personal'),
(215, '6285155105056', '6285231654320', 'Expedisi Timbul Jaya', 'Personal'),
(216, '6285155105056', '6282234628026', 'Pak Sartono', 'Personal'),
(217, '6285155105056', '6281559732915', 'Bmt Tika', 'Personal'),
(218, '6285155105056', '6285706822124', 'Bmt Kholil', 'Personal'),
(219, '6285155105056', '6285887665420', 'Bmt Aulia', 'Personal'),
(220, '6285155105056', '6289530369362', 'IT Adit', 'Personal'),
(221, '6285155105056', '6285892551668', 'Isa', 'Personal'),
(222, '6285155105056', '6282247017936', 'Bmt rikha', 'Personal'),
(223, '6285155105056', '6285694988155', 'Mbak Qotijah', 'Personal'),
(224, '6285155105056', '6285257477279', 'Bmt hida', 'Personal'),
(225, '6285155105056', '6285230891222', 'Pak Niam', 'Personal'),
(226, '6285155105056', '6285230837778', 'Getuk Online', 'Personal'),
(227, '6285155105056', '6285335271549', 'Pak Yanto', 'Personal'),
(228, '6285155105056', '6281249914335', 'BMT Asti????', 'Personal'),
(229, '6285155105056', '6285330215096', 'Mas Andik', 'Personal'),
(230, '6285155105056', '6281357869805', 'Dirut Easy', 'Personal'),
(231, '6285155105056', '6285851539727', 'Ademos', 'Personal'),
(232, '6285155105056', '6282331620965', 'Anam', 'Personal'),
(233, '6285155105056', '6285706687868', 'Mas Habib', 'Personal'),
(234, '6285155105056', '6285784619266', 'Hendra Bendrat', 'Personal'),
(235, '6285155105056', '6285748113856', 'Nusa Riko', 'Personal'),
(236, '6285155105056', '6285745215204', 'Bmt istiana', 'Personal'),
(237, '6285155105056', '6285854277717', 'Bmt fariezza', 'Personal'),
(238, '6285155105056', '6281335024024', 'Pak Por(mantrisapi)', 'Personal'),
(239, '6285155105056', '6281578937877', 'Irsyad', 'Personal'),
(240, '6285155105056', '6281359527292', 'Divisi SDI', 'Personal'),
(241, '6285155105056', '6281230776177', 'Kurir Tenda', 'Personal'),
(242, '6285155105056', '6285730212660', 'Bmt suhartono', 'Personal'),
(243, '6285155105056', '6285786333330', 'UPT PUSKESMAS GEMARANG Mbak Ovin', 'Personal'),
(244, '6285155105056', '6282232449691', 'Pak Imam', 'Personal'),
(245, '6285155105056', '6281216073420', 'Jefri', 'Personal'),
(246, '6285155105056', '6281238492589', 'Bmt Khoirul Anwar 2', 'Personal'),
(247, '6285155105056', '6285607390088', 'Bmt Sofia', 'Personal'),
(248, '6285155105056', '6285728841307', 'IT putra', 'Personal'),
(249, '6285155105056', '6285230899583', 'Ihsanudin IT MWC NU Parengan', 'Personal'),
(250, '6285155105056', '6289667771377', 'Panji', 'Personal'),
(251, '6285155105056', '6282257762692', 'Khumaidah', 'Personal'),
(252, '6285155105056', '6285733901286', 'Bmt Edik', 'Personal'),
(253, '6285155105056', '6281216429799', 'Indihome', 'Personal'),
(254, '6285155105056', '6281259715022', 'Komite Pembiayaan', 'Personal'),
(255, '6285155105056', '62895703982299', 'Rudi', 'Personal'),
(256, '6285155105056', '6281231683364', 'Totok Gresik', 'Personal'),
(257, '6285155105056', '6285334814143', 'Huda Benturi', 'Personal'),
(258, '6285155105056', '6281380751565', 'Tik', 'Personal'),
(259, '6285155105056', '6285733566705', 'Bmt Soni', 'Personal'),
(260, '6285155105056', '6281555365573', 'Bmt Susi', 'Personal'),
(261, '6285155105056', '6285895902117', 'Bmt Afrida', 'Personal'),
(262, '6285155105056', '6285668996337', 'Bmt Ulum', 'Personal'),
(263, '6285155105056', '6285735473977', 'Bmt luluk', 'Personal'),
(264, '6285155105056', '6285749916943', 'Poppy', 'Personal'),
(265, '6285155105056', '6281331735522', 'Produsen Ayu Indah', 'Personal'),
(266, '6285155105056', '6285399471908', 'BMT MAS DIMAS', 'Personal'),
(267, '6285155105056', '6282230806242', 'Indihome Teknisi', 'Personal'),
(268, '6285155105056', '6285899269389', 'Ita', 'Personal'),
(269, '6285155105056', '6283831307969', 'Mas Hary', 'Personal'),
(270, '6285155105056', '6285708391842', 'Tarisah', 'Personal'),
(271, '6285155105056', '6281322899246', 'Bayu Sidiq', 'Personal'),
(272, '6285155105056', '6288226149241', 'Ademos Nidhom', 'Personal'),
(273, '6285155105056', '6285236528732', 'Cak Farid', 'Personal'),
(274, '6285155105056', '6285386664527', 'Pak Amiin JagatSembilan', 'Personal'),
(275, '6285155105056', '6285865909305', 'Bmt Riska', 'Personal'),
(276, '6285155105056', '6282245437878', 'Bmt windy', 'Personal'),
(277, '6285155105056', '6281335871173', 'IT MWC NU Bubulan', 'Personal'),
(278, '6285155105056', '6285749619154', 'Lazisnu Malo', 'Personal'),
(279, '6285155105056', '6282266295772', 'Bmt ahmad Khoirudin', 'Personal'),
(280, '6285155105056', '6281238492723', 'Huda', 'Personal'),
(281, '6285155105056', '6283119568076', 'Jk', 'Personal'),
(282, '6285155105056', '6281231798858', 'Gori 2 Cell', 'Personal'),
(283, '6285155105056', '6281218869416', 'sukiswanto', 'Personal'),
(284, '6285155105056', '6282127277101', 'Dicoding', 'Personal'),
(285, '6285155105056', '628563422164', 'Ida', 'Personal'),
(286, '6285155105056', '6289633495220', 'Alim', 'Personal'),
(287, '6285155105056', '6285731803370', 'Adminya Nusa', 'Personal'),
(288, '6285155105056', '6285230850411', 'Mas Darul Mutakin', 'Personal'),
(289, '6285155105056', '6282132269522', 'Eko Dongin', 'Personal'),
(290, '6285155105056', '6282244273236', 'Kak Lim', 'Personal'),
(291, '6285155105056', '6281357496436', 'BMT Faizal', 'Personal'),
(292, '6285155105056', '6285736311192', 'Ust. Ansori LFNU Ngawi', 'Personal'),
(293, '6285155105056', '6285648667884', 'Bmt alex', 'Personal'),
(294, '6285155105056', '6285733501432', 'Imam', 'Personal'),
(295, '6285155105056', '6285158038896', '*fudin', 'Personal'),
(296, '6285155105056', '6285856434030', 'Pk Muklas', 'Personal'),
(297, '6285155105056', '6285334774678', 'Kak Din', 'Personal'),
(298, '6285155105056', '6285746591390', 'Bmt wicen', 'Personal'),
(299, '6285155105056', '6282116356643', 'Khafid IT MWC NU Tambakrejo', 'Personal'),
(300, '6285155105056', '6285815830718', 'Hadlir IT MWC NU Senori', 'Personal'),
(301, '6285155105056', '6282233720343', 'Lita Rohman Sby', 'Personal'),
(302, '6285155105056', '6282210803382', 'Mas Hyda', 'Personal'),
(303, '6285155105056', '6285732089539', 'Bmt khamdan', 'Personal'),
(304, '6285155105056', '62895397293787', 'Yusuf Air Nu', 'Personal'),
(305, '6285155105056', '6281450222610', 'Aripin', 'Personal'),
(306, '6285155105056', '6285640645659', 'Mbak Linda', 'Personal'),
(307, '6285155105056', '6282141598213', 'Nikmah', 'Personal'),
(308, '6285155105056', '6282132300616', 'Bmt bevi', 'Personal'),
(309, '6285155105056', '6285216849474', 'H26/4/2022 3', 'Personal'),
(310, '6285155105056', '6285729140255', 'BMT Desi Rahmawati', 'Personal'),
(311, '6285155105056', '628563311868', 'Dhani Pungpungan', 'Personal'),
(312, '6285155105056', '6281228570574', 'PKU', 'Personal'),
(313, '6285155105056', '6281917380782', 'Volunteer Medhayoh', 'Personal'),
(314, '6285155105056', '6282230830126', 'Devi Muaidah', 'Personal'),
(315, '6285155105056', '6282160611253', 'Ariyozi', 'Personal'),
(316, '6285155105056', '6285815275896', 'BMT Khotijah', 'Personal'),
(317, '6285155105056', '6281259604190', 'Siswanto Gayam', 'Personal'),
(318, '6285155105056', '6285755154734', 'Riska', 'Personal'),
(319, '6285155105056', '6285773847615', 'Mbk Tik', 'Personal'),
(320, '6285155105056', '6289514291550', 'Nurkalem', 'Personal'),
(321, '6285155105056', '6285731146851', 'b zida benturi', 'Personal'),
(322, '6285155105056', '628993711159', 'RS Fatma', 'Personal'),
(323, '6285155105056', '6285331679329', 'Bmt irnaini P', 'Personal'),
(324, '6285155105056', '6285769529703', 'Mas Roni 2', 'Personal'),
(325, '6285155105056', '628112576935', 'Navagreeen', 'Personal'),
(326, '6285155105056', '6285157783733', 'Pak E', 'Personal'),
(327, '6285155105056', '6282339909973', 'Oke', 'Personal'),
(328, '6285155105056', '6282246197193', 'Fajar', 'Personal'),
(329, '6285155105056', '6285259084719', 'Mbak Linda', 'Personal'),
(330, '6285155105056', '6282330060769', 'Mbah Wo', 'Personal'),
(331, '6285155105056', '6285232040965', 'Kyai', 'Personal'),
(332, '6285155105056', '6281357665006', 'Pak Bayan Salim', 'Personal'),
(333, '6285155105056', '62895385898022', 'Hena Dicoding', 'Personal'),
(334, '6285155105056', '6285735658962', 'Ahas Kalitidu', 'Personal'),
(335, '6285155105056', '6282331707949', 'Riadi', 'Personal'),
(336, '6285155105056', '6285706739813', 'Bmt fita', 'Personal'),
(337, '6285155105056', '6282337006992', 'Easy Perc', 'Personal'),
(338, '6285155105056', '6285236324613', 'Agus Hafidz', 'Personal'),
(339, '6285155105056', '6285785772897', 'Nusa Dicky', 'Personal'),
(340, '6285155105056', '6288216907124', 'Kholis', 'Personal'),
(341, '6285155105056', '6282257182228', 'Raden Rahmad Sholeh', 'Personal'),
(342, '6285155105056', '6285731921097', 'Anis Jasa', 'Personal'),
(343, '6285155105056', '6285808338881', 'Sholikun', 'Personal'),
(344, '6285155105056', '6285730000727', 'Tripay', 'Personal'),
(345, '6285155105056', '6281230267022', 'Teknisi', 'Personal'),
(346, '6285155105056', '6282335198424', 'Mbak Rul', 'Personal'),
(347, '6285155105056', '6285655935214', 'kelvin', 'Personal'),
(348, '6285155105056', '6285735138294', 'Bmt lia', 'Personal'),
(349, '6285155105056', '628567442579', 'Mas Dhuha', 'Personal'),
(350, '6285155105056', '6282139877115', 'Bmt irul', 'Personal'),
(351, '6285155105056', '6289618780866', 'Suntoro', 'Personal'),
(352, '6285155105056', '62895415096531', 'SantriKoding', 'Personal'),
(353, '6285155105056', '6285399485468', 'Bmt Muzaqi', 'Personal'),
(354, '6285155105056', '6282147334657', 'Shifana IT MWC NU Kedewan', 'Personal'),
(355, '6285155105056', '6285777656340', 'Huda', 'Personal'),
(356, '6285155105056', '6282220468952', 'Bang Wa', 'Personal'),
(357, '6285155105056', '6285203583380', 'Lutfi IT MWC NU Ngambon', 'Personal'),
(358, '6285155105056', '6282257383511', 'Stiker Ambulance', 'Personal'),
(359, '6285155105056', '6285781480396', 'Proyek', 'Personal'),
(360, '6285155105056', '6285790640983', 'Bu lis', 'Personal'),
(361, '6285155105056', '6281297667579', 'Sales Dprintz', 'Personal'),
(362, '6285155105056', '6285232402093', 'Oman', 'Personal'),
(363, '6285155105056', '6285546098527', 'Bmt nikmatul Jannah', 'Personal'),
(364, '6285155105056', '6285746485732', 'Ustadz Alfan LFNU Bojonegoro', 'Personal'),
(365, '6285155105056', '6282244777638', 'Admin Teknisi', 'Personal'),
(366, '6285155105056', '6285748139689', 'Dimas Baru', 'Personal'),
(367, '6285155105056', '6282336883977', 'Notaris Iz', 'Personal'),
(368, '6285155105056', '6282331852568', 'Azza IT MWC NU Dander', 'Personal'),
(369, '6285155105056', '6282244946460', 'Fajar HP', 'Personal'),
(370, '6285155105056', '6285707009109', 'Bmt Ali', 'Personal'),
(371, '6285155105056', '6285731230992', 'Mas Azis', 'Personal'),
(372, '6285155105056', '6285788936761', 'Mudah', 'Personal'),
(373, '6285155105056', '6289631599043', 'Linda Colorlink Surabaya', 'Personal'),
(374, '6285155105056', '6285237221828', 'Sin', 'Personal'),
(375, '6285155105056', '6282136712429', 'Bmt Huda', 'Personal'),
(376, '6285155105056', '6285257994919', 'Pesan Buku', 'Personal'),
(377, '6285155105056', '6285855243818', 'Sholikin', 'Personal'),
(378, '6285155105056', '6285316547777', 'Putra', 'Personal'),
(379, '6285155105056', '6281249532619', 'BSI Mas Robeh', 'Personal'),
(380, '6285155105056', '6281213766180', 'Bmt Vina', 'Personal'),
(381, '6285155105056', '966530419323', 'Mbak Qot Koncone Mak E', 'Personal'),
(382, '6285155105056', '6281332064192', 'Bmt falich', 'Personal'),
(383, '6285155105056', '6285546538824', 'Bmt setiawan', 'Personal'),
(384, '6285155105056', '6281332063215', 'Falich 2', 'Personal'),
(385, '6285155105056', '6285732778834', 'Dian Baru', 'Personal'),
(386, '6285155105056', '6281330465308', 'Pak Martono Sapi', 'Personal'),
(387, '6285155105056', '6281232443725', 'Bmt sholihin', 'Personal'),
(388, '6285155105056', '6289616337619', 'Bmt Adi', 'Personal'),
(389, '6285155105056', '6285731827605', 'Pak Arifin', 'Personal'),
(390, '6285155105056', '6285236551881', 'Mas Irul', 'Personal'),
(391, '6285155105056', '628881455094', 'Smartfren', 'Personal'),
(392, '6285155105056', '6285704468381', 'Tutikpuji', 'Personal'),
(393, '6285155105056', '62881026830914', 'Irna', 'Personal'),
(394, '6285155105056', '628999488990', 'Admin Codepolitan', 'Personal'),
(395, '6285155105056', '628999900411', 'Al Quran', 'Personal'),
(396, '6285155105056', '6285748102129', 'Bmt nikmah Pwr', 'Personal'),
(397, '6285155105056', '6285731418373', 'Duwik Bendo', 'Personal'),
(398, '6285155105056', '6288238883193', 'Bang Bekam', 'Personal'),
(399, '6285155105056', '6283109107350', 'Andi', 'Personal'),
(400, '6285155105056', '628986965328', 'Amin', 'Personal'),
(401, '6285155105056', '6288216907103', 'Kesayangan', 'Personal'),
(402, '6285155105056', '6285730804094', 'Imam. IT MWC NU Ngasem', 'Personal'),
(403, '6285155105056', '6282121609346', 'Software', 'Personal'),
(404, '6285155105056', '6282232085582', 'Wifi Net One', 'Personal'),
(405, '6285155105056', '6285785331361', 'Prehatini', 'Personal'),
(406, '6285155105056', '628113308222', 'Perc Victory Rika', 'Personal'),
(407, '6285155105056', '6282228884332', 'Karikatur', 'Personal'),
(408, '6285155105056', '628563108638', 'Bmt Hana Senori', 'Personal'),
(409, '6285155105056', '6282341810186', 'Mas inyong', 'Personal');

-- --------------------------------------------------------

--
-- Table structure for table `autoreply`
--

CREATE TABLE `autoreply` (
  `id` int(11) NOT NULL,
  `type` enum('Text','Text & Media','Quick Reply Button','Url & Call Button','List Button') NOT NULL,
  `keyword` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `response` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `media` text DEFAULT NULL,
  `btn1` varchar(255) NOT NULL,
  `btn2` varchar(255) NOT NULL,
  `btn3` varchar(255) NOT NULL,
  `btnid1` varchar(255) NOT NULL,
  `btnid2` varchar(255) NOT NULL,
  `btnid3` varchar(255) NOT NULL,
  `footer` varchar(255) NOT NULL,
  `nomor` varchar(15) NOT NULL DEFAULT '0',
  `make_by` varchar(33) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blast`
--

CREATE TABLE `blast` (
  `id` int(11) NOT NULL,
  `sender` varchar(15) NOT NULL,
  `type` enum('Text','Text & Media','Quick Reply Button','Url & Call Button','List Button') NOT NULL,
  `tujuan` varchar(255) NOT NULL,
  `pesan` longtext NOT NULL,
  `media` varchar(255) NOT NULL,
  `btn1` varchar(255) NOT NULL,
  `btn2` varchar(255) NOT NULL,
  `btn3` varchar(255) NOT NULL,
  `btnid1` varchar(255) NOT NULL,
  `btnid2` varchar(255) NOT NULL,
  `btnid3` varchar(255) NOT NULL,
  `footer` varchar(255) NOT NULL,
  `make_by` int(11) NOT NULL,
  `status` enum('pending','terkirim','gagal') NOT NULL,
  `status_pay` varchar(256) NOT NULL DEFAULT 'belum_bayar',
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `blast`
--

INSERT INTO `blast` (`id`, `sender`, `type`, `tujuan`, `pesan`, `media`, `btn1`, `btn2`, `btn3`, `btnid1`, `btnid2`, `btnid3`, `footer`, `make_by`, `status`, `status_pay`, `created_at`) VALUES
(18, '6285155105056', 'Text', '0857-5561-0151', 'tes', '', '', '', '', '', '', '', '', 2, 'terkirim', 'belum_bayar', '2022-12-20 12:12:41'),
(19, '6285155105056', 'Text', '0857-3244-8430', 'tes', '', '', '', '', '', '', '', '', 2, 'terkirim', 'belum_bayar', '2022-12-20 12:12:41'),
(20, '6285155105056', 'Text', '085646909013', 'tes', '', '', '', '', '', '', '', '', 2, 'terkirim', 'belum_bayar', '2022-12-20 12:12:41');

-- --------------------------------------------------------

--
-- Table structure for table `broadcast`
--

CREATE TABLE `broadcast` (
  `id` int(11) NOT NULL,
  `pesan` longtext NOT NULL,
  `media` varchar(255) NOT NULL,
  `make_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `id` int(11) NOT NULL,
  `sender` varchar(111) NOT NULL,
  `number` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `type` enum('Personal','Group','','') NOT NULL,
  `make_by` varchar(33) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `device`
--

CREATE TABLE `device` (
  `id` int(11) NOT NULL,
  `pemilik` varchar(111) NOT NULL,
  `nomor` varchar(14) NOT NULL,
  `link_webhook` varchar(100) NOT NULL,
  `chunk` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `device`
--

INSERT INTO `device` (`id`, `pemilik`, `nomor`, `link_webhook`, `chunk`) VALUES
(6, '2', '6285155105056', '', 100);

-- --------------------------------------------------------

--
-- Table structure for table `nomor`
--

CREATE TABLE `nomor` (
  `id` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `nomor` varchar(255) NOT NULL,
  `label` varchar(225) NOT NULL,
  `make_by` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `nomor`
--

INSERT INTO `nomor` (`id`, `nama`, `nomor`, `label`, `make_by`) VALUES
(2, 'Muhammad Mufid', '0857-5561-0151', 'bmtnu', '1'),
(3, 'M. Shobirin', '0857-3244-8430', 'bmtnu', '1'),
(4, 'M. Imron Rosyadi', '085646909013', 'bmtnu', '1'),
(5, 'Muhammad Mufid', '0857-5561-0151', 'bmtnu', '2'),
(6, 'M. Shobirin', '0857-3244-8430', 'bmtnu', '2'),
(7, 'M. Imron Rosyadi', '085646909013', 'bmtnu', '2');

-- --------------------------------------------------------

--
-- Table structure for table `pesan`
--

CREATE TABLE `pesan` (
  `id` int(11) NOT NULL,
  `sender` varchar(15) NOT NULL,
  `type` enum('Text','Text & Media','Quick Reply Button','Url & Call Button','List Button') NOT NULL,
  `nomor` varchar(255) NOT NULL,
  `pesan` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `footer` varchar(225) NOT NULL,
  `btn1` varchar(255) NOT NULL,
  `btn2` varchar(255) NOT NULL,
  `btn3` varchar(255) NOT NULL,
  `btnid1` varchar(255) NOT NULL,
  `btnid2` varchar(255) NOT NULL,
  `btnid3` varchar(255) NOT NULL,
  `media` varchar(255) DEFAULT NULL,
  `status` enum('MENUNGGU JADWAL','GAGAL','TERKIRIM') NOT NULL DEFAULT 'MENUNGGU JADWAL',
  `jadwal` datetime NOT NULL,
  `make_by` varchar(255) DEFAULT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `status_pay` varchar(256) NOT NULL DEFAULT 'belum_bayar',
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pricelist`
--

CREATE TABLE `pricelist` (
  `id` int(11) NOT NULL,
  `nama` varchar(256) NOT NULL,
  `type` varchar(256) NOT NULL,
  `price` int(11) NOT NULL,
  `description` text NOT NULL,
  `limit_device` int(11) NOT NULL,
  `make_by` int(11) NOT NULL,
  `created_at` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pricelist`
--

INSERT INTO `pricelist` (`id`, `nama`, `type`, `price`, `description`, `limit_device`, `make_by`, `created_at`) VALUES
(1, 'Paket Standart (1 Bulan)', 'standart', 30000, 'Paket Standart (1 Bulan)', 1, 1, ''),
(2, 'Paket Reguler (6 Bulan)', 'reguler', 165000, 'Paket Reguler (6 Bulan)', 1, 1, '2022-12-19 15:12:54'),
(3, 'Paket Premium (1 Tahun)', 'premium', 300000, 'Paket Premium (1 Tahun)', 1, 1, '2022-12-19 15:12:20');

-- --------------------------------------------------------

--
-- Table structure for table `receive_chat`
--

CREATE TABLE `receive_chat` (
  `id` int(11) NOT NULL,
  `id_pesan` varchar(200) NOT NULL,
  `nomor` varchar(255) NOT NULL,
  `pesan` text NOT NULL,
  `from_me` enum('0','1') NOT NULL DEFAULT '0',
  `nomor_saya` varchar(255) DEFAULT NULL,
  `tanggal` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reports`
--

CREATE TABLE `reports` (
  `id` int(11) NOT NULL,
  `device` varchar(50) NOT NULL,
  `receiver` varchar(255) NOT NULL,
  `message` longtext CHARACTER SET utf16 COLLATE utf16_unicode_ci NOT NULL,
  `media` varchar(255) NOT NULL,
  `footer` varchar(255) NOT NULL,
  `btn1` varchar(255) NOT NULL,
  `btn2` varchar(255) NOT NULL,
  `btn3` varchar(255) NOT NULL,
  `btnid1` varchar(255) NOT NULL,
  `btnid2` varchar(255) NOT NULL,
  `btnid3` varchar(255) NOT NULL,
  `status` enum('Failed','Sent') NOT NULL,
  `type` enum('single','received','api') NOT NULL,
  `status_pay` varchar(256) NOT NULL DEFAULT 'belum_bayar',
  `created_at` datetime NOT NULL,
  `make_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `reports`
--

INSERT INTO `reports` (`id`, `device`, `receiver`, `message`, `media`, `footer`, `btn1`, `btn2`, `btn3`, `btnid1`, `btnid2`, `btnid3`, `status`, `type`, `status_pay`, `created_at`, `make_by`) VALUES
(27, '6285155105056', '+62 856-4690-9013', 'Test', '', '', '', '', '', '', '', '', 'Sent', 'single', 'belum_bayar', '2022-12-19 13:40:31', 2),
(28, '6285155105056', '+62 857-5561-0151', 'tes', '', '', '', '', '', '', '', '', 'Failed', 'single', 'belum_bayar', '2022-12-20 10:25:43', 0),
(29, '6285155105056', '6285755610151', 'tes', '', '', '', '', '', '', '', '', 'Failed', 'single', 'belum_bayar', '2022-12-20 10:25:57', 0),
(30, '6285155105056', '+62 857-5561-0151', 'tes', '', '', '', '', '', '', '', '', 'Failed', 'single', 'belum_bayar', '2022-12-20 10:27:16', 0),
(31, '6285155105056', '+62 856-4690-9013', 'tesss', '', '', '', '', '', '', '', '', 'Sent', 'single', 'belum_bayar', '2022-12-20 12:34:33', 2);

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(11) NOT NULL,
  `base_node` varchar(255) NOT NULL,
  `install_in` int(11) NOT NULL COMMENT '1 = HOSTING 2 = LOCAL'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `base_node`, `install_in`) VALUES
(1, 'http://localhost:3000', 2);

-- --------------------------------------------------------

--
-- Table structure for table `storage`
--

CREATE TABLE `storage` (
  `id` int(11) NOT NULL,
  `namafile` varchar(255) NOT NULL,
  `nama_original` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `storage`
--

INSERT INTO `storage` (`id`, `namafile`, `nama_original`) VALUES
(1, '3aacb19fbd468d02d65fd05df4ddfac7.jpg', 'Apa-itu-HTML.jpg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `all_contacts`
--
ALTER TABLE `all_contacts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `autoreply`
--
ALTER TABLE `autoreply`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blast`
--
ALTER TABLE `blast`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `broadcast`
--
ALTER TABLE `broadcast`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `device`
--
ALTER TABLE `device`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `nomor`
--
ALTER TABLE `nomor`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pesan`
--
ALTER TABLE `pesan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pricelist`
--
ALTER TABLE `pricelist`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `receive_chat`
--
ALTER TABLE `receive_chat`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reports`
--
ALTER TABLE `reports`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `storage`
--
ALTER TABLE `storage`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `account`
--
ALTER TABLE `account`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `all_contacts`
--
ALTER TABLE `all_contacts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=410;

--
-- AUTO_INCREMENT for table `autoreply`
--
ALTER TABLE `autoreply`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `blast`
--
ALTER TABLE `blast`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `broadcast`
--
ALTER TABLE `broadcast`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `device`
--
ALTER TABLE `device`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `nomor`
--
ALTER TABLE `nomor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `pesan`
--
ALTER TABLE `pesan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `pricelist`
--
ALTER TABLE `pricelist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `receive_chat`
--
ALTER TABLE `receive_chat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reports`
--
ALTER TABLE `reports`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `storage`
--
ALTER TABLE `storage`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
