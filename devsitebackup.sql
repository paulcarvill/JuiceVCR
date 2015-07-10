-- phpMyAdmin SQL Dump
-- version 4.3.8deb0.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jul 09, 2015 at 04:24 PM
-- Server version: 5.5.43-0ubuntu0.12.04.1
-- PHP Version: 5.5.26-1+deb.sury.org~precise+1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `foo`
--

-- --------------------------------------------------------

--
-- Table structure for table `craft_assetfiles`
--

CREATE TABLE IF NOT EXISTS `craft_assetfiles` (
  `id` int(11) NOT NULL,
  `sourceId` int(11) DEFAULT NULL,
  `folderId` int(11) NOT NULL,
  `filename` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `kind` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'unknown',
  `width` smallint(6) unsigned DEFAULT NULL,
  `height` smallint(6) unsigned DEFAULT NULL,
  `size` int(11) unsigned DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `craft_assetfiles`
--

INSERT INTO `craft_assetfiles` (`id`, `sourceId`, `folderId`, `filename`, `kind`, `width`, `height`, `size`, `dateModified`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(9, 1, 1, 'Screen-Shot-2015-06-22-at-12.48.57.png', 'image', 850, 425, 47934, '2015-06-25 15:37:37', '2015-06-25 15:37:37', '2015-06-25 15:37:37', '9af7a07a-1253-46d7-a4a6-8325c7ec8e90');

-- --------------------------------------------------------

--
-- Table structure for table `craft_assetfolders`
--

CREATE TABLE IF NOT EXISTS `craft_assetfolders` (
  `id` int(11) NOT NULL,
  `parentId` int(11) DEFAULT NULL,
  `sourceId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `craft_assetfolders`
--

INSERT INTO `craft_assetfolders` (`id`, `parentId`, `sourceId`, `name`, `path`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, NULL, 1, 'imgs', '', '2015-06-25 15:30:52', '2015-06-25 15:30:52', '040ef895-7995-4677-a5e5-9389f58a8e69');

-- --------------------------------------------------------

--
-- Table structure for table `craft_assetindexdata`
--

CREATE TABLE IF NOT EXISTS `craft_assetindexdata` (
  `id` int(11) NOT NULL,
  `sessionId` varchar(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `sourceId` int(10) NOT NULL,
  `offset` int(10) NOT NULL,
  `uri` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `size` int(10) DEFAULT NULL,
  `recordId` int(10) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `craft_assetsources`
--

CREATE TABLE IF NOT EXISTS `craft_assetsources` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `settings` text COLLATE utf8_unicode_ci,
  `sortOrder` tinyint(4) DEFAULT NULL,
  `fieldLayoutId` int(10) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `craft_assetsources`
--

INSERT INTO `craft_assetsources` (`id`, `name`, `handle`, `type`, `settings`, `sortOrder`, `fieldLayoutId`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 'imgs', 'imgs', 'Local', '{"path":"\\/vagrant\\/craft\\/storage\\/","url":"http:\\/\\/localhost:8080\\/images\\/"}', 1, 12, '2015-06-25 15:30:52', '2015-06-25 15:37:25', 'd55f6219-a1c9-44dd-9941-9b04a37bb3fa');

-- --------------------------------------------------------

--
-- Table structure for table `craft_assettransformindex`
--

CREATE TABLE IF NOT EXISTS `craft_assettransformindex` (
  `id` int(11) NOT NULL,
  `fileId` int(11) NOT NULL,
  `filename` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `format` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `location` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sourceId` int(11) DEFAULT NULL,
  `fileExists` tinyint(1) DEFAULT NULL,
  `inProgress` tinyint(1) DEFAULT NULL,
  `dateIndexed` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `craft_assettransforms`
--

CREATE TABLE IF NOT EXISTS `craft_assettransforms` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `mode` enum('stretch','fit','crop') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'crop',
  `position` enum('top-left','top-center','top-right','center-left','center-center','center-right','bottom-left','bottom-center','bottom-right') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'center-center',
  `height` int(10) DEFAULT NULL,
  `width` int(10) DEFAULT NULL,
  `format` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `quality` int(10) DEFAULT NULL,
  `dimensionChangeTime` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `craft_categories`
--

CREATE TABLE IF NOT EXISTS `craft_categories` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `craft_categorygroups`
--

CREATE TABLE IF NOT EXISTS `craft_categorygroups` (
  `id` int(11) NOT NULL,
  `structureId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `hasUrls` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `template` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `craft_categorygroups_i18n`
--

CREATE TABLE IF NOT EXISTS `craft_categorygroups_i18n` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `urlFormat` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nestedUrlFormat` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `craft_content`
--

CREATE TABLE IF NOT EXISTS `craft_content` (
  `id` int(11) NOT NULL,
  `elementId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `field_body` text COLLATE utf8_unicode_ci,
  `field_artist` text COLLATE utf8_unicode_ci,
  `field_label` text COLLATE utf8_unicode_ci,
  `field_trackTitle` text COLLATE utf8_unicode_ci,
  `field_publisher` text COLLATE utf8_unicode_ci,
  `field_album` text COLLATE utf8_unicode_ci,
  `field_videoUrl` text COLLATE utf8_unicode_ci,
  `field_videotype` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'video/youtube',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=371 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `craft_content`
--

INSERT INTO `craft_content` (`id`, `elementId`, `locale`, `title`, `field_body`, `field_artist`, `field_label`, `field_trackTitle`, `field_publisher`, `field_album`, `field_videoUrl`, `field_videotype`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 1, 'en_us', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2015-06-25 14:04:22', '2015-06-25 14:04:22', 'bb559f8e-86ed-421d-bd52-db4dc2d62c23'),
(2, 2, 'en_us', 'Welcome to Vagrant.local!', '<p>It’s true, this site doesn’t have a whole lot of content yet, but don’t worry. Our web developers have just installed the CMS, and they’re setting things up for the content editors this very moment. Soon Vagrant.local will be an oasis of fresh perspectives, sharp analyses, and astute opinions that will keep you coming back again and again.</p>', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2015-06-25 14:04:24', '2015-06-25 14:04:24', 'f795b108-9f67-4136-8be5-d26874f11330'),
(4, 4, 'en_us', 'About', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2015-06-25 14:29:31', '2015-06-25 14:29:31', 'be8516be-39ef-4b60-8ea6-f34cb274f910'),
(5, 5, 'en_us', 'Contact', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2015-06-25 14:29:40', '2015-06-25 14:29:40', 'f04e5518-5284-4d69-86c8-eca5480942ba'),
(7, 7, 'en_us', 'grime', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2015-06-25 15:11:58', '2015-06-25 15:11:58', '5797cb84-1210-4d40-b202-d7e07e589fd6'),
(8, 8, 'en_us', 'hot', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2015-06-25 15:12:05', '2015-06-25 15:12:05', '7cd7d16d-dcde-4620-b933-73951912dd89'),
(9, 9, 'en_us', 'Screen-Shot-2015-06-22-at-12.48.57', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2015-06-25 15:37:37', '2015-06-25 15:37:37', '5114a10a-29e2-4018-88b9-c1693e3217e4'),
(64, 64, 'en_us', 'Eyedress - Lies Tear Us Apart/When The Planets Align', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=xuImZfKmbE8', 'video/youtube', '2015-07-09 15:20:06', '2015-07-09 15:20:06', 'c39a6fa2-f2ad-4038-82fd-4b1b43e498a3'),
(65, 65, 'en_us', 'Private video', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=zsWWX_9UI6Q', 'video/youtube', '2015-07-09 15:20:06', '2015-07-09 15:20:06', 'd3b2aff2-cdd6-4a81-b034-aca9955c8438'),
(66, 66, 'en_us', 'Final Flash - Lord Rao + Cupp Cave + Herrmutt Lobby.', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=y38c1tbfBDc', 'video/youtube', '2015-07-09 15:20:06', '2015-07-09 15:20:06', 'aa1297de-75d7-4ef0-8678-bf2e4ca61962'),
(67, 67, 'en_us', 'ANOTHER ONE', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=gbg27oT8Z9M', 'video/youtube', '2015-07-09 15:20:06', '2015-07-09 15:20:06', 'fcf42cb5-8325-4ba2-806d-108198d070cc'),
(68, 68, 'en_us', 'DeeCee What You Know About (Music Video)', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=vyvrjas3rHA', 'video/youtube', '2015-07-09 15:20:06', '2015-07-09 15:20:06', '6b7efe56-a56b-48d9-ac74-df57f438da4b'),
(69, 69, 'en_us', 'DonMonique - You Ain''t Heard (Prod. by Ryan Scott) [OFFICIAL VIDEO]', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=GwYdHYFtd3U', 'video/youtube', '2015-07-09 15:20:06', '2015-07-09 15:20:06', '85246b1c-cb00-4ddb-b307-a2807b015487'),
(70, 70, 'en_us', 'Storm'' from my 4th solo album ''In A Low Light"', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=j4ngcp8nznE', 'video/youtube', '2015-07-09 15:20:06', '2015-07-09 15:20:06', '3e6d7768-5ab7-4898-bed4-998f1470d96a'),
(71, 71, 'en_us', 'Klein - Fake Frendz', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=1FkOovyeUWg', 'video/youtube', '2015-07-09 15:20:06', '2015-07-09 15:20:06', 'b0a79966-de6c-4efb-8b46-d0fe1fafdd32'),
(72, 72, 'en_us', 'Black Josh & Pete Cannon - Know About It OFFICIAL VIDEO', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=g4gGbU0qGLM', 'video/youtube', '2015-07-09 15:20:06', '2015-07-09 15:20:06', '2d64da58-582b-4e89-9b4e-22617270ab65'),
(73, 73, 'en_us', 'ESTE', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=H-HFGfwZJ0c', 'video/youtube', '2015-07-09 15:20:07', '2015-07-09 15:20:07', 'afe73aa7-6ead-4f7d-a095-caa23e2ddbfc'),
(74, 74, 'en_us', 'Bullion - Saysah! (official video)', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=qbCbrhqADsM', 'video/youtube', '2015-07-09 15:20:07', '2015-07-09 15:20:07', '4926524b-fb24-4b15-8f30-a1335a3d34ac'),
(75, 75, 'en_us', 'Amani Fela - Night Zoo (prod. jax)', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=sRuUeEQqsOY', 'video/youtube', '2015-07-09 15:20:07', '2015-07-09 15:20:07', 'd60c9b12-947f-4d24-9822-3830802cbd37'),
(76, 76, 'en_us', 'Beach Baby - No Mind No Money', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=-umRkWTZcco', 'video/youtube', '2015-07-09 15:20:07', '2015-07-09 15:20:07', '0c51cae5-88c9-4f69-99b1-686ab37c8805'),
(77, 77, 'en_us', 'Expressive feat BJ The Chicago Kid, Illa J, Rosewood 2055', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=r9eCOoQv7-g', 'video/youtube', '2015-07-09 15:20:07', '2015-07-09 15:20:07', 'f64f72b4-842c-4d86-9c47-99fea6a2467e'),
(78, 78, 'en_us', 'FIDLAR - 40oz. On Repeat', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=iJy8VgB83OQ', 'video/youtube', '2015-07-09 15:20:07', '2015-07-09 15:20:07', 'c5701aa5-122e-48b4-994a-6b1ae709026b'),
(79, 79, 'en_us', 'Omar Souleyman "Bahdeni Nami" (prod. by Four Tet)', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=Jlu1XyPexn8', 'video/youtube', '2015-07-09 15:20:07', '2015-07-09 15:20:07', 'd401ba47-c370-4dc7-aa91-9ddf5e8e4ff4'),
(80, 80, 'en_us', 'ANDERSON .PAAK "THE CITY" (OFFICIAL VIDEO)', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=k91GXps9MVI', 'video/youtube', '2015-07-09 15:20:07', '2015-07-09 15:20:07', 'de90dc99-240f-468d-a2df-feb8f705aace'),
(81, 81, 'en_us', 'Salomon Faye - Black Power', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=MX32paeph9Q', 'video/youtube', '2015-07-09 15:20:07', '2015-07-09 15:20:07', 'a6862eb5-977f-43be-b3b8-2dbb266ac953'),
(82, 82, 'en_us', 'bobby raps & corbin - welcome to the hell zone', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=93JC2M4_gPY', 'video/youtube', '2015-07-09 15:20:07', '2015-07-09 15:20:07', 'a7475b86-7e36-4936-89db-dde735813a71'),
(83, 83, 'en_us', 'Awate - Birthday', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=2WduYl9FE_U', 'video/youtube', '2015-07-09 15:20:07', '2015-07-09 15:20:07', 'ce82f910-8d5f-4bd0-abdc-bb19074bf5e9'),
(84, 84, 'en_us', 'KR - Play My Shit (Official Music Video)', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=P8NfpRzP5KE', 'video/youtube', '2015-07-09 15:20:07', '2015-07-09 15:20:07', '30c5d85d-2ee7-4bbe-b9f2-9556e31e46ec'),
(85, 85, 'en_us', 'JAWS - Bad Company', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=2iVf1jCTXTE', 'video/youtube', '2015-07-09 15:20:07', '2015-07-09 15:20:07', '2ab61079-2937-42c3-8c6e-27cda15903a1'),
(86, 86, 'en_us', 'Towkio - Reflection (prod. Kaytranada)', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=RPE5Ruj67Sg', 'video/youtube', '2015-07-09 15:20:07', '2015-07-09 15:20:07', 'af6ce41c-acd4-4f12-b522-ba547ad2ce21'),
(87, 87, 'en_us', 'Little Simz - Guess Who ft. Josh Arcé, Chuck20, and Tilla', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=GR76BXhuPrg', 'video/youtube', '2015-07-09 15:20:07', '2015-07-09 15:20:07', 'df3005fa-f2b5-4a87-a283-4444e5494ad0'),
(88, 88, 'en_us', 'Aldous RH - Seductive Atmospheres', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=d89TkcSIj6o', 'video/youtube', '2015-07-09 15:20:07', '2015-07-09 15:20:07', '5ca800b8-ea03-488d-b6b0-262118e7d0c6'),
(89, 89, 'en_us', 'JUICEBOXXX "WALKING IN MILWAUKEE" (OFFICIAL VIDEO)', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=oFBL9N04EnA', 'video/youtube', '2015-07-09 15:20:07', '2015-07-09 15:20:07', '10dd024e-ddea-4580-92a6-b4a65fc83643'),
(90, 90, 'en_us', 'Redrawing Taylor Swift - Shake it Off Rotoscoped', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=RhT_gVh_73w', 'video/youtube', '2015-07-09 15:20:07', '2015-07-09 15:20:07', '9df6c848-eb55-4498-8a72-65130b298aec'),
(91, 91, 'en_us', 'More fire crew- Oi', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=dTek4AdPkik', 'video/youtube', '2015-07-09 15:20:07', '2015-07-09 15:20:07', '7336af52-ed6b-4749-997d-b6473d348027'),
(92, 92, 'en_us', 'Tilapia - Jaguar', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=BF2o7wOPhcg', 'video/youtube', '2015-07-09 15:20:07', '2015-07-09 15:20:07', 'b537d680-7974-4473-aad5-23a243a9530c'),
(93, 93, 'en_us', 'Remy Banks - exhale.', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=BhSc_ijmECw', 'video/youtube', '2015-07-09 15:20:07', '2015-07-09 15:20:07', 'c618542f-272e-4125-842e-0d282e9a3143'),
(94, 94, 'en_us', 'Rone - Acid Reflux (binaural audio version optimized for headphones)', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=5tV37E7xie4', 'video/youtube', '2015-07-09 15:20:07', '2015-07-09 15:20:07', '6105b613-8620-4a84-bee2-312f632f3d7f'),
(95, 95, 'en_us', 'Run The Jewels - Early (Official Music Video from Run The Jewels 2)', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=pJJyKlRxyvA', 'video/youtube', '2015-07-09 15:20:07', '2015-07-09 15:20:07', '3cc75e2b-850d-4a0e-a0b6-997aee8a204c'),
(96, 96, 'en_us', 'Juice VCR | Ident 003', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=b2yyV8iNTTk', 'video/youtube', '2015-07-09 15:20:08', '2015-07-09 15:20:08', '31e3797e-87cc-45d3-95a7-05cb5bbdd085'),
(97, 97, 'en_us', 'Juice VCR | Ident 004', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=lo8iG8JyYMQ', 'video/youtube', '2015-07-09 15:20:08', '2015-07-09 15:20:08', 'c99b6bcb-f83d-45c9-bcb8-bf8a9baae019'),
(98, 98, 'en_us', 'Juice VCR | Ident 002', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=KSWqtKVPocI', 'video/youtube', '2015-07-09 15:20:08', '2015-07-09 15:20:08', 'a698853d-3b72-4089-bfb1-a2b3ac28c5be'),
(99, 99, 'en_us', 'Juice VCR | Ident 001', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=StI1yu-Xtkk', 'video/youtube', '2015-07-09 15:20:08', '2015-07-09 15:20:08', 'b069137e-4ad8-4512-a857-fce7a21d6d19'),
(100, 100, 'en_us', 'King Krule - The Noose of Jah City', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=Xi1_GYahCSs', 'video/youtube', '2015-07-09 15:20:08', '2015-07-09 15:20:08', '5de12139-ab1c-4ea0-b732-54ee894453bd'),
(101, 101, 'en_us', 'King Krule - A Lizard State (Official Video)', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=kpkr79srKTE', 'video/youtube', '2015-07-09 15:20:08', '2015-07-09 15:20:08', '41545204-7f07-4aeb-8524-7f699d763a73'),
(102, 102, 'en_us', 'King Krule — Rock Bottom [Official Video]', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=hvZJI8rerWA', 'video/youtube', '2015-07-09 15:20:08', '2015-07-09 15:20:08', '8cdfba4b-84e6-42b5-9ffa-c4c0b6bae548'),
(103, 103, 'en_us', 'Rejjie Snow - "Lost in Empathy" (Official Video)', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=o-3q0e-ZRsg', 'video/youtube', '2015-07-09 15:20:08', '2015-07-09 15:20:08', '8ae2a911-a1b3-478e-bc9b-9b50bb24ce35'),
(104, 104, 'en_us', 'BLACK PANCAKES', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=2JiDZSTO53w', 'video/youtube', '2015-07-09 15:20:08', '2015-07-09 15:20:08', '42f9fd89-fee2-42e5-ba6b-e704f627a01e'),
(105, 105, 'en_us', 'Rejjie Snow / Nights Over Georgia', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=rXCMBlhat3s', 'video/youtube', '2015-07-09 15:20:08', '2015-07-09 15:20:08', '29333be6-fd64-4712-be42-97ee91e2d65e'),
(106, 106, 'en_us', 'Cayucas - Will The Thrill (Official Video)', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=9Z9OkQrzw60', 'video/youtube', '2015-07-09 15:20:08', '2015-07-09 15:20:08', '68b9be52-5066-47eb-b66b-98646e7e79d2'),
(107, 107, 'en_us', '(VIDEO) Yung Simmie - Popeye FT Cashy', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=Ahq5D5mdyIE', 'video/youtube', '2015-07-09 15:20:08', '2015-07-09 15:20:08', '084983e1-25d5-46ee-8cee-6a1ae84a6122'),
(108, 108, 'en_us', 'Django Django - First Light (Official Video)', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=oACQyGiM9Lg', 'video/youtube', '2015-07-09 15:20:08', '2015-07-09 15:20:08', '93ad506f-d6b1-4971-89bf-97fc9054230f'),
(109, 109, 'en_us', 'Obey City - Waterbed ft Anthony Flammia (Official Video)', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=Cpo-FfQgjjc', 'video/youtube', '2015-07-09 15:20:08', '2015-07-09 15:20:08', '958383e6-e134-4ff7-85a2-2fd53accca9a'),
(110, 110, 'en_us', 'Dutch Uncles - Decided Knowledge', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=KESiOVOufm4', 'video/youtube', '2015-07-09 15:20:08', '2015-07-09 15:20:08', '2abe6263-11ed-49f3-8fb2-200baed4eef5'),
(111, 111, 'en_us', 'Mutual Attraction - Lost tape', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=jNMt5BV_7MY', 'video/youtube', '2015-07-09 15:20:08', '2015-07-09 15:20:08', 'f2a17d1a-3298-4445-b1ee-3e54f6c1547d'),
(112, 112, 'en_us', 'Stinkin Slumrok & Bisk - Catfish [Official Video]', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=tW3jeUUpCHg', 'video/youtube', '2015-07-09 15:20:08', '2015-07-09 15:20:08', '648e26e5-ff6e-4596-b8be-43f64a37af35'),
(113, 113, 'en_us', 'Palmbomen II - Carina Sayles [Official Video]', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=ebxfrJJ_S1k', 'video/youtube', '2015-07-09 15:20:08', '2015-07-09 15:20:08', 'be2c1e27-c9ee-4519-9034-9282ff8c2be5'),
(114, 114, 'en_us', 'Jam Baxter - Caravan (OFFICIAL VIDEO) (Prod. Chemo)', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=qrX1fun4zb4', 'video/youtube', '2015-07-09 15:20:08', '2015-07-09 15:20:08', 'bf9a6a7e-4be9-4794-9ec1-d2189ed36d48'),
(115, 115, 'en_us', 'Loyle Carner - BFG (Official Video)', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=w-ba3H_Sv6o', 'video/youtube', '2015-07-09 15:20:08', '2015-07-09 15:20:08', 'cec8db22-a007-4399-9c2c-edb937ac137f'),
(116, 116, 'en_us', 'Proxima — Trapped [Official Video]', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=mul1TqclutU', 'video/youtube', '2015-07-09 15:20:08', '2015-07-09 15:20:08', 'a9ff056a-d1b4-44a6-873b-32004835d2fb'),
(117, 117, 'en_us', 'BRONCHO - NC-17 [Official Music Video]', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=T0f5k9SgefI', 'video/youtube', '2015-07-09 15:20:08', '2015-07-09 15:20:08', '062b6606-3dd6-4ef4-86c5-e38e6fab5de5'),
(118, 118, 'en_us', 'Fort Romeau & New Jackson - Not A Word', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=pms-yrJdzcQ', 'video/youtube', '2015-07-09 15:20:09', '2015-07-09 15:20:09', '6354f376-fd39-4aac-8851-27e93370f704'),
(119, 119, 'en_us', 'Kano - Hail (Official Video)', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=46JvVR6jw1E', 'video/youtube', '2015-07-09 15:20:09', '2015-07-09 15:20:09', '86236f1f-87c6-46f4-917d-74335df19dcf'),
(120, 120, 'en_us', 'Yung Lean & Thaiboy Digital - Diamonds', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=KOFw2UPLdPk', 'video/youtube', '2015-07-09 15:20:09', '2015-07-09 15:20:09', '01e4966a-7721-4398-bf4c-a9f74e99d33a'),
(121, 121, 'en_us', 'D.R.A.M. - "Cha Cha" (Official Music Video)', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=jzMhcP7ab3k', 'video/youtube', '2015-07-09 15:20:09', '2015-07-09 15:20:09', 'efa4c5ca-32a1-4922-9ecb-f2fe81db3d0a'),
(122, 122, 'en_us', 'CASisDEAD - Nigella', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=fVRML2TfPy8', 'video/youtube', '2015-07-09 15:20:09', '2015-07-09 15:20:09', '3988a349-678c-4ff5-b547-a6e5f2555185'),
(123, 123, 'en_us', 'Marching Church "Hungry For Love" (Official Music Video)', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=lWWr3X_d5rU', 'video/youtube', '2015-07-09 15:20:09', '2015-07-09 15:20:09', 'ac2b806a-0d43-4797-b587-8615bfbe0a52'),
(124, 124, 'en_us', 'SIR E.U - Fireday (Official Music Video)', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=NzQnZX2l0T4', 'video/youtube', '2015-07-09 15:20:09', '2015-07-09 15:20:09', '66444602-7d10-441e-a4d8-c98464e3885e'),
(125, 125, 'en_us', 'LOS YUMAS ~LOS FOREIGN~ OFFICIAL VIDEO', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=wjNRk63XFdk', 'video/youtube', '2015-07-09 15:20:09', '2015-07-09 15:20:09', '98b2a4c2-b40a-43e2-824c-cbd93d51cbf3'),
(126, 126, 'en_us', 'Errors "Slow Rotor" - Official Music Video', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=j-F3_Me--a4', 'video/youtube', '2015-07-09 15:20:09', '2015-07-09 15:20:09', 'fd5addfc-4601-4160-9c52-275d4f14b1ee'),
(127, 127, 'en_us', 'DTA OFFICIAL VIDEO feat. SENDAWG & YT prod by DJ $ABREWATTS', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=jYbnc0f5jlA', 'video/youtube', '2015-07-09 15:20:09', '2015-07-09 15:20:09', '289ef798-c409-4e53-a222-1eb7cadf70ab'),
(128, 128, 'en_us', 'Sekuoia - Somewhere', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=caLcG23HIBA', 'video/youtube', '2015-07-09 15:20:09', '2015-07-09 15:20:09', '1f73dcf7-352d-45a3-b3d9-cbef50432929'),
(129, 129, 'en_us', 'YUNG - Nobody Cares', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=4gpu62Ps0B4', 'video/youtube', '2015-07-09 15:20:09', '2015-07-09 15:20:09', 'cb975b21-eeb1-4d2e-b6f7-ca34a03ddd6a'),
(130, 130, 'en_us', 'Nick Edward Harris / Trying To Be Silent (Official Video)', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=kC8JhRf-U60', 'video/youtube', '2015-07-09 15:20:09', '2015-07-09 15:20:09', 'b5f84d00-f3b9-43f2-9c4e-13d846d3a916'),
(131, 131, 'en_us', 'Elijah Bank$y // SAMO', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=Dfq1256osCA', 'video/youtube', '2015-07-09 15:20:09', '2015-07-09 15:20:09', '27014105-15a7-490f-a893-728ae03eff84'),
(132, 132, 'en_us', 'Flako - Kuku (Official Video) HD', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=hOamCSaPWoU', 'video/youtube', '2015-07-09 15:20:09', '2015-07-09 15:20:09', '79d02133-b24a-4a99-a2bd-0cdc15c6d28e'),
(133, 133, 'en_us', 'Kid Smpl - Ja (Official Video)', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=RvpxAbHwchA', 'video/youtube', '2015-07-09 15:20:09', '2015-07-09 15:20:09', '4e89fdf7-c84e-4857-9a32-708b5aeea865'),
(134, 134, 'en_us', 'DOOMTREE "Final Boss" (Official Music Video)', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=5PTHFL63sTQ', 'video/youtube', '2015-07-09 15:20:09', '2015-07-09 15:20:09', '2b338a01-1483-43b8-9279-d693e7faec0c'),
(135, 135, 'en_us', 'Shamz Le Roc - Bus Route', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=FPK2EJYBfHo', 'video/youtube', '2015-07-09 15:20:09', '2015-07-09 15:20:09', '712533af-74b8-406f-bd4c-c9a1a633e08c'),
(136, 136, 'en_us', 'Panes - Stills', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=-7A9213oZ5s', 'video/youtube', '2015-07-09 15:20:09', '2015-07-09 15:20:09', '48462d82-7d69-40de-9591-7eb37d81df45'),
(137, 137, 'en_us', 'Lee Scott & Black Josh - Skedaddle (prod by Baileys Brown) OFFICIAL VIDEO', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=oTgvyUQhvJ4', 'video/youtube', '2015-07-09 15:20:09', '2015-07-09 15:20:09', '86d9921e-0e49-4628-9a8a-cebeddf6cf32'),
(138, 138, 'en_us', 'Black Josh - Sky High ft Bill Shakes (prod by Reklews) OFFICIAL VIDEO', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=vktWBv3U4SM', 'video/youtube', '2015-07-09 15:20:09', '2015-07-09 15:20:09', 'c3e34c19-8832-4154-a54e-375dc9b5a2cc'),
(139, 139, 'en_us', 'Latrell James - The Button [Official Video]', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=b5TCEdMWDBc', 'video/youtube', '2015-07-09 15:20:09', '2015-07-09 15:20:09', '9a497689-c32a-453c-8611-dfb5271c3754'),
(140, 140, 'en_us', 'Bones - Sodium', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=OQTImQ0RQNg', 'video/youtube', '2015-07-09 15:20:09', '2015-07-09 15:20:09', '457b6042-9433-451f-8f7a-4557ed870e08'),
(141, 141, 'en_us', 'salute - Silver Tides (Official Video)', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=wohGKbLvZbo', 'video/youtube', '2015-07-09 15:20:10', '2015-07-09 15:20:10', 'f64af0b2-ad04-47a1-800a-daa0611d0363'),
(142, 142, 'en_us', 'Sleater-Kinney - A New Wave [OFFICIAL VIDEO]', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=Kc1htX3q-F0', 'video/youtube', '2015-07-09 15:20:10', '2015-07-09 15:20:10', '6a49f99b-4b0e-49a4-8170-ec4f57695cf2'),
(143, 143, 'en_us', 'Pussy Riot - I Can''t Breathe', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=dXctA2BqF9A', 'video/youtube', '2015-07-09 15:20:10', '2015-07-09 15:20:10', 'ea7a8b0a-450b-4256-8fc1-768e024ccd61'),
(144, 144, 'en_us', 'Man-Z - Coulda Told The Truth (Official Music Video)', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=cOEIV_cfNnc', 'video/youtube', '2015-07-09 15:20:10', '2015-07-09 15:20:10', '0a6dfa7d-0097-4c69-845b-ce0cdcc4ecf0'),
(145, 145, 'en_us', 'IM CRAZY (Official Music Video)', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=wCBYfTdi8Mk', 'video/youtube', '2015-07-09 15:20:10', '2015-07-09 15:20:10', 'd528c7ef-9aaa-442e-a892-53d93ce60684'),
(146, 146, 'en_us', 'JALALI SET - SURA TARGET (Official Music Video)', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=UWntf94yDyc', 'video/youtube', '2015-07-09 15:20:10', '2015-07-09 15:20:10', '7f899a13-ee39-4f5c-b945-b0bbd2a67d34'),
(147, 147, 'en_us', 'Onoe Caponoe - Horse In The Hill (Quadrant) (OFFICIAL VIDEO) (Prod. Chemo)', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=fQ0gt-HURWQ', 'video/youtube', '2015-07-09 15:20:10', '2015-07-09 15:20:10', '19899f17-b2cf-478c-adaf-81938eccbdff'),
(148, 148, 'en_us', 'AIR POP - INTELEXUAL', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=UrVG4Al2KqM', 'video/youtube', '2015-07-09 15:20:10', '2015-07-09 15:20:10', '2fa293b0-f90c-4f06-8a72-898894ba5640'),
(149, 149, 'en_us', 'Pyramid Quince - We Don''t Hear You (Prod. Dexter Dukarus)', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=9bVsHZyR_tQ', 'video/youtube', '2015-07-09 15:20:10', '2015-07-09 15:20:10', 'e4113e67-fdd2-4390-a13e-bd869821decf'),
(150, 150, 'en_us', 'Kelela - A Message (Official Video)', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=m4-9mYrbXVI', 'video/youtube', '2015-07-09 15:20:10', '2015-07-09 15:20:10', '84137ca5-f5df-4ca0-9dc6-4d39c6adc443'),
(151, 151, 'en_us', 'Azealia Banks - Wallace (Official)', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=NVmqIGerl7Q', 'video/youtube', '2015-07-09 15:20:10', '2015-07-09 15:20:10', '73e2a7f4-bb51-4c85-a2b0-2e9cb16ca862'),
(152, 152, 'en_us', 'Dr. Yen Lo - Day 3', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=yBTXOaGh8tU', 'video/youtube', '2015-07-09 15:20:10', '2015-07-09 15:20:10', '2fe629c3-64ed-4c15-ae69-a91f86b836a8'),
(153, 153, 'en_us', 'Holly Herndon - Interference [Official Video]', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=ybzSWlpgJOA', 'video/youtube', '2015-07-09 15:20:10', '2015-07-09 15:20:10', '8a716708-e660-40ff-971c-674302b08b5c'),
(154, 154, 'en_us', 'Subzy | All I See [Music Video]: SBTV', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=-p9WnMAa-Xk', 'video/youtube', '2015-07-09 15:20:10', '2015-07-09 15:20:10', '0bdec1a7-37df-4c6b-9e30-317288a1deb0'),
(155, 155, 'en_us', 'Filthy Funk | Burn ''Em Up [Music Video]: SBTV', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=1GNfa7ciL24', 'video/youtube', '2015-07-09 15:20:10', '2015-07-09 15:20:10', '6a2e45d3-2313-4109-a2e3-3d3c6a3afec5'),
(156, 156, 'en_us', 'Dizzee Rascal ft. Giggs - Nutcrackerz (Official Video)', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=tpY-DPB2NYk', 'video/youtube', '2015-07-09 15:20:10', '2015-07-09 15:20:10', '497d399c-c49c-4421-9b38-4b0e68547972'),
(157, 157, 'en_us', 'G L O G A N G - Chief Keef & Andy Milonakis Music Video', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=R5LM5I98lZg', 'video/youtube', '2015-07-09 15:20:10', '2015-07-09 15:20:10', '9c832fce-1b9a-40b3-a5e5-f69eeb479460'),
(158, 158, 'en_us', 'Jazz Cartier - New Religion', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=hzxQvfpmebA', 'video/youtube', '2015-07-09 15:20:10', '2015-07-09 15:20:10', '5161ba1f-18b2-484b-a644-29cc2f201882'),
(159, 159, 'en_us', 'Denzel Curry - Ultimate [Teaser] Prod. Ronny J', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=4q6-MXnjC5Y', 'video/youtube', '2015-07-09 15:20:10', '2015-07-09 15:20:10', '5cc8eed5-104e-4011-a621-ed1cfeda2cbf'),
(160, 160, 'en_us', 'Pictureplane - Hyper Real (Official Video)', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=Qa2mWplqebQ', 'video/youtube', '2015-07-09 15:20:10', '2015-07-09 15:20:10', '7dd1bdaa-ec5c-4e27-ad8f-04afc2c0c133'),
(161, 161, 'en_us', 'FKA twigs -­ Glass & Patron (Official Music Video­ YTMAs)', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=cNbFc-fa-ww', 'video/youtube', '2015-07-09 15:20:10', '2015-07-09 15:20:10', 'b62be0db-e1d9-49bc-8354-b2e567f393c3'),
(162, 162, 'en_us', 'MC Miliband X BBK- That''s Not Me', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=tce3sb_Bp74', 'video/youtube', '2015-07-09 15:20:10', '2015-07-09 15:20:10', 'ec750e1e-d625-4843-9586-ecada4950df8'),
(163, 163, 'en_us', 'DeJ Loaf "On MY Own" Video', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=f7J6KlL35e4', 'video/youtube', '2015-07-09 15:20:10', '2015-07-09 15:20:10', '2e508abc-98b2-4b87-9ab6-a66d8e989f19'),
(164, 164, 'en_us', 'Kindness - I''ll Be Back (Official Video)', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=7OsJ7Fg8hNk', 'video/youtube', '2015-07-09 15:20:11', '2015-07-09 15:20:11', '3f7e6b09-15eb-4242-8b16-ea75b32fa438'),
(165, 165, 'en_us', 'Uzzee | The Return [Music Video]: SBTV', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=6agm70qBVZk', 'video/youtube', '2015-07-09 15:20:11', '2015-07-09 15:20:11', '9c86a116-19ad-43c2-a5ef-0fedd666e651'),
(166, 166, 'en_us', 'CHAE BUTTUH - BITCH FROM THE SOUTH [PROMO]', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=HHn4ebfWLdk', 'video/youtube', '2015-07-09 15:20:11', '2015-07-09 15:20:11', 'cd7d377e-d28e-4866-babb-50eaeb65ae72'),
(167, 167, 'en_us', 'Azealia Banks - Ice Princess', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=xGox2wVCLuw', 'video/youtube', '2015-07-09 15:20:11', '2015-07-09 15:20:11', 'abb3e176-ece3-463a-b3f7-35d966afea0c'),
(168, 168, 'en_us', 'BOTZY - "Couldn''t Believe My Eyes"', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=K5u4CWZt2jc', 'video/youtube', '2015-07-09 15:20:11', '2015-07-09 15:20:11', '28217670-435f-4791-91f9-398870ebd6d3'),
(169, 169, 'en_us', 'Metronomy - The Upsetter (Official Video)', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=siHQVEStDlg', 'video/youtube', '2015-07-09 15:20:11', '2015-07-09 15:20:11', '75b6b8c3-1ce1-4b96-8a00-496d85d92962'),
(170, 170, 'en_us', 'BOTZY - "Flameburger"', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=jd13OsxfqCo', 'video/youtube', '2015-07-09 15:20:11', '2015-07-09 15:20:11', 'ec00c9db-11d7-42cb-87e3-c482dfc2dcb1'),
(171, 171, 'en_us', 'Death Grips - I Break Mirrors With My Face in The United States', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=pwSvL08isHo', 'video/youtube', '2015-07-09 15:20:11', '2015-07-09 15:20:11', '7a7db4ca-7122-4014-83c7-76e6909ee1c4'),
(172, 172, 'en_us', 'GypjaQ feat. Azealia Banks - "Blown Away" (Official Video)', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=DwY7WM3p0u0', 'video/youtube', '2015-07-09 15:20:11', '2015-07-09 15:20:11', '50ec832b-f7ee-4f75-99ce-7a5505eb387d'),
(173, 173, 'en_us', 'Towkio - Free Your Mind ft Donnie Trumpet (prod. Cam Obi & The Social Experiment)', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=HnMR1JpxwXo', 'video/youtube', '2015-07-09 15:20:11', '2015-07-09 15:20:11', '53944615-5dad-4149-8551-3f0239c790e6'),
(174, 174, 'en_us', 'JME - WORK', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=_89IW1D8Wmw', 'video/youtube', '2015-07-09 15:20:11', '2015-07-09 15:20:11', '13dd0912-e749-4473-8f22-2b24f38000f2'),
(175, 175, 'en_us', 'Fliptrix - Jeheeze (OFFICIAL VIDEO) (Prod. Molotov)', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=jZ0nUJrZfrI', 'video/youtube', '2015-07-09 15:20:11', '2015-07-09 15:20:11', '612bf8f6-108d-496e-b7e2-1a71fdad6e08'),
(176, 176, 'en_us', 'björk: lionsong', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=MWHpoJT3qK4', 'video/youtube', '2015-07-09 15:20:11', '2015-07-09 15:20:11', '517613cb-145a-4ffd-a37d-447099816aaa'),
(177, 177, 'en_us', 'Whistlejacket - Mr Melon', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=JOj0JjcdCO4', 'video/youtube', '2015-07-09 15:20:11', '2015-07-09 15:20:11', 'f201fc6e-c62d-466d-936b-0a7dcd6cb7cb'),
(178, 178, 'en_us', 'JME - INTEGRITY', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=TwHsg2XO--c', 'video/youtube', '2015-07-09 15:20:11', '2015-07-09 15:20:11', '33bd2340-2574-4a48-9a48-cb57a15481c6'),
(179, 179, 'en_us', 'Låpsley - Brownlow', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=0mmyPnF7Fo0', 'video/youtube', '2015-07-09 15:20:11', '2015-07-09 15:20:11', '09d18c81-3ea0-4c8e-a1e7-44205f8b1329'),
(180, 180, 'en_us', 'Eskmo: "Mind of War" (Official Video)', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=NBlCM9gSqGg', 'video/youtube', '2015-07-09 15:20:11', '2015-07-09 15:20:11', 'd9fc413c-d962-4d42-9c07-91534d32f272'),
(181, 181, 'en_us', 'Grimes - REALiTi', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=N9XKLqGqwLA', 'video/youtube', '2015-07-09 15:20:11', '2015-07-09 15:20:11', '04337e90-4d03-4cd5-999b-8044d7e0fe39'),
(182, 182, 'en_us', 'Jme - Taking Over? (It Ain''t Working)', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=Bsd285VkB2E', 'video/youtube', '2015-07-09 15:20:11', '2015-07-09 15:20:11', 'eed2ad42-f67c-461a-aaad-11dc0b18d8ed'),
(183, 183, 'en_us', 'WHEN DID YOUR LAST ROSE DIE?', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=0w1HvZjYVJo', 'video/youtube', '2015-07-09 15:20:11', '2015-07-09 15:20:11', '4a467634-eb2d-4d75-acb5-0a35c21e18e4'),
(184, 184, 'en_us', 'Skepta - All Over The House (Official Unsensored Video)', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=GL3iIpT2EGE', 'video/youtube', '2015-07-09 15:20:11', '2015-07-09 15:20:11', '84e5143f-720d-4fc8-9830-06a67c859207'),
(185, 185, 'en_us', 'Shlohmo - "Beams"', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=MHMcrfXxlDM', 'video/youtube', '2015-07-09 15:20:11', '2015-07-09 15:20:11', '24140af0-d494-4fc2-b6db-0091ec1c304d'),
(186, 186, 'en_us', 'björk: family (moving album cover)', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=HAXvkbOzK6E', 'video/youtube', '2015-07-09 15:20:11', '2015-07-09 15:20:11', 'b59b927a-b664-4ae5-a7a9-1817f97b61c4'),
(187, 187, 'en_us', 'James Pants - Broth', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=KAUyPTDFO9Y', 'video/youtube', '2015-07-09 15:20:12', '2015-07-09 15:20:12', '5d9b2dd8-8960-408f-acec-bf4f582bbca2'),
(188, 188, 'en_us', 'Subzy - Music For Your Soul Ft. Chany & Jungle VIP (Official Music Video)', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=MRSbsowhN94', 'video/youtube', '2015-07-09 15:20:12', '2015-07-09 15:20:12', '8f15269e-59ef-4ada-82e2-f6664f2f847f'),
(189, 189, 'en_us', 'Death Grips - On GP', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=cinJDxLUsNY', 'video/youtube', '2015-07-09 15:20:12', '2015-07-09 15:20:12', '425743c2-597c-4103-b1c5-4a893508f2f6'),
(190, 190, 'en_us', 'Ghostpoet - X Marks The Spot feat. Nadine Shah (Official Video) #Openshoot', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=0OmtRTqeW2s', 'video/youtube', '2015-07-09 15:20:12', '2015-07-09 15:20:12', '3d2ab74d-f24b-454b-b35e-fa8f1aed82d0'),
(191, 191, 'en_us', 'of Montreal - Bassem Sabry [OFFICIAL MUSIC VIDEO]', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=eeLLjJFNKSI', 'video/youtube', '2015-07-09 15:20:12', '2015-07-09 15:20:12', '974d82d4-f8ef-4517-8284-8936f5e61385'),
(192, 192, 'en_us', 'STORMZY [@STORMZY1] - KNOW ME FROM', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=PxbzujA69DA', 'video/youtube', '2015-07-09 15:20:12', '2015-07-09 15:20:12', 'ad29eb70-9db9-435f-ba27-3d818717c93e'),
(193, 193, 'en_us', 'Devonté Hynes and Neneh Cherry - He She Me', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=_9rPiexwJJA', 'video/youtube', '2015-07-09 15:20:12', '2015-07-09 15:20:12', '0016a61c-3391-4cf9-ab8a-0a2a1aecb193'),
(194, 194, 'en_us', 'Yung Simmie - iLL As Fuk (VIDEO)', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=cR9HlzpUXyM', 'video/youtube', '2015-07-09 15:20:12', '2015-07-09 15:20:12', '7563a3aa-0ea6-4c6a-8dc7-848205ecf0b1'),
(195, 195, 'en_us', 'KOOSH OFFICIAL VIDEO feat. SENDAWG + YT', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=zsW28Hve4JU', 'video/youtube', '2015-07-09 15:20:12', '2015-07-09 15:20:12', 'a28e40c0-c7e8-41ec-8528-4660720e84e4'),
(196, 196, 'en_us', 'Dressin Red - Our Love (Official Video)', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=rbOuurlIP2U', 'video/youtube', '2015-07-09 15:20:12', '2015-07-09 15:20:12', 'a68fa3cf-b2d2-40d0-80f7-2ad46c2b8bf1'),
(197, 197, 'en_us', 'TYGAPAW- Keep On', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=25sPTjYN_Bk', 'video/youtube', '2015-07-09 15:20:12', '2015-07-09 15:20:12', 'de1d6717-b580-4c96-ba8d-1f4e1f47067d'),
(198, 198, 'en_us', 'Tee Vish & Jenna G - Don''t Hold Back (Official Video)', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=ue6LPGZkyqo', 'video/youtube', '2015-07-09 15:20:12', '2015-07-09 15:20:12', '57c2e247-f3bf-46a6-89e2-727f93b68ca4'),
(199, 199, 'en_us', 'Alone Now (Official Music Video) - Zebra Katz', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=RRqluZ_5eeA', 'video/youtube', '2015-07-09 15:20:12', '2015-07-09 15:20:12', '8e1cb83f-8e20-46d2-a905-2a238fd409c8'),
(200, 200, 'en_us', 'Sam Binga - Tek Nuh Chat - ft. Redders (Official Video)', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=MXEQws-jGMI', 'video/youtube', '2015-07-09 15:20:12', '2015-07-09 15:20:12', 'c6ee3c8f-c722-44c7-a37f-7d04c9612bdd'),
(201, 201, 'en_us', 'YOUNG GIRLS - PRINCESS NOKIA', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=9PqPukvQgTk', 'video/youtube', '2015-07-09 15:20:12', '2015-07-09 15:20:12', '2987e149-68ca-4821-afcb-781c862fba63'),
(202, 202, 'en_us', 'FKA twigs - Two Weeks', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=3yDP9MKVhZc', 'video/youtube', '2015-07-09 15:20:12', '2015-07-09 15:20:12', '81d1c9c2-4fee-4e6e-9508-ca1b53a199c7'),
(203, 203, 'en_us', 'FKA twigs - Pendulum', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=O8yix8PZKlw', 'video/youtube', '2015-07-09 15:20:12', '2015-07-09 15:20:12', '86bb75c3-9b5f-4107-a32a-c98e0736dc30'),
(204, 204, 'en_us', 'Show Me the Body - "One Train" (Official Video)', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=5S7NY-q1_cc', 'video/youtube', '2015-07-09 15:20:12', '2015-07-09 15:20:12', '54cc6f86-d9a1-42a9-9e67-5e6eb05f69b6'),
(205, 205, 'en_us', 'Salomon Faye - Luv (Feat. Raveena) Official Music Video', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=NU36Rz3Ui1U', 'video/youtube', '2015-07-09 15:20:12', '2015-07-09 15:20:12', 'e3feb9b3-4f72-41f4-b32c-7dad72ec634d'),
(206, 206, 'en_us', 'Loyle Carner - October Ft. Kiko Bun (Official Video)', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=6LwBZnxqeEg', 'video/youtube', '2015-07-09 15:20:12', '2015-07-09 15:20:12', '74152517-44f2-464d-8980-7b7d38d69c01'),
(207, 207, 'en_us', 'TOPS - "Outside" (Official Video)', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=6t-zUa0UaW0', 'video/youtube', '2015-07-09 15:20:12', '2015-07-09 15:20:12', '6895b37b-dc79-44bb-8ec8-910622b808d3'),
(208, 208, 'en_us', 'Oscar - Sometimes', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=XY6cTtEcxXw', 'video/youtube', '2015-07-09 15:20:12', '2015-07-09 15:20:12', '92323a7d-5275-44cc-849a-99f8fc4ec6db'),
(209, 209, 'en_us', 'Sean Nicholas Savage - Spotted Brown', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=0HsdHnWYU9I', 'video/youtube', '2015-07-09 15:20:12', '2015-07-09 15:20:12', '3024d0c7-e997-4f73-a0b2-53ab8414bc1d'),
(210, 210, 'en_us', 'ANTWON // 3RD WORLD GRRL MUSIC VIDEO', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=fM8TvwsgOxM', 'video/youtube', '2015-07-09 15:20:13', '2015-07-09 15:20:13', 'c95778cd-c9d9-448a-a314-8b4b8c982e18'),
(211, 211, 'en_us', 'Sean Nicholas Savage - Empire (official video)', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=KBll4N6tYcE', 'video/youtube', '2015-07-09 15:20:13', '2015-07-09 15:20:13', 'd4170024-9df5-43ba-966d-4abfe59017ff'),
(212, 212, 'en_us', 'Poison Ivory - Mr. Wonderful', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=Tcad8fQcLRM', 'video/youtube', '2015-07-09 15:20:13', '2015-07-09 15:20:13', 'a0709d0c-c2c8-46ff-8ca1-6adb0c103904'),
(213, 213, 'en_us', 'Denzel Curry - Zone 3 (OFFICIAL VIDEO)', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=vQBBLRCQV0w', 'video/youtube', '2015-07-09 15:20:13', '2015-07-09 15:20:13', '499a4b3a-dda5-4f60-b686-ae31fef6d426'),
(214, 214, 'en_us', 'Phresh James - Indigo', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=NWg51-ERYWE', 'video/youtube', '2015-07-09 15:20:13', '2015-07-09 15:20:13', '41143a3f-f56c-4f0d-acdc-6260ce812e3f'),
(215, 215, 'en_us', 'Robb Bank$ - "Ice Cold" [Official Video]', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=7VoXGd44FNE', 'video/youtube', '2015-07-09 15:20:13', '2015-07-09 15:20:13', 'fd265f69-f1e5-4647-a4dc-b1f31c36d0ea'),
(216, 216, 'en_us', 'Cakes Da Killa - Living Gud, Eating Gud', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=t6vTseV83EQ', 'video/youtube', '2015-07-09 15:20:13', '2015-07-09 15:20:13', '8262ac9f-37ff-4458-9643-550889418a23'),
(217, 217, 'en_us', 'JUNGLEPUSSY - NAH', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=AtwVdabW0GE', 'video/youtube', '2015-07-09 15:20:13', '2015-07-09 15:20:13', '66b0e9fa-2ac5-491d-ac84-c4f350be5aa3'),
(218, 218, 'en_us', 'Death Grips - Inanimate Sensation', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=r5GCn1BKkxg', 'video/youtube', '2015-07-09 15:20:13', '2015-07-09 15:20:13', '8be14c61-d911-483c-8dac-4c46b8cedf23'),
(219, 219, 'en_us', 'TRASH TALK - THE HOLE', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=Ud1S25WXN9I', 'video/youtube', '2015-07-09 15:20:13', '2015-07-09 15:20:13', '5e6920d7-0ac2-4982-a541-6c8384c14d99'),
(220, 220, 'en_us', 'Girlpool - Plants And Worms (Official Video)', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=OEM2D-BnvM8', 'video/youtube', '2015-07-09 15:20:13', '2015-07-09 15:20:13', 'f6b1eb9e-c456-44f7-9a2e-644e01598913'),
(221, 221, 'en_us', 'Silk Rhodes - Pains', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=SoxbvE1Doog', 'video/youtube', '2015-07-09 15:20:13', '2015-07-09 15:20:13', '8a171958-5023-450a-9244-36bf0a2dac6c'),
(222, 222, 'en_us', 'Pyramid Vritra - Palace (Official video)', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=vNy_7tXTgVc', 'video/youtube', '2015-07-09 15:20:13', '2015-07-09 15:20:13', '70992b3d-8ea3-452d-92c8-74b4ce58a6de'),
(223, 223, 'en_us', 'BADBADNOTGOOD & Ghostface Killah - Ray Gun ft. DOOM (Official Video)', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=6YW_RqTuZMw', 'video/youtube', '2015-07-09 15:20:13', '2015-07-09 15:20:13', '9ecc6bf5-a21c-4216-93d8-af2282c4df74'),
(224, 224, 'en_us', 'Run the Jewels - "Lie, Cheat, Steal" (Official Video)', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=BEOximWoFd0', 'video/youtube', '2015-07-09 15:20:13', '2015-07-09 15:20:13', 'd4355308-faa2-44c2-afc3-c6ed15114c65'),
(225, 225, 'en_us', 'Young Thug, Freddie Gibbs & A$AP Ferg - Old English', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=6OpdjbzTIhM', 'video/youtube', '2015-07-09 15:20:13', '2015-07-09 15:20:13', '23f9379d-1a75-4061-a463-c1462d26d52c'),
(226, 226, 'en_us', 'Girlpool - Chinatown (Official Video)', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=9h4CTdIhDF0', 'video/youtube', '2015-07-09 15:20:13', '2015-07-09 15:20:13', '13a0e43b-edc1-4e4e-b471-0653510acc0a'),
(227, 227, 'en_us', 'RiiahWORLD - Rinse & Repeat', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=DDRxCzKjagA', 'video/youtube', '2015-07-09 15:20:13', '2015-07-09 15:20:13', '28503fc6-706e-479a-937d-6261030e97b7'),
(228, 228, 'en_us', 'TheKidd EP FT El Caetano - Coca-Hiena (Music Video)', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=xX4u7LDp-jg', 'video/youtube', '2015-07-09 15:20:13', '2015-07-09 15:20:13', 'e0fb0fb6-19d3-4cfe-83d8-3265541867d0'),
(229, 229, 'en_us', 'ANTWON - METRO NOME (FEATURING WIKI)', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=5IP4BFBFvgo', 'video/youtube', '2015-07-09 15:20:13', '2015-07-09 15:20:13', '90abda64-8913-4fd2-83db-7a075e5b14f3'),
(230, 230, 'en_us', 'Antwon - Don''t Care', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=-JtTrd_Xaj0', 'video/youtube', '2015-07-09 15:20:13', '2015-07-09 15:20:13', '9700f425-4397-4631-a6bc-d3326d247b9c'),
(231, 231, 'en_us', 'RATKING - Snow Beach', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=ihextXXsLew', 'video/youtube', '2015-07-09 15:20:13', '2015-07-09 15:20:13', '72087b43-f986-4680-9760-37df7d0786f6'),
(232, 232, 'en_us', 'Flying Lotus - Coronus, The Terminator', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=Ak4vLEBxIo4', 'video/youtube', '2015-07-09 15:20:13', '2015-07-09 15:20:13', '4538a606-b93f-45fe-9dd8-fd16e4ec0af6'),
(233, 233, 'en_us', 'RATKING - So It Goes', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=Yzdb4gEaF6E', 'video/youtube', '2015-07-09 15:20:14', '2015-07-09 15:20:14', 'ffc462b5-674c-44fa-8735-4b24026f822f'),
(234, 234, 'en_us', 'spooky black - dj khaled is my father', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=Cmjl7s-KliY', 'video/youtube', '2015-07-09 15:20:14', '2015-07-09 15:20:14', 'dee2e092-8e8c-4987-a96b-ba8edb2342d7'),
(235, 235, 'en_us', 'Mndsgn - Camelblues', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=h_ZKRFxxFU0', 'video/youtube', '2015-07-09 15:20:14', '2015-07-09 15:20:14', 'be766ab5-96e9-46a2-96e9-0a60ee546c14'),
(236, 236, 'en_us', 'Pyramid Vritra - Like Summer', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=LPhA3yucb-E', 'video/youtube', '2015-07-09 15:20:14', '2015-07-09 15:20:14', 'cff286ba-56cd-4843-85a0-09dcfcc95833'),
(237, 237, 'en_us', 'Heavy Metal And Reflective (Official Music Video) - Azealia Banks', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=nQOD8M6Okoc', 'video/youtube', '2015-07-09 15:20:14', '2015-07-09 15:20:14', '88d03dbe-d384-4245-aaca-5e9a38887c6b'),
(238, 238, 'en_us', 'spooky black - reason', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=im9UzhOxVlI', 'video/youtube', '2015-07-09 15:20:14', '2015-07-09 15:20:14', '537599ca-7b49-40d4-9f23-40c6857343f0'),
(239, 239, 'en_us', 'Azealia Banks - Chasing Time (Official)', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=jtTjzDTpx8o', 'video/youtube', '2015-07-09 15:20:14', '2015-07-09 15:20:14', 'a15a8ebc-b605-47c5-b3e1-6496c2aeb76b'),
(240, 240, 'en_us', 'ANTWON // HANDSOME MUSIC VIDEO', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=0hFLziSdH4M', 'video/youtube', '2015-07-09 15:20:14', '2015-07-09 15:20:14', '584075fc-982b-487c-a879-35d14b80d832'),
(241, 241, 'en_us', 'Little Simz - Intervention', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=n69dxQ3djsE', 'video/youtube', '2015-07-09 15:20:14', '2015-07-09 15:20:14', '3b111587-43a4-4ec4-b4d8-0b8f0117c3c7'),
(242, 242, 'en_us', 'Moon Duo "Animal" featuring Richie Jackson (Official Music Video)', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=gFhKRt5g7LU', 'video/youtube', '2015-07-09 15:20:14', '2015-07-09 15:20:14', 'f6628e44-6ad4-4377-a91f-c9dafab3cfec'),
(243, 243, 'en_us', 'Twerps "Stranger"', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=07sS7HORWFw', 'video/youtube', '2015-07-09 15:20:14', '2015-07-09 15:20:14', 'edf4b98b-05a9-43db-9a62-eef97a2827e2'),
(244, 244, 'en_us', 'Jungle - Julia', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=A0HFtcCRVNc', 'video/youtube', '2015-07-09 15:20:14', '2015-07-09 15:20:14', '00443c33-2462-4d68-ad4e-c17692488d74'),
(245, 245, 'en_us', 'Shinobi Ninja - Saw Red (Official)', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=sIIz3Q4N3lU', 'video/youtube', '2015-07-09 15:20:14', '2015-07-09 15:20:14', '382e0fa6-7bd5-4106-8bbb-fd5bfe552412'),
(246, 246, 'en_us', 'Clarence Clarity - Meadow Hopping, Traffic Stopping, Death Splash', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=0qyUTmMFYS4', 'video/youtube', '2015-07-09 15:20:14', '2015-07-09 15:20:14', '2cc22609-8b4b-4067-b56a-9f406cb73c12'),
(247, 247, 'en_us', 'Via Rosa "One More"', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=KRZebY0ytAU', 'video/youtube', '2015-07-09 15:20:14', '2015-07-09 15:20:14', '36b88c56-2928-47a4-871c-a1595ca14e94'),
(248, 248, 'en_us', 'Bones - HDMI', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=5souw4K5UQc', 'video/youtube', '2015-07-09 15:20:14', '2015-07-09 15:20:14', 'faca201e-5335-4cba-b254-fad4946900de'),
(249, 249, 'en_us', 'BIG MOMMA - DENTATA (OFFICIAL VIDEO)', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=YiTlYkyVe9g', 'video/youtube', '2015-07-09 15:20:14', '2015-07-09 15:20:14', '637cef3a-0968-4b16-b787-1a8548334c2d'),
(250, 250, 'en_us', 'Gang of Four feat. Alison Mosshart - "England’s in My Bones" (Official Video)', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=zwFHiSRc19E', 'video/youtube', '2015-07-09 15:20:14', '2015-07-09 15:20:14', '560f4dc8-9e8b-45ec-bbc0-f8f8d407c4ee'),
(251, 251, 'en_us', 'Suicide Slide - Black Shapes', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=b-sI8fFj5yI', 'video/youtube', '2015-07-09 15:20:14', '2015-07-09 15:20:14', 'a4ac5ba7-4f98-4b0c-b0a3-8d1ddc66fa64'),
(252, 252, 'en_us', 'Shlohmo - "Buried"', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=mVR10CD2Alk', 'video/youtube', '2015-07-09 15:20:14', '2015-07-09 15:20:14', '6c4a6c40-9ff9-4229-b311-c9dbefef7473'),
(253, 253, 'en_us', 'East India Youth - CAROUSEL', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=BW3NFKJj5ts', 'video/youtube', '2015-07-09 15:20:14', '2015-07-09 15:20:14', '585b21c3-9bcc-4c2a-99ee-d6af413db402'),
(254, 254, 'en_us', 'The Four Owls - Think Twice (Prod. DJ Premier) (OFFICIAL VIDEO)', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=JYOYqn4No1w', 'video/youtube', '2015-07-09 15:20:14', '2015-07-09 15:20:14', '7a58a2a1-bae8-4436-a30e-816d776c59e2'),
(255, 255, 'en_us', 'SENDAWG - SEN-RUNNER - BURNING IN HELL (OFFICIAL VIDEO)', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=hn0_c7V7PMg', 'video/youtube', '2015-07-09 15:20:15', '2015-07-09 15:20:15', 'd6967261-0b0f-4eb4-9453-a645d38481e2'),
(256, 256, 'en_us', 'Chevron - Shimoda', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=wye11fIOS9c', 'video/youtube', '2015-07-09 15:20:15', '2015-07-09 15:20:15', '38689671-0d07-48f7-b998-60490da0335c'),
(257, 257, 'en_us', 'Rome Fortune - "OneDay" (Official Video) [Prod by CitoOnTheBeat & Richard Adderley]', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=pPsIDfpCEyM', 'video/youtube', '2015-07-09 15:20:15', '2015-07-09 15:20:15', '8c894f10-8c4c-45d1-8b58-92751a67dfdb'),
(258, 258, 'en_us', 'RASKLz - superDUPER (Official Music Video)', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=S6n-_Fc5QX4', 'video/youtube', '2015-07-09 15:20:15', '2015-07-09 15:20:15', '91ac0b18-96ec-4be9-990b-799d2d02f115'),
(259, 259, 'en_us', 'Keith Ape - 잊지마 (It G Ma) (feat. JayAllDay, Loota, Okasian & Kohh) [Official Music Video]', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=DPC9erC5WqU', 'video/youtube', '2015-07-09 15:20:15', '2015-07-09 15:20:15', '48ec8503-eb87-4dd3-85e1-6e0920390304');
INSERT INTO `craft_content` (`id`, `elementId`, `locale`, `title`, `field_body`, `field_artist`, `field_label`, `field_trackTitle`, `field_publisher`, `field_album`, `field_videoUrl`, `field_videotype`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(260, 260, 'en_us', 'JGRXXN - Get Buck (Official Video)', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=dKuQmtp7Umk', 'video/youtube', '2015-07-09 15:20:15', '2015-07-09 15:20:15', 'fcd5cecc-5b05-4398-aefc-2ac7cb817f64'),
(261, 261, 'en_us', 'Pedestrian At Best - Courtney Barnett', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=o-nr1nNC3ds', 'video/youtube', '2015-07-09 15:20:15', '2015-07-09 15:20:15', '31e350ad-a601-404a-9519-c73849b7d628'),
(262, 262, 'en_us', 'Viet Cong - "Silhouettes" (Official Video)', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=zW1kP99mok4', 'video/youtube', '2015-07-09 15:20:15', '2015-07-09 15:20:15', '78c8f9c9-8325-4850-97ef-a4196ecc1a9c'),
(263, 263, 'en_us', 'BATTY BOYS "JUST A TASTE" (TZ023)', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=GTSMQjzGDIg', 'video/youtube', '2015-07-09 15:20:15', '2015-07-09 15:20:15', 'a3574d1d-ba74-4261-8a0f-54652794ca1d'),
(264, 264, 'en_us', 'JUICEBOXXX "BACK SEAT" (CRAZY FACIAL HAIR WOAH)', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=JDRIjRYvbRI', 'video/youtube', '2015-07-09 15:20:15', '2015-07-09 15:20:15', 'befc3eb2-dc73-4921-8f06-c9a0ba9d68ab'),
(265, 265, 'en_us', 'Lxury - Square 1 feat. Deptford Goth (Official Video)', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=_U389fISBXg', 'video/youtube', '2015-07-09 15:20:15', '2015-07-09 15:20:15', '466f4185-e40f-4b2a-9a4e-109911dc2938'),
(266, 266, 'en_us', 'Ibeyi - Mama Says (Official Video)', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=88U_dMhhfNI', 'video/youtube', '2015-07-09 15:20:15', '2015-07-09 15:20:15', '9103f732-7289-4781-837e-bed6d102770a'),
(267, 267, 'en_us', 'annelia anderson - pour une infante défunte', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=LDuf6_-CzEQ', 'video/youtube', '2015-07-09 15:20:15', '2015-07-09 15:20:15', '6bd35105-29e2-431e-8a7a-3319173d4ccd'),
(268, 268, 'en_us', 'BATTY BOYS "HONEY" (TZ023)', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=nkpFk9knl08', 'video/youtube', '2015-07-09 15:20:15', '2015-07-09 15:20:15', '5a8f2d11-3acc-4e8f-952e-7954d1854789'),
(269, 269, 'en_us', 'Kill Frenzy - All Night Long [Official Video]', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=Y37d3Aiq4OA', 'video/youtube', '2015-07-09 15:20:15', '2015-07-09 15:20:15', '94eb7a8a-0b60-4fb4-aa5b-f6005b956156'),
(270, 270, 'en_us', 'ANTWON // GET OUT MY FACE', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=fMHP-1I9hEg', 'video/youtube', '2015-07-09 15:20:15', '2015-07-09 15:20:15', '0b7479c3-c016-42c5-88ed-447ad50ff9a8'),
(271, 271, 'en_us', 'Fránçois & The Atlas Mountains - Ayan Filé (Official Video)', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=kgTh6urcmhQ', 'video/youtube', '2015-07-09 15:20:15', '2015-07-09 15:20:15', '7182df1f-0d2e-40e1-8a3d-675aa8ab2904'),
(272, 272, 'en_us', 'Fatima - Biggest Joke Of All (Official Video)', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=jA4ZkAFOaV8', 'video/youtube', '2015-07-09 15:20:15', '2015-07-09 15:20:15', 'd6c940e9-31ea-4c81-8eca-63468ebca79b'),
(273, 273, 'en_us', 'Dan Deacon - Feel The Lightning (Official Video)', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=kK-1axSGkXc', 'video/youtube', '2015-07-09 15:20:15', '2015-07-09 15:20:15', '276bdc73-6397-4842-94d2-3b72bc59a453'),
(274, 274, 'en_us', 'Papa J. Ruiz - Me Against The World [Official Music Video]', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=Z-PkqnOIzK8', 'video/youtube', '2015-07-09 15:20:16', '2015-07-09 15:20:16', '32a7e515-fd8a-4c93-bc08-a71c4ad8ceb7'),
(275, 275, 'en_us', 'VON POE VII - Everything Has A Meaning [Official Music Video]', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=kapr0zHRZEE', 'video/youtube', '2015-07-09 15:20:16', '2015-07-09 15:20:16', '4f7ebfdd-669a-4ce9-b478-90325d770ed0'),
(276, 276, 'en_us', 'U - Pilgrimage [Official Video]', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=ULSEIHnbUdM', 'video/youtube', '2015-07-09 15:20:16', '2015-07-09 15:20:16', '014ec60b-06c3-45e3-a608-bbe37cf15a43'),
(277, 277, 'en_us', 'Joey Purp - Don''t Stop', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=dX6MU_tcApA', 'video/youtube', '2015-07-09 15:20:16', '2015-07-09 15:20:16', 'cbe45f1e-1b42-42d9-9432-ff3ccd7dac31'),
(278, 278, 'en_us', 'Jabu - Chamber', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=A1dXxTSV-cI', 'video/youtube', '2015-07-09 15:20:16', '2015-07-09 15:20:16', 'e899f452-860a-404d-ad93-1c406a034ab1'),
(279, 279, 'en_us', 'Joseph Marinetti - Ms Telesales (Official)', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=vtlbtt3DrDM', 'video/youtube', '2015-07-09 15:20:16', '2015-07-09 15:20:16', 'f9f7df0e-0f2c-484e-9d3c-a5508f7eb7fe'),
(280, 280, 'en_us', 'Julio Bashmore - KONG feat. Bixby', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=si3YMVIrWFg', 'video/youtube', '2015-07-09 15:20:16', '2015-07-09 15:20:16', '89e77d0b-e0c2-41e7-9609-e5263e26289c'),
(281, 281, 'en_us', 'Jacques Greene - After Life, After Party (Official)', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=-wuaKSlU7Ts', 'video/youtube', '2015-07-09 15:20:16', '2015-07-09 15:20:16', '90ada897-43e0-45f1-98db-9dafb1f84111'),
(282, 282, 'en_us', 'Two Times a Charm - Official Video', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=m0e5IuBDxi8', 'video/youtube', '2015-07-09 15:20:16', '2015-07-09 15:20:16', 'db3acc19-2c15-41f5-a97c-a14ca9b366a2'),
(283, 283, 'en_us', 'Joseph Marinetti - Lipsync (Official)', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=5PXUHlQZFc4', 'video/youtube', '2015-07-09 15:20:16', '2015-07-09 15:20:16', '8576063d-40f5-4a3f-b1d5-bd92cf969796'),
(284, 284, 'en_us', 'Claude Speeed - Some Other Guy (Official)', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=pfwxe2mo5Gg', 'video/youtube', '2015-07-09 15:20:16', '2015-07-09 15:20:16', '7450a30f-6cbb-46ff-a92d-33deeccc4c3b'),
(285, 285, 'en_us', 'Kemekem (I Like Your Afro) by Meklit, Featuring Samuel Yirga', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=qC8feW4gomo', 'video/youtube', '2015-07-09 15:20:16', '2015-07-09 15:20:16', 'ee06c185-8d0b-4716-8071-97d67e73fc0a'),
(286, 286, 'en_us', 'Hudson Mohawke - Very First Breath (Official Video) ft. Irfane', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=z_kLmNPlolY', 'video/youtube', '2015-07-09 15:20:16', '2015-07-09 15:20:16', '3a37e3ca-dc3c-46b4-94a4-8592f8e399d1'),
(287, 287, 'en_us', 'Lapalux - Puzzle (feat. Andreya Triana) (Official Video)', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=auKO2U6Q60g', 'video/youtube', '2015-07-09 15:20:16', '2015-07-09 15:20:16', '588c8d07-c91d-4767-85c4-751846c899fb'),
(288, 288, 'en_us', 'Белка.mp4', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=n0Kw-lSePjA', 'video/youtube', '2015-07-09 15:20:16', '2015-07-09 15:20:16', '8aace83b-b6d8-4eba-b814-5f5fe86b2722'),
(289, 289, 'en_us', 'Eternal Promise', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=LujU06oCaEU', 'video/youtube', '2015-07-09 15:20:16', '2015-07-09 15:20:16', '3542be03-e3ff-4759-a583-3145d65d8054'),
(290, 290, 'en_us', 'Cyrax - I Like (Official Video)', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=ksC5f8ET0iY', 'video/youtube', '2015-07-09 15:20:16', '2015-07-09 15:20:16', '7162f366-6316-4a9b-a75e-1cd8378e37a1'),
(291, 291, 'en_us', 'poshgod - shawty get me high', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=ArUrOOuA6mU', 'video/youtube', '2015-07-09 15:20:17', '2015-07-09 15:20:17', '69145321-6bfb-442b-8577-60dc50db89ba'),
(292, 292, 'en_us', 'Lil Ugly Mane - Throw Dem Gunz', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=t99r8JSdI7s', 'video/youtube', '2015-07-09 15:20:17', '2015-07-09 15:20:17', '35bb18f8-55a4-4553-bb94-84391835c296'),
(293, 293, 'en_us', 'Drums of Death featuring Azealia Banks & Franklin Fuentes - "FIERCE" (Official Video)', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=eyuFqpQ-dvY', 'video/youtube', '2015-07-09 15:20:17', '2015-07-09 15:20:17', '3ebae256-f88e-44e1-837a-42671547369a'),
(294, 294, 'en_us', 'Vic Mensa | ORANGE SODA (Official Music Video)', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=ZLp7M5SMBkQ', 'video/youtube', '2015-07-09 15:20:17', '2015-07-09 15:20:17', '295f981f-2a32-47ec-a62b-c36a762135b7'),
(295, 295, 'en_us', 'Dillon Cooper - State of Elevation', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=tFqz4_sSaAk', 'video/youtube', '2015-07-09 15:20:17', '2015-07-09 15:20:17', '9023e14b-4b9c-4f89-8d0d-c46342b6b4df'),
(296, 296, 'en_us', 'Vic Mensa - YNSP (feat. Eliza Doolittle) OFFICIAL VIDEO HD', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=iuC1TF4ZISA', 'video/youtube', '2015-07-09 15:20:17', '2015-07-09 15:20:17', 'c28e902f-075b-44cc-8ea3-6633ee979657'),
(297, 297, 'en_us', 'Denzel Curry - "Parents" Official Music Video Premiere | First Look', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=kuiwNb-Pxcc', 'video/youtube', '2015-07-09 15:20:17', '2015-07-09 15:20:17', '89a47683-419c-4309-83cd-008295cf96d3'),
(298, 298, 'en_us', 'THE NEW MECCA || PROD BY THEMPEOPLE', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=OLIk0N5DDac', 'video/youtube', '2015-07-09 15:20:17', '2015-07-09 15:20:17', '74a134b6-c832-49c6-a993-4289f7ea5205'),
(299, 299, 'en_us', 'Show Me The Body - Death Sounds', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=5POpRDcsWDo', 'video/youtube', '2015-07-09 15:20:17', '2015-07-09 15:20:17', 'fd655aae-5d97-46da-ba49-857c8fc69274'),
(300, 300, 'en_us', 'FKA twigs - How''s That', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=a7CTo2-bAA8', 'video/youtube', '2015-07-09 15:20:17', '2015-07-09 15:20:17', 'ceee94bb-371b-4043-8a5b-1d64d4a2de99'),
(301, 301, 'en_us', 'Remy Banks - 7th heaven. (interlude) (Prod. MacKrule)', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=0-z5QMVBttU', 'video/youtube', '2015-07-09 15:20:17', '2015-07-09 15:20:17', '841e6129-7642-420c-b1f7-e17d74e93fc5'),
(302, 302, 'en_us', 'Lil B - No Black Person Is Ugly *MUSIC VIDEO* MOST POWERFUL SONG OF THE DECADE?', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=83p69JhDnwU', 'video/youtube', '2015-07-09 15:20:17', '2015-07-09 15:20:17', '8b06fd06-f480-4880-9de8-de363cac694c'),
(303, 303, 'en_us', 'Detroit in Effect - R U Married (1997)', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=PMM-oad3i54', 'video/youtube', '2015-07-09 15:20:17', '2015-07-09 15:20:17', '73cba704-60cb-4a8b-9513-538808a22218'),
(304, 304, 'en_us', 'Homeboy Sandman - America the Beautiful', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=j_56QEKDtHE', 'video/youtube', '2015-07-09 15:20:17', '2015-07-09 15:20:17', '5973b2f0-b547-4550-9e95-8746c7e8c06e'),
(305, 305, 'en_us', 'darwin deez - radar detector (official video)', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=8pbdLqTh_x4', 'video/youtube', '2015-07-09 15:20:17', '2015-07-09 15:20:17', 'f88e996d-79ba-4031-a9a3-8f7c7e5abec7'),
(306, 306, 'en_us', 'LOFTY305- POSHBURGER DREAM SEQUENCE', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=9nnmbTQQ5uU', 'video/youtube', '2015-07-09 15:20:17', '2015-07-09 15:20:17', 'cd243c66-4867-4e09-a483-e2a0f6dfab32'),
(307, 307, 'en_us', 'OCTOPUSBACON', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=Vnh3djgyFdM', 'video/youtube', '2015-07-09 15:20:17', '2015-07-09 15:20:17', '3ae24cd9-778e-43f4-97dc-bb0be327bd0e'),
(308, 308, 'en_us', 'Howes - Crease Fusion', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=Jky_hlmYHVk', 'video/youtube', '2015-07-09 15:20:17', '2015-07-09 15:20:17', '3b0bd8ab-c049-43a6-be44-87fb703fd521'),
(309, 309, 'en_us', 'CULT MOUNTAIN - SMFDB', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=9gNhd1n9eAY', 'video/youtube', '2015-07-09 15:20:18', '2015-07-09 15:20:18', '91beeecb-74b2-4663-a57d-65d4d40515b0'),
(310, 310, 'en_us', 'Da$H - "Parachute Escape / Counseling" (OFFICIAL MUSIC VIDEO)', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=o_PizwmFnoU', 'video/youtube', '2015-07-09 15:20:18', '2015-07-09 15:20:18', '30fb0eb1-eafc-4fcd-83e0-c576e085ce53'),
(311, 311, 'en_us', 'King Krule - Border Line', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=rQrDgQiWJV0', 'video/youtube', '2015-07-09 15:20:18', '2015-07-09 15:20:18', 'd7eb7e29-820e-4d06-b777-6a97c91d1220'),
(312, 312, 'en_us', 'FrancescaSortino_INSIDE ART_Gerardo Frisina mix_featuring Fabrizio Bosso', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=zeF0rh1_Ueg', 'video/youtube', '2015-07-09 15:20:18', '2015-07-09 15:20:18', '1f76dc6a-d60f-4cc9-9769-11f55917e625'),
(313, 313, 'en_us', 'Remy Banks - rem. (feat. Nasty Nigel)', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=EDMzuOQ5gNQ', 'video/youtube', '2015-07-09 15:20:18', '2015-07-09 15:20:18', 'ca63dc1c-360d-474d-b3e5-db8c51662c10'),
(314, 314, 'en_us', 'DDWIWDD (Dan Deacon “When I Was Done Dying”) | Off The Air | Adult Swim', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=TuJqUvBj4rE', 'video/youtube', '2015-07-09 15:20:18', '2015-07-09 15:20:18', '0532c6a0-ef51-4d7a-8a47-552792c02ab2'),
(315, 315, 'en_us', 'Mac DeMarco // "My Kind of Woman" (OFFICIAL VIDEO)', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=wIuBcb2T55Q', 'video/youtube', '2015-07-09 15:20:18', '2015-07-09 15:20:18', '568d4047-9376-4ae5-b48c-4cb452c52618'),
(316, 316, 'en_us', 'Hot Chocolate - Emma', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=IFYOHrwi-W8', 'video/youtube', '2015-07-09 15:20:18', '2015-07-09 15:20:18', '53fbb353-5d3f-4e85-b3c5-6fdb817b9be2'),
(317, 317, 'en_us', 'Oscar - Daffodil Days', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=_wprtDXS3mA', 'video/youtube', '2015-07-09 15:20:18', '2015-07-09 15:20:18', '2882decd-9613-48f3-9999-00490fefacad'),
(318, 318, 'en_us', 'Klein - Open mind', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=JNwE_lVIko8', 'video/youtube', '2015-07-09 15:20:18', '2015-07-09 15:20:18', 'ab4533b2-5ed5-456b-beac-083ad4c68992'),
(319, 319, 'en_us', 'Klein - Witch', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=ox5S9m6iANk', 'video/youtube', '2015-07-09 15:20:18', '2015-07-09 15:20:18', '47f6dbf9-bd24-4aca-b7ab-79397df4286a'),
(320, 320, 'en_us', 'Kali Uchis - Rush (Official Video)', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=Srfe453YePI', 'video/youtube', '2015-07-09 15:20:18', '2015-07-09 15:20:18', '8200b854-a2ad-451a-afa0-e0a5ba8d5749'),
(321, 321, 'en_us', 'Man Don''t Care - Jme ft Giggs', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=rivFCwwvoh8', 'video/youtube', '2015-07-09 15:20:18', '2015-07-09 15:20:18', 'b218a85f-d998-4a7e-bd04-7386034b30f7'),
(322, 322, 'en_us', 'Death from Above 1979 - Virgins [Official Video]', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=rJz0rq1gVLk', 'video/youtube', '2015-07-09 15:20:18', '2015-07-09 15:20:18', 'babe8a04-5ff4-45d0-ae92-3ee35d5b3e74'),
(323, 323, 'en_us', '"Have Mercy" | Eryn Allen Kane', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=uImvs9X9duY', 'video/youtube', '2015-07-09 15:20:18', '2015-07-09 15:20:18', 'e604a3d8-c785-4d9e-9937-7894c3321d72'),
(324, 324, 'en_us', 'Towkio - .WAV Theory (prod. Towkio & The Social Experiment)', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=U4c9bBeUe4M', 'video/youtube', '2015-07-09 15:20:18', '2015-07-09 15:20:18', '2c16937f-2623-4955-9691-4d336e06dcba'),
(325, 325, 'en_us', 'Cousin Brian - Disposer', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=1UNmeIPkGz4', 'video/youtube', '2015-07-09 15:20:18', '2015-07-09 15:20:18', 'dffdd19d-0a97-4a23-9ac0-a92f1b76b8f3'),
(326, 326, 'en_us', 'Private video', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=cN10yLP9ht0', 'video/youtube', '2015-07-09 15:20:19', '2015-07-09 15:20:19', 'a7d3648f-545c-4ff9-bb35-072dd6b0f768'),
(327, 327, 'en_us', 'Shamir - Call It Off (Official Music Video YTMAs)', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=10Kc7RK2rOs', 'video/youtube', '2015-07-09 15:20:19', '2015-07-09 15:20:19', '157fa4d4-c5d7-49ee-8e79-14cb7e75ab46'),
(328, 328, 'en_us', 'Portico - ''101'' feat. Joe Newman (Official Video)', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=5eBCbUxMej4', 'video/youtube', '2015-07-09 15:20:19', '2015-07-09 15:20:19', '66dc9b97-8900-403e-8088-25dfe9c31890'),
(329, 329, 'en_us', 'PINS - Too Little Too Late', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=6UvTPoDGzrY', 'video/youtube', '2015-07-09 15:20:19', '2015-07-09 15:20:19', '279c2bee-3724-4c69-bc4e-7a4161c61975'),
(330, 330, 'en_us', 'BRTSH KNIGHTS - OUTTA YOUR MIND / STUCK ON U', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=-_ej1kp_h0g', 'video/youtube', '2015-07-09 15:20:19', '2015-07-09 15:20:19', '68c2db3e-cefe-4357-ab9c-fad90d5cb7b2'),
(331, 331, 'en_us', 'Show Me The Body - Bone Soup', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=Pkww8QpOYQ4', 'video/youtube', '2015-07-09 15:20:19', '2015-07-09 15:20:19', '158d8c08-add3-4ca6-a803-ebd95db52916'),
(332, 332, 'en_us', 'Jamie xx - Loud Places (ft Romy)', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=TP9luRtEqjc', 'video/youtube', '2015-07-09 15:20:19', '2015-07-09 15:20:19', '15824611-5075-40ca-99cb-fdc478e77b77'),
(333, 333, 'en_us', 'DONMONIQUE - Pilates (Kendall, Kylie, Miley) (OFFICIAL VIDEO)', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=NhY379hlDsk', 'video/youtube', '2015-07-09 15:20:19', '2015-07-09 15:20:19', '98a93b33-29eb-424c-ba58-c42f4efe4bb0'),
(334, 334, 'en_us', 'OKAY KAYA - Damn, Gravity', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=3xDatKoM4nc', 'video/youtube', '2015-07-09 15:20:19', '2015-07-09 15:20:19', '5c853e2b-3c6f-4b54-a6c0-4072700149a4'),
(335, 335, 'en_us', 'Dems - ''Wake'' (Official Video)', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=I8BbcpW-BR4', 'video/youtube', '2015-07-09 15:20:19', '2015-07-09 15:20:19', '285bfaf3-69ec-4cdd-ac7d-da4ca42077eb'),
(336, 336, 'en_us', 'PERFECT BLUNT 2 feat STEVIE LA FUHK . SENDAWG & YT', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=2YWsx88LZbM', 'video/youtube', '2015-07-09 15:20:19', '2015-07-09 15:20:19', '40fb488a-b260-425c-b7f0-208be61411b9'),
(337, 337, 'en_us', 'Andre Jakai - Actuality | Directed by Dave Phoenix', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=JR7hZiFIQwM', 'video/youtube', '2015-07-09 15:20:19', '2015-07-09 15:20:19', '7191bbae-9837-4607-a277-1619aed001d5'),
(338, 338, 'en_us', 'SQUAD DEEP - ANTWON & WIKI FT. LEE SPIELMAN PROD. BY SKYWLKR', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=WDr-Mse4VOE', 'video/youtube', '2015-07-09 15:20:19', '2015-07-09 15:20:19', '82972c4c-e29b-4f45-b82d-382a6fd911a4'),
(339, 339, 'en_us', 'Salomon Faye - W.T.F.', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=jmQlFOU4sTw', 'video/youtube', '2015-07-09 15:20:19', '2015-07-09 15:20:19', 'a7a4b84d-02e3-41ba-bc17-181cbaab285a'),
(340, 340, 'en_us', 'SLICKYBOY "KARMA"', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=cwgsKqo4Edw', 'video/youtube', '2015-07-09 15:20:19', '2015-07-09 15:20:19', '2ef9f9e1-555e-4a20-ae31-8bcae71b5be6'),
(341, 341, 'en_us', 'JUNGLEPUSSY - ME', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=AwDt7oGjwcY', 'video/youtube', '2015-07-09 15:20:19', '2015-07-09 15:20:19', '92cdc7c5-b7cd-40c5-ba39-ab80f41bda1d'),
(342, 342, 'en_us', 'FAIK - Oops', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=F8IWgbH9sX0', 'video/youtube', '2015-07-09 15:20:19', '2015-07-09 15:20:19', 'f3fbbc53-c28f-4745-b4d4-55fbc50209b8'),
(343, 343, 'en_us', 'Lee Scott - Butter Fly (OFFICIAL VIDEO) (Prod. Dirty Dike)', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=XUnzKIJq-30', 'video/youtube', '2015-07-09 15:20:19', '2015-07-09 15:20:19', 'e7b92386-db5a-4791-8537-581589618c97'),
(344, 344, 'en_us', 'GoldLink - Sober Thoughts ( Official Video )', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=Nhm87YivsWM', 'video/youtube', '2015-07-09 15:20:19', '2015-07-09 15:20:19', '348c6f9f-7208-4721-a197-fad5adb09bc4'),
(345, 345, 'en_us', 'BOK BOK & SWEYN JUPITER - Papaya Lipgloss', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=MsIBb8IhF6Q', 'video/youtube', '2015-07-09 15:20:20', '2015-07-09 15:20:20', '8f8feee1-3fae-412e-b60a-980233031e14'),
(346, 346, 'en_us', 'JFSE', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=4wwarO7Az6Y', 'video/youtube', '2015-07-09 15:20:20', '2015-07-09 15:20:20', 'f0d1345a-e5bd-4662-bfe3-3c2b8d1dac1f'),
(347, 347, 'en_us', 'Overreacting Under The Sea OFFICIAL VIDEO', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=YJtGgZz4src', 'video/youtube', '2015-07-09 15:20:20', '2015-07-09 15:20:20', '09b469d7-98b0-4438-8455-cac0324a46fa'),
(348, 348, 'en_us', 'TODD TERJE - Alfonso Muskedunder (official video)', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=WB4SyLujxis', 'video/youtube', '2015-07-09 15:20:20', '2015-07-09 15:20:20', 'f1f302a6-0f4c-4864-b30a-02e2e21e6dd7'),
(349, 349, 'en_us', 'Young Fathers - SHAME', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=2PdYvkaYsaU', 'video/youtube', '2015-07-09 15:20:20', '2015-07-09 15:20:20', '2155a5e0-fb50-4e72-8297-de075df91a59'),
(350, 350, 'en_us', 'ILLAMAN BAM BAM (OFFICIAL VIDEO)', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=onI0bXp2CLU', 'video/youtube', '2015-07-09 15:20:20', '2015-07-09 15:20:20', '481d878b-df72-40fe-a76c-8ed5b429dd11'),
(351, 351, 'en_us', 'Dam-Funk - When I''m With U I Think of Her (Adolescent Funk)', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=GWIhIAcuSXA', 'video/youtube', '2015-07-09 15:20:20', '2015-07-09 15:20:20', 'e1864d66-e6f0-40a9-bc48-5a002cb746ad'),
(352, 352, 'en_us', 'Ariel Pink - Jell-o (Official Video)', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=IAIeconvvgE', 'video/youtube', '2015-07-09 15:20:20', '2015-07-09 15:20:20', '24b97e10-ec35-4db9-a917-5486701027f0'),
(353, 353, 'en_us', 'Towkio - World Turning feat. Joey Purp (prod. Caleb James)', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=Rwj389ssZd4', 'video/youtube', '2015-07-09 15:20:20', '2015-07-09 15:20:20', '1ccd696f-e1ff-4a7c-87cd-1878ed583896'),
(354, 354, 'en_us', 'This Will Destroy You: New Topia | Music Video | Adult Swim', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=8IMTKQ5YoTw', 'video/youtube', '2015-07-09 15:20:20', '2015-07-09 15:20:20', 'fa76230d-181b-4e06-99d8-d06c4a7db089'),
(355, 355, 'en_us', 'Lee Scott - Don''t Tell Me (OFFICIAL VIDEO) (Prod. Dirty Dike)', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=j8JQi8QmhJg', 'video/youtube', '2015-07-09 15:20:20', '2015-07-09 15:20:20', 'fec6a6e7-6357-4789-a341-2a84d9e5899b'),
(356, 356, 'en_us', 'James Pants - Artificial Lover', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=qhUi7INm0DM', 'video/youtube', '2015-07-09 15:20:20', '2015-07-09 15:20:20', '6a8a4439-a29c-406a-ac34-def09b7bed7c'),
(357, 357, 'en_us', 'JOSIAHWISE IS THE SERPENTWITHFEET - "Curiosity of Other Men"', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=BtV_Fw3VVoM', 'video/youtube', '2015-07-09 15:20:20', '2015-07-09 15:20:20', '2f362d32-40ce-41a0-a478-c31707f33fee'),
(358, 358, 'en_us', 'Arca - Sad Bitch', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=cuFMkvoRNqM', 'video/youtube', '2015-07-09 15:20:20', '2015-07-09 15:20:20', '1b36c4fe-d1b9-4c71-a1f3-c6bf10206193'),
(359, 359, 'en_us', 'Salomon Faye - Faye ( Feat. Enasni Leber ) | Official Music Video', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=Vmz3yyj8Vzo', 'video/youtube', '2015-07-09 15:20:20', '2015-07-09 15:20:20', 'f80e458a-d18a-4bc3-9b9c-a7afa8b2d52a'),
(360, 360, 'en_us', 'Show Me The Body - Space Faithful', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=YXnp5ZYxJxQ', 'video/youtube', '2015-07-09 15:20:20', '2015-07-09 15:20:20', '7303abf1-d5c0-428a-9921-b14937a3d45e'),
(361, 361, 'en_us', 'Save The Child/Life - Andre Jakai', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=0PaYjJ7I7I0', 'video/youtube', '2015-07-09 15:20:20', '2015-07-09 15:20:20', '7d86ad67-248f-4cc1-b5b9-7e3962cfabec'),
(362, 362, 'en_us', 'Henry Wu ''Just Negotiate'' ft. Simeon Jones', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=0dfbor_KoaE', 'video/youtube', '2015-07-09 15:20:20', '2015-07-09 15:20:20', '7cac769e-199c-43df-8dee-df981c6a5651'),
(363, 363, 'en_us', 'Danny Lover - Jesus (prod by 19.thou$and) OFFICIAL VIDEO', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=l2tux_oUr_k', 'video/youtube', '2015-07-09 15:20:20', '2015-07-09 15:20:20', '7fb3467d-d1fc-4306-a12f-a57108bff3af'),
(364, 364, 'en_us', 'Jonwayne - Minerals & Gems', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=c47SAMqCalQ', 'video/youtube', '2015-07-09 15:20:21', '2015-07-09 15:20:21', 'd28e6b9f-f9e9-4358-8bdd-bfd80ffc8396'),
(365, 365, 'en_us', 'MARZ LÉON - W H I T E L I O N Z Official Music Video', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=U_-ivCX5YtM', 'video/youtube', '2015-07-09 15:20:21', '2015-07-09 15:20:21', '85203c5f-f4fc-46fd-a023-a6fda51e0f9d'),
(366, 366, 'en_us', 'Lydia Knows - Stevie La Fuhk Feat YT & Sendawg ( Prod by YT )', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=43X1GhKyUcc', 'video/youtube', '2015-07-09 15:20:21', '2015-07-09 15:20:21', '2c972221-9c2b-4d4e-a0f4-8b847f75d65a'),
(367, 367, 'en_us', 'Configa & HaStyle - Wut You Got', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=vRHbGW9C4-M', 'video/youtube', '2015-07-09 15:20:21', '2015-07-09 15:20:21', '1031c51a-677a-4139-bc03-1666c3d6b871'),
(368, 368, 'en_us', 'poshgod - freeze me', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=Q7HkI3WBVic', 'video/youtube', '2015-07-09 15:20:21', '2015-07-09 15:20:21', 'eababe1f-ecff-48c7-9165-1ff233c9ba80'),
(369, 369, 'en_us', 'Skepta - Shutdown', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=MQOG5BkY2Bc', 'video/youtube', '2015-07-09 15:20:21', '2015-07-09 15:20:21', '941fea7f-cc10-4e86-b492-f8018aa8384a'),
(370, 370, 'en_us', 'Saba feat. Eryn Allen Kane - Burnout (Official Video @HOTC_TV)', NULL, NULL, NULL, NULL, NULL, NULL, 'http://www.youtube.com/watch?v=ur8Dj-T20f4', 'video/youtube', '2015-07-09 15:20:21', '2015-07-09 15:20:21', 'bb13dd2e-9121-4425-92af-2013b3cb0abc');

-- --------------------------------------------------------

--
-- Table structure for table `craft_deprecationerrors`
--

CREATE TABLE IF NOT EXISTS `craft_deprecationerrors` (
  `id` int(11) NOT NULL,
  `key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fingerprint` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `lastOccurrence` datetime NOT NULL,
  `file` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `line` smallint(6) unsigned NOT NULL,
  `class` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `method` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `template` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `templateLine` smallint(6) unsigned DEFAULT NULL,
  `message` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `traces` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `craft_elements`
--

CREATE TABLE IF NOT EXISTS `craft_elements` (
  `id` int(11) NOT NULL,
  `type` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `archived` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=371 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `craft_elements`
--

INSERT INTO `craft_elements` (`id`, `type`, `enabled`, `archived`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 'User', 1, 0, '2015-06-25 14:04:22', '2015-06-25 14:04:22', 'b1dd5680-e1ff-4c43-b381-a281c375e792'),
(2, 'Entry', 1, 0, '2015-06-25 14:04:24', '2015-06-25 14:04:24', 'bee2e37d-b6c3-41b6-ae7e-1ba29ab73295'),
(4, 'Entry', 1, 0, '2015-06-25 14:29:31', '2015-06-25 14:29:31', '0b71e70c-5745-4ea1-9d40-587e3916a460'),
(5, 'Entry', 1, 0, '2015-06-25 14:29:40', '2015-06-25 14:29:40', 'd00a8a64-0cfa-415a-b31c-fbf83255f215'),
(7, 'Tag', 1, 0, '2015-06-25 15:11:58', '2015-06-25 15:11:58', '4dc7e904-9165-4006-8787-59c258be964f'),
(8, 'Tag', 1, 0, '2015-06-25 15:12:05', '2015-06-25 15:12:05', 'c38b00f9-b9af-4083-a614-95190f150706'),
(9, 'Asset', 1, 0, '2015-06-25 15:37:37', '2015-06-25 15:37:37', 'f75c67b1-7240-4c40-87c7-ea36f7f2c8d0'),
(64, 'Entry', 1, 0, '2015-07-09 15:20:06', '2015-07-09 15:20:06', 'b0d0e6eb-4ab6-47f4-8f99-75b668f47a1f'),
(65, 'Entry', 1, 0, '2015-07-09 15:20:06', '2015-07-09 15:20:06', 'cf802ac4-c3e3-45ce-a247-54901e3e9f57'),
(66, 'Entry', 1, 0, '2015-07-09 15:20:06', '2015-07-09 15:20:06', '32757fe0-bc39-4929-9833-ac830c5488ab'),
(67, 'Entry', 1, 0, '2015-07-09 15:20:06', '2015-07-09 15:20:06', 'a604b6ab-7b90-439a-8938-db0d6b060814'),
(68, 'Entry', 1, 0, '2015-07-09 15:20:06', '2015-07-09 15:20:06', '6f86b05d-2e0f-44f9-b967-277f91b91b71'),
(69, 'Entry', 1, 0, '2015-07-09 15:20:06', '2015-07-09 15:20:06', '66bb569b-b552-4f7e-be65-6fc5bf5f0b45'),
(70, 'Entry', 1, 0, '2015-07-09 15:20:06', '2015-07-09 15:20:06', '7cb3d4e9-ee20-47d8-a5f9-c97cedb9b095'),
(71, 'Entry', 1, 0, '2015-07-09 15:20:06', '2015-07-09 15:20:06', '4ab969a5-13c6-43c2-9ded-996cbdc52fc3'),
(72, 'Entry', 1, 0, '2015-07-09 15:20:06', '2015-07-09 15:20:06', '0fc149f8-0416-411e-83ca-38466c3c75ca'),
(73, 'Entry', 1, 0, '2015-07-09 15:20:07', '2015-07-09 15:20:07', 'cf559e5c-d3ca-4ce8-b882-070515f1c7c8'),
(74, 'Entry', 1, 0, '2015-07-09 15:20:07', '2015-07-09 15:20:07', '11c7cefd-46c1-4e43-9855-c16474cdd057'),
(75, 'Entry', 1, 0, '2015-07-09 15:20:07', '2015-07-09 15:20:07', '92d58740-922d-4541-9468-a04c0516afc0'),
(76, 'Entry', 1, 0, '2015-07-09 15:20:07', '2015-07-09 15:20:07', '4172ffec-28c5-48d5-a4b9-681e8ff08fbe'),
(77, 'Entry', 1, 0, '2015-07-09 15:20:07', '2015-07-09 15:20:07', 'cce54488-ed01-48a3-90e8-0c5da4fe9704'),
(78, 'Entry', 1, 0, '2015-07-09 15:20:07', '2015-07-09 15:20:07', '32fb5c42-c3f4-4f4a-a69b-5c29abf32212'),
(79, 'Entry', 1, 0, '2015-07-09 15:20:07', '2015-07-09 15:20:07', '046d3cdd-39ff-4776-b6d7-0b47f83b7191'),
(80, 'Entry', 1, 0, '2015-07-09 15:20:07', '2015-07-09 15:20:07', 'ca08e4a2-c86b-443b-b4c6-eaed005ee902'),
(81, 'Entry', 1, 0, '2015-07-09 15:20:07', '2015-07-09 15:20:07', '1d912054-acfc-44f9-acf4-181302648390'),
(82, 'Entry', 1, 0, '2015-07-09 15:20:07', '2015-07-09 15:20:07', 'aa26bd73-0a7a-4725-8df7-be7ff3a6bfff'),
(83, 'Entry', 1, 0, '2015-07-09 15:20:07', '2015-07-09 15:20:07', '4afb0d4c-71ba-437d-8080-cef83dca691a'),
(84, 'Entry', 1, 0, '2015-07-09 15:20:07', '2015-07-09 15:20:07', '7019e4f8-2d7d-4232-a581-f1f2dd71ed56'),
(85, 'Entry', 1, 0, '2015-07-09 15:20:07', '2015-07-09 15:20:07', 'e3d8e48c-faf1-4163-87e4-3bba87ceb570'),
(86, 'Entry', 1, 0, '2015-07-09 15:20:07', '2015-07-09 15:20:07', '3167b06d-2219-459a-91d4-dcf4ec20b3c1'),
(87, 'Entry', 1, 0, '2015-07-09 15:20:07', '2015-07-09 15:20:07', '753b3a6e-00de-46c9-9ed1-c0be340dc5f1'),
(88, 'Entry', 1, 0, '2015-07-09 15:20:07', '2015-07-09 15:20:07', 'db13c784-6a30-472a-8e4b-7feb6bd8e121'),
(89, 'Entry', 1, 0, '2015-07-09 15:20:07', '2015-07-09 15:20:07', '38c2c615-d184-4e65-bcea-8b63fb824a7f'),
(90, 'Entry', 1, 0, '2015-07-09 15:20:07', '2015-07-09 15:20:07', '2fba42be-cacb-4c10-9bdb-95ef67f034a6'),
(91, 'Entry', 1, 0, '2015-07-09 15:20:07', '2015-07-09 15:20:07', '1707730e-4ff8-4e22-b9b0-272397a26bb9'),
(92, 'Entry', 1, 0, '2015-07-09 15:20:07', '2015-07-09 15:20:07', '9e19cfe4-7edb-4ea3-b65a-1d5aeff77ec0'),
(93, 'Entry', 1, 0, '2015-07-09 15:20:07', '2015-07-09 15:20:07', '61adbfd7-6d85-4ce3-b2be-8f241c7b0ee9'),
(94, 'Entry', 1, 0, '2015-07-09 15:20:07', '2015-07-09 15:20:07', '5743fac2-2f2d-418c-a459-942847acfcad'),
(95, 'Entry', 1, 0, '2015-07-09 15:20:07', '2015-07-09 15:20:07', 'e7d96f27-dc48-497e-8c86-acc3e2a51835'),
(96, 'Entry', 1, 0, '2015-07-09 15:20:08', '2015-07-09 15:20:08', '1b19d8f3-47b9-4f6d-a4db-c6d02b2a7e98'),
(97, 'Entry', 1, 0, '2015-07-09 15:20:08', '2015-07-09 15:20:08', '131818c0-6107-4425-bdd1-6ee5872bbfa2'),
(98, 'Entry', 1, 0, '2015-07-09 15:20:08', '2015-07-09 15:20:08', '3b0834fc-cf56-477e-883f-b629e995d13d'),
(99, 'Entry', 1, 0, '2015-07-09 15:20:08', '2015-07-09 15:20:08', '8ef581d9-1048-4724-8e19-6da2413a5f44'),
(100, 'Entry', 1, 0, '2015-07-09 15:20:08', '2015-07-09 15:20:08', 'bf70e893-c649-4037-8209-2c04cf461a2a'),
(101, 'Entry', 1, 0, '2015-07-09 15:20:08', '2015-07-09 15:20:08', '531eaca6-363e-40ef-9507-87251e01c7a4'),
(102, 'Entry', 1, 0, '2015-07-09 15:20:08', '2015-07-09 15:20:08', 'd392f003-fd27-49f3-b10c-1a171b79429d'),
(103, 'Entry', 1, 0, '2015-07-09 15:20:08', '2015-07-09 15:20:08', '84cb8384-e81c-42ed-a555-53facb9935b3'),
(104, 'Entry', 1, 0, '2015-07-09 15:20:08', '2015-07-09 15:20:08', 'bf76ded4-3dbc-4e43-898e-2d698c22bb7e'),
(105, 'Entry', 1, 0, '2015-07-09 15:20:08', '2015-07-09 15:20:08', 'd28b635c-bf5a-4ca0-826a-4d37623dd08c'),
(106, 'Entry', 1, 0, '2015-07-09 15:20:08', '2015-07-09 15:20:08', 'fa55be99-2315-4b66-8d28-70d6586de6e3'),
(107, 'Entry', 1, 0, '2015-07-09 15:20:08', '2015-07-09 15:20:08', '2e7b59a2-4788-4abf-8b61-9cb30ea3a118'),
(108, 'Entry', 1, 0, '2015-07-09 15:20:08', '2015-07-09 15:20:08', 'd131beb4-a0aa-49e2-ac2a-850aeb6f913b'),
(109, 'Entry', 1, 0, '2015-07-09 15:20:08', '2015-07-09 15:20:08', '6cac6e41-bde9-4187-92d8-89abc6e85999'),
(110, 'Entry', 1, 0, '2015-07-09 15:20:08', '2015-07-09 15:20:08', '2d6fce13-9696-40b1-8621-12c10c89a75c'),
(111, 'Entry', 1, 0, '2015-07-09 15:20:08', '2015-07-09 15:20:08', 'ec5eafd2-8866-401f-8f86-d2d2d76def56'),
(112, 'Entry', 1, 0, '2015-07-09 15:20:08', '2015-07-09 15:20:08', '69a5e1d4-211b-4308-b7cd-9c4ca354dc85'),
(113, 'Entry', 1, 0, '2015-07-09 15:20:08', '2015-07-09 15:20:08', 'a5b5b09e-147c-44e3-a364-2a7427748e34'),
(114, 'Entry', 1, 0, '2015-07-09 15:20:08', '2015-07-09 15:20:08', 'bb93a666-1ad8-4226-a809-8000f9307ef8'),
(115, 'Entry', 1, 0, '2015-07-09 15:20:08', '2015-07-09 15:20:08', '671e5a76-776f-4a59-b3d8-332c43067a99'),
(116, 'Entry', 1, 0, '2015-07-09 15:20:08', '2015-07-09 15:20:08', 'dd069880-9683-425b-b982-99fbcf62def1'),
(117, 'Entry', 1, 0, '2015-07-09 15:20:08', '2015-07-09 15:20:08', '4ecde3d7-11d9-4b16-923c-8f6baef36776'),
(118, 'Entry', 1, 0, '2015-07-09 15:20:09', '2015-07-09 15:20:09', '9010a690-5066-4867-80c4-e913f9f2c09c'),
(119, 'Entry', 1, 0, '2015-07-09 15:20:09', '2015-07-09 15:20:09', 'a0203497-9969-4995-b798-61e2e03b4447'),
(120, 'Entry', 1, 0, '2015-07-09 15:20:09', '2015-07-09 15:20:09', '2e472b48-93e6-4e1a-ae5d-0a807f7d6e34'),
(121, 'Entry', 1, 0, '2015-07-09 15:20:09', '2015-07-09 15:20:09', '4c715b2c-58a2-46ac-9f3a-8f529a258853'),
(122, 'Entry', 1, 0, '2015-07-09 15:20:09', '2015-07-09 15:20:09', '8ba90412-e052-4a92-aacd-23e6a40399ba'),
(123, 'Entry', 1, 0, '2015-07-09 15:20:09', '2015-07-09 15:20:09', '75f67861-d697-4f19-98c2-5d9e00210ebe'),
(124, 'Entry', 1, 0, '2015-07-09 15:20:09', '2015-07-09 15:20:09', 'e741e917-ff0a-4602-ad60-906e44fc4f44'),
(125, 'Entry', 1, 0, '2015-07-09 15:20:09', '2015-07-09 15:20:09', '8288e93b-0765-47b9-954a-570a1d27b02e'),
(126, 'Entry', 1, 0, '2015-07-09 15:20:09', '2015-07-09 15:20:09', 'b3c44a7f-1c53-4406-b0e9-38b8a5728493'),
(127, 'Entry', 1, 0, '2015-07-09 15:20:09', '2015-07-09 15:20:09', '5e07fc0b-de66-4ac6-8398-f39f2efe988b'),
(128, 'Entry', 1, 0, '2015-07-09 15:20:09', '2015-07-09 15:20:09', '05980b50-cc0b-4eb3-855b-a1d9d0a32d49'),
(129, 'Entry', 1, 0, '2015-07-09 15:20:09', '2015-07-09 15:20:09', '8bc6a48f-7336-414d-b47b-78b350fb92cd'),
(130, 'Entry', 1, 0, '2015-07-09 15:20:09', '2015-07-09 15:20:09', '6f22aee3-fe47-4fb9-b9a5-30054f6f9140'),
(131, 'Entry', 1, 0, '2015-07-09 15:20:09', '2015-07-09 15:20:09', 'fcf07375-38e9-4247-9e9a-6ad7c9e1cf4d'),
(132, 'Entry', 1, 0, '2015-07-09 15:20:09', '2015-07-09 15:20:09', '495bcaed-a5c9-46a6-a70d-22eed3d883fd'),
(133, 'Entry', 1, 0, '2015-07-09 15:20:09', '2015-07-09 15:20:09', '7631dd13-9602-444a-947d-48238977de29'),
(134, 'Entry', 1, 0, '2015-07-09 15:20:09', '2015-07-09 15:20:09', '922789f2-04ba-4eb8-a4c3-37a66c602708'),
(135, 'Entry', 1, 0, '2015-07-09 15:20:09', '2015-07-09 15:20:09', 'fc81a16c-5f4a-4ab7-9510-157433ed782b'),
(136, 'Entry', 1, 0, '2015-07-09 15:20:09', '2015-07-09 15:20:09', '67a352fa-4df6-46f7-ba96-5760b00e4b6e'),
(137, 'Entry', 1, 0, '2015-07-09 15:20:09', '2015-07-09 15:20:09', 'cc883a6b-20fa-4b81-af03-ba3b9f9262b5'),
(138, 'Entry', 1, 0, '2015-07-09 15:20:09', '2015-07-09 15:20:09', '337c8a2a-ac6d-4d15-82cb-ec399b607102'),
(139, 'Entry', 1, 0, '2015-07-09 15:20:09', '2015-07-09 15:20:09', '50625012-4d25-46f6-940c-3f3fed8f6fa5'),
(140, 'Entry', 1, 0, '2015-07-09 15:20:09', '2015-07-09 15:20:09', '25048954-e525-465f-a82d-4f7cad49d9bf'),
(141, 'Entry', 1, 0, '2015-07-09 15:20:10', '2015-07-09 15:20:10', 'f0a20d17-4d9b-4575-9539-1476659d90e7'),
(142, 'Entry', 1, 0, '2015-07-09 15:20:10', '2015-07-09 15:20:10', 'da9f8c42-0268-4448-b9d0-c601ab0c0271'),
(143, 'Entry', 1, 0, '2015-07-09 15:20:10', '2015-07-09 15:20:10', '65d94b51-936c-40cc-a2e9-5d47ae1734ae'),
(144, 'Entry', 1, 0, '2015-07-09 15:20:10', '2015-07-09 15:20:10', '9c455a51-9c43-4dbf-b14f-25b8f98c662e'),
(145, 'Entry', 1, 0, '2015-07-09 15:20:10', '2015-07-09 15:20:10', '4f861d3b-7274-473a-a657-b248bd4b9765'),
(146, 'Entry', 1, 0, '2015-07-09 15:20:10', '2015-07-09 15:20:10', '5a3a7f30-27c3-426f-a265-a3b5d2fcb415'),
(147, 'Entry', 1, 0, '2015-07-09 15:20:10', '2015-07-09 15:20:10', 'eb080d5c-18ea-41b1-bac0-155ac31a02d3'),
(148, 'Entry', 1, 0, '2015-07-09 15:20:10', '2015-07-09 15:20:10', '60fae9ed-d490-4a04-a8c9-715421166627'),
(149, 'Entry', 1, 0, '2015-07-09 15:20:10', '2015-07-09 15:20:10', '1a8f94ec-a595-4cd7-892c-33f59f78fef0'),
(150, 'Entry', 1, 0, '2015-07-09 15:20:10', '2015-07-09 15:20:10', '84357448-d26c-417e-be38-8146cfebeeca'),
(151, 'Entry', 1, 0, '2015-07-09 15:20:10', '2015-07-09 15:20:10', '91636f50-232d-4af7-ba82-97bc665b504a'),
(152, 'Entry', 1, 0, '2015-07-09 15:20:10', '2015-07-09 15:20:10', '08ea582b-42a0-4b9f-bc7d-330095dd5cfb'),
(153, 'Entry', 1, 0, '2015-07-09 15:20:10', '2015-07-09 15:20:10', 'eb2dda21-fcac-4046-ac4b-fc8eb4e7e0e3'),
(154, 'Entry', 1, 0, '2015-07-09 15:20:10', '2015-07-09 15:20:10', 'f3fc3272-ba2f-4c52-990f-f6ba2d696b4a'),
(155, 'Entry', 1, 0, '2015-07-09 15:20:10', '2015-07-09 15:20:10', '4f4d2787-7159-4777-8234-533b6c0aff8f'),
(156, 'Entry', 1, 0, '2015-07-09 15:20:10', '2015-07-09 15:20:10', 'f7654457-cdbd-455f-a8a8-4650ee28db4d'),
(157, 'Entry', 1, 0, '2015-07-09 15:20:10', '2015-07-09 15:20:10', 'f1d04fcc-af86-4108-b401-e8a0d7552bc8'),
(158, 'Entry', 1, 0, '2015-07-09 15:20:10', '2015-07-09 15:20:10', '5835a9f1-4dea-4bc1-aca0-9d31a17f33d5'),
(159, 'Entry', 1, 0, '2015-07-09 15:20:10', '2015-07-09 15:20:10', '60d26c8e-158a-4a13-b830-0534b61c45b9'),
(160, 'Entry', 1, 0, '2015-07-09 15:20:10', '2015-07-09 15:20:10', '2ea6f8b6-4201-4d01-b2ea-de76e7aa17fb'),
(161, 'Entry', 1, 0, '2015-07-09 15:20:10', '2015-07-09 15:20:10', 'fb30543e-090b-442a-a6c0-4ac44fd356df'),
(162, 'Entry', 1, 0, '2015-07-09 15:20:10', '2015-07-09 15:20:10', '9b7361ba-8e20-41e1-89d7-1289aa852b3f'),
(163, 'Entry', 1, 0, '2015-07-09 15:20:10', '2015-07-09 15:20:10', '19fbcbb6-43c4-45df-b090-aed818e13667'),
(164, 'Entry', 1, 0, '2015-07-09 15:20:11', '2015-07-09 15:20:11', '2231557c-5c6c-47a1-ab5e-9337cf333cca'),
(165, 'Entry', 1, 0, '2015-07-09 15:20:11', '2015-07-09 15:20:11', '8563273f-b5f7-4dde-9043-2c9e20771dbb'),
(166, 'Entry', 1, 0, '2015-07-09 15:20:11', '2015-07-09 15:20:11', 'd279733a-7d77-4434-bac8-073158c7b31a'),
(167, 'Entry', 1, 0, '2015-07-09 15:20:11', '2015-07-09 15:20:11', '7657aedb-74cb-4fb8-8255-81f3a0fcb155'),
(168, 'Entry', 1, 0, '2015-07-09 15:20:11', '2015-07-09 15:20:11', 'c9b94195-4a9c-4ada-8b1b-4a2b985378ff'),
(169, 'Entry', 1, 0, '2015-07-09 15:20:11', '2015-07-09 15:20:11', 'ee903ddb-bd4b-4a0c-bb23-9f2711f51a0d'),
(170, 'Entry', 1, 0, '2015-07-09 15:20:11', '2015-07-09 15:20:11', '95a2ff42-80d2-4cbb-a607-99cfb3513eac'),
(171, 'Entry', 1, 0, '2015-07-09 15:20:11', '2015-07-09 15:20:11', '15eead78-6d33-404a-853f-d441fe189efd'),
(172, 'Entry', 1, 0, '2015-07-09 15:20:11', '2015-07-09 15:20:11', 'b976e4e1-4487-44e8-9bb4-7856883b9774'),
(173, 'Entry', 1, 0, '2015-07-09 15:20:11', '2015-07-09 15:20:11', '4dfb8d03-74f8-4a4d-afdb-3edf754c9922'),
(174, 'Entry', 1, 0, '2015-07-09 15:20:11', '2015-07-09 15:20:11', '74760a5c-94f6-45db-a977-08a7303b4a38'),
(175, 'Entry', 1, 0, '2015-07-09 15:20:11', '2015-07-09 15:20:11', 'a34fef90-9e6f-4813-8acd-76459c51a860'),
(176, 'Entry', 1, 0, '2015-07-09 15:20:11', '2015-07-09 15:20:11', '045ccd8f-2c33-4cb3-b346-0e083bd2abe7'),
(177, 'Entry', 1, 0, '2015-07-09 15:20:11', '2015-07-09 15:20:11', 'd2ebe4ac-8d02-400c-92fa-9d366f862682'),
(178, 'Entry', 1, 0, '2015-07-09 15:20:11', '2015-07-09 15:20:11', '51490541-b0c5-4924-beed-e33c825a7293'),
(179, 'Entry', 1, 0, '2015-07-09 15:20:11', '2015-07-09 15:20:11', '971ebb63-3cb8-437f-88ec-d08ee180cc89'),
(180, 'Entry', 1, 0, '2015-07-09 15:20:11', '2015-07-09 15:20:11', 'ad461e6b-41ca-43f2-a983-83e97baf8826'),
(181, 'Entry', 1, 0, '2015-07-09 15:20:11', '2015-07-09 15:20:11', 'e78b7bca-d96e-4b64-bb1f-0f0578df1d99'),
(182, 'Entry', 1, 0, '2015-07-09 15:20:11', '2015-07-09 15:20:11', 'ad4adf67-2928-40ac-86a7-8e79f9e0d0b6'),
(183, 'Entry', 1, 0, '2015-07-09 15:20:11', '2015-07-09 15:20:11', '60560849-f4d4-404b-95e4-d5f9a7c71e0a'),
(184, 'Entry', 1, 0, '2015-07-09 15:20:11', '2015-07-09 15:20:11', '8a61abb1-746d-41c3-84b3-f539f9b2a49f'),
(185, 'Entry', 1, 0, '2015-07-09 15:20:11', '2015-07-09 15:20:11', '07bd8fb7-8258-4feb-97bc-1c8ee64503a5'),
(186, 'Entry', 1, 0, '2015-07-09 15:20:11', '2015-07-09 15:20:11', '41dd86c4-7bbd-4237-b27c-a67ef14df7a2'),
(187, 'Entry', 1, 0, '2015-07-09 15:20:12', '2015-07-09 15:20:12', '63c5d18a-db1f-4f8f-ab82-d3cc50415f6c'),
(188, 'Entry', 1, 0, '2015-07-09 15:20:12', '2015-07-09 15:20:12', '38e6abaa-f42c-4dab-b1f2-2ec4296090d3'),
(189, 'Entry', 1, 0, '2015-07-09 15:20:12', '2015-07-09 15:20:12', '56a799f1-ed66-41ce-8ced-aec32697bf63'),
(190, 'Entry', 1, 0, '2015-07-09 15:20:12', '2015-07-09 15:20:12', '2e391d47-eb79-4b7c-9c6e-8ea178583801'),
(191, 'Entry', 1, 0, '2015-07-09 15:20:12', '2015-07-09 15:20:12', '716788a7-0b9d-42a4-ae03-b6f62e3ecd0a'),
(192, 'Entry', 1, 0, '2015-07-09 15:20:12', '2015-07-09 15:20:12', 'd5f86764-0fe2-4a43-a625-faf7c14db10e'),
(193, 'Entry', 1, 0, '2015-07-09 15:20:12', '2015-07-09 15:20:12', 'ea20b1c5-a54c-4413-aae2-231df010ce74'),
(194, 'Entry', 1, 0, '2015-07-09 15:20:12', '2015-07-09 15:20:12', 'ea32d699-32d9-4311-9729-d4c9e8a4c78b'),
(195, 'Entry', 1, 0, '2015-07-09 15:20:12', '2015-07-09 15:20:12', 'f5707ef0-bddd-4dc0-bf72-8a43e1355269'),
(196, 'Entry', 1, 0, '2015-07-09 15:20:12', '2015-07-09 15:20:12', '4b3a8dec-72c1-4b5e-8a0b-b99fd8ca0740'),
(197, 'Entry', 1, 0, '2015-07-09 15:20:12', '2015-07-09 15:20:12', 'a86cfd6b-bcbd-4d10-a182-9871e107aff3'),
(198, 'Entry', 1, 0, '2015-07-09 15:20:12', '2015-07-09 15:20:12', 'acdd87dd-38dd-47f4-85d4-55b483fdaf41'),
(199, 'Entry', 1, 0, '2015-07-09 15:20:12', '2015-07-09 15:20:12', '755bc1b9-7629-47a6-bdb0-9681147e1cc5'),
(200, 'Entry', 1, 0, '2015-07-09 15:20:12', '2015-07-09 15:20:12', 'a200c159-38d4-49d0-a27c-95e00b843c36'),
(201, 'Entry', 1, 0, '2015-07-09 15:20:12', '2015-07-09 15:20:12', '2ca6548a-8363-4a56-96c7-97c80652a697'),
(202, 'Entry', 1, 0, '2015-07-09 15:20:12', '2015-07-09 15:20:12', '06dfc865-7fca-41ad-957d-b3fefca563e1'),
(203, 'Entry', 1, 0, '2015-07-09 15:20:12', '2015-07-09 15:20:12', '07ba6ceb-50ce-4146-a88f-9404e8402770'),
(204, 'Entry', 1, 0, '2015-07-09 15:20:12', '2015-07-09 15:20:12', 'dd614512-b46f-408b-b27c-24084d7e4dd4'),
(205, 'Entry', 1, 0, '2015-07-09 15:20:12', '2015-07-09 15:20:12', '615440d5-2260-469a-aa19-fdd9a7fd0e2f'),
(206, 'Entry', 1, 0, '2015-07-09 15:20:12', '2015-07-09 15:20:12', '17184c00-dcd0-4712-98fa-ed129da91278'),
(207, 'Entry', 1, 0, '2015-07-09 15:20:12', '2015-07-09 15:20:12', '2ec8a817-b669-47a4-9456-d38d5c0ebc7b'),
(208, 'Entry', 1, 0, '2015-07-09 15:20:12', '2015-07-09 15:20:12', '13474956-3154-43d3-8782-1788cecc64bc'),
(209, 'Entry', 1, 0, '2015-07-09 15:20:12', '2015-07-09 15:20:12', 'a123150a-f00b-4435-bb08-4dfffcccaf0c'),
(210, 'Entry', 1, 0, '2015-07-09 15:20:13', '2015-07-09 15:20:13', '43390498-f59f-454d-ab92-cfa5063a5a85'),
(211, 'Entry', 1, 0, '2015-07-09 15:20:13', '2015-07-09 15:20:13', '5e25f49b-ad00-45cd-821c-26b41ab910d3'),
(212, 'Entry', 1, 0, '2015-07-09 15:20:13', '2015-07-09 15:20:13', 'be9cbc99-aa7d-4fa6-9e7d-061a7c31ac17'),
(213, 'Entry', 1, 0, '2015-07-09 15:20:13', '2015-07-09 15:20:13', '44e8e8d8-89ad-4c44-b56c-7f6bb64b5e2f'),
(214, 'Entry', 1, 0, '2015-07-09 15:20:13', '2015-07-09 15:20:13', '16291432-c040-4bae-8a3d-c0e988d31f52'),
(215, 'Entry', 1, 0, '2015-07-09 15:20:13', '2015-07-09 15:20:13', 'ce15e518-87cd-4a3c-9918-09801ec15ea1'),
(216, 'Entry', 1, 0, '2015-07-09 15:20:13', '2015-07-09 15:20:13', '98f7689f-0d20-415d-8a0f-5387bef6e98b'),
(217, 'Entry', 1, 0, '2015-07-09 15:20:13', '2015-07-09 15:20:13', '48b7082e-56bc-4d31-8f26-67fd62acc1c2'),
(218, 'Entry', 1, 0, '2015-07-09 15:20:13', '2015-07-09 15:20:13', 'ac148681-26df-41cf-9492-5e80b8c5fbe2'),
(219, 'Entry', 1, 0, '2015-07-09 15:20:13', '2015-07-09 15:20:13', 'f3847901-924c-45fe-a9f0-0b86fa70c6b0'),
(220, 'Entry', 1, 0, '2015-07-09 15:20:13', '2015-07-09 15:20:13', '7191034e-d28a-44bd-a80c-f56f4087a2df'),
(221, 'Entry', 1, 0, '2015-07-09 15:20:13', '2015-07-09 15:20:13', '5f381757-8821-49fc-90c7-f684fa0a050c'),
(222, 'Entry', 1, 0, '2015-07-09 15:20:13', '2015-07-09 15:20:13', 'a2b6e58d-ac9b-4fcd-8a85-2a5b85a0d06c'),
(223, 'Entry', 1, 0, '2015-07-09 15:20:13', '2015-07-09 15:20:13', 'c11a8d57-8962-4a31-9fb6-b9aa3fb6af3a'),
(224, 'Entry', 1, 0, '2015-07-09 15:20:13', '2015-07-09 15:20:13', 'd3e894d3-f79f-405e-9a22-f49cf677cb8d'),
(225, 'Entry', 1, 0, '2015-07-09 15:20:13', '2015-07-09 15:20:13', 'ff02875d-6dfe-419a-a687-3fbf9378e5c8'),
(226, 'Entry', 1, 0, '2015-07-09 15:20:13', '2015-07-09 15:20:13', '6de43286-f070-4bd2-a162-55732181e4ee'),
(227, 'Entry', 1, 0, '2015-07-09 15:20:13', '2015-07-09 15:20:13', '2f3ae796-ea05-445d-ad4a-0c2d94a8f7fa'),
(228, 'Entry', 1, 0, '2015-07-09 15:20:13', '2015-07-09 15:20:13', '41125081-5ab8-4b04-a28a-2518730e6e10'),
(229, 'Entry', 1, 0, '2015-07-09 15:20:13', '2015-07-09 15:20:13', 'e7220232-8c82-4fcc-8927-e69bfd38f9ec'),
(230, 'Entry', 1, 0, '2015-07-09 15:20:13', '2015-07-09 15:20:13', '8f505e96-9f94-4578-8e2b-a269f37fc18e'),
(231, 'Entry', 1, 0, '2015-07-09 15:20:13', '2015-07-09 15:20:13', 'afdf7260-d7bf-4b43-af1f-3cf028ae9708'),
(232, 'Entry', 1, 0, '2015-07-09 15:20:13', '2015-07-09 15:20:13', 'd1d09ec8-2369-417c-85a6-18ca6b5d9b42'),
(233, 'Entry', 1, 0, '2015-07-09 15:20:14', '2015-07-09 15:20:14', '57c3e5d6-81ea-4afe-9d24-15f5c9c0ea63'),
(234, 'Entry', 1, 0, '2015-07-09 15:20:14', '2015-07-09 15:20:14', '44e7fde5-766a-4dac-ae86-edaec73be4b3'),
(235, 'Entry', 1, 0, '2015-07-09 15:20:14', '2015-07-09 15:20:14', '41b4cdd7-1aef-4393-b355-66177e468a06'),
(236, 'Entry', 1, 0, '2015-07-09 15:20:14', '2015-07-09 15:20:14', 'a110bce6-f4c6-4ba8-ab52-11e93a1bbd0f'),
(237, 'Entry', 1, 0, '2015-07-09 15:20:14', '2015-07-09 15:20:14', 'cc6144d3-c90c-4ece-9ac0-59d4a3ae33f2'),
(238, 'Entry', 1, 0, '2015-07-09 15:20:14', '2015-07-09 15:20:14', '60ff1d55-fad7-42a6-9b82-42210d23f052'),
(239, 'Entry', 1, 0, '2015-07-09 15:20:14', '2015-07-09 15:20:14', '84483619-01c4-46de-85cd-eac817c6fbdf'),
(240, 'Entry', 1, 0, '2015-07-09 15:20:14', '2015-07-09 15:20:14', 'a09e4013-1e41-421c-9e7f-1b43296c7e36'),
(241, 'Entry', 1, 0, '2015-07-09 15:20:14', '2015-07-09 15:20:14', '641cc6a1-e319-4957-9067-e2f10d37ab10'),
(242, 'Entry', 1, 0, '2015-07-09 15:20:14', '2015-07-09 15:20:14', '05b272a9-eff7-48a8-b619-a8671ed0ada0'),
(243, 'Entry', 1, 0, '2015-07-09 15:20:14', '2015-07-09 15:20:14', 'a9ab1ccb-1dcd-40a5-9fac-280d59adb4cf'),
(244, 'Entry', 1, 0, '2015-07-09 15:20:14', '2015-07-09 15:20:14', 'c5cdf0ea-18dc-4205-83a3-212d3b70f804'),
(245, 'Entry', 1, 0, '2015-07-09 15:20:14', '2015-07-09 15:20:14', '4dd15b6a-6f41-45df-bc43-be2bef59da16'),
(246, 'Entry', 1, 0, '2015-07-09 15:20:14', '2015-07-09 15:20:14', '7e6c2607-f5d8-4183-a5e4-a2491519308c'),
(247, 'Entry', 1, 0, '2015-07-09 15:20:14', '2015-07-09 15:20:14', '5fd41da7-66e6-4806-a9e1-1fd9fbfddcd6'),
(248, 'Entry', 1, 0, '2015-07-09 15:20:14', '2015-07-09 15:20:14', 'e2e21b0b-83db-40a8-86b3-5dfec94e8330'),
(249, 'Entry', 1, 0, '2015-07-09 15:20:14', '2015-07-09 15:20:14', '81d2e298-fd39-4c13-8ea4-f4da8ca195c6'),
(250, 'Entry', 1, 0, '2015-07-09 15:20:14', '2015-07-09 15:20:14', '252303c7-ad34-4ffd-82d8-e0a8efd8e49d'),
(251, 'Entry', 1, 0, '2015-07-09 15:20:14', '2015-07-09 15:20:14', '10d6ed39-e58a-47b9-bf83-8cb599dc53bd'),
(252, 'Entry', 1, 0, '2015-07-09 15:20:14', '2015-07-09 15:20:14', '86857775-acee-422c-bcd6-da00d87977df'),
(253, 'Entry', 1, 0, '2015-07-09 15:20:14', '2015-07-09 15:20:14', 'a11681c3-1f3d-4fa2-aba1-0c3e1b22242a'),
(254, 'Entry', 1, 0, '2015-07-09 15:20:14', '2015-07-09 15:20:14', 'dacd7e42-9b36-467b-b7dc-fddea9b64e6c'),
(255, 'Entry', 1, 0, '2015-07-09 15:20:15', '2015-07-09 15:20:15', '4faa54bc-bf7e-4785-975a-eab11e40a0c7'),
(256, 'Entry', 1, 0, '2015-07-09 15:20:15', '2015-07-09 15:20:15', '617d7a5e-2057-41fa-93f4-d22c243b4319'),
(257, 'Entry', 1, 0, '2015-07-09 15:20:15', '2015-07-09 15:20:15', '7e225f86-afe4-4fd7-9e97-e201c381cfa4'),
(258, 'Entry', 1, 0, '2015-07-09 15:20:15', '2015-07-09 15:20:15', '3d453376-d2ba-439c-b8b1-79df355ace54'),
(259, 'Entry', 1, 0, '2015-07-09 15:20:15', '2015-07-09 15:20:15', '20f9bc90-17f5-476a-89f7-318c0dd52640'),
(260, 'Entry', 1, 0, '2015-07-09 15:20:15', '2015-07-09 15:20:15', '44ced339-7a5e-4d98-a7b9-80d03cb10580'),
(261, 'Entry', 1, 0, '2015-07-09 15:20:15', '2015-07-09 15:20:15', '91d69a4b-7919-4517-8e40-19f8fa4e764f'),
(262, 'Entry', 1, 0, '2015-07-09 15:20:15', '2015-07-09 15:20:15', '51f38505-6559-4def-90d9-96444b0977e1'),
(263, 'Entry', 1, 0, '2015-07-09 15:20:15', '2015-07-09 15:20:15', '4cd1403c-b912-4f4d-ba8b-a15084b9ce92'),
(264, 'Entry', 1, 0, '2015-07-09 15:20:15', '2015-07-09 15:20:15', 'ed9e95e5-3d9b-4fd0-84c1-6030fc61f47f'),
(265, 'Entry', 1, 0, '2015-07-09 15:20:15', '2015-07-09 15:20:15', '630bf12b-e284-4c99-a500-b579b9a68891'),
(266, 'Entry', 1, 0, '2015-07-09 15:20:15', '2015-07-09 15:20:15', '3a3c910f-67df-45fc-9c73-d73593e0d4dd'),
(267, 'Entry', 1, 0, '2015-07-09 15:20:15', '2015-07-09 15:20:15', '733c9c4b-891a-43f4-ac76-fe26a35abd91'),
(268, 'Entry', 1, 0, '2015-07-09 15:20:15', '2015-07-09 15:20:15', '2121162a-8c20-4833-946e-96a4999ca3f1'),
(269, 'Entry', 1, 0, '2015-07-09 15:20:15', '2015-07-09 15:20:15', '4cf7047a-95e1-4e70-902e-9a140a496f39'),
(270, 'Entry', 1, 0, '2015-07-09 15:20:15', '2015-07-09 15:20:15', 'f2ade39f-0dd8-4644-9c2f-a2c1c1857d5b'),
(271, 'Entry', 1, 0, '2015-07-09 15:20:15', '2015-07-09 15:20:15', 'd7f1ec57-a245-43e7-94d3-2cddeb55e5b7'),
(272, 'Entry', 1, 0, '2015-07-09 15:20:15', '2015-07-09 15:20:15', 'a37ae98f-52a5-41b1-b9be-572bd0edffe5'),
(273, 'Entry', 1, 0, '2015-07-09 15:20:15', '2015-07-09 15:20:15', 'bdfb187d-e6c8-44bd-923c-258d5372e169'),
(274, 'Entry', 1, 0, '2015-07-09 15:20:16', '2015-07-09 15:20:16', '32517f91-f803-4f42-a10b-fe5930f7100d'),
(275, 'Entry', 1, 0, '2015-07-09 15:20:16', '2015-07-09 15:20:16', 'f9437a3a-e006-4d04-9452-46a090b9a94f'),
(276, 'Entry', 1, 0, '2015-07-09 15:20:16', '2015-07-09 15:20:16', 'b8958414-0ad5-47a7-b67d-8a63a8dd0fa5'),
(277, 'Entry', 1, 0, '2015-07-09 15:20:16', '2015-07-09 15:20:16', '73b242fc-22a8-4f58-b1fc-07b5735b4ba4'),
(278, 'Entry', 1, 0, '2015-07-09 15:20:16', '2015-07-09 15:20:16', '2eef1e51-f19a-435d-a3fa-c4d67dbd8cdf'),
(279, 'Entry', 1, 0, '2015-07-09 15:20:16', '2015-07-09 15:20:16', 'ae88adb3-3c53-474b-a852-084cacdf5398'),
(280, 'Entry', 1, 0, '2015-07-09 15:20:16', '2015-07-09 15:20:16', '5ba73c64-1d09-4651-ba61-5fa103dc7ef3'),
(281, 'Entry', 1, 0, '2015-07-09 15:20:16', '2015-07-09 15:20:16', 'd2bdeccc-279f-4317-a34e-5990d1724572'),
(282, 'Entry', 1, 0, '2015-07-09 15:20:16', '2015-07-09 15:20:16', '5c8ddabe-6459-40a5-8eed-598404c08e95'),
(283, 'Entry', 1, 0, '2015-07-09 15:20:16', '2015-07-09 15:20:16', '7f5d80e5-6c39-4637-9305-aa6629a5bb25'),
(284, 'Entry', 1, 0, '2015-07-09 15:20:16', '2015-07-09 15:20:16', '87c70fe2-7759-4eda-aabb-debd2dfae79d'),
(285, 'Entry', 1, 0, '2015-07-09 15:20:16', '2015-07-09 15:20:16', '0692c3ad-a39e-4838-b75a-240842423636'),
(286, 'Entry', 1, 0, '2015-07-09 15:20:16', '2015-07-09 15:20:16', '05ef38f2-4f8b-47ca-bfc4-42b7a6fcc4e8'),
(287, 'Entry', 1, 0, '2015-07-09 15:20:16', '2015-07-09 15:20:16', '36ef2db0-52db-478a-b33d-66811abc271a'),
(288, 'Entry', 1, 0, '2015-07-09 15:20:16', '2015-07-09 15:20:16', '29793b62-8448-4c8e-bc57-8c1ef7ae2d47'),
(289, 'Entry', 1, 0, '2015-07-09 15:20:16', '2015-07-09 15:20:16', '06bd4c1e-3e56-417d-911d-713df3f206c8'),
(290, 'Entry', 1, 0, '2015-07-09 15:20:16', '2015-07-09 15:20:16', 'a598564d-4f6c-4c97-b475-7e1040112ba8'),
(291, 'Entry', 1, 0, '2015-07-09 15:20:17', '2015-07-09 15:20:17', '191c5e2d-f724-49d0-a0c3-5173210881b3'),
(292, 'Entry', 1, 0, '2015-07-09 15:20:17', '2015-07-09 15:20:17', 'd084e74b-942a-479b-853b-feae07d9a5e3'),
(293, 'Entry', 1, 0, '2015-07-09 15:20:17', '2015-07-09 15:20:17', 'fa42b26e-766a-4a83-91ee-baff5bb2c0dc'),
(294, 'Entry', 1, 0, '2015-07-09 15:20:17', '2015-07-09 15:20:17', '60865eaf-fdc7-4b86-9394-5acc2b2725ae'),
(295, 'Entry', 1, 0, '2015-07-09 15:20:17', '2015-07-09 15:20:17', '55228337-a088-4112-98a4-9200e6ac6f6f'),
(296, 'Entry', 1, 0, '2015-07-09 15:20:17', '2015-07-09 15:20:17', 'b4316490-c9ad-4778-afdc-2f935ff073d1'),
(297, 'Entry', 1, 0, '2015-07-09 15:20:17', '2015-07-09 15:20:17', '1079f4a6-9e7b-4c85-b991-2f698315f756'),
(298, 'Entry', 1, 0, '2015-07-09 15:20:17', '2015-07-09 15:20:17', '7d189620-2c1e-4329-b738-cfc4620078a5'),
(299, 'Entry', 1, 0, '2015-07-09 15:20:17', '2015-07-09 15:20:17', 'fb7b07fd-0fde-41de-bd4f-8da288b34da4'),
(300, 'Entry', 1, 0, '2015-07-09 15:20:17', '2015-07-09 15:20:17', 'd782a181-76b5-4ef8-9365-466742c42b3b'),
(301, 'Entry', 1, 0, '2015-07-09 15:20:17', '2015-07-09 15:20:17', '078e227a-2749-4b1d-bca1-b7a7512f6d12'),
(302, 'Entry', 1, 0, '2015-07-09 15:20:17', '2015-07-09 15:20:17', 'cc4ae064-ecd8-45a4-83a9-c331a53fd82c'),
(303, 'Entry', 1, 0, '2015-07-09 15:20:17', '2015-07-09 15:20:17', '97b78040-1fae-4435-96dc-1c81efc68f14'),
(304, 'Entry', 1, 0, '2015-07-09 15:20:17', '2015-07-09 15:20:17', 'a2e04ebe-27dd-4128-9154-04e449f6571b'),
(305, 'Entry', 1, 0, '2015-07-09 15:20:17', '2015-07-09 15:20:17', '8abdc3cd-a8f9-46db-8b16-bd428b70795e'),
(306, 'Entry', 1, 0, '2015-07-09 15:20:17', '2015-07-09 15:20:17', '7c88a770-5ce2-45b6-bf36-b80b73107b81'),
(307, 'Entry', 1, 0, '2015-07-09 15:20:17', '2015-07-09 15:20:17', 'a479fb42-10f1-4675-b93b-0728813a09c1'),
(308, 'Entry', 1, 0, '2015-07-09 15:20:17', '2015-07-09 15:20:17', '0b788017-95ca-4a33-8f13-4675668cc85d'),
(309, 'Entry', 1, 0, '2015-07-09 15:20:18', '2015-07-09 15:20:18', '01380ea8-2af9-4d1c-a870-6e935f827a10'),
(310, 'Entry', 1, 0, '2015-07-09 15:20:18', '2015-07-09 15:20:18', 'dbd51807-4b39-462c-90de-3a8b15bd0f88'),
(311, 'Entry', 1, 0, '2015-07-09 15:20:18', '2015-07-09 15:20:18', 'ddf570c9-d4a4-45a4-b1c8-6c124edca914'),
(312, 'Entry', 1, 0, '2015-07-09 15:20:18', '2015-07-09 15:20:18', 'c3084adf-f332-4e01-9fc8-e409b747d48e'),
(313, 'Entry', 1, 0, '2015-07-09 15:20:18', '2015-07-09 15:20:18', '5097c42a-7e3e-402a-b07c-4c9800c91b50'),
(314, 'Entry', 1, 0, '2015-07-09 15:20:18', '2015-07-09 15:20:18', '25d6842f-bdf2-4f11-97a9-d952b3990038'),
(315, 'Entry', 1, 0, '2015-07-09 15:20:18', '2015-07-09 15:20:18', 'f4c7e9ac-7df5-4bcb-8d21-b0978e8236fb'),
(316, 'Entry', 1, 0, '2015-07-09 15:20:18', '2015-07-09 15:20:18', 'cd683e8d-f5f7-4aed-8b88-6afbc3b407d8'),
(317, 'Entry', 1, 0, '2015-07-09 15:20:18', '2015-07-09 15:20:18', 'ead83abc-9d2d-4363-a0ce-d3b70f4815a8'),
(318, 'Entry', 1, 0, '2015-07-09 15:20:18', '2015-07-09 15:20:18', 'bffdef54-2c7b-476e-9d21-b6b6e14803ff'),
(319, 'Entry', 1, 0, '2015-07-09 15:20:18', '2015-07-09 15:20:18', '32438ba7-05db-48d4-9bc9-c94781b34714'),
(320, 'Entry', 1, 0, '2015-07-09 15:20:18', '2015-07-09 15:20:18', '11a91fb4-e40a-48f8-a3eb-6c346811e165'),
(321, 'Entry', 1, 0, '2015-07-09 15:20:18', '2015-07-09 15:20:18', '64997be1-208b-4800-88e7-addcc339c637'),
(322, 'Entry', 1, 0, '2015-07-09 15:20:18', '2015-07-09 15:20:18', 'd9e6589a-7013-4df7-a11b-d0da55a3107d'),
(323, 'Entry', 1, 0, '2015-07-09 15:20:18', '2015-07-09 15:20:18', '14117528-3014-4e6a-872f-12c3e15db2e5'),
(324, 'Entry', 1, 0, '2015-07-09 15:20:18', '2015-07-09 15:20:18', '51621f5d-187f-4666-ba1b-708219d83a0f'),
(325, 'Entry', 1, 0, '2015-07-09 15:20:18', '2015-07-09 15:20:18', 'e926bc1f-43b8-47a4-91a0-f85d0fdf0f7c'),
(326, 'Entry', 1, 0, '2015-07-09 15:20:19', '2015-07-09 15:20:19', '2fd8011a-b531-4935-83a9-1df311b54de1'),
(327, 'Entry', 1, 0, '2015-07-09 15:20:19', '2015-07-09 15:20:19', '9e9dc04b-6520-4889-8ab3-bf2211be8890'),
(328, 'Entry', 1, 0, '2015-07-09 15:20:19', '2015-07-09 15:20:19', '266d8ce1-1a5b-4d23-af0b-63da158f22a3'),
(329, 'Entry', 1, 0, '2015-07-09 15:20:19', '2015-07-09 15:20:19', '0cbf63db-66bf-4f5b-acf7-c98f2ca3eb37'),
(330, 'Entry', 1, 0, '2015-07-09 15:20:19', '2015-07-09 15:20:19', '0b7da38d-3923-406e-a3b1-38156cb64178'),
(331, 'Entry', 1, 0, '2015-07-09 15:20:19', '2015-07-09 15:20:19', '2c116571-cf40-4a18-b69d-5feb2016b6a5'),
(332, 'Entry', 1, 0, '2015-07-09 15:20:19', '2015-07-09 15:20:19', '5593144e-de0b-40c3-ae9b-dd30f3cfd1a4'),
(333, 'Entry', 1, 0, '2015-07-09 15:20:19', '2015-07-09 15:20:19', 'd220a2a5-acaf-4996-8686-aef64c61fe4b'),
(334, 'Entry', 1, 0, '2015-07-09 15:20:19', '2015-07-09 15:20:19', 'e42295a2-83b3-4ba2-b9dc-4d8220f713d9'),
(335, 'Entry', 1, 0, '2015-07-09 15:20:19', '2015-07-09 15:20:19', '22b3877d-c95a-439b-ba0d-0bbb81cd6d4c'),
(336, 'Entry', 1, 0, '2015-07-09 15:20:19', '2015-07-09 15:20:19', '9a565d53-4b28-4e83-a2d1-1defc1b7d177'),
(337, 'Entry', 1, 0, '2015-07-09 15:20:19', '2015-07-09 15:20:19', '155a784d-fc1d-4555-964f-1b34b3fdaadb'),
(338, 'Entry', 1, 0, '2015-07-09 15:20:19', '2015-07-09 15:20:19', '2bbc3e01-964d-4965-90f0-de193651875c'),
(339, 'Entry', 1, 0, '2015-07-09 15:20:19', '2015-07-09 15:20:19', '0880d2f1-fbda-406a-8874-a721a7f3cd73'),
(340, 'Entry', 1, 0, '2015-07-09 15:20:19', '2015-07-09 15:20:19', '5e18b2c0-ff54-4dcc-9092-56cef3fd7b0e'),
(341, 'Entry', 1, 0, '2015-07-09 15:20:19', '2015-07-09 15:20:19', '0e5b36b3-7486-4aa6-b6c6-1f6d33a01d0c'),
(342, 'Entry', 1, 0, '2015-07-09 15:20:19', '2015-07-09 15:20:19', '21eb0423-53a9-4d69-986f-e1f1e8594591'),
(343, 'Entry', 1, 0, '2015-07-09 15:20:19', '2015-07-09 15:20:19', '34cf4192-2575-464d-a0aa-4d0f649b3b4c'),
(344, 'Entry', 1, 0, '2015-07-09 15:20:19', '2015-07-09 15:20:19', '8c8f7d9a-5dad-478b-a280-47c2101d2535'),
(345, 'Entry', 1, 0, '2015-07-09 15:20:20', '2015-07-09 15:20:20', 'ac7b6333-c97f-4cef-aaa9-07a9a5472642'),
(346, 'Entry', 1, 0, '2015-07-09 15:20:20', '2015-07-09 15:20:20', '1488e910-1603-47b5-98d8-f603b99404dd'),
(347, 'Entry', 1, 0, '2015-07-09 15:20:20', '2015-07-09 15:20:20', 'd3fdd7ef-ab07-4c0f-928a-3f63cf113da8'),
(348, 'Entry', 1, 0, '2015-07-09 15:20:20', '2015-07-09 15:20:20', '158b3931-a71a-4a8b-bb6e-90d6e8fa30a4'),
(349, 'Entry', 1, 0, '2015-07-09 15:20:20', '2015-07-09 15:20:20', '42de4897-8d9d-417b-a7ee-5c4aea16d4c7'),
(350, 'Entry', 1, 0, '2015-07-09 15:20:20', '2015-07-09 15:20:20', '721d32ad-1ba5-4cf1-b6e4-70454f4ec58d'),
(351, 'Entry', 1, 0, '2015-07-09 15:20:20', '2015-07-09 15:20:20', 'a3a3909d-9327-4786-bf3d-3e54cb4a92b2'),
(352, 'Entry', 1, 0, '2015-07-09 15:20:20', '2015-07-09 15:20:20', '6bbefc8f-35e7-4d46-b2ed-6b74c7c5dfcc'),
(353, 'Entry', 1, 0, '2015-07-09 15:20:20', '2015-07-09 15:20:20', 'be3fd633-4310-4558-a325-2030e3f71fd0'),
(354, 'Entry', 1, 0, '2015-07-09 15:20:20', '2015-07-09 15:20:20', '90b74d4f-5f69-43a5-9ab0-e08675df5eb2'),
(355, 'Entry', 1, 0, '2015-07-09 15:20:20', '2015-07-09 15:20:20', '2561b036-04a7-463e-9422-43af5d12da55'),
(356, 'Entry', 1, 0, '2015-07-09 15:20:20', '2015-07-09 15:20:20', 'cd0c6a70-bda6-4dc0-bb54-86713233feb4'),
(357, 'Entry', 1, 0, '2015-07-09 15:20:20', '2015-07-09 15:20:20', '233080ed-e94e-4460-99cb-6d82d7763741'),
(358, 'Entry', 1, 0, '2015-07-09 15:20:20', '2015-07-09 15:20:20', '0593d939-28c9-4d27-ac63-e239809256bb'),
(359, 'Entry', 1, 0, '2015-07-09 15:20:20', '2015-07-09 15:20:20', '886c6abe-74d1-4f4a-b183-a661371808b0'),
(360, 'Entry', 1, 0, '2015-07-09 15:20:20', '2015-07-09 15:20:20', '97c78284-2a88-4323-bb6f-ee972ea390ef'),
(361, 'Entry', 1, 0, '2015-07-09 15:20:20', '2015-07-09 15:20:20', '09d47843-2789-43ec-80fe-eda3dc901fe1'),
(362, 'Entry', 1, 0, '2015-07-09 15:20:20', '2015-07-09 15:20:20', '8493dc86-b5ad-4077-b1f2-b5147d18fcdc'),
(363, 'Entry', 1, 0, '2015-07-09 15:20:20', '2015-07-09 15:20:20', '0f0ece5c-4279-4977-bd28-ee2ed8dfd664'),
(364, 'Entry', 1, 0, '2015-07-09 15:20:21', '2015-07-09 15:20:21', 'd1841e51-c5de-4278-8672-80a569afaba9'),
(365, 'Entry', 1, 0, '2015-07-09 15:20:21', '2015-07-09 15:20:21', 'a2bdc150-662e-41c9-ad26-c6164b2128d9'),
(366, 'Entry', 1, 0, '2015-07-09 15:20:21', '2015-07-09 15:20:21', '6c8a6a91-f1b2-4ac0-9384-a6547f05891b'),
(367, 'Entry', 1, 0, '2015-07-09 15:20:21', '2015-07-09 15:20:21', 'd9c1e09d-28be-4b81-9963-477ccc9f4867'),
(368, 'Entry', 1, 0, '2015-07-09 15:20:21', '2015-07-09 15:20:21', '36893014-6d54-4be8-846a-ea612f77c229'),
(369, 'Entry', 1, 0, '2015-07-09 15:20:21', '2015-07-09 15:20:21', 'c1e73286-9720-4576-a2db-f0707a90ee9e'),
(370, 'Entry', 1, 0, '2015-07-09 15:20:21', '2015-07-09 15:20:21', '34f3e729-f22e-4464-9c89-e92d9d7b71b4');

-- --------------------------------------------------------

--
-- Table structure for table `craft_elements_i18n`
--

CREATE TABLE IF NOT EXISTS `craft_elements_i18n` (
  `id` int(11) NOT NULL,
  `elementId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `uri` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `enabled` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=371 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `craft_elements_i18n`
--

INSERT INTO `craft_elements_i18n` (`id`, `elementId`, `locale`, `slug`, `uri`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 1, 'en_us', '', NULL, 1, '2015-06-25 14:04:23', '2015-06-25 14:04:23', '1d8f5dbc-437e-459c-bba0-2e747033bf37'),
(2, 2, 'en_us', 'homepage', '__home__', 1, '2015-06-25 14:04:24', '2015-06-25 14:04:24', 'e0e429b2-5ea3-4da3-8cd0-b76644f1017a'),
(4, 4, 'en_us', 'about', 'about', 1, '2015-06-25 14:29:31', '2015-06-25 14:29:31', 'af845596-ed0b-4d28-8010-b8782db66152'),
(5, 5, 'en_us', 'contact', 'contact', 1, '2015-06-25 14:29:40', '2015-06-25 14:29:40', '3f80c7f5-c09e-410c-9dde-2e5cdf2823ce'),
(7, 7, 'en_us', 'grime', NULL, 1, '2015-06-25 15:11:58', '2015-06-25 15:11:58', '6707f88a-a6b3-439b-9f2c-3f9bca4d6865'),
(8, 8, 'en_us', 'hot', NULL, 1, '2015-06-25 15:12:05', '2015-06-25 15:12:05', 'fc038d56-9092-4cea-86b9-668b4b5881fd'),
(9, 9, 'en_us', 'screen-shot-2015-06-22-at-12-48-57', NULL, 1, '2015-06-25 15:37:37', '2015-06-25 15:37:37', '4e9544e5-0b37-4035-aced-0b76a06c10a5'),
(64, 64, 'en_us', 'eyedress-lies-tear-us-apart-when-the-planets-align', 'videos/eyedress-lies-tear-us-apart-when-the-planets-align', 1, '2015-07-09 15:20:06', '2015-07-09 15:20:06', 'e87dcc9c-fae1-4867-bff4-517697d6b46c'),
(65, 65, 'en_us', 'private-video', 'videos/private-video', 1, '2015-07-09 15:20:06', '2015-07-09 15:20:06', '9fd007f2-03a9-4778-8ad7-14fbb88cb866'),
(66, 66, 'en_us', 'final-flash-lord-rao-cupp-cave-herrmutt-lobby', 'videos/final-flash-lord-rao-cupp-cave-herrmutt-lobby', 1, '2015-07-09 15:20:06', '2015-07-09 15:20:06', '62838cae-d55e-4303-b363-342c11b6bba8'),
(67, 67, 'en_us', 'another-one', 'videos/another-one', 1, '2015-07-09 15:20:06', '2015-07-09 15:20:06', '8cf5d3a1-10f7-432d-a04f-0f21d9b043ce'),
(68, 68, 'en_us', 'deecee-what-you-know-about-music-video', 'videos/deecee-what-you-know-about-music-video', 1, '2015-07-09 15:20:06', '2015-07-09 15:20:06', '9003840a-d0a1-4000-9906-9690563a8858'),
(69, 69, 'en_us', 'donmonique-you-aint-heard-prod-by-ryan-scott-official-video', 'videos/donmonique-you-aint-heard-prod-by-ryan-scott-official-video', 1, '2015-07-09 15:20:06', '2015-07-09 15:20:06', '0a6fc5c8-5ef1-44b0-aac0-65156d51ba7c'),
(70, 70, 'en_us', 'storm-from-my-4th-solo-album-in-a-low-light', 'videos/storm-from-my-4th-solo-album-in-a-low-light', 1, '2015-07-09 15:20:06', '2015-07-09 15:20:06', 'bb8e45b0-a6ca-4f53-a787-7ff74b88c406'),
(71, 71, 'en_us', 'klein-fake-frendz', 'videos/klein-fake-frendz', 1, '2015-07-09 15:20:06', '2015-07-09 15:20:06', 'ae8900b8-69a0-4338-b839-0f7175026144'),
(72, 72, 'en_us', 'black-josh-pete-cannon-know-about-it-official-video', 'videos/black-josh-pete-cannon-know-about-it-official-video', 1, '2015-07-09 15:20:06', '2015-07-09 15:20:06', '202facb5-8e97-48e1-8b2c-2d9e01a66e2a'),
(73, 73, 'en_us', 'este', 'videos/este', 1, '2015-07-09 15:20:07', '2015-07-09 15:20:07', '6d2c7277-4160-420a-9074-5e5c134cdd76'),
(74, 74, 'en_us', 'bullion-saysah-official-video', 'videos/bullion-saysah-official-video', 1, '2015-07-09 15:20:07', '2015-07-09 15:20:07', '73590014-f227-4b41-a7a1-9ff68cdacd20'),
(75, 75, 'en_us', 'amani-fela-night-zoo-prod-jax', 'videos/amani-fela-night-zoo-prod-jax', 1, '2015-07-09 15:20:07', '2015-07-09 15:20:07', 'd74b0976-4ab1-4e95-a734-a3cb659cbac7'),
(76, 76, 'en_us', 'beach-baby-no-mind-no-money', 'videos/beach-baby-no-mind-no-money', 1, '2015-07-09 15:20:07', '2015-07-09 15:20:07', '3b8404b4-80f6-4d40-9d11-be0989e37b8e'),
(77, 77, 'en_us', 'expressive-feat-bj-the-chicago-kid-illa-j-rosewood-2055', 'videos/expressive-feat-bj-the-chicago-kid-illa-j-rosewood-2055', 1, '2015-07-09 15:20:07', '2015-07-09 15:20:07', '80a0ea7c-0bac-446b-9136-a50ceca32dbc'),
(78, 78, 'en_us', 'fidlar-40oz-on-repeat', 'videos/fidlar-40oz-on-repeat', 1, '2015-07-09 15:20:07', '2015-07-09 15:20:07', '4b5533a8-e18f-445e-950a-d0ee6c8d593b'),
(79, 79, 'en_us', 'omar-souleyman-bahdeni-nami-prod-by-four-tet', 'videos/omar-souleyman-bahdeni-nami-prod-by-four-tet', 1, '2015-07-09 15:20:07', '2015-07-09 15:20:07', 'a5963f7b-5e63-4465-937e-c3577df5042c'),
(80, 80, 'en_us', 'anderson-paak-the-city-official-video', 'videos/anderson-paak-the-city-official-video', 1, '2015-07-09 15:20:07', '2015-07-09 15:20:07', '84a699e3-da1c-4b70-934c-3ed1ad2021c1'),
(81, 81, 'en_us', 'salomon-faye-black-power', 'videos/salomon-faye-black-power', 1, '2015-07-09 15:20:07', '2015-07-09 15:20:07', '258a2f7c-a7ba-46b2-ad22-de82cdd2457d'),
(82, 82, 'en_us', 'bobby-raps-corbin-welcome-to-the-hell-zone', 'videos/bobby-raps-corbin-welcome-to-the-hell-zone', 1, '2015-07-09 15:20:07', '2015-07-09 15:20:07', 'd9c82fd1-9423-4f56-815e-243183341808'),
(83, 83, 'en_us', 'awate-birthday', 'videos/awate-birthday', 1, '2015-07-09 15:20:07', '2015-07-09 15:20:07', '7b5a5554-d644-47ca-bda0-1e13b89a503b'),
(84, 84, 'en_us', 'kr-play-my-shit-official-music-video', 'videos/kr-play-my-shit-official-music-video', 1, '2015-07-09 15:20:07', '2015-07-09 15:20:07', 'c934a5ed-ada7-4571-8ab4-743aa3702597'),
(85, 85, 'en_us', 'jaws-bad-company', 'videos/jaws-bad-company', 1, '2015-07-09 15:20:07', '2015-07-09 15:20:07', 'b08b1ebe-a35c-41dd-930b-06bde37a3b11'),
(86, 86, 'en_us', 'towkio-reflection-prod-kaytranada', 'videos/towkio-reflection-prod-kaytranada', 1, '2015-07-09 15:20:07', '2015-07-09 15:20:07', 'ac7764e9-131a-4ecc-8bce-2c288c12eb83'),
(87, 87, 'en_us', 'little-simz-guess-who-ft-josh-arcé-chuck20-and-tilla', 'videos/little-simz-guess-who-ft-josh-arcé-chuck20-and-tilla', 1, '2015-07-09 15:20:07', '2015-07-09 15:20:07', '01f78bc3-16f7-4ca1-8775-52ac9f66ee39'),
(88, 88, 'en_us', 'aldous-rh-seductive-atmospheres', 'videos/aldous-rh-seductive-atmospheres', 1, '2015-07-09 15:20:07', '2015-07-09 15:20:07', '45becdcd-b093-412c-b0e5-eb331038e05c'),
(89, 89, 'en_us', 'juiceboxxx-walking-in-milwaukee-official-video', 'videos/juiceboxxx-walking-in-milwaukee-official-video', 1, '2015-07-09 15:20:07', '2015-07-09 15:20:07', 'e10e2d7f-3f7a-45a5-8634-26e929fe955a'),
(90, 90, 'en_us', 'redrawing-taylor-swift-shake-it-off-rotoscoped', 'videos/redrawing-taylor-swift-shake-it-off-rotoscoped', 1, '2015-07-09 15:20:07', '2015-07-09 15:20:07', '46000c30-63de-4a24-9622-9a63575344bd'),
(91, 91, 'en_us', 'more-fire-crew-oi', 'videos/more-fire-crew-oi', 1, '2015-07-09 15:20:07', '2015-07-09 15:20:07', 'f607381a-4943-4338-b0de-ff13ab67f4d7'),
(92, 92, 'en_us', 'tilapia-jaguar', 'videos/tilapia-jaguar', 1, '2015-07-09 15:20:07', '2015-07-09 15:20:07', 'fc2f4ec6-9d95-45c8-8dcd-329c9d2da795'),
(93, 93, 'en_us', 'remy-banks-exhale', 'videos/remy-banks-exhale', 1, '2015-07-09 15:20:07', '2015-07-09 15:20:07', '4ce16785-97c6-4c78-add8-d1df0cf0c401'),
(94, 94, 'en_us', 'rone-acid-reflux-binaural-audio-version-optimized-for-headphones', 'videos/rone-acid-reflux-binaural-audio-version-optimized-for-headphones', 1, '2015-07-09 15:20:07', '2015-07-09 15:20:07', 'a0517393-b59e-4a03-a3bb-59bc774be8cd'),
(95, 95, 'en_us', 'run-the-jewels-early-official-music-video-from-run-the-jewels-2', 'videos/run-the-jewels-early-official-music-video-from-run-the-jewels-2', 1, '2015-07-09 15:20:07', '2015-07-09 15:20:07', '66cc0fc5-d974-49ac-9720-e4aabbc3b049'),
(96, 96, 'en_us', 'juice-vcr-ident-003', 'videos/juice-vcr-ident-003', 1, '2015-07-09 15:20:08', '2015-07-09 15:20:08', '4c247474-d926-46f5-918e-3e5844476702'),
(97, 97, 'en_us', 'juice-vcr-ident-004', 'videos/juice-vcr-ident-004', 1, '2015-07-09 15:20:08', '2015-07-09 15:20:08', '8ee4f4ba-08e2-458c-9e11-091221c0f211'),
(98, 98, 'en_us', 'juice-vcr-ident-002', 'videos/juice-vcr-ident-002', 1, '2015-07-09 15:20:08', '2015-07-09 15:20:08', '6f52aef4-fd8f-419b-a8d4-28e50b7d2e5c'),
(99, 99, 'en_us', 'juice-vcr-ident-001', 'videos/juice-vcr-ident-001', 1, '2015-07-09 15:20:08', '2015-07-09 15:20:08', 'a56f0eda-78bd-4dae-b9a1-8bb7b1c0b1d4'),
(100, 100, 'en_us', 'king-krule-the-noose-of-jah-city', 'videos/king-krule-the-noose-of-jah-city', 1, '2015-07-09 15:20:08', '2015-07-09 15:20:08', 'a3808f97-adc8-42a3-ae5f-89ed6db82f74'),
(101, 101, 'en_us', 'king-krule-a-lizard-state-official-video', 'videos/king-krule-a-lizard-state-official-video', 1, '2015-07-09 15:20:08', '2015-07-09 15:20:08', 'c822eb17-ea61-4bd2-9787-2e788ee09c39'),
(102, 102, 'en_us', 'king-krule-rock-bottom-official-video', 'videos/king-krule-rock-bottom-official-video', 1, '2015-07-09 15:20:08', '2015-07-09 15:20:08', '44b3907f-7a66-4104-8e68-d320b3aeb481'),
(103, 103, 'en_us', 'rejjie-snow-lost-in-empathy-official-video', 'videos/rejjie-snow-lost-in-empathy-official-video', 1, '2015-07-09 15:20:08', '2015-07-09 15:20:08', '3a5edb7c-324f-42a1-833a-e4c98052f475'),
(104, 104, 'en_us', 'black-pancakes', 'videos/black-pancakes', 1, '2015-07-09 15:20:08', '2015-07-09 15:20:08', 'e2c4cdad-2879-4ada-8bf8-9fc00e2930a3'),
(105, 105, 'en_us', 'rejjie-snow-nights-over-georgia', 'videos/rejjie-snow-nights-over-georgia', 1, '2015-07-09 15:20:08', '2015-07-09 15:20:08', '5cd40cd1-f4b2-4378-a0a6-e69ba8117e51'),
(106, 106, 'en_us', 'cayucas-will-the-thrill-official-video', 'videos/cayucas-will-the-thrill-official-video', 1, '2015-07-09 15:20:08', '2015-07-09 15:20:08', '387d3670-9df0-4523-9eff-a46ec100021c'),
(107, 107, 'en_us', 'video-yung-simmie-popeye-ft-cashy', 'videos/video-yung-simmie-popeye-ft-cashy', 1, '2015-07-09 15:20:08', '2015-07-09 15:20:08', '273fa53c-f23e-44a5-af65-ae3468d313a6'),
(108, 108, 'en_us', 'django-django-first-light-official-video', 'videos/django-django-first-light-official-video', 1, '2015-07-09 15:20:08', '2015-07-09 15:20:08', '8f989dd3-0a8e-4c80-b84a-7afa10438365'),
(109, 109, 'en_us', 'obey-city-waterbed-ft-anthony-flammia-official-video', 'videos/obey-city-waterbed-ft-anthony-flammia-official-video', 1, '2015-07-09 15:20:08', '2015-07-09 15:20:08', '4e62bd6e-93f6-4793-a0a3-ad4c16b03c93'),
(110, 110, 'en_us', 'dutch-uncles-decided-knowledge', 'videos/dutch-uncles-decided-knowledge', 1, '2015-07-09 15:20:08', '2015-07-09 15:20:08', 'd7840510-bb9c-402f-84ea-18c7a433bc74'),
(111, 111, 'en_us', 'mutual-attraction-lost-tape', 'videos/mutual-attraction-lost-tape', 1, '2015-07-09 15:20:08', '2015-07-09 15:20:08', '15623a45-ca79-4949-8645-d6ce663cb33b'),
(112, 112, 'en_us', 'stinkin-slumrok-bisk-catfish-official-video', 'videos/stinkin-slumrok-bisk-catfish-official-video', 1, '2015-07-09 15:20:08', '2015-07-09 15:20:08', '001d56e7-964e-4fdf-8e01-be742886bd9b'),
(113, 113, 'en_us', 'palmbomen-ii-carina-sayles-official-video', 'videos/palmbomen-ii-carina-sayles-official-video', 1, '2015-07-09 15:20:08', '2015-07-09 15:20:08', '37655997-c578-486b-902b-31e6143c7071'),
(114, 114, 'en_us', 'jam-baxter-caravan-official-video-prod-chemo', 'videos/jam-baxter-caravan-official-video-prod-chemo', 1, '2015-07-09 15:20:08', '2015-07-09 15:20:08', '1e13183f-bdca-40fb-8caa-80ac0de8d58b'),
(115, 115, 'en_us', 'loyle-carner-bfg-official-video', 'videos/loyle-carner-bfg-official-video', 1, '2015-07-09 15:20:08', '2015-07-09 15:20:08', 'eceeebdd-3aac-4df8-8871-92c0a24f1bd5'),
(116, 116, 'en_us', 'proxima-trapped-official-video', 'videos/proxima-trapped-official-video', 1, '2015-07-09 15:20:08', '2015-07-09 15:20:08', '42ad8d19-4e71-4f91-802d-29587203c6c4'),
(117, 117, 'en_us', 'broncho-nc-17-official-music-video', 'videos/broncho-nc-17-official-music-video', 1, '2015-07-09 15:20:09', '2015-07-09 15:20:09', '5f8786ed-7557-44b0-adcc-31359b90a49f'),
(118, 118, 'en_us', 'fort-romeau-new-jackson-not-a-word', 'videos/fort-romeau-new-jackson-not-a-word', 1, '2015-07-09 15:20:09', '2015-07-09 15:20:09', '7b11aa2c-9b46-4c3c-b104-bc5d0299396f'),
(119, 119, 'en_us', 'kano-hail-official-video', 'videos/kano-hail-official-video', 1, '2015-07-09 15:20:09', '2015-07-09 15:20:09', '72e33f17-a72c-42f4-9559-a56bfa50d28c'),
(120, 120, 'en_us', 'yung-lean-thaiboy-digital-diamonds', 'videos/yung-lean-thaiboy-digital-diamonds', 1, '2015-07-09 15:20:09', '2015-07-09 15:20:09', 'c4bcadad-2ed2-44ab-a083-742c148fc8d3'),
(121, 121, 'en_us', 'd-r-a-m-cha-cha-official-music-video', 'videos/d-r-a-m-cha-cha-official-music-video', 1, '2015-07-09 15:20:09', '2015-07-09 15:20:09', '2d43d976-42dd-46bb-86d8-b8d6d3aaf636'),
(122, 122, 'en_us', 'casisdead-nigella', 'videos/casisdead-nigella', 1, '2015-07-09 15:20:09', '2015-07-09 15:20:09', '20bf9c53-2a68-4cef-8bbf-756981174b21'),
(123, 123, 'en_us', 'marching-church-hungry-for-love-official-music-video', 'videos/marching-church-hungry-for-love-official-music-video', 1, '2015-07-09 15:20:09', '2015-07-09 15:20:09', '87497222-058f-4b80-99c9-bba3112e6826'),
(124, 124, 'en_us', 'sir-e-u-fireday-official-music-video', 'videos/sir-e-u-fireday-official-music-video', 1, '2015-07-09 15:20:09', '2015-07-09 15:20:09', '05addbef-d449-44fe-8029-7bc0e052d5ca'),
(125, 125, 'en_us', 'los-yumas-los-foreign-official-video', 'videos/los-yumas-los-foreign-official-video', 1, '2015-07-09 15:20:09', '2015-07-09 15:20:09', '3e0b4096-fadf-4f3c-bc33-b1aaa4d3cdd6'),
(126, 126, 'en_us', 'errors-slow-rotor-official-music-video', 'videos/errors-slow-rotor-official-music-video', 1, '2015-07-09 15:20:09', '2015-07-09 15:20:09', '4b2b7a47-7027-4a05-9b5d-a61e28a90bc5'),
(127, 127, 'en_us', 'dta-official-video-feat-sendawg-yt-prod-by-dj-abrewatts', 'videos/dta-official-video-feat-sendawg-yt-prod-by-dj-abrewatts', 1, '2015-07-09 15:20:09', '2015-07-09 15:20:09', '2ed1084f-4ffa-4d0b-ab3c-ec5eb0ff9b78'),
(128, 128, 'en_us', 'sekuoia-somewhere', 'videos/sekuoia-somewhere', 1, '2015-07-09 15:20:09', '2015-07-09 15:20:09', '23736524-1059-4b80-9d4a-29a1ddb55221'),
(129, 129, 'en_us', 'yung-nobody-cares', 'videos/yung-nobody-cares', 1, '2015-07-09 15:20:09', '2015-07-09 15:20:09', 'aa8ba9b0-6196-45b3-81f6-d03bb41f3d39'),
(130, 130, 'en_us', 'nick-edward-harris-trying-to-be-silent-official-video', 'videos/nick-edward-harris-trying-to-be-silent-official-video', 1, '2015-07-09 15:20:09', '2015-07-09 15:20:09', '8d963581-762c-4821-b146-648fd6b3e684'),
(131, 131, 'en_us', 'elijah-bank-y-samo', 'videos/elijah-bank-y-samo', 1, '2015-07-09 15:20:09', '2015-07-09 15:20:09', 'ee408a29-3ec0-48c7-bd3b-effe5ee9e7b2'),
(132, 132, 'en_us', 'flako-kuku-official-video-hd', 'videos/flako-kuku-official-video-hd', 1, '2015-07-09 15:20:09', '2015-07-09 15:20:09', '5afb1609-444e-4d57-a3a3-45481ba5b63a'),
(133, 133, 'en_us', 'kid-smpl-ja-official-video', 'videos/kid-smpl-ja-official-video', 1, '2015-07-09 15:20:09', '2015-07-09 15:20:09', '193771c9-bd5c-43aa-9723-5edb2fcaf476'),
(134, 134, 'en_us', 'doomtree-final-boss-official-music-video', 'videos/doomtree-final-boss-official-music-video', 1, '2015-07-09 15:20:09', '2015-07-09 15:20:09', '935c8ec6-9faf-48aa-a8d0-fa9765a36c8b'),
(135, 135, 'en_us', 'shamz-le-roc-bus-route', 'videos/shamz-le-roc-bus-route', 1, '2015-07-09 15:20:09', '2015-07-09 15:20:09', '2274571a-fd84-4397-a145-185c3fb46a3c'),
(136, 136, 'en_us', 'panes-stills', 'videos/panes-stills', 1, '2015-07-09 15:20:09', '2015-07-09 15:20:09', '095a2f57-14b1-4ca8-af78-c03eed32732c'),
(137, 137, 'en_us', 'lee-scott-black-josh-skedaddle-prod-by-baileys-brown-official-video', 'videos/lee-scott-black-josh-skedaddle-prod-by-baileys-brown-official-video', 1, '2015-07-09 15:20:09', '2015-07-09 15:20:09', 'd156e4fe-80e2-4b06-9892-8d172c84e60a'),
(138, 138, 'en_us', 'black-josh-sky-high-ft-bill-shakes-prod-by-reklews-official-video', 'videos/black-josh-sky-high-ft-bill-shakes-prod-by-reklews-official-video', 1, '2015-07-09 15:20:09', '2015-07-09 15:20:09', '67f629c6-d143-4d62-b873-15310e55552e'),
(139, 139, 'en_us', 'latrell-james-the-button-official-video', 'videos/latrell-james-the-button-official-video', 1, '2015-07-09 15:20:09', '2015-07-09 15:20:09', 'fd15c725-4dd5-4b8c-81c4-3e246bd92ed8'),
(140, 140, 'en_us', 'bones-sodium', 'videos/bones-sodium', 1, '2015-07-09 15:20:10', '2015-07-09 15:20:10', '4691823e-4443-444f-b8c2-a540f211f168'),
(141, 141, 'en_us', 'salute-silver-tides-official-video', 'videos/salute-silver-tides-official-video', 1, '2015-07-09 15:20:10', '2015-07-09 15:20:10', 'fbb41b05-4653-4f0e-bb49-2215fbe506de'),
(142, 142, 'en_us', 'sleater-kinney-a-new-wave-official-video', 'videos/sleater-kinney-a-new-wave-official-video', 1, '2015-07-09 15:20:10', '2015-07-09 15:20:10', 'aaefe4b0-e0ac-4e31-bad8-6416693ee356'),
(143, 143, 'en_us', 'pussy-riot-i-cant-breathe', 'videos/pussy-riot-i-cant-breathe', 1, '2015-07-09 15:20:10', '2015-07-09 15:20:10', 'da91d0ed-d342-46d0-aa3a-d4b0574ded41'),
(144, 144, 'en_us', 'man-z-coulda-told-the-truth-official-music-video', 'videos/man-z-coulda-told-the-truth-official-music-video', 1, '2015-07-09 15:20:10', '2015-07-09 15:20:10', '37aa530c-3562-4144-808b-7e6d9ffa3976'),
(145, 145, 'en_us', 'im-crazy-official-music-video', 'videos/im-crazy-official-music-video', 1, '2015-07-09 15:20:10', '2015-07-09 15:20:10', 'da3d90cf-2c8b-4a5d-aa3f-803a4621e445'),
(146, 146, 'en_us', 'jalali-set-sura-target-official-music-video', 'videos/jalali-set-sura-target-official-music-video', 1, '2015-07-09 15:20:10', '2015-07-09 15:20:10', '98e35de1-edba-4b66-8f73-35a9abea79f1'),
(147, 147, 'en_us', 'onoe-caponoe-horse-in-the-hill-quadrant-official-video-prod-chemo', 'videos/onoe-caponoe-horse-in-the-hill-quadrant-official-video-prod-chemo', 1, '2015-07-09 15:20:10', '2015-07-09 15:20:10', '7f05841e-0c2d-4a56-84df-520ce009be0d'),
(148, 148, 'en_us', 'air-pop-intelexual', 'videos/air-pop-intelexual', 1, '2015-07-09 15:20:10', '2015-07-09 15:20:10', '5c1c27da-fa2e-48f9-9dc9-9b5dc5f801b6'),
(149, 149, 'en_us', 'pyramid-quince-we-dont-hear-you-prod-dexter-dukarus', 'videos/pyramid-quince-we-dont-hear-you-prod-dexter-dukarus', 1, '2015-07-09 15:20:10', '2015-07-09 15:20:10', '0a0fab3d-46ce-419a-bd3a-b5407b928b63'),
(150, 150, 'en_us', 'kelela-a-message-official-video', 'videos/kelela-a-message-official-video', 1, '2015-07-09 15:20:10', '2015-07-09 15:20:10', '2acd0ce6-a039-49fd-97d7-507a844879ce'),
(151, 151, 'en_us', 'azealia-banks-wallace-official', 'videos/azealia-banks-wallace-official', 1, '2015-07-09 15:20:10', '2015-07-09 15:20:10', '802b439e-0b91-415a-b114-8bdbb3af9b09'),
(152, 152, 'en_us', 'dr-yen-lo-day-3', 'videos/dr-yen-lo-day-3', 1, '2015-07-09 15:20:10', '2015-07-09 15:20:10', 'e4785dee-0798-4e2d-a396-07d1aae2661a'),
(153, 153, 'en_us', 'holly-herndon-interference-official-video', 'videos/holly-herndon-interference-official-video', 1, '2015-07-09 15:20:10', '2015-07-09 15:20:10', '6382de91-58be-49af-b2ed-f5459b1a4868'),
(154, 154, 'en_us', 'subzy-all-i-see-music-video-sbtv', 'videos/subzy-all-i-see-music-video-sbtv', 1, '2015-07-09 15:20:10', '2015-07-09 15:20:10', '2b17e153-897f-46ad-adeb-f48db63b0047'),
(155, 155, 'en_us', 'filthy-funk-burn-em-up-music-video-sbtv', 'videos/filthy-funk-burn-em-up-music-video-sbtv', 1, '2015-07-09 15:20:10', '2015-07-09 15:20:10', 'd4ceab59-aea5-4459-922b-c876f932588b'),
(156, 156, 'en_us', 'dizzee-rascal-ft-giggs-nutcrackerz-official-video', 'videos/dizzee-rascal-ft-giggs-nutcrackerz-official-video', 1, '2015-07-09 15:20:10', '2015-07-09 15:20:10', 'a8810eb3-e1ba-4aaf-ba9a-1d1d2a1925f7'),
(157, 157, 'en_us', 'g-l-o-g-a-n-g-chief-keef-andy-milonakis-music-video', 'videos/g-l-o-g-a-n-g-chief-keef-andy-milonakis-music-video', 1, '2015-07-09 15:20:10', '2015-07-09 15:20:10', '7c0e7136-eb81-4cbe-9f66-6f93704447da'),
(158, 158, 'en_us', 'jazz-cartier-new-religion', 'videos/jazz-cartier-new-religion', 1, '2015-07-09 15:20:10', '2015-07-09 15:20:10', 'c444156e-e6fd-443b-b21c-2303ea635f28'),
(159, 159, 'en_us', 'denzel-curry-ultimate-teaser-prod-ronny-j', 'videos/denzel-curry-ultimate-teaser-prod-ronny-j', 1, '2015-07-09 15:20:10', '2015-07-09 15:20:10', '2f580c54-aba8-4a98-9efc-3b6ffc18adfd'),
(160, 160, 'en_us', 'pictureplane-hyper-real-official-video', 'videos/pictureplane-hyper-real-official-video', 1, '2015-07-09 15:20:10', '2015-07-09 15:20:10', 'e98cc51d-1b4e-4a72-8f74-f461ea9dedc1'),
(161, 161, 'en_us', 'fka-twigs-glass-patron-official-music-video-ytmas', 'videos/fka-twigs-glass-patron-official-music-video-ytmas', 1, '2015-07-09 15:20:10', '2015-07-09 15:20:10', '93f51fb2-b5e1-414c-9104-dfc7d13a2527'),
(162, 162, 'en_us', 'mc-miliband-x-bbk-thats-not-me', 'videos/mc-miliband-x-bbk-thats-not-me', 1, '2015-07-09 15:20:10', '2015-07-09 15:20:10', '94922d08-5ee8-49b4-9792-b9ff5bd6e73c'),
(163, 163, 'en_us', 'dej-loaf-on-my-own-video', 'videos/dej-loaf-on-my-own-video', 1, '2015-07-09 15:20:11', '2015-07-09 15:20:11', '53296f7f-fa46-4600-86a1-74b201466a13'),
(164, 164, 'en_us', 'kindness-ill-be-back-official-video', 'videos/kindness-ill-be-back-official-video', 1, '2015-07-09 15:20:11', '2015-07-09 15:20:11', 'b660cfbf-0c6e-4fba-bd39-e22548fde8aa'),
(165, 165, 'en_us', 'uzzee-the-return-music-video-sbtv', 'videos/uzzee-the-return-music-video-sbtv', 1, '2015-07-09 15:20:11', '2015-07-09 15:20:11', '87e27f5e-7fcc-439f-ac14-a6e6f5bed5a9'),
(166, 166, 'en_us', 'chae-buttuh-bitch-from-the-south-promo', 'videos/chae-buttuh-bitch-from-the-south-promo', 1, '2015-07-09 15:20:11', '2015-07-09 15:20:11', 'dc91f889-88d4-48ef-b6f9-f47843f02b4e'),
(167, 167, 'en_us', 'azealia-banks-ice-princess', 'videos/azealia-banks-ice-princess', 1, '2015-07-09 15:20:11', '2015-07-09 15:20:11', '0b4531f4-be86-4bc6-b456-b8cb9fa3a911'),
(168, 168, 'en_us', 'botzy-couldnt-believe-my-eyes', 'videos/botzy-couldnt-believe-my-eyes', 1, '2015-07-09 15:20:11', '2015-07-09 15:20:11', '24f39ae8-65bc-47ec-8d5a-5430407ea899'),
(169, 169, 'en_us', 'metronomy-the-upsetter-official-video', 'videos/metronomy-the-upsetter-official-video', 1, '2015-07-09 15:20:11', '2015-07-09 15:20:11', 'de2d2714-1d3e-47f9-80b5-16c876c33fb6'),
(170, 170, 'en_us', 'botzy-flameburger', 'videos/botzy-flameburger', 1, '2015-07-09 15:20:11', '2015-07-09 15:20:11', 'c7161de0-e88a-4e95-a620-c67872c23191'),
(171, 171, 'en_us', 'death-grips-i-break-mirrors-with-my-face-in-the-united-states', 'videos/death-grips-i-break-mirrors-with-my-face-in-the-united-states', 1, '2015-07-09 15:20:11', '2015-07-09 15:20:11', '16eb5150-41ac-4eca-a6df-e2e56a018f89'),
(172, 172, 'en_us', 'gypjaq-feat-azealia-banks-blown-away-official-video', 'videos/gypjaq-feat-azealia-banks-blown-away-official-video', 1, '2015-07-09 15:20:11', '2015-07-09 15:20:11', '76728805-7829-442d-9f09-14c8d20e0d3b'),
(173, 173, 'en_us', 'towkio-free-your-mind-ft-donnie-trumpet-prod-cam-obi-the-social-experiment', 'videos/towkio-free-your-mind-ft-donnie-trumpet-prod-cam-obi-the-social-experiment', 1, '2015-07-09 15:20:11', '2015-07-09 15:20:11', 'f4462a06-ed9b-4b04-bcc4-fc27ee42d15a'),
(174, 174, 'en_us', 'jme-work', 'videos/jme-work', 1, '2015-07-09 15:20:11', '2015-07-09 15:20:11', '78cd6dd3-de0c-4ef7-b096-764de259aba9'),
(175, 175, 'en_us', 'fliptrix-jeheeze-official-video-prod-molotov', 'videos/fliptrix-jeheeze-official-video-prod-molotov', 1, '2015-07-09 15:20:11', '2015-07-09 15:20:11', 'afc26d9b-8261-435c-9947-7a48ba7afb6e'),
(176, 176, 'en_us', 'björk-lionsong', 'videos/björk-lionsong', 1, '2015-07-09 15:20:11', '2015-07-09 15:20:11', 'bfaa1c38-c5ec-42ca-98e6-3e29fbddbc6d'),
(177, 177, 'en_us', 'whistlejacket-mr-melon', 'videos/whistlejacket-mr-melon', 1, '2015-07-09 15:20:11', '2015-07-09 15:20:11', '02157321-cb74-4de0-8955-68f85230e28f'),
(178, 178, 'en_us', 'jme-integrity', 'videos/jme-integrity', 1, '2015-07-09 15:20:11', '2015-07-09 15:20:11', '64535a37-bc3f-4c39-ba39-9e18f5acf7ca'),
(179, 179, 'en_us', 'låpsley-brownlow', 'videos/låpsley-brownlow', 1, '2015-07-09 15:20:11', '2015-07-09 15:20:11', '812f2353-6da9-4b16-ba6d-db8a02ff02cd'),
(180, 180, 'en_us', 'eskmo-mind-of-war-official-video', 'videos/eskmo-mind-of-war-official-video', 1, '2015-07-09 15:20:11', '2015-07-09 15:20:11', 'e7b79584-e2c6-4e46-bd97-4f86d0edf839'),
(181, 181, 'en_us', 'grimes-realiti', 'videos/grimes-realiti', 1, '2015-07-09 15:20:11', '2015-07-09 15:20:11', '2019e1de-a880-40a0-b925-b11ad3e0cbd1'),
(182, 182, 'en_us', 'jme-taking-over-it-aint-working', 'videos/jme-taking-over-it-aint-working', 1, '2015-07-09 15:20:11', '2015-07-09 15:20:11', '1439221f-05b0-473a-974b-726777594888'),
(183, 183, 'en_us', 'when-did-your-last-rose-die', 'videos/when-did-your-last-rose-die', 1, '2015-07-09 15:20:11', '2015-07-09 15:20:11', 'c84a0920-ded9-403e-9869-ef4b9caeab06'),
(184, 184, 'en_us', 'skepta-all-over-the-house-official-unsensored-video', 'videos/skepta-all-over-the-house-official-unsensored-video', 1, '2015-07-09 15:20:11', '2015-07-09 15:20:11', 'eb6bb55a-5064-4a8a-8fbe-da3056abaa43'),
(185, 185, 'en_us', 'shlohmo-beams', 'videos/shlohmo-beams', 1, '2015-07-09 15:20:11', '2015-07-09 15:20:11', '7b6bb861-afcd-454b-8bf4-41309530c38c'),
(186, 186, 'en_us', 'björk-family-moving-album-cover', 'videos/björk-family-moving-album-cover', 1, '2015-07-09 15:20:12', '2015-07-09 15:20:12', '0560fd7c-f497-42ee-b334-b4d6e73fb411'),
(187, 187, 'en_us', 'james-pants-broth', 'videos/james-pants-broth', 1, '2015-07-09 15:20:12', '2015-07-09 15:20:12', '0299419d-f980-4e8e-93e5-49f8347b7433'),
(188, 188, 'en_us', 'subzy-music-for-your-soul-ft-chany-jungle-vip-official-music-video', 'videos/subzy-music-for-your-soul-ft-chany-jungle-vip-official-music-video', 1, '2015-07-09 15:20:12', '2015-07-09 15:20:12', '6125aad3-7027-4a91-976e-6aa081629c58'),
(189, 189, 'en_us', 'death-grips-on-gp', 'videos/death-grips-on-gp', 1, '2015-07-09 15:20:12', '2015-07-09 15:20:12', '0a991ada-10a8-4620-b3fd-96447ce0fe72'),
(190, 190, 'en_us', 'ghostpoet-x-marks-the-spot-feat-nadine-shah-official-video-openshoot', 'videos/ghostpoet-x-marks-the-spot-feat-nadine-shah-official-video-openshoot', 1, '2015-07-09 15:20:12', '2015-07-09 15:20:12', 'e056bacb-35b4-49c7-b901-321b07ad744f'),
(191, 191, 'en_us', 'of-montreal-bassem-sabry-official-music-video', 'videos/of-montreal-bassem-sabry-official-music-video', 1, '2015-07-09 15:20:12', '2015-07-09 15:20:12', '176c496f-5f92-4ca5-96a6-6482ded7f8f4'),
(192, 192, 'en_us', 'stormzy-stormzy1-know-me-from', 'videos/stormzy-stormzy1-know-me-from', 1, '2015-07-09 15:20:12', '2015-07-09 15:20:12', '95090b42-5a08-41be-ae36-42dc4c9f26d0'),
(193, 193, 'en_us', 'devonté-hynes-and-neneh-cherry-he-she-me', 'videos/devonté-hynes-and-neneh-cherry-he-she-me', 1, '2015-07-09 15:20:12', '2015-07-09 15:20:12', 'ce13d25f-e84e-4be3-a29d-0265adab882d'),
(194, 194, 'en_us', 'yung-simmie-ill-as-fuk-video', 'videos/yung-simmie-ill-as-fuk-video', 1, '2015-07-09 15:20:12', '2015-07-09 15:20:12', '6c8689bc-7adc-483f-b050-62dd62a54c29'),
(195, 195, 'en_us', 'koosh-official-video-feat-sendawg-yt', 'videos/koosh-official-video-feat-sendawg-yt', 1, '2015-07-09 15:20:12', '2015-07-09 15:20:12', '753988bd-1857-41ec-84a4-ccc2415d1c4c'),
(196, 196, 'en_us', 'dressin-red-our-love-official-video', 'videos/dressin-red-our-love-official-video', 1, '2015-07-09 15:20:12', '2015-07-09 15:20:12', '6c41651b-5a13-4586-8f37-0f34d8b7fef8'),
(197, 197, 'en_us', 'tygapaw-keep-on', 'videos/tygapaw-keep-on', 1, '2015-07-09 15:20:12', '2015-07-09 15:20:12', 'd6c970a5-70ac-449d-ba7f-9d25c0866f3d'),
(198, 198, 'en_us', 'tee-vish-jenna-g-dont-hold-back-official-video', 'videos/tee-vish-jenna-g-dont-hold-back-official-video', 1, '2015-07-09 15:20:12', '2015-07-09 15:20:12', '7485f651-b2e6-4e38-9324-4c65d690b10a'),
(199, 199, 'en_us', 'alone-now-official-music-video-zebra-katz', 'videos/alone-now-official-music-video-zebra-katz', 1, '2015-07-09 15:20:12', '2015-07-09 15:20:12', '801c8791-c677-4b72-945c-a1b02d069fe5'),
(200, 200, 'en_us', 'sam-binga-tek-nuh-chat-ft-redders-official-video', 'videos/sam-binga-tek-nuh-chat-ft-redders-official-video', 1, '2015-07-09 15:20:12', '2015-07-09 15:20:12', '329b4b5a-6d75-49d0-bb81-e933172f15fb'),
(201, 201, 'en_us', 'young-girls-princess-nokia', 'videos/young-girls-princess-nokia', 1, '2015-07-09 15:20:12', '2015-07-09 15:20:12', '1e71d5ea-1f52-4019-9186-dfe5de674a48'),
(202, 202, 'en_us', 'fka-twigs-two-weeks', 'videos/fka-twigs-two-weeks', 1, '2015-07-09 15:20:12', '2015-07-09 15:20:12', '329910ae-e0b2-41c9-9d0f-f076fd5b1633'),
(203, 203, 'en_us', 'fka-twigs-pendulum', 'videos/fka-twigs-pendulum', 1, '2015-07-09 15:20:12', '2015-07-09 15:20:12', '041745a9-a530-493e-a644-5e2ea05abe0e'),
(204, 204, 'en_us', 'show-me-the-body-one-train-official-video', 'videos/show-me-the-body-one-train-official-video', 1, '2015-07-09 15:20:12', '2015-07-09 15:20:12', '459705b9-3c02-4cd8-b5e7-a2df783ec015'),
(205, 205, 'en_us', 'salomon-faye-luv-feat-raveena-official-music-video', 'videos/salomon-faye-luv-feat-raveena-official-music-video', 1, '2015-07-09 15:20:12', '2015-07-09 15:20:12', '4216fdf8-4125-4b34-a805-13f1621bc51f'),
(206, 206, 'en_us', 'loyle-carner-october-ft-kiko-bun-official-video', 'videos/loyle-carner-october-ft-kiko-bun-official-video', 1, '2015-07-09 15:20:12', '2015-07-09 15:20:12', '6ef4a66f-e7d2-4c18-ad78-79337dde3dfb'),
(207, 207, 'en_us', 'tops-outside-official-video', 'videos/tops-outside-official-video', 1, '2015-07-09 15:20:12', '2015-07-09 15:20:12', 'b9f2011b-dbb2-4e82-b792-62830fd3f083'),
(208, 208, 'en_us', 'oscar-sometimes', 'videos/oscar-sometimes', 1, '2015-07-09 15:20:12', '2015-07-09 15:20:12', 'db52e51b-a286-4f51-bb22-104f774b9b37'),
(209, 209, 'en_us', 'sean-nicholas-savage-spotted-brown', 'videos/sean-nicholas-savage-spotted-brown', 1, '2015-07-09 15:20:12', '2015-07-09 15:20:12', '91e478e8-ff3e-47cf-b856-3a9e4fb69b0d'),
(210, 210, 'en_us', 'antwon-3rd-world-grrl-music-video', 'videos/antwon-3rd-world-grrl-music-video', 1, '2015-07-09 15:20:13', '2015-07-09 15:20:13', 'eb42ecb5-5361-4604-818f-cdc5b3a312de'),
(211, 211, 'en_us', 'sean-nicholas-savage-empire-official-video', 'videos/sean-nicholas-savage-empire-official-video', 1, '2015-07-09 15:20:13', '2015-07-09 15:20:13', '6872e4e2-0b09-4fed-986f-000242b316b5'),
(212, 212, 'en_us', 'poison-ivory-mr-wonderful', 'videos/poison-ivory-mr-wonderful', 1, '2015-07-09 15:20:13', '2015-07-09 15:20:13', 'e0b551b5-26ad-459e-b875-196863f06769'),
(213, 213, 'en_us', 'denzel-curry-zone-3-official-video', 'videos/denzel-curry-zone-3-official-video', 1, '2015-07-09 15:20:13', '2015-07-09 15:20:13', '6bac6bf8-b3b6-4472-b203-69d8c540d91a'),
(214, 214, 'en_us', 'phresh-james-indigo', 'videos/phresh-james-indigo', 1, '2015-07-09 15:20:13', '2015-07-09 15:20:13', 'a10e39d3-b0d8-49a1-b04e-bd93c1d13df2'),
(215, 215, 'en_us', 'robb-bank-ice-cold-official-video', 'videos/robb-bank-ice-cold-official-video', 1, '2015-07-09 15:20:13', '2015-07-09 15:20:13', '1f94b453-293d-4be7-8916-523f59872c0c'),
(216, 216, 'en_us', 'cakes-da-killa-living-gud-eating-gud', 'videos/cakes-da-killa-living-gud-eating-gud', 1, '2015-07-09 15:20:13', '2015-07-09 15:20:13', '0537f6e3-a2c9-4de8-b6ef-0974af4b58e2'),
(217, 217, 'en_us', 'junglepussy-nah', 'videos/junglepussy-nah', 1, '2015-07-09 15:20:13', '2015-07-09 15:20:13', 'de1effdc-8008-4642-b51d-a966f5662aab'),
(218, 218, 'en_us', 'death-grips-inanimate-sensation', 'videos/death-grips-inanimate-sensation', 1, '2015-07-09 15:20:13', '2015-07-09 15:20:13', 'bd0e85db-96c9-48a3-95fc-d62ca79b0d7d'),
(219, 219, 'en_us', 'trash-talk-the-hole', 'videos/trash-talk-the-hole', 1, '2015-07-09 15:20:13', '2015-07-09 15:20:13', '54c1e243-1d99-4fbb-8237-6769deb5a517'),
(220, 220, 'en_us', 'girlpool-plants-and-worms-official-video', 'videos/girlpool-plants-and-worms-official-video', 1, '2015-07-09 15:20:13', '2015-07-09 15:20:13', 'dd612812-b869-45ac-8b84-8a948312dfd4'),
(221, 221, 'en_us', 'silk-rhodes-pains', 'videos/silk-rhodes-pains', 1, '2015-07-09 15:20:13', '2015-07-09 15:20:13', '85997be8-29ff-4371-b1c1-8c27e46023f6'),
(222, 222, 'en_us', 'pyramid-vritra-palace-official-video', 'videos/pyramid-vritra-palace-official-video', 1, '2015-07-09 15:20:13', '2015-07-09 15:20:13', '9ff2b646-73ec-4be0-b1f4-e9494e360261'),
(223, 223, 'en_us', 'badbadnotgood-ghostface-killah-ray-gun-ft-doom-official-video', 'videos/badbadnotgood-ghostface-killah-ray-gun-ft-doom-official-video', 1, '2015-07-09 15:20:13', '2015-07-09 15:20:13', 'bacf776a-54cc-4da3-9d74-9c2864f5efc8'),
(224, 224, 'en_us', 'run-the-jewels-lie-cheat-steal-official-video', 'videos/run-the-jewels-lie-cheat-steal-official-video', 1, '2015-07-09 15:20:13', '2015-07-09 15:20:13', '55f8e3a6-59ee-4705-98ee-7ddafa6d555a'),
(225, 225, 'en_us', 'young-thug-freddie-gibbs-a-ap-ferg-old-english', 'videos/young-thug-freddie-gibbs-a-ap-ferg-old-english', 1, '2015-07-09 15:20:13', '2015-07-09 15:20:13', '6c511e0b-b224-4fda-948a-906422e5a9f3'),
(226, 226, 'en_us', 'girlpool-chinatown-official-video', 'videos/girlpool-chinatown-official-video', 1, '2015-07-09 15:20:13', '2015-07-09 15:20:13', '8637ba9e-e2a0-42f0-917e-7f8f814e195b'),
(227, 227, 'en_us', 'riiahworld-rinse-repeat', 'videos/riiahworld-rinse-repeat', 1, '2015-07-09 15:20:13', '2015-07-09 15:20:13', '83be5fb8-3294-4846-acf9-dd8d281f1e15'),
(228, 228, 'en_us', 'thekidd-ep-ft-el-caetano-coca-hiena-music-video', 'videos/thekidd-ep-ft-el-caetano-coca-hiena-music-video', 1, '2015-07-09 15:20:13', '2015-07-09 15:20:13', '78877126-4998-4f7f-af31-a79663384c1d'),
(229, 229, 'en_us', 'antwon-metro-nome-featuring-wiki', 'videos/antwon-metro-nome-featuring-wiki', 1, '2015-07-09 15:20:13', '2015-07-09 15:20:13', '8e72e8f6-6fc2-4c94-a6f0-566777cf6893'),
(230, 230, 'en_us', 'antwon-dont-care', 'videos/antwon-dont-care', 1, '2015-07-09 15:20:13', '2015-07-09 15:20:13', '77def8d6-d891-4dab-9813-a4f1a3cf0490'),
(231, 231, 'en_us', 'ratking-snow-beach', 'videos/ratking-snow-beach', 1, '2015-07-09 15:20:13', '2015-07-09 15:20:13', '19cc2771-8e7c-4525-9de2-3b0c2ee24dab'),
(232, 232, 'en_us', 'flying-lotus-coronus-the-terminator', 'videos/flying-lotus-coronus-the-terminator', 1, '2015-07-09 15:20:13', '2015-07-09 15:20:13', '5f7ef8b9-4e90-48e4-96cb-f5c60a1a79c9'),
(233, 233, 'en_us', 'ratking-so-it-goes', 'videos/ratking-so-it-goes', 1, '2015-07-09 15:20:14', '2015-07-09 15:20:14', '262cd368-f064-4704-a09f-985dea159551'),
(234, 234, 'en_us', 'spooky-black-dj-khaled-is-my-father', 'videos/spooky-black-dj-khaled-is-my-father', 1, '2015-07-09 15:20:14', '2015-07-09 15:20:14', 'ab34ea39-c54f-4aaf-8d25-50469edf3ae8'),
(235, 235, 'en_us', 'mndsgn-camelblues', 'videos/mndsgn-camelblues', 1, '2015-07-09 15:20:14', '2015-07-09 15:20:14', '69c4ac1e-601d-4a35-a63f-a8e2333101fe'),
(236, 236, 'en_us', 'pyramid-vritra-like-summer', 'videos/pyramid-vritra-like-summer', 1, '2015-07-09 15:20:14', '2015-07-09 15:20:14', 'e33bfafb-8424-40bb-a4a0-f9150820642b'),
(237, 237, 'en_us', 'heavy-metal-and-reflective-official-music-video-azealia-banks', 'videos/heavy-metal-and-reflective-official-music-video-azealia-banks', 1, '2015-07-09 15:20:14', '2015-07-09 15:20:14', '6cded482-1eae-4b76-8c61-b1dc07397ecb'),
(238, 238, 'en_us', 'spooky-black-reason', 'videos/spooky-black-reason', 1, '2015-07-09 15:20:14', '2015-07-09 15:20:14', '4a023824-8ce8-4846-ac01-c27c0baa3ccd'),
(239, 239, 'en_us', 'azealia-banks-chasing-time-official', 'videos/azealia-banks-chasing-time-official', 1, '2015-07-09 15:20:14', '2015-07-09 15:20:14', '5f4a9bac-8d9a-43ff-9ac9-0f71bce9f323'),
(240, 240, 'en_us', 'antwon-handsome-music-video', 'videos/antwon-handsome-music-video', 1, '2015-07-09 15:20:14', '2015-07-09 15:20:14', '49c797db-ee45-418f-84b6-031eff580a08'),
(241, 241, 'en_us', 'little-simz-intervention', 'videos/little-simz-intervention', 1, '2015-07-09 15:20:14', '2015-07-09 15:20:14', '017bd35b-03f1-4427-9010-e2b2927235e4'),
(242, 242, 'en_us', 'moon-duo-animal-featuring-richie-jackson-official-music-video', 'videos/moon-duo-animal-featuring-richie-jackson-official-music-video', 1, '2015-07-09 15:20:14', '2015-07-09 15:20:14', 'd64c9ac2-79ce-452e-ba1d-31cfdf084310'),
(243, 243, 'en_us', 'twerps-stranger', 'videos/twerps-stranger', 1, '2015-07-09 15:20:14', '2015-07-09 15:20:14', 'b3527902-6679-4318-b2cd-a0347f4a8562'),
(244, 244, 'en_us', 'jungle-julia', 'videos/jungle-julia', 1, '2015-07-09 15:20:14', '2015-07-09 15:20:14', '9e293e72-edda-4178-9788-a8660df446b0'),
(245, 245, 'en_us', 'shinobi-ninja-saw-red-official', 'videos/shinobi-ninja-saw-red-official', 1, '2015-07-09 15:20:14', '2015-07-09 15:20:14', '9d7d4315-b2f2-4d93-abd4-ce71268552d9'),
(246, 246, 'en_us', 'clarence-clarity-meadow-hopping-traffic-stopping-death-splash', 'videos/clarence-clarity-meadow-hopping-traffic-stopping-death-splash', 1, '2015-07-09 15:20:14', '2015-07-09 15:20:14', 'a3989ef9-0b22-4c21-890a-c26933ec455c'),
(247, 247, 'en_us', 'via-rosa-one-more', 'videos/via-rosa-one-more', 1, '2015-07-09 15:20:14', '2015-07-09 15:20:14', '2e06d996-7312-4c33-8f2d-d35f18d0eefc'),
(248, 248, 'en_us', 'bones-hdmi', 'videos/bones-hdmi', 1, '2015-07-09 15:20:14', '2015-07-09 15:20:14', '0625d5be-e4c6-4f22-bbbe-a6fabe2da35d'),
(249, 249, 'en_us', 'big-momma-dentata-official-video', 'videos/big-momma-dentata-official-video', 1, '2015-07-09 15:20:14', '2015-07-09 15:20:14', '8c595ef2-c67c-4166-8feb-bd5b80699cd6'),
(250, 250, 'en_us', 'gang-of-four-feat-alison-mosshart-englands-in-my-bones-official-video', 'videos/gang-of-four-feat-alison-mosshart-englands-in-my-bones-official-video', 1, '2015-07-09 15:20:14', '2015-07-09 15:20:14', '2a5fe4aa-63e1-4de3-b21b-7b9967a48766'),
(251, 251, 'en_us', 'suicide-slide-black-shapes', 'videos/suicide-slide-black-shapes', 1, '2015-07-09 15:20:14', '2015-07-09 15:20:14', '09b7fc24-87df-4160-b0d2-d70b07b790dd'),
(252, 252, 'en_us', 'shlohmo-buried', 'videos/shlohmo-buried', 1, '2015-07-09 15:20:14', '2015-07-09 15:20:14', '6d5f24fa-a9ed-430d-9519-81f57791de1d'),
(253, 253, 'en_us', 'east-india-youth-carousel', 'videos/east-india-youth-carousel', 1, '2015-07-09 15:20:14', '2015-07-09 15:20:14', '1b7401bd-2a0e-4b32-8116-f9dc417219ad'),
(254, 254, 'en_us', 'the-four-owls-think-twice-prod-dj-premier-official-video', 'videos/the-four-owls-think-twice-prod-dj-premier-official-video', 1, '2015-07-09 15:20:14', '2015-07-09 15:20:14', 'b7a6bce0-3b72-411e-94ea-f6bd7967daae'),
(255, 255, 'en_us', 'sendawg-sen-runner-burning-in-hell-official-video', 'videos/sendawg-sen-runner-burning-in-hell-official-video', 1, '2015-07-09 15:20:15', '2015-07-09 15:20:15', 'f947778b-1dbc-4424-a293-bf95076b6c7c'),
(256, 256, 'en_us', 'chevron-shimoda', 'videos/chevron-shimoda', 1, '2015-07-09 15:20:15', '2015-07-09 15:20:15', 'e37df0fa-e740-4768-881a-e4cf33ffd537'),
(257, 257, 'en_us', 'rome-fortune-oneday-official-video-prod-by-citoonthebeat-richard-adderley', 'videos/rome-fortune-oneday-official-video-prod-by-citoonthebeat-richard-adderley', 1, '2015-07-09 15:20:15', '2015-07-09 15:20:15', 'c3e0b1ce-fecd-405a-9864-29eb14470cb6'),
(258, 258, 'en_us', 'rasklz-superduper-official-music-video', 'videos/rasklz-superduper-official-music-video', 1, '2015-07-09 15:20:15', '2015-07-09 15:20:15', '18d66a2a-3d00-4c3c-86e3-ee485fa65b3c'),
(259, 259, 'en_us', 'keith-ape-잊지마-it-g-ma-feat-jayallday-loota-okasian-kohh-official-music-video', 'videos/keith-ape-잊지마-it-g-ma-feat-jayallday-loota-okasian-kohh-official-music-video', 1, '2015-07-09 15:20:15', '2015-07-09 15:20:15', 'c76b9dad-22f9-4faa-9f70-a57ca42a7f40'),
(260, 260, 'en_us', 'jgrxxn-get-buck-official-video', 'videos/jgrxxn-get-buck-official-video', 1, '2015-07-09 15:20:15', '2015-07-09 15:20:15', '6e21a52e-115e-49dd-81e1-cf966c69b557'),
(261, 261, 'en_us', 'pedestrian-at-best-courtney-barnett', 'videos/pedestrian-at-best-courtney-barnett', 1, '2015-07-09 15:20:15', '2015-07-09 15:20:15', '267ac73f-1248-4215-97c7-61e5f7d70ef5'),
(262, 262, 'en_us', 'viet-cong-silhouettes-official-video', 'videos/viet-cong-silhouettes-official-video', 1, '2015-07-09 15:20:15', '2015-07-09 15:20:15', '6c3d86a8-ec83-4189-ba92-5c66ab0708c5'),
(263, 263, 'en_us', 'batty-boys-just-a-taste-tz023', 'videos/batty-boys-just-a-taste-tz023', 1, '2015-07-09 15:20:15', '2015-07-09 15:20:15', 'd550943f-14b0-456a-be05-9878d228d3b7'),
(264, 264, 'en_us', 'juiceboxxx-back-seat-crazy-facial-hair-woah', 'videos/juiceboxxx-back-seat-crazy-facial-hair-woah', 1, '2015-07-09 15:20:15', '2015-07-09 15:20:15', '041093da-2239-4683-8627-3b3dcfab3260'),
(265, 265, 'en_us', 'lxury-square-1-feat-deptford-goth-official-video', 'videos/lxury-square-1-feat-deptford-goth-official-video', 1, '2015-07-09 15:20:15', '2015-07-09 15:20:15', '2f8cb874-47c3-472e-92dc-b9d43b4be08e'),
(266, 266, 'en_us', 'ibeyi-mama-says-official-video', 'videos/ibeyi-mama-says-official-video', 1, '2015-07-09 15:20:15', '2015-07-09 15:20:15', '02f149ed-189f-4d6c-b492-8fc7f44b7d20'),
(267, 267, 'en_us', 'annelia-anderson-pour-une-infante-défunte', 'videos/annelia-anderson-pour-une-infante-défunte', 1, '2015-07-09 15:20:15', '2015-07-09 15:20:15', '31277a96-c2b0-4c10-b38f-5782859cbda1'),
(268, 268, 'en_us', 'batty-boys-honey-tz023', 'videos/batty-boys-honey-tz023', 1, '2015-07-09 15:20:15', '2015-07-09 15:20:15', '07646145-60b1-42b9-be6d-1871b0692552'),
(269, 269, 'en_us', 'kill-frenzy-all-night-long-official-video', 'videos/kill-frenzy-all-night-long-official-video', 1, '2015-07-09 15:20:15', '2015-07-09 15:20:15', '9bdd67e8-309a-4df0-89db-3ef01f6cabf0'),
(270, 270, 'en_us', 'antwon-get-out-my-face', 'videos/antwon-get-out-my-face', 1, '2015-07-09 15:20:15', '2015-07-09 15:20:15', 'bee8ee83-273d-47c0-b78f-b17a1ba971e4'),
(271, 271, 'en_us', 'fránçois-the-atlas-mountains-ayan-filé-official-video', 'videos/fránçois-the-atlas-mountains-ayan-filé-official-video', 1, '2015-07-09 15:20:15', '2015-07-09 15:20:15', '28dc648d-65db-4025-94f0-7336aa86152a'),
(272, 272, 'en_us', 'fatima-biggest-joke-of-all-official-video', 'videos/fatima-biggest-joke-of-all-official-video', 1, '2015-07-09 15:20:15', '2015-07-09 15:20:15', '353ec42f-0d0a-40c6-b0dd-67846c723fe9'),
(273, 273, 'en_us', 'dan-deacon-feel-the-lightning-official-video', 'videos/dan-deacon-feel-the-lightning-official-video', 1, '2015-07-09 15:20:16', '2015-07-09 15:20:16', '71dadc68-9f44-4729-a852-f1b4bffad6dc'),
(274, 274, 'en_us', 'papa-j-ruiz-me-against-the-world-official-music-video', 'videos/papa-j-ruiz-me-against-the-world-official-music-video', 1, '2015-07-09 15:20:16', '2015-07-09 15:20:16', '913e4834-68e1-4ee2-b970-7e44490154cc'),
(275, 275, 'en_us', 'von-poe-vii-everything-has-a-meaning-official-music-video', 'videos/von-poe-vii-everything-has-a-meaning-official-music-video', 1, '2015-07-09 15:20:16', '2015-07-09 15:20:16', 'ee1f2940-afe3-4450-af92-579417b0e56d'),
(276, 276, 'en_us', 'u-pilgrimage-official-video', 'videos/u-pilgrimage-official-video', 1, '2015-07-09 15:20:16', '2015-07-09 15:20:16', '1139c16e-2cf1-4210-9591-7c79bd4f864e'),
(277, 277, 'en_us', 'joey-purp-dont-stop', 'videos/joey-purp-dont-stop', 1, '2015-07-09 15:20:16', '2015-07-09 15:20:16', 'c58f1334-d924-43ea-863d-d49ba8cf03cf'),
(278, 278, 'en_us', 'jabu-chamber', 'videos/jabu-chamber', 1, '2015-07-09 15:20:16', '2015-07-09 15:20:16', '84019921-b6a1-4f6d-bb14-1a53ab56c5b6'),
(279, 279, 'en_us', 'joseph-marinetti-ms-telesales-official', 'videos/joseph-marinetti-ms-telesales-official', 1, '2015-07-09 15:20:16', '2015-07-09 15:20:16', '25d67de0-411e-4546-a486-9d4d1fe135e9'),
(280, 280, 'en_us', 'julio-bashmore-kong-feat-bixby', 'videos/julio-bashmore-kong-feat-bixby', 1, '2015-07-09 15:20:16', '2015-07-09 15:20:16', '95dfd130-04f3-4c50-8478-244d3431d279'),
(281, 281, 'en_us', 'jacques-greene-after-life-after-party-official', 'videos/jacques-greene-after-life-after-party-official', 1, '2015-07-09 15:20:16', '2015-07-09 15:20:16', '57f2dd1b-be1a-4760-ab6a-10031fac8e81'),
(282, 282, 'en_us', 'two-times-a-charm-official-video', 'videos/two-times-a-charm-official-video', 1, '2015-07-09 15:20:16', '2015-07-09 15:20:16', '70786fe9-2e07-43ce-a8d4-324b3b5825a7'),
(283, 283, 'en_us', 'joseph-marinetti-lipsync-official', 'videos/joseph-marinetti-lipsync-official', 1, '2015-07-09 15:20:16', '2015-07-09 15:20:16', '5d102a8b-ec89-4dc0-9048-7711caa94265'),
(284, 284, 'en_us', 'claude-speeed-some-other-guy-official', 'videos/claude-speeed-some-other-guy-official', 1, '2015-07-09 15:20:16', '2015-07-09 15:20:16', '5b612f40-7a01-430b-83d7-a12a7330cb28'),
(285, 285, 'en_us', 'kemekem-i-like-your-afro-by-meklit-featuring-samuel-yirga', 'videos/kemekem-i-like-your-afro-by-meklit-featuring-samuel-yirga', 1, '2015-07-09 15:20:16', '2015-07-09 15:20:16', '714c838d-f822-4312-9527-17a8510d53cb'),
(286, 286, 'en_us', 'hudson-mohawke-very-first-breath-official-video-ft-irfane', 'videos/hudson-mohawke-very-first-breath-official-video-ft-irfane', 1, '2015-07-09 15:20:16', '2015-07-09 15:20:16', '8eb92037-caa3-464d-b13e-a494b11e28b5'),
(287, 287, 'en_us', 'lapalux-puzzle-feat-andreya-triana-official-video', 'videos/lapalux-puzzle-feat-andreya-triana-official-video', 1, '2015-07-09 15:20:16', '2015-07-09 15:20:16', 'ecd8e295-911a-4c92-a7f6-68c1eb2d5cbf'),
(288, 288, 'en_us', 'белка-mp4', 'videos/белка-mp4', 1, '2015-07-09 15:20:16', '2015-07-09 15:20:16', 'f742f250-a564-402f-8f95-9a26b70f67aa'),
(289, 289, 'en_us', 'eternal-promise', 'videos/eternal-promise', 1, '2015-07-09 15:20:16', '2015-07-09 15:20:16', 'db3ecd39-17a8-4a3b-96ac-697e9180a5d7'),
(290, 290, 'en_us', 'cyrax-i-like-official-video', 'videos/cyrax-i-like-official-video', 1, '2015-07-09 15:20:17', '2015-07-09 15:20:17', '99de3a56-d788-4b42-80ef-0b492f76c3bd'),
(291, 291, 'en_us', 'poshgod-shawty-get-me-high', 'videos/poshgod-shawty-get-me-high', 1, '2015-07-09 15:20:17', '2015-07-09 15:20:17', '74375f2b-dea6-4d34-9730-4bb46c7f4c55'),
(292, 292, 'en_us', 'lil-ugly-mane-throw-dem-gunz', 'videos/lil-ugly-mane-throw-dem-gunz', 1, '2015-07-09 15:20:17', '2015-07-09 15:20:17', 'c2b6c061-f3d7-4ec9-b840-3b3c466916fb'),
(293, 293, 'en_us', 'drums-of-death-featuring-azealia-banks-franklin-fuentes-fierce-official-video', 'videos/drums-of-death-featuring-azealia-banks-franklin-fuentes-fierce-official-video', 1, '2015-07-09 15:20:17', '2015-07-09 15:20:17', 'e12b283c-2462-45bc-a4d3-b82a47efd54f'),
(294, 294, 'en_us', 'vic-mensa-orange-soda-official-music-video', 'videos/vic-mensa-orange-soda-official-music-video', 1, '2015-07-09 15:20:17', '2015-07-09 15:20:17', 'b31637e8-7b10-4dda-bfc5-3983e9e8651f'),
(295, 295, 'en_us', 'dillon-cooper-state-of-elevation', 'videos/dillon-cooper-state-of-elevation', 1, '2015-07-09 15:20:17', '2015-07-09 15:20:17', 'cddf5172-6b57-46f3-ae30-a707953ea634'),
(296, 296, 'en_us', 'vic-mensa-ynsp-feat-eliza-doolittle-official-video-hd', 'videos/vic-mensa-ynsp-feat-eliza-doolittle-official-video-hd', 1, '2015-07-09 15:20:17', '2015-07-09 15:20:17', '8e10e8b0-a66f-4abe-9b8e-bb658b2df3c8'),
(297, 297, 'en_us', 'denzel-curry-parents-official-music-video-premiere-first-look', 'videos/denzel-curry-parents-official-music-video-premiere-first-look', 1, '2015-07-09 15:20:17', '2015-07-09 15:20:17', '8b9442fa-e8ac-4616-8266-41adb099241f'),
(298, 298, 'en_us', 'the-new-mecca-prod-by-thempeople', 'videos/the-new-mecca-prod-by-thempeople', 1, '2015-07-09 15:20:17', '2015-07-09 15:20:17', 'fd62be06-5340-454a-a29a-fa939f687f40'),
(299, 299, 'en_us', 'show-me-the-body-death-sounds', 'videos/show-me-the-body-death-sounds', 1, '2015-07-09 15:20:17', '2015-07-09 15:20:17', '41600110-63cc-4819-9cc0-c52c1e29ab8d'),
(300, 300, 'en_us', 'fka-twigs-hows-that', 'videos/fka-twigs-hows-that', 1, '2015-07-09 15:20:17', '2015-07-09 15:20:17', '831a8541-5b53-40d9-82e6-bd5ccb7d9769'),
(301, 301, 'en_us', 'remy-banks-7th-heaven-interlude-prod-mackrule', 'videos/remy-banks-7th-heaven-interlude-prod-mackrule', 1, '2015-07-09 15:20:17', '2015-07-09 15:20:17', '5850900c-0cab-4a9b-b699-b29e7bd7fcaf'),
(302, 302, 'en_us', 'lil-b-no-black-person-is-ugly-music-video-most-powerful-song-of-the-decade', 'videos/lil-b-no-black-person-is-ugly-music-video-most-powerful-song-of-the-decade', 1, '2015-07-09 15:20:17', '2015-07-09 15:20:17', '7da20a50-5fc5-4942-82e8-7325e48b975a'),
(303, 303, 'en_us', 'detroit-in-effect-r-u-married-1997', 'videos/detroit-in-effect-r-u-married-1997', 1, '2015-07-09 15:20:17', '2015-07-09 15:20:17', '6fff2b61-2b00-470b-84a6-ad26ede9a988'),
(304, 304, 'en_us', 'homeboy-sandman-america-the-beautiful', 'videos/homeboy-sandman-america-the-beautiful', 1, '2015-07-09 15:20:17', '2015-07-09 15:20:17', 'efa48107-41a6-4d43-94cb-871e6cead317'),
(305, 305, 'en_us', 'darwin-deez-radar-detector-official-video', 'videos/darwin-deez-radar-detector-official-video', 1, '2015-07-09 15:20:17', '2015-07-09 15:20:17', '68df5260-b68b-4bbe-855d-222cb8ac0370'),
(306, 306, 'en_us', 'lofty305-poshburger-dream-sequence', 'videos/lofty305-poshburger-dream-sequence', 1, '2015-07-09 15:20:17', '2015-07-09 15:20:17', '6dbade78-5e3a-47c3-bb92-d61031223909'),
(307, 307, 'en_us', 'octopusbacon', 'videos/octopusbacon', 1, '2015-07-09 15:20:17', '2015-07-09 15:20:17', '986c9916-6ad6-4e0d-b292-a8a4eec90efa'),
(308, 308, 'en_us', 'howes-crease-fusion', 'videos/howes-crease-fusion', 1, '2015-07-09 15:20:18', '2015-07-09 15:20:18', '04d2b09f-db11-47fa-a4f0-4566c6bc76c6'),
(309, 309, 'en_us', 'cult-mountain-smfdb', 'videos/cult-mountain-smfdb', 1, '2015-07-09 15:20:18', '2015-07-09 15:20:18', '492460cf-7243-45cc-a97c-e9dc0ce8b499'),
(310, 310, 'en_us', 'da-h-parachute-escape-counseling-official-music-video', 'videos/da-h-parachute-escape-counseling-official-music-video', 1, '2015-07-09 15:20:18', '2015-07-09 15:20:18', '8ff822a9-fcde-4217-95a4-ec91d071b9ed'),
(311, 311, 'en_us', 'king-krule-border-line', 'videos/king-krule-border-line', 1, '2015-07-09 15:20:18', '2015-07-09 15:20:18', '66a814e0-e953-462f-ab88-9504f208c540'),
(312, 312, 'en_us', 'francescasortino-inside-art-gerardo-frisina-mix-featuring-fabrizio-bosso', 'videos/francescasortino-inside-art-gerardo-frisina-mix-featuring-fabrizio-bosso', 1, '2015-07-09 15:20:18', '2015-07-09 15:20:18', 'd760d4a0-ea5b-4944-8c1d-ebeb6894f3f5'),
(313, 313, 'en_us', 'remy-banks-rem-feat-nasty-nigel', 'videos/remy-banks-rem-feat-nasty-nigel', 1, '2015-07-09 15:20:18', '2015-07-09 15:20:18', '7d6b7a6c-dbd3-4786-87df-1237c2167baa'),
(314, 314, 'en_us', 'ddwiwdd-dan-deacon-when-i-was-done-dying-off-the-air-adult-swim', 'videos/ddwiwdd-dan-deacon-when-i-was-done-dying-off-the-air-adult-swim', 1, '2015-07-09 15:20:18', '2015-07-09 15:20:18', '8b6a9846-0960-449d-836f-17a86d15665a'),
(315, 315, 'en_us', 'mac-demarco-my-kind-of-woman-official-video', 'videos/mac-demarco-my-kind-of-woman-official-video', 1, '2015-07-09 15:20:18', '2015-07-09 15:20:18', 'ac9151d5-990b-4a1a-b6e4-85e55edb05d1'),
(316, 316, 'en_us', 'hot-chocolate-emma', 'videos/hot-chocolate-emma', 1, '2015-07-09 15:20:18', '2015-07-09 15:20:18', '786197f1-4d9c-4f6d-8ef5-1467131ee3e7'),
(317, 317, 'en_us', 'oscar-daffodil-days', 'videos/oscar-daffodil-days', 1, '2015-07-09 15:20:18', '2015-07-09 15:20:18', '1f8833ec-eae7-4e92-9bf1-bd788e143909'),
(318, 318, 'en_us', 'klein-open-mind', 'videos/klein-open-mind', 1, '2015-07-09 15:20:18', '2015-07-09 15:20:18', '8a865877-4c15-4256-93ed-f94e5e8ac4a2');
INSERT INTO `craft_elements_i18n` (`id`, `elementId`, `locale`, `slug`, `uri`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(319, 319, 'en_us', 'klein-witch', 'videos/klein-witch', 1, '2015-07-09 15:20:18', '2015-07-09 15:20:18', 'f9729506-fc89-4c0f-a241-9da756042fad'),
(320, 320, 'en_us', 'kali-uchis-rush-official-video', 'videos/kali-uchis-rush-official-video', 1, '2015-07-09 15:20:18', '2015-07-09 15:20:18', '753f3f48-82a1-43b8-b0cc-21a55b7b6786'),
(321, 321, 'en_us', 'man-dont-care-jme-ft-giggs', 'videos/man-dont-care-jme-ft-giggs', 1, '2015-07-09 15:20:18', '2015-07-09 15:20:18', '59cb9d45-f655-43b4-a1bf-a18bc68c8d2b'),
(322, 322, 'en_us', 'death-from-above-1979-virgins-official-video', 'videos/death-from-above-1979-virgins-official-video', 1, '2015-07-09 15:20:18', '2015-07-09 15:20:18', '79160570-1013-47aa-b466-5cdde6f08bbe'),
(323, 323, 'en_us', 'have-mercy-eryn-allen-kane', 'videos/have-mercy-eryn-allen-kane', 1, '2015-07-09 15:20:18', '2015-07-09 15:20:18', '298add56-9f9c-4ae1-923c-09a2bfb506b1'),
(324, 324, 'en_us', 'towkio-wav-theory-prod-towkio-the-social-experiment', 'videos/towkio-wav-theory-prod-towkio-the-social-experiment', 1, '2015-07-09 15:20:18', '2015-07-09 15:20:18', '7601451f-b089-4ded-8ecb-f7cef2f3f9ef'),
(325, 325, 'en_us', 'cousin-brian-disposer', 'videos/cousin-brian-disposer', 1, '2015-07-09 15:20:18', '2015-07-09 15:20:18', '7cb27500-40d3-4a2a-bfac-5a4cee7cd5fc'),
(326, 326, 'en_us', 'private-video-1', 'videos/private-video-1', 1, '2015-07-09 15:20:19', '2015-07-09 15:20:19', '96f111a2-b0fd-4def-97f0-6655e2c9fd2b'),
(327, 327, 'en_us', 'shamir-call-it-off-official-music-video-ytmas', 'videos/shamir-call-it-off-official-music-video-ytmas', 1, '2015-07-09 15:20:19', '2015-07-09 15:20:19', '03cb3009-c645-4a57-b0aa-c4c733424958'),
(328, 328, 'en_us', 'portico-101-feat-joe-newman-official-video', 'videos/portico-101-feat-joe-newman-official-video', 1, '2015-07-09 15:20:19', '2015-07-09 15:20:19', 'eedfeaa1-f105-4d3d-bce5-49eb3bfa86c6'),
(329, 329, 'en_us', 'pins-too-little-too-late', 'videos/pins-too-little-too-late', 1, '2015-07-09 15:20:19', '2015-07-09 15:20:19', '35f744f7-7da6-4dac-ba41-cf66075b5280'),
(330, 330, 'en_us', 'brtsh-knights-outta-your-mind-stuck-on-u', 'videos/brtsh-knights-outta-your-mind-stuck-on-u', 1, '2015-07-09 15:20:19', '2015-07-09 15:20:19', '44edec66-85c3-45a7-a97a-765cb113ac4c'),
(331, 331, 'en_us', 'show-me-the-body-bone-soup', 'videos/show-me-the-body-bone-soup', 1, '2015-07-09 15:20:19', '2015-07-09 15:20:19', '7b79a0ef-ec90-4dae-ab62-c80a1e177ab0'),
(332, 332, 'en_us', 'jamie-xx-loud-places-ft-romy', 'videos/jamie-xx-loud-places-ft-romy', 1, '2015-07-09 15:20:19', '2015-07-09 15:20:19', '78fe180b-6c60-4ffe-b78b-c6ac6c9fab50'),
(333, 333, 'en_us', 'donmonique-pilates-kendall-kylie-miley-official-video', 'videos/donmonique-pilates-kendall-kylie-miley-official-video', 1, '2015-07-09 15:20:19', '2015-07-09 15:20:19', '72a29e59-77d9-4f60-996f-fc96bf71ae39'),
(334, 334, 'en_us', 'okay-kaya-damn-gravity', 'videos/okay-kaya-damn-gravity', 1, '2015-07-09 15:20:19', '2015-07-09 15:20:19', '0a22c0d5-e9d3-4f02-9d32-9cced007a0c8'),
(335, 335, 'en_us', 'dems-wake-official-video', 'videos/dems-wake-official-video', 1, '2015-07-09 15:20:19', '2015-07-09 15:20:19', '434ddc5a-1c7c-49be-9b43-9838f8d0c68b'),
(336, 336, 'en_us', 'perfect-blunt-2-feat-stevie-la-fuhk-sendawg-yt', 'videos/perfect-blunt-2-feat-stevie-la-fuhk-sendawg-yt', 1, '2015-07-09 15:20:19', '2015-07-09 15:20:19', '8534b262-003a-41c7-9cbf-3a57bf6695e3'),
(337, 337, 'en_us', 'andre-jakai-actuality-directed-by-dave-phoenix', 'videos/andre-jakai-actuality-directed-by-dave-phoenix', 1, '2015-07-09 15:20:19', '2015-07-09 15:20:19', '036eb37c-ad82-4bd6-bd33-595a4afd24b5'),
(338, 338, 'en_us', 'squad-deep-antwon-wiki-ft-lee-spielman-prod-by-skywlkr', 'videos/squad-deep-antwon-wiki-ft-lee-spielman-prod-by-skywlkr', 1, '2015-07-09 15:20:19', '2015-07-09 15:20:19', 'd50e65eb-780a-4a39-a4de-bde8dd5f4ca2'),
(339, 339, 'en_us', 'salomon-faye-w-t-f', 'videos/salomon-faye-w-t-f', 1, '2015-07-09 15:20:19', '2015-07-09 15:20:19', 'cfed6ff6-e308-4a56-bef6-5cbe4b29fdc4'),
(340, 340, 'en_us', 'slickyboy-karma', 'videos/slickyboy-karma', 1, '2015-07-09 15:20:19', '2015-07-09 15:20:19', '269e0bc5-5d11-4260-87e6-13bf75372984'),
(341, 341, 'en_us', 'junglepussy-me', 'videos/junglepussy-me', 1, '2015-07-09 15:20:19', '2015-07-09 15:20:19', '4162cc34-59b8-469b-afc2-428a135e3233'),
(342, 342, 'en_us', 'faik-oops', 'videos/faik-oops', 1, '2015-07-09 15:20:19', '2015-07-09 15:20:19', '9744dad8-be6d-4fe5-9458-0fbe91506879'),
(343, 343, 'en_us', 'lee-scott-butter-fly-official-video-prod-dirty-dike', 'videos/lee-scott-butter-fly-official-video-prod-dirty-dike', 1, '2015-07-09 15:20:19', '2015-07-09 15:20:19', '74daf1b2-3087-4d24-a3c2-7d3c7f0683b1'),
(344, 344, 'en_us', 'goldlink-sober-thoughts-official-video', 'videos/goldlink-sober-thoughts-official-video', 1, '2015-07-09 15:20:19', '2015-07-09 15:20:19', '14f8e7f1-cf4c-4bf3-b1d4-21a27e71ed7f'),
(345, 345, 'en_us', 'bok-bok-sweyn-jupiter-papaya-lipgloss', 'videos/bok-bok-sweyn-jupiter-papaya-lipgloss', 1, '2015-07-09 15:20:20', '2015-07-09 15:20:20', 'e0b91523-1732-4b17-ac95-d0b9180bb814'),
(346, 346, 'en_us', 'jfse', 'videos/jfse', 1, '2015-07-09 15:20:20', '2015-07-09 15:20:20', '44525dda-202b-4a27-8cef-e41562ec13d7'),
(347, 347, 'en_us', 'overreacting-under-the-sea-official-video', 'videos/overreacting-under-the-sea-official-video', 1, '2015-07-09 15:20:20', '2015-07-09 15:20:20', 'f44dbcb4-39cf-45b6-b891-edf4b0b2950d'),
(348, 348, 'en_us', 'todd-terje-alfonso-muskedunder-official-video', 'videos/todd-terje-alfonso-muskedunder-official-video', 1, '2015-07-09 15:20:20', '2015-07-09 15:20:20', '49c3a8dc-7062-4574-aa8d-1349d1099e7a'),
(349, 349, 'en_us', 'young-fathers-shame', 'videos/young-fathers-shame', 1, '2015-07-09 15:20:20', '2015-07-09 15:20:20', '126adfaf-dcf7-4595-a773-7d27877d90cb'),
(350, 350, 'en_us', 'illaman-bam-bam-official-video', 'videos/illaman-bam-bam-official-video', 1, '2015-07-09 15:20:20', '2015-07-09 15:20:20', 'd65de8dc-7813-4338-aae2-c31b5e22c80f'),
(351, 351, 'en_us', 'dam-funk-when-im-with-u-i-think-of-her-adolescent-funk', 'videos/dam-funk-when-im-with-u-i-think-of-her-adolescent-funk', 1, '2015-07-09 15:20:20', '2015-07-09 15:20:20', '997e0f94-2b76-4fbb-9b76-3616e183b6a1'),
(352, 352, 'en_us', 'ariel-pink-jell-o-official-video', 'videos/ariel-pink-jell-o-official-video', 1, '2015-07-09 15:20:20', '2015-07-09 15:20:20', 'caa30046-9d48-4088-bd85-aa529a582e91'),
(353, 353, 'en_us', 'towkio-world-turning-feat-joey-purp-prod-caleb-james', 'videos/towkio-world-turning-feat-joey-purp-prod-caleb-james', 1, '2015-07-09 15:20:20', '2015-07-09 15:20:20', '9d0148da-4817-403e-b2ef-2f3c37476b05'),
(354, 354, 'en_us', 'this-will-destroy-you-new-topia-music-video-adult-swim', 'videos/this-will-destroy-you-new-topia-music-video-adult-swim', 1, '2015-07-09 15:20:20', '2015-07-09 15:20:20', '413117f5-89da-404e-b4c6-a858e4082230'),
(355, 355, 'en_us', 'lee-scott-dont-tell-me-official-video-prod-dirty-dike', 'videos/lee-scott-dont-tell-me-official-video-prod-dirty-dike', 1, '2015-07-09 15:20:20', '2015-07-09 15:20:20', '4e8a806c-4123-4881-8d63-8db1bb48b6b4'),
(356, 356, 'en_us', 'james-pants-artificial-lover', 'videos/james-pants-artificial-lover', 1, '2015-07-09 15:20:20', '2015-07-09 15:20:20', '9e4b2bc6-c3cb-49b3-b17c-6aff420659b3'),
(357, 357, 'en_us', 'josiahwise-is-the-serpentwithfeet-curiosity-of-other-men', 'videos/josiahwise-is-the-serpentwithfeet-curiosity-of-other-men', 1, '2015-07-09 15:20:20', '2015-07-09 15:20:20', '1a4c44b9-7e75-4a5f-b2de-535980c50f61'),
(358, 358, 'en_us', 'arca-sad-bitch', 'videos/arca-sad-bitch', 1, '2015-07-09 15:20:20', '2015-07-09 15:20:20', 'b3900475-2054-4268-8729-1885542a4659'),
(359, 359, 'en_us', 'salomon-faye-faye-feat-enasni-leber-official-music-video', 'videos/salomon-faye-faye-feat-enasni-leber-official-music-video', 1, '2015-07-09 15:20:20', '2015-07-09 15:20:20', '793eb15a-05e5-4219-971d-07f939d850ba'),
(360, 360, 'en_us', 'show-me-the-body-space-faithful', 'videos/show-me-the-body-space-faithful', 1, '2015-07-09 15:20:20', '2015-07-09 15:20:20', 'db935e3a-420e-4063-8cfc-6f4e5c321cd0'),
(361, 361, 'en_us', 'save-the-child-life-andre-jakai', 'videos/save-the-child-life-andre-jakai', 1, '2015-07-09 15:20:20', '2015-07-09 15:20:20', '95dd0077-a59f-4f77-a598-6f7eda40dc7b'),
(362, 362, 'en_us', 'henry-wu-just-negotiate-ft-simeon-jones', 'videos/henry-wu-just-negotiate-ft-simeon-jones', 1, '2015-07-09 15:20:20', '2015-07-09 15:20:20', '10298f50-b8c7-49de-b560-b17a0dcda0c5'),
(363, 363, 'en_us', 'danny-lover-jesus-prod-by-19-thou-and-official-video', 'videos/danny-lover-jesus-prod-by-19-thou-and-official-video', 1, '2015-07-09 15:20:20', '2015-07-09 15:20:20', '3ecbae34-9df7-4d95-9189-794a3ab0ec59'),
(364, 364, 'en_us', 'jonwayne-minerals-gems', 'videos/jonwayne-minerals-gems', 1, '2015-07-09 15:20:21', '2015-07-09 15:20:21', '42aa18b9-5a51-4134-ac88-3ade5b150819'),
(365, 365, 'en_us', 'marz-léon-w-h-i-t-e-l-i-o-n-z-official-music-video', 'videos/marz-léon-w-h-i-t-e-l-i-o-n-z-official-music-video', 1, '2015-07-09 15:20:21', '2015-07-09 15:20:21', '1b908e5a-881a-41db-877d-76d190cd0d7f'),
(366, 366, 'en_us', 'lydia-knows-stevie-la-fuhk-feat-yt-sendawg-prod-by-yt', 'videos/lydia-knows-stevie-la-fuhk-feat-yt-sendawg-prod-by-yt', 1, '2015-07-09 15:20:21', '2015-07-09 15:20:21', 'cbeef7fa-7ee9-436e-952c-84b8b4288138'),
(367, 367, 'en_us', 'configa-hastyle-wut-you-got', 'videos/configa-hastyle-wut-you-got', 1, '2015-07-09 15:20:21', '2015-07-09 15:20:21', '1f4348de-65a2-47b6-b6a3-7310eb7d5a57'),
(368, 368, 'en_us', 'poshgod-freeze-me', 'videos/poshgod-freeze-me', 1, '2015-07-09 15:20:21', '2015-07-09 15:20:21', '971024ff-3595-4812-bc96-4748e5c77e01'),
(369, 369, 'en_us', 'skepta-shutdown', 'videos/skepta-shutdown', 1, '2015-07-09 15:20:21', '2015-07-09 15:20:21', '3ec75f22-296a-4260-abe5-5cb15228ce4c'),
(370, 370, 'en_us', 'saba-feat-eryn-allen-kane-burnout-official-video-hotc-tv', 'videos/saba-feat-eryn-allen-kane-burnout-official-video-hotc-tv', 1, '2015-07-09 15:20:21', '2015-07-09 15:20:21', '41ac9938-69f5-4dcb-982f-ebb67b5485cb');

-- --------------------------------------------------------

--
-- Table structure for table `craft_emailmessages`
--

CREATE TABLE IF NOT EXISTS `craft_emailmessages` (
  `id` int(11) NOT NULL,
  `key` char(150) COLLATE utf8_unicode_ci NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `subject` varchar(1000) COLLATE utf8_unicode_ci NOT NULL,
  `body` text COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `craft_entries`
--

CREATE TABLE IF NOT EXISTS `craft_entries` (
  `id` int(11) NOT NULL,
  `sectionId` int(11) NOT NULL,
  `typeId` int(11) DEFAULT NULL,
  `authorId` int(11) DEFAULT NULL,
  `postDate` datetime DEFAULT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `craft_entries`
--

INSERT INTO `craft_entries` (`id`, `sectionId`, `typeId`, `authorId`, `postDate`, `expiryDate`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(2, 1, NULL, NULL, '2015-06-25 14:04:24', NULL, '2015-06-25 14:04:24', '2015-06-25 14:04:24', '90fae003-b9ab-46fc-97e3-af486014364d'),
(4, 3, NULL, NULL, '2015-06-25 14:29:31', NULL, '2015-06-25 14:29:31', '2015-06-25 14:29:31', 'a26bcb43-e2fe-4fed-9504-b6364774b153'),
(5, 4, NULL, NULL, '2015-06-25 14:29:40', NULL, '2015-06-25 14:29:40', '2015-06-25 14:29:40', '7ff9f3c9-df6b-4ae9-97bd-c990a493cd52'),
(64, 2, 2, 1, '2015-07-09 15:20:06', NULL, '2015-07-09 15:20:06', '2015-07-09 15:20:06', 'e992893f-6467-4692-b49c-2d3b2735a080'),
(65, 2, 2, 1, '2015-07-09 15:20:06', NULL, '2015-07-09 15:20:06', '2015-07-09 15:20:06', '713a82d6-2621-4c33-8486-152a438da19b'),
(66, 2, 2, 1, '2015-07-09 15:20:06', NULL, '2015-07-09 15:20:06', '2015-07-09 15:20:06', 'afcd3609-917b-4b91-9d69-9ffdb1cf7204'),
(67, 2, 2, 1, '2015-07-09 15:20:06', NULL, '2015-07-09 15:20:06', '2015-07-09 15:20:06', '5326c88d-32cc-40e2-ab11-f5475c8dfe08'),
(68, 2, 2, 1, '2015-07-09 15:20:06', NULL, '2015-07-09 15:20:06', '2015-07-09 15:20:06', '76bdd048-193c-4cef-8271-0e470dfeda63'),
(69, 2, 2, 1, '2015-07-09 15:20:06', NULL, '2015-07-09 15:20:06', '2015-07-09 15:20:06', '128e7928-c49e-4341-844e-8391e9d295b8'),
(70, 2, 2, 1, '2015-07-09 15:20:06', NULL, '2015-07-09 15:20:06', '2015-07-09 15:20:06', '8d8221db-58de-43c5-8257-051fcad08a86'),
(71, 2, 2, 1, '2015-07-09 15:20:06', NULL, '2015-07-09 15:20:06', '2015-07-09 15:20:06', 'c252cb40-263e-4da9-99a6-293ab80e9f48'),
(72, 2, 2, 1, '2015-07-09 15:20:06', NULL, '2015-07-09 15:20:06', '2015-07-09 15:20:06', 'f373d202-496e-4053-a13c-1c9667e6a1c1'),
(73, 2, 2, 1, '2015-07-09 15:20:07', NULL, '2015-07-09 15:20:07', '2015-07-09 15:20:07', 'e4dca1f0-46f6-45ba-9dba-63d018dac36e'),
(74, 2, 2, 1, '2015-07-09 15:20:07', NULL, '2015-07-09 15:20:07', '2015-07-09 15:20:07', '60f71e3e-03bd-46d7-b379-2fe5f6467723'),
(75, 2, 2, 1, '2015-07-09 15:20:07', NULL, '2015-07-09 15:20:07', '2015-07-09 15:20:07', '8daad614-a310-4ce7-9d3d-f4becd61ea95'),
(76, 2, 2, 1, '2015-07-09 15:20:07', NULL, '2015-07-09 15:20:07', '2015-07-09 15:20:07', '6c753cac-8b86-4b29-aee7-17c782ce8b08'),
(77, 2, 2, 1, '2015-07-09 15:20:07', NULL, '2015-07-09 15:20:07', '2015-07-09 15:20:07', '3d1f2161-c7fc-4efb-af62-a90864b3d72e'),
(78, 2, 2, 1, '2015-07-09 15:20:07', NULL, '2015-07-09 15:20:07', '2015-07-09 15:20:07', 'cda77d6a-f3e0-4349-9e25-ea34d446bf42'),
(79, 2, 2, 1, '2015-07-09 15:20:07', NULL, '2015-07-09 15:20:07', '2015-07-09 15:20:07', '71874f44-a1fa-4aa0-a5df-42c32024321b'),
(80, 2, 2, 1, '2015-07-09 15:20:07', NULL, '2015-07-09 15:20:07', '2015-07-09 15:20:07', '14a92eaa-9e50-4346-8aad-0161b7add587'),
(81, 2, 2, 1, '2015-07-09 15:20:07', NULL, '2015-07-09 15:20:07', '2015-07-09 15:20:07', 'bca3e7f6-6046-4f76-b985-2254774d68ab'),
(82, 2, 2, 1, '2015-07-09 15:20:07', NULL, '2015-07-09 15:20:07', '2015-07-09 15:20:07', '5c9b8bf7-0e81-45aa-b46f-9f0d33b63416'),
(83, 2, 2, 1, '2015-07-09 15:20:07', NULL, '2015-07-09 15:20:07', '2015-07-09 15:20:07', '3a9b65d4-239e-41b1-9d77-6b46c56c5d21'),
(84, 2, 2, 1, '2015-07-09 15:20:07', NULL, '2015-07-09 15:20:07', '2015-07-09 15:20:07', '88df6965-781b-4adb-8b9c-c36e3b4d5e2b'),
(85, 2, 2, 1, '2015-07-09 15:20:07', NULL, '2015-07-09 15:20:07', '2015-07-09 15:20:07', 'a56d1b65-56be-4eb5-9fce-d9aec7b472e7'),
(86, 2, 2, 1, '2015-07-09 15:20:07', NULL, '2015-07-09 15:20:07', '2015-07-09 15:20:07', '836cfbef-ae3d-44df-b4e4-988cd1a2d12c'),
(87, 2, 2, 1, '2015-07-09 15:20:07', NULL, '2015-07-09 15:20:07', '2015-07-09 15:20:07', 'cad22a59-599a-4f22-9939-af742de11c14'),
(88, 2, 2, 1, '2015-07-09 15:20:07', NULL, '2015-07-09 15:20:07', '2015-07-09 15:20:07', 'c7433540-d606-45be-8d7e-7a759f9efbd3'),
(89, 2, 2, 1, '2015-07-09 15:20:07', NULL, '2015-07-09 15:20:07', '2015-07-09 15:20:07', '6d00850d-5d5f-4130-82c1-ca5a8ffc3685'),
(90, 2, 2, 1, '2015-07-09 15:20:07', NULL, '2015-07-09 15:20:07', '2015-07-09 15:20:07', 'e21212c8-2e4d-45e3-9b82-5de2f0e8a9f7'),
(91, 2, 2, 1, '2015-07-09 15:20:07', NULL, '2015-07-09 15:20:07', '2015-07-09 15:20:07', 'f39e4774-24a5-4413-b662-1a47211a49de'),
(92, 2, 2, 1, '2015-07-09 15:20:07', NULL, '2015-07-09 15:20:07', '2015-07-09 15:20:07', '6cd84a7c-d4d3-442d-856d-46c7a76a67c0'),
(93, 2, 2, 1, '2015-07-09 15:20:07', NULL, '2015-07-09 15:20:07', '2015-07-09 15:20:07', 'a7ed85d9-4dfc-42b2-bb08-61eed7aae630'),
(94, 2, 2, 1, '2015-07-09 15:20:07', NULL, '2015-07-09 15:20:07', '2015-07-09 15:20:07', '67e102d7-ebb0-417c-aee3-c641d6ec1687'),
(95, 2, 2, 1, '2015-07-09 15:20:07', NULL, '2015-07-09 15:20:07', '2015-07-09 15:20:07', '4c984698-fad6-4931-8cde-a347c77e55e1'),
(96, 2, 2, 1, '2015-07-09 15:20:08', NULL, '2015-07-09 15:20:08', '2015-07-09 15:20:08', '22e5b0f9-bce3-44ea-a6be-cf076efb3689'),
(97, 2, 2, 1, '2015-07-09 15:20:08', NULL, '2015-07-09 15:20:08', '2015-07-09 15:20:08', '7991eacc-f21f-4d02-90fc-e769f56b7ba1'),
(98, 2, 2, 1, '2015-07-09 15:20:08', NULL, '2015-07-09 15:20:08', '2015-07-09 15:20:08', '076a8889-4a35-49b2-a074-01dd691b1e0b'),
(99, 2, 2, 1, '2015-07-09 15:20:08', NULL, '2015-07-09 15:20:08', '2015-07-09 15:20:08', '2123321f-5142-4baa-9a42-41b970256eb8'),
(100, 2, 2, 1, '2015-07-09 15:20:08', NULL, '2015-07-09 15:20:08', '2015-07-09 15:20:08', '298acb1c-816f-4344-859a-09689fadc628'),
(101, 2, 2, 1, '2015-07-09 15:20:08', NULL, '2015-07-09 15:20:08', '2015-07-09 15:20:08', '3345680f-86b6-4b33-94df-43bef0029788'),
(102, 2, 2, 1, '2015-07-09 15:20:08', NULL, '2015-07-09 15:20:08', '2015-07-09 15:20:08', 'b1e02f4f-ad72-4e5c-879b-2d737eb68752'),
(103, 2, 2, 1, '2015-07-09 15:20:08', NULL, '2015-07-09 15:20:08', '2015-07-09 15:20:08', '6bd975d6-3eb6-45bf-acb1-a114b7dcfac9'),
(104, 2, 2, 1, '2015-07-09 15:20:08', NULL, '2015-07-09 15:20:08', '2015-07-09 15:20:08', 'c180cbd4-dad8-4607-b0c9-00ff1f33d893'),
(105, 2, 2, 1, '2015-07-09 15:20:08', NULL, '2015-07-09 15:20:08', '2015-07-09 15:20:08', 'd8bdb3e2-2b0f-49a1-9364-fde3789357d3'),
(106, 2, 2, 1, '2015-07-09 15:20:08', NULL, '2015-07-09 15:20:08', '2015-07-09 15:20:08', '7ee13089-da07-4fba-8aed-70106f7f5966'),
(107, 2, 2, 1, '2015-07-09 15:20:08', NULL, '2015-07-09 15:20:08', '2015-07-09 15:20:08', 'b0877ce9-9f22-4614-a1ea-fc1a38cc8168'),
(108, 2, 2, 1, '2015-07-09 15:20:08', NULL, '2015-07-09 15:20:08', '2015-07-09 15:20:08', '1b2850d7-d494-4d31-9bf4-e7b871398ce0'),
(109, 2, 2, 1, '2015-07-09 15:20:08', NULL, '2015-07-09 15:20:08', '2015-07-09 15:20:08', '1af5a12d-db21-4ec4-9178-b112cdb35253'),
(110, 2, 2, 1, '2015-07-09 15:20:08', NULL, '2015-07-09 15:20:08', '2015-07-09 15:20:08', '821ad273-bcae-4e5b-9538-2f438c7deaf3'),
(111, 2, 2, 1, '2015-07-09 15:20:08', NULL, '2015-07-09 15:20:08', '2015-07-09 15:20:08', 'bf1b00b2-4610-4f53-b162-c70e3837d469'),
(112, 2, 2, 1, '2015-07-09 15:20:08', NULL, '2015-07-09 15:20:08', '2015-07-09 15:20:08', '031a26f7-39c0-4890-b937-3be386c472e8'),
(113, 2, 2, 1, '2015-07-09 15:20:08', NULL, '2015-07-09 15:20:08', '2015-07-09 15:20:08', '963bcc78-923d-4d55-b3a2-594a03ae9464'),
(114, 2, 2, 1, '2015-07-09 15:20:08', NULL, '2015-07-09 15:20:08', '2015-07-09 15:20:08', '23aa99ad-0c85-4d07-9fcb-93e6769519c6'),
(115, 2, 2, 1, '2015-07-09 15:20:08', NULL, '2015-07-09 15:20:08', '2015-07-09 15:20:08', 'dd876b8f-e05e-456b-ae15-18138f5669e2'),
(116, 2, 2, 1, '2015-07-09 15:20:08', NULL, '2015-07-09 15:20:08', '2015-07-09 15:20:08', '072f937f-2239-4e32-bec2-aeb8ec6f9560'),
(117, 2, 2, 1, '2015-07-09 15:20:08', NULL, '2015-07-09 15:20:09', '2015-07-09 15:20:09', '23b3c337-4778-4776-a3d2-0b0a9cf56577'),
(118, 2, 2, 1, '2015-07-09 15:20:09', NULL, '2015-07-09 15:20:09', '2015-07-09 15:20:09', '098e84a6-bfbb-459e-a337-1c18b343e1cc'),
(119, 2, 2, 1, '2015-07-09 15:20:09', NULL, '2015-07-09 15:20:09', '2015-07-09 15:20:09', '1a40f95b-6a17-4602-a5a4-05027dd1d9f7'),
(120, 2, 2, 1, '2015-07-09 15:20:09', NULL, '2015-07-09 15:20:09', '2015-07-09 15:20:09', 'd503839e-7746-4ff0-b74e-2e323c2e1533'),
(121, 2, 2, 1, '2015-07-09 15:20:09', NULL, '2015-07-09 15:20:09', '2015-07-09 15:20:09', 'a1e64492-d079-4a87-95a5-fcb28e7cc49d'),
(122, 2, 2, 1, '2015-07-09 15:20:09', NULL, '2015-07-09 15:20:09', '2015-07-09 15:20:09', '49e81770-6de9-4768-afbb-d3733b9eddaf'),
(123, 2, 2, 1, '2015-07-09 15:20:09', NULL, '2015-07-09 15:20:09', '2015-07-09 15:20:09', 'f9885b67-8a0b-4704-b0df-1821f881fddb'),
(124, 2, 2, 1, '2015-07-09 15:20:09', NULL, '2015-07-09 15:20:09', '2015-07-09 15:20:09', '9834cf8e-6b7f-4d10-b257-e8550a847bcc'),
(125, 2, 2, 1, '2015-07-09 15:20:09', NULL, '2015-07-09 15:20:09', '2015-07-09 15:20:09', 'c938582b-ece1-4678-afcc-1aa8e956c086'),
(126, 2, 2, 1, '2015-07-09 15:20:09', NULL, '2015-07-09 15:20:09', '2015-07-09 15:20:09', '0b1273ea-1ef9-4913-a3b5-18f88ee3f893'),
(127, 2, 2, 1, '2015-07-09 15:20:09', NULL, '2015-07-09 15:20:09', '2015-07-09 15:20:09', 'fe3dc3fc-2bf6-438d-aa88-50cb9a569c6e'),
(128, 2, 2, 1, '2015-07-09 15:20:09', NULL, '2015-07-09 15:20:09', '2015-07-09 15:20:09', '25f7af91-c215-4ee7-9541-6dc3f155b875'),
(129, 2, 2, 1, '2015-07-09 15:20:09', NULL, '2015-07-09 15:20:09', '2015-07-09 15:20:09', 'c4b43494-d4a2-437f-90c4-56f7ea38e309'),
(130, 2, 2, 1, '2015-07-09 15:20:09', NULL, '2015-07-09 15:20:09', '2015-07-09 15:20:09', '1fc2bec0-163a-40b8-b13e-5365c891e7c3'),
(131, 2, 2, 1, '2015-07-09 15:20:09', NULL, '2015-07-09 15:20:09', '2015-07-09 15:20:09', 'f5439336-a401-4108-9e8b-badee42ae27c'),
(132, 2, 2, 1, '2015-07-09 15:20:09', NULL, '2015-07-09 15:20:09', '2015-07-09 15:20:09', 'aa84c713-75bf-43b9-a705-d0f4ea449228'),
(133, 2, 2, 1, '2015-07-09 15:20:09', NULL, '2015-07-09 15:20:09', '2015-07-09 15:20:09', '7a213eb6-d514-49a3-b5dc-0771cded6404'),
(134, 2, 2, 1, '2015-07-09 15:20:09', NULL, '2015-07-09 15:20:09', '2015-07-09 15:20:09', 'a3f47ab4-0bc3-4441-89f7-d00404deef13'),
(135, 2, 2, 1, '2015-07-09 15:20:09', NULL, '2015-07-09 15:20:09', '2015-07-09 15:20:09', '7c914e20-1718-4101-afac-33e78a10acd0'),
(136, 2, 2, 1, '2015-07-09 15:20:09', NULL, '2015-07-09 15:20:09', '2015-07-09 15:20:09', 'accf3c3d-8dc9-4098-b079-e0ca557cad4a'),
(137, 2, 2, 1, '2015-07-09 15:20:09', NULL, '2015-07-09 15:20:09', '2015-07-09 15:20:09', 'a19f52a0-fb26-4722-a9f8-a0feadd8407f'),
(138, 2, 2, 1, '2015-07-09 15:20:09', NULL, '2015-07-09 15:20:09', '2015-07-09 15:20:09', 'bcd52da2-e746-4f2c-aaf6-ab02e73a4859'),
(139, 2, 2, 1, '2015-07-09 15:20:09', NULL, '2015-07-09 15:20:09', '2015-07-09 15:20:09', 'e89b588c-838c-4d43-adc0-3ff561958c83'),
(140, 2, 2, 1, '2015-07-09 15:20:09', NULL, '2015-07-09 15:20:10', '2015-07-09 15:20:10', 'ebe5652f-c73c-4404-b5ff-a94bc4f7509e'),
(141, 2, 2, 1, '2015-07-09 15:20:10', NULL, '2015-07-09 15:20:10', '2015-07-09 15:20:10', '53e748c6-a473-4667-848f-783796e42c97'),
(142, 2, 2, 1, '2015-07-09 15:20:10', NULL, '2015-07-09 15:20:10', '2015-07-09 15:20:10', 'ca01a60d-123a-439c-8a06-b19fd8d2fc30'),
(143, 2, 2, 1, '2015-07-09 15:20:10', NULL, '2015-07-09 15:20:10', '2015-07-09 15:20:10', '52db2df8-274f-470b-8706-d06bb8627b6e'),
(144, 2, 2, 1, '2015-07-09 15:20:10', NULL, '2015-07-09 15:20:10', '2015-07-09 15:20:10', '5ffec817-7919-487c-b5f8-a69a694a1a3c'),
(145, 2, 2, 1, '2015-07-09 15:20:10', NULL, '2015-07-09 15:20:10', '2015-07-09 15:20:10', 'a009f63d-817f-4a55-a4b0-83d25b0c11d1'),
(146, 2, 2, 1, '2015-07-09 15:20:10', NULL, '2015-07-09 15:20:10', '2015-07-09 15:20:10', 'e10a0328-da5a-4d9e-82b5-5b100534c540'),
(147, 2, 2, 1, '2015-07-09 15:20:10', NULL, '2015-07-09 15:20:10', '2015-07-09 15:20:10', 'fa7abc0f-a347-4b3e-a273-8dcfde5704f7'),
(148, 2, 2, 1, '2015-07-09 15:20:10', NULL, '2015-07-09 15:20:10', '2015-07-09 15:20:10', '4faa1f57-917b-41f6-bb42-22d1afd0977a'),
(149, 2, 2, 1, '2015-07-09 15:20:10', NULL, '2015-07-09 15:20:10', '2015-07-09 15:20:10', '66a06952-01dc-425a-aa04-37cded93e332'),
(150, 2, 2, 1, '2015-07-09 15:20:10', NULL, '2015-07-09 15:20:10', '2015-07-09 15:20:10', '3858bbcb-4fb0-40bf-96cf-8038289739d2'),
(151, 2, 2, 1, '2015-07-09 15:20:10', NULL, '2015-07-09 15:20:10', '2015-07-09 15:20:10', 'cfa0f8e9-59f8-456a-9e04-4968ae26c9f6'),
(152, 2, 2, 1, '2015-07-09 15:20:10', NULL, '2015-07-09 15:20:10', '2015-07-09 15:20:10', 'f40fc1e8-0e61-4b5d-a3fd-00e94ac0109c'),
(153, 2, 2, 1, '2015-07-09 15:20:10', NULL, '2015-07-09 15:20:10', '2015-07-09 15:20:10', 'ae6d0451-e80e-46c3-ab41-a283c3a78953'),
(154, 2, 2, 1, '2015-07-09 15:20:10', NULL, '2015-07-09 15:20:10', '2015-07-09 15:20:10', '338241f0-7456-408b-a508-f83296267d15'),
(155, 2, 2, 1, '2015-07-09 15:20:10', NULL, '2015-07-09 15:20:10', '2015-07-09 15:20:10', 'd583c129-8d30-41c6-b808-7f0d0a2dc966'),
(156, 2, 2, 1, '2015-07-09 15:20:10', NULL, '2015-07-09 15:20:10', '2015-07-09 15:20:10', '4c84a83e-cee4-4d12-bc43-d4ec0dde38d3'),
(157, 2, 2, 1, '2015-07-09 15:20:10', NULL, '2015-07-09 15:20:10', '2015-07-09 15:20:10', '02ed68e0-114f-4c4f-b011-7e4e3e382b55'),
(158, 2, 2, 1, '2015-07-09 15:20:10', NULL, '2015-07-09 15:20:10', '2015-07-09 15:20:10', 'e6cd7791-c0a3-4d40-8f00-639dbc7cff97'),
(159, 2, 2, 1, '2015-07-09 15:20:10', NULL, '2015-07-09 15:20:10', '2015-07-09 15:20:10', '20f96a91-f0dc-47da-b203-670a7e761824'),
(160, 2, 2, 1, '2015-07-09 15:20:10', NULL, '2015-07-09 15:20:10', '2015-07-09 15:20:10', '138387fa-4718-4655-a99e-14ad844aca56'),
(161, 2, 2, 1, '2015-07-09 15:20:10', NULL, '2015-07-09 15:20:10', '2015-07-09 15:20:10', '1e8abe8e-6602-474b-b5e1-140b28a141ec'),
(162, 2, 2, 1, '2015-07-09 15:20:10', NULL, '2015-07-09 15:20:10', '2015-07-09 15:20:10', 'd075fb60-534d-4d53-b1f5-17aacb1d8802'),
(163, 2, 2, 1, '2015-07-09 15:20:10', NULL, '2015-07-09 15:20:11', '2015-07-09 15:20:11', '996eec0f-0ca4-4dfd-84c2-c163deb40d86'),
(164, 2, 2, 1, '2015-07-09 15:20:11', NULL, '2015-07-09 15:20:11', '2015-07-09 15:20:11', 'cf5c299a-6469-4b30-8354-9cbd1952c85e'),
(165, 2, 2, 1, '2015-07-09 15:20:11', NULL, '2015-07-09 15:20:11', '2015-07-09 15:20:11', '8e2f9c19-759c-4f89-ae06-5f4bb1073e33'),
(166, 2, 2, 1, '2015-07-09 15:20:11', NULL, '2015-07-09 15:20:11', '2015-07-09 15:20:11', '381da3bf-24b3-48df-8406-4a1fabfa4da0'),
(167, 2, 2, 1, '2015-07-09 15:20:11', NULL, '2015-07-09 15:20:11', '2015-07-09 15:20:11', '3225cf84-ffe3-4b39-9b90-97703ca56492'),
(168, 2, 2, 1, '2015-07-09 15:20:11', NULL, '2015-07-09 15:20:11', '2015-07-09 15:20:11', 'a8921abf-679b-486e-bbb8-424c60ad26bf'),
(169, 2, 2, 1, '2015-07-09 15:20:11', NULL, '2015-07-09 15:20:11', '2015-07-09 15:20:11', '8a425380-77c4-4e72-9479-2a1e9d114a3c'),
(170, 2, 2, 1, '2015-07-09 15:20:11', NULL, '2015-07-09 15:20:11', '2015-07-09 15:20:11', 'f28d3b5b-db5d-429f-a8be-c0d5123e43fe'),
(171, 2, 2, 1, '2015-07-09 15:20:11', NULL, '2015-07-09 15:20:11', '2015-07-09 15:20:11', '2e283dda-ca47-4226-889e-4c48c48ae059'),
(172, 2, 2, 1, '2015-07-09 15:20:11', NULL, '2015-07-09 15:20:11', '2015-07-09 15:20:11', 'db6ab951-4f35-4d93-9e42-be3d667088a2'),
(173, 2, 2, 1, '2015-07-09 15:20:11', NULL, '2015-07-09 15:20:11', '2015-07-09 15:20:11', '17a3eb6f-e1cd-4792-a0fc-abb0e1e6f74d'),
(174, 2, 2, 1, '2015-07-09 15:20:11', NULL, '2015-07-09 15:20:11', '2015-07-09 15:20:11', 'ff18a1aa-2859-4bad-98c3-5a92f9cb7c6c'),
(175, 2, 2, 1, '2015-07-09 15:20:11', NULL, '2015-07-09 15:20:11', '2015-07-09 15:20:11', 'cef342cd-4582-4901-b007-309e837cf492'),
(176, 2, 2, 1, '2015-07-09 15:20:11', NULL, '2015-07-09 15:20:11', '2015-07-09 15:20:11', '97a583b0-a074-4031-8bab-65673e83ae0a'),
(177, 2, 2, 1, '2015-07-09 15:20:11', NULL, '2015-07-09 15:20:11', '2015-07-09 15:20:11', '1f268f14-de40-4148-80f2-3e4a4a469bf4'),
(178, 2, 2, 1, '2015-07-09 15:20:11', NULL, '2015-07-09 15:20:11', '2015-07-09 15:20:11', '97cf2f15-1bf6-416e-87e0-d10b3417a8ab'),
(179, 2, 2, 1, '2015-07-09 15:20:11', NULL, '2015-07-09 15:20:11', '2015-07-09 15:20:11', 'c2b191c0-7b2a-4db3-ad45-d597400c48c0'),
(180, 2, 2, 1, '2015-07-09 15:20:11', NULL, '2015-07-09 15:20:11', '2015-07-09 15:20:11', '1741ed95-9d54-42bc-929e-92375c0caae4'),
(181, 2, 2, 1, '2015-07-09 15:20:11', NULL, '2015-07-09 15:20:11', '2015-07-09 15:20:11', '7088490e-6b53-47c3-9dc2-d03408b14553'),
(182, 2, 2, 1, '2015-07-09 15:20:11', NULL, '2015-07-09 15:20:11', '2015-07-09 15:20:11', '67d4ea4a-36ce-4fd3-bf5a-c9df5c166749'),
(183, 2, 2, 1, '2015-07-09 15:20:11', NULL, '2015-07-09 15:20:11', '2015-07-09 15:20:11', 'd4889c26-da0d-4aaa-9fb2-c776b7f3791f'),
(184, 2, 2, 1, '2015-07-09 15:20:11', NULL, '2015-07-09 15:20:11', '2015-07-09 15:20:11', 'fdefc38a-9c5c-408c-95e6-75d578429a41'),
(185, 2, 2, 1, '2015-07-09 15:20:11', NULL, '2015-07-09 15:20:11', '2015-07-09 15:20:11', 'f4c51078-5f59-470d-9534-3aa5645e182e'),
(186, 2, 2, 1, '2015-07-09 15:20:11', NULL, '2015-07-09 15:20:12', '2015-07-09 15:20:12', '0a49fb40-0de2-4291-999f-667148af002b'),
(187, 2, 2, 1, '2015-07-09 15:20:12', NULL, '2015-07-09 15:20:12', '2015-07-09 15:20:12', '0f2c3463-25a8-4e0c-9415-9922697db1ea'),
(188, 2, 2, 1, '2015-07-09 15:20:12', NULL, '2015-07-09 15:20:12', '2015-07-09 15:20:12', '1f8c7235-0e27-4ce1-88d2-5f01f3345add'),
(189, 2, 2, 1, '2015-07-09 15:20:12', NULL, '2015-07-09 15:20:12', '2015-07-09 15:20:12', 'fc55df36-d33e-4e5b-99f0-20ea7d1b5526'),
(190, 2, 2, 1, '2015-07-09 15:20:12', NULL, '2015-07-09 15:20:12', '2015-07-09 15:20:12', '23136842-4b14-4df7-aa92-15042385a992'),
(191, 2, 2, 1, '2015-07-09 15:20:12', NULL, '2015-07-09 15:20:12', '2015-07-09 15:20:12', '6e28ec56-f77d-4589-862b-ce074958dd43'),
(192, 2, 2, 1, '2015-07-09 15:20:12', NULL, '2015-07-09 15:20:12', '2015-07-09 15:20:12', 'c0818cc1-7791-4a91-aa96-54e4877ac9ef'),
(193, 2, 2, 1, '2015-07-09 15:20:12', NULL, '2015-07-09 15:20:12', '2015-07-09 15:20:12', 'e75b1342-0692-4154-9560-88d3d4bd0343'),
(194, 2, 2, 1, '2015-07-09 15:20:12', NULL, '2015-07-09 15:20:12', '2015-07-09 15:20:12', 'f151f344-db32-48e2-8767-aa1392a2d4c2'),
(195, 2, 2, 1, '2015-07-09 15:20:12', NULL, '2015-07-09 15:20:12', '2015-07-09 15:20:12', '54dfd5ab-724c-4325-aff1-5cd1f2a840f3'),
(196, 2, 2, 1, '2015-07-09 15:20:12', NULL, '2015-07-09 15:20:12', '2015-07-09 15:20:12', 'ac74bedd-fcc1-46f5-b314-75dbddcdb2c1'),
(197, 2, 2, 1, '2015-07-09 15:20:12', NULL, '2015-07-09 15:20:12', '2015-07-09 15:20:12', '09cf0617-e763-4a35-a343-cc8b31e99083'),
(198, 2, 2, 1, '2015-07-09 15:20:12', NULL, '2015-07-09 15:20:12', '2015-07-09 15:20:12', 'cbf1cbc6-8198-465a-8ba1-ff7026bfdd32'),
(199, 2, 2, 1, '2015-07-09 15:20:12', NULL, '2015-07-09 15:20:12', '2015-07-09 15:20:12', 'b0bbe9d2-3dd6-4ded-8ca0-e9bbbcdbb8f6'),
(200, 2, 2, 1, '2015-07-09 15:20:12', NULL, '2015-07-09 15:20:12', '2015-07-09 15:20:12', 'bea7519d-1745-43cb-8742-70432fddd71a'),
(201, 2, 2, 1, '2015-07-09 15:20:12', NULL, '2015-07-09 15:20:12', '2015-07-09 15:20:12', '92ec87fe-6949-45ca-ae2a-e6d0d1d0e119'),
(202, 2, 2, 1, '2015-07-09 15:20:12', NULL, '2015-07-09 15:20:12', '2015-07-09 15:20:12', '94f6f8b7-3e19-48ce-87e2-32cf1ebfd5e5'),
(203, 2, 2, 1, '2015-07-09 15:20:12', NULL, '2015-07-09 15:20:12', '2015-07-09 15:20:12', '53e622c9-1fd1-4340-b0a3-3f7c61bd2448'),
(204, 2, 2, 1, '2015-07-09 15:20:12', NULL, '2015-07-09 15:20:12', '2015-07-09 15:20:12', 'd1f5291a-f515-4613-812d-2a1f018fa3ed'),
(205, 2, 2, 1, '2015-07-09 15:20:12', NULL, '2015-07-09 15:20:12', '2015-07-09 15:20:12', '7a1e5ec3-842a-446a-bbff-ba99216da5ff'),
(206, 2, 2, 1, '2015-07-09 15:20:12', NULL, '2015-07-09 15:20:12', '2015-07-09 15:20:12', 'cf23c3e6-1a50-40a1-b96c-45c76ba204b1'),
(207, 2, 2, 1, '2015-07-09 15:20:12', NULL, '2015-07-09 15:20:12', '2015-07-09 15:20:12', 'a9b5d973-3a9c-4060-8706-867e4b9758a5'),
(208, 2, 2, 1, '2015-07-09 15:20:12', NULL, '2015-07-09 15:20:12', '2015-07-09 15:20:12', 'c60d36a7-d186-43aa-bd7a-75dd779ac1ab'),
(209, 2, 2, 1, '2015-07-09 15:20:12', NULL, '2015-07-09 15:20:12', '2015-07-09 15:20:12', 'd80522af-96b2-4ebd-a73e-e8b2fd4c56f6'),
(210, 2, 2, 1, '2015-07-09 15:20:13', NULL, '2015-07-09 15:20:13', '2015-07-09 15:20:13', '8f3bba26-0199-48d0-810e-9fc8c5e100a7'),
(211, 2, 2, 1, '2015-07-09 15:20:13', NULL, '2015-07-09 15:20:13', '2015-07-09 15:20:13', 'ee0c9079-e3b5-4e60-9dc0-de876ea66d1a'),
(212, 2, 2, 1, '2015-07-09 15:20:13', NULL, '2015-07-09 15:20:13', '2015-07-09 15:20:13', '51cb52e6-6d60-458b-8470-c7dba21f36e2'),
(213, 2, 2, 1, '2015-07-09 15:20:13', NULL, '2015-07-09 15:20:13', '2015-07-09 15:20:13', '08410ea0-91e0-43a5-a350-52bf356e9f85'),
(214, 2, 2, 1, '2015-07-09 15:20:13', NULL, '2015-07-09 15:20:13', '2015-07-09 15:20:13', 'bb87eefe-5b15-46e9-a794-3ae668c81bbb'),
(215, 2, 2, 1, '2015-07-09 15:20:13', NULL, '2015-07-09 15:20:13', '2015-07-09 15:20:13', '4d8e11dc-b467-4785-a5df-92859a8ee375'),
(216, 2, 2, 1, '2015-07-09 15:20:13', NULL, '2015-07-09 15:20:13', '2015-07-09 15:20:13', '46e20053-c680-4bc7-95e4-c6876d43049d'),
(217, 2, 2, 1, '2015-07-09 15:20:13', NULL, '2015-07-09 15:20:13', '2015-07-09 15:20:13', '5a0d0dc3-6321-467d-83f9-513a170e4e51'),
(218, 2, 2, 1, '2015-07-09 15:20:13', NULL, '2015-07-09 15:20:13', '2015-07-09 15:20:13', 'd692661e-0354-4c41-b421-f4bb1290fb0b'),
(219, 2, 2, 1, '2015-07-09 15:20:13', NULL, '2015-07-09 15:20:13', '2015-07-09 15:20:13', '3ad8c304-41c4-4883-8d47-bbda0fddaf47'),
(220, 2, 2, 1, '2015-07-09 15:20:13', NULL, '2015-07-09 15:20:13', '2015-07-09 15:20:13', '868eb8cf-5b50-4725-9ff6-c21054840bc7'),
(221, 2, 2, 1, '2015-07-09 15:20:13', NULL, '2015-07-09 15:20:13', '2015-07-09 15:20:13', 'afe49f7e-1996-4e48-a799-eedee529e933'),
(222, 2, 2, 1, '2015-07-09 15:20:13', NULL, '2015-07-09 15:20:13', '2015-07-09 15:20:13', 'e9dbd1de-71b5-4ba4-9d8d-03af1c291d83'),
(223, 2, 2, 1, '2015-07-09 15:20:13', NULL, '2015-07-09 15:20:13', '2015-07-09 15:20:13', '34d73cae-c01a-47b6-9104-ded854a4882f'),
(224, 2, 2, 1, '2015-07-09 15:20:13', NULL, '2015-07-09 15:20:13', '2015-07-09 15:20:13', '51ec0c5a-77cf-445d-b34a-867f7340c19b'),
(225, 2, 2, 1, '2015-07-09 15:20:13', NULL, '2015-07-09 15:20:13', '2015-07-09 15:20:13', '86c2ba9a-78cc-4346-b8f2-9582978fbb69'),
(226, 2, 2, 1, '2015-07-09 15:20:13', NULL, '2015-07-09 15:20:13', '2015-07-09 15:20:13', '7be2d871-5df1-48b1-8975-a5e37e863c9b'),
(227, 2, 2, 1, '2015-07-09 15:20:13', NULL, '2015-07-09 15:20:13', '2015-07-09 15:20:13', '5f9a5f90-494d-4206-b284-8bc232496a1f'),
(228, 2, 2, 1, '2015-07-09 15:20:13', NULL, '2015-07-09 15:20:13', '2015-07-09 15:20:13', 'b7445ffa-e7fe-44d7-b28b-c4acfaa45e68'),
(229, 2, 2, 1, '2015-07-09 15:20:13', NULL, '2015-07-09 15:20:13', '2015-07-09 15:20:13', '84af45f7-7a39-4f2b-9225-88c50b7c2211'),
(230, 2, 2, 1, '2015-07-09 15:20:13', NULL, '2015-07-09 15:20:13', '2015-07-09 15:20:13', '6b7d04c7-1822-4e1d-b01b-58480aab469d'),
(231, 2, 2, 1, '2015-07-09 15:20:13', NULL, '2015-07-09 15:20:13', '2015-07-09 15:20:13', '16f9c4ac-d150-4bdd-abef-e87e911cfd0a'),
(232, 2, 2, 1, '2015-07-09 15:20:13', NULL, '2015-07-09 15:20:14', '2015-07-09 15:20:14', '8d2fdff4-e3da-44dd-9feb-5b2d65d8b341'),
(233, 2, 2, 1, '2015-07-09 15:20:14', NULL, '2015-07-09 15:20:14', '2015-07-09 15:20:14', 'cbe5c38a-68cd-4591-ba38-af6086553679'),
(234, 2, 2, 1, '2015-07-09 15:20:14', NULL, '2015-07-09 15:20:14', '2015-07-09 15:20:14', '1ccc6b3e-a083-4bde-af23-2b127aaa2c51'),
(235, 2, 2, 1, '2015-07-09 15:20:14', NULL, '2015-07-09 15:20:14', '2015-07-09 15:20:14', 'cd7b8897-6d9f-4f71-8ad9-f805e1bd1a6b'),
(236, 2, 2, 1, '2015-07-09 15:20:14', NULL, '2015-07-09 15:20:14', '2015-07-09 15:20:14', '150cbc31-b44a-450e-9d8c-1b44f65ac1a4'),
(237, 2, 2, 1, '2015-07-09 15:20:14', NULL, '2015-07-09 15:20:14', '2015-07-09 15:20:14', 'b61ccfe5-0107-4d1f-b4b1-1c3755b24e0d'),
(238, 2, 2, 1, '2015-07-09 15:20:14', NULL, '2015-07-09 15:20:14', '2015-07-09 15:20:14', 'ac8c99f9-e58c-4117-b2e7-15430665b27c'),
(239, 2, 2, 1, '2015-07-09 15:20:14', NULL, '2015-07-09 15:20:14', '2015-07-09 15:20:14', '66055b7e-75d6-44cf-8888-638b8704a783'),
(240, 2, 2, 1, '2015-07-09 15:20:14', NULL, '2015-07-09 15:20:14', '2015-07-09 15:20:14', 'f70ceca0-6089-49a0-a42a-648300e1092f'),
(241, 2, 2, 1, '2015-07-09 15:20:14', NULL, '2015-07-09 15:20:14', '2015-07-09 15:20:14', '021c7c13-220a-49a9-bc8e-6ed929cab0bb'),
(242, 2, 2, 1, '2015-07-09 15:20:14', NULL, '2015-07-09 15:20:14', '2015-07-09 15:20:14', 'e3bf8dfe-1739-4268-b815-b0f5ed8e4396'),
(243, 2, 2, 1, '2015-07-09 15:20:14', NULL, '2015-07-09 15:20:14', '2015-07-09 15:20:14', '72a24fd4-8831-4b21-abd8-119d93f9f05d'),
(244, 2, 2, 1, '2015-07-09 15:20:14', NULL, '2015-07-09 15:20:14', '2015-07-09 15:20:14', 'e76b4d15-29cc-4cf6-b126-c5102c4b37a0'),
(245, 2, 2, 1, '2015-07-09 15:20:14', NULL, '2015-07-09 15:20:14', '2015-07-09 15:20:14', '58b8db72-2a51-4a3a-bb83-5a2379a9e96e'),
(246, 2, 2, 1, '2015-07-09 15:20:14', NULL, '2015-07-09 15:20:14', '2015-07-09 15:20:14', 'c7f93592-5e95-4918-9a88-7aaf9b481b51'),
(247, 2, 2, 1, '2015-07-09 15:20:14', NULL, '2015-07-09 15:20:14', '2015-07-09 15:20:14', '2f554776-596d-4d54-8e3b-e5474c8c94fe'),
(248, 2, 2, 1, '2015-07-09 15:20:14', NULL, '2015-07-09 15:20:14', '2015-07-09 15:20:14', '6a85d58b-e96b-4524-8dad-f83dd92c1899'),
(249, 2, 2, 1, '2015-07-09 15:20:14', NULL, '2015-07-09 15:20:14', '2015-07-09 15:20:14', '82e388ad-99cc-4961-8bd3-24292b83032d'),
(250, 2, 2, 1, '2015-07-09 15:20:14', NULL, '2015-07-09 15:20:14', '2015-07-09 15:20:14', '5ccbe106-e55e-44ae-8517-347b1abc3973'),
(251, 2, 2, 1, '2015-07-09 15:20:14', NULL, '2015-07-09 15:20:14', '2015-07-09 15:20:14', '40182bc5-88df-4291-bf61-5a6950586c70'),
(252, 2, 2, 1, '2015-07-09 15:20:14', NULL, '2015-07-09 15:20:14', '2015-07-09 15:20:14', '5cf4c94a-e675-423c-95f2-3928859634a9'),
(253, 2, 2, 1, '2015-07-09 15:20:14', NULL, '2015-07-09 15:20:14', '2015-07-09 15:20:14', 'a632a06d-a53e-4f62-aae4-396b1d1c38e2'),
(254, 2, 2, 1, '2015-07-09 15:20:14', NULL, '2015-07-09 15:20:14', '2015-07-09 15:20:14', '0fb9c535-196a-409d-8294-1105805f5b21'),
(255, 2, 2, 1, '2015-07-09 15:20:15', NULL, '2015-07-09 15:20:15', '2015-07-09 15:20:15', '6dcf35f0-8397-40eb-8049-de2e8eb61171'),
(256, 2, 2, 1, '2015-07-09 15:20:15', NULL, '2015-07-09 15:20:15', '2015-07-09 15:20:15', 'b1499a0f-e199-4810-b55f-91c6d68313a1'),
(257, 2, 2, 1, '2015-07-09 15:20:15', NULL, '2015-07-09 15:20:15', '2015-07-09 15:20:15', 'bb243dc5-b516-4093-9c57-a084de459dff'),
(258, 2, 2, 1, '2015-07-09 15:20:15', NULL, '2015-07-09 15:20:15', '2015-07-09 15:20:15', 'ba734976-75af-49b9-a089-8da12df61d26'),
(259, 2, 2, 1, '2015-07-09 15:20:15', NULL, '2015-07-09 15:20:15', '2015-07-09 15:20:15', 'cb303c62-4de9-49a0-a3d9-2a45706593e6'),
(260, 2, 2, 1, '2015-07-09 15:20:15', NULL, '2015-07-09 15:20:15', '2015-07-09 15:20:15', '94f1fa99-a7b1-49d9-ad3b-967ca940bea3'),
(261, 2, 2, 1, '2015-07-09 15:20:15', NULL, '2015-07-09 15:20:15', '2015-07-09 15:20:15', 'f8ce2c9a-c144-469f-a4e5-7878454ee739'),
(262, 2, 2, 1, '2015-07-09 15:20:15', NULL, '2015-07-09 15:20:15', '2015-07-09 15:20:15', '89b6641a-c9fb-4ef6-ae60-2701c24a362d'),
(263, 2, 2, 1, '2015-07-09 15:20:15', NULL, '2015-07-09 15:20:15', '2015-07-09 15:20:15', '132c2853-d57b-4384-9494-565ea78d3007'),
(264, 2, 2, 1, '2015-07-09 15:20:15', NULL, '2015-07-09 15:20:15', '2015-07-09 15:20:15', '0f619c81-8ff5-4620-9da3-a30ce35cdaf5'),
(265, 2, 2, 1, '2015-07-09 15:20:15', NULL, '2015-07-09 15:20:15', '2015-07-09 15:20:15', 'fa0a5bd0-b403-4e0b-a42d-8229be089f64'),
(266, 2, 2, 1, '2015-07-09 15:20:15', NULL, '2015-07-09 15:20:15', '2015-07-09 15:20:15', 'f48999fd-86c3-4008-97ab-8484801becb2'),
(267, 2, 2, 1, '2015-07-09 15:20:15', NULL, '2015-07-09 15:20:15', '2015-07-09 15:20:15', '6e1afa8f-26ff-4a3e-8789-01cd2caf0224'),
(268, 2, 2, 1, '2015-07-09 15:20:15', NULL, '2015-07-09 15:20:15', '2015-07-09 15:20:15', 'a811f8ab-b157-45e1-b393-3528fa478e92'),
(269, 2, 2, 1, '2015-07-09 15:20:15', NULL, '2015-07-09 15:20:15', '2015-07-09 15:20:15', '6b3d87a4-6405-4759-bed7-ed2b978cd816'),
(270, 2, 2, 1, '2015-07-09 15:20:15', NULL, '2015-07-09 15:20:15', '2015-07-09 15:20:15', '23f5de1c-c7d1-4dbb-b092-dbb6744ef37c'),
(271, 2, 2, 1, '2015-07-09 15:20:15', NULL, '2015-07-09 15:20:15', '2015-07-09 15:20:15', '6a6e7529-ec30-49e0-9393-dd0ed54ebf41'),
(272, 2, 2, 1, '2015-07-09 15:20:15', NULL, '2015-07-09 15:20:15', '2015-07-09 15:20:15', 'c2cbae70-b9d2-4737-91e8-f84b764ac999'),
(273, 2, 2, 1, '2015-07-09 15:20:15', NULL, '2015-07-09 15:20:16', '2015-07-09 15:20:16', 'c7b7843d-db0f-476b-bb58-e1996b19eb6e'),
(274, 2, 2, 1, '2015-07-09 15:20:16', NULL, '2015-07-09 15:20:16', '2015-07-09 15:20:16', '62322afd-9f86-4623-bc80-f88745732376'),
(275, 2, 2, 1, '2015-07-09 15:20:16', NULL, '2015-07-09 15:20:16', '2015-07-09 15:20:16', 'a383f404-eb8c-47ee-9d39-c77a3e20049f'),
(276, 2, 2, 1, '2015-07-09 15:20:16', NULL, '2015-07-09 15:20:16', '2015-07-09 15:20:16', '0fa4ea6d-8857-484e-9ba3-d5df8d4a12ab'),
(277, 2, 2, 1, '2015-07-09 15:20:16', NULL, '2015-07-09 15:20:16', '2015-07-09 15:20:16', 'f91ed195-2a7c-4fc8-89fb-7f28dd15d2e5'),
(278, 2, 2, 1, '2015-07-09 15:20:16', NULL, '2015-07-09 15:20:16', '2015-07-09 15:20:16', '30c71490-4521-43ac-806b-edc0525ad41c'),
(279, 2, 2, 1, '2015-07-09 15:20:16', NULL, '2015-07-09 15:20:16', '2015-07-09 15:20:16', '1c631643-ba9e-4428-bc1d-d9a3fec5a380'),
(280, 2, 2, 1, '2015-07-09 15:20:16', NULL, '2015-07-09 15:20:16', '2015-07-09 15:20:16', 'b71566db-ec57-4052-9a04-e563b8129ae3'),
(281, 2, 2, 1, '2015-07-09 15:20:16', NULL, '2015-07-09 15:20:16', '2015-07-09 15:20:16', '368a16e1-f0b0-4708-9489-c571a9ea4e43'),
(282, 2, 2, 1, '2015-07-09 15:20:16', NULL, '2015-07-09 15:20:16', '2015-07-09 15:20:16', '9acbfa73-0de7-419f-8772-cd55e7d927d3'),
(283, 2, 2, 1, '2015-07-09 15:20:16', NULL, '2015-07-09 15:20:16', '2015-07-09 15:20:16', '6613c62b-52c8-4fdd-b19e-5f996e8b4a18'),
(284, 2, 2, 1, '2015-07-09 15:20:16', NULL, '2015-07-09 15:20:16', '2015-07-09 15:20:16', '5d1d4b3c-6da2-4ed0-881b-c47011bdfa4a'),
(285, 2, 2, 1, '2015-07-09 15:20:16', NULL, '2015-07-09 15:20:16', '2015-07-09 15:20:16', '16fc4916-1b43-4a73-bde7-de89bba2b4aa'),
(286, 2, 2, 1, '2015-07-09 15:20:16', NULL, '2015-07-09 15:20:16', '2015-07-09 15:20:16', 'f2905d48-92d5-4235-8d16-63ba0ec6ce2c'),
(287, 2, 2, 1, '2015-07-09 15:20:16', NULL, '2015-07-09 15:20:16', '2015-07-09 15:20:16', '05bfed79-ac86-4321-9121-491f8e4d81a9'),
(288, 2, 2, 1, '2015-07-09 15:20:16', NULL, '2015-07-09 15:20:16', '2015-07-09 15:20:16', 'f6f2d917-5253-4836-aa64-8dc3c5346b5c'),
(289, 2, 2, 1, '2015-07-09 15:20:16', NULL, '2015-07-09 15:20:16', '2015-07-09 15:20:16', 'c3a7a8bc-60eb-49f8-add1-476251473d29'),
(290, 2, 2, 1, '2015-07-09 15:20:16', NULL, '2015-07-09 15:20:17', '2015-07-09 15:20:17', '9b9d1327-4a22-415f-ad94-f0c8c9d8d276'),
(291, 2, 2, 1, '2015-07-09 15:20:17', NULL, '2015-07-09 15:20:17', '2015-07-09 15:20:17', '5933759c-196c-464f-a8b1-adfcd3b1e33b'),
(292, 2, 2, 1, '2015-07-09 15:20:17', NULL, '2015-07-09 15:20:17', '2015-07-09 15:20:17', 'd0af7a76-f0ba-4360-8293-190ee289efc7'),
(293, 2, 2, 1, '2015-07-09 15:20:17', NULL, '2015-07-09 15:20:17', '2015-07-09 15:20:17', '21d43e77-04cf-4c2b-9f6f-4d04e0f9ed1b'),
(294, 2, 2, 1, '2015-07-09 15:20:17', NULL, '2015-07-09 15:20:17', '2015-07-09 15:20:17', 'cd7107dc-a801-4930-9617-26a5648cb12b'),
(295, 2, 2, 1, '2015-07-09 15:20:17', NULL, '2015-07-09 15:20:17', '2015-07-09 15:20:17', '0a7146d1-bc3a-4aa3-9d63-4b30fc27c96b'),
(296, 2, 2, 1, '2015-07-09 15:20:17', NULL, '2015-07-09 15:20:17', '2015-07-09 15:20:17', 'ab29a5a5-b2cb-4cf6-be89-817b8774587e'),
(297, 2, 2, 1, '2015-07-09 15:20:17', NULL, '2015-07-09 15:20:17', '2015-07-09 15:20:17', 'fb6d5d5e-c5a9-4c78-a5f8-eb32068f66e6'),
(298, 2, 2, 1, '2015-07-09 15:20:17', NULL, '2015-07-09 15:20:17', '2015-07-09 15:20:17', '8ba140a2-9dcb-4ce9-ae54-b19aefc47f49'),
(299, 2, 2, 1, '2015-07-09 15:20:17', NULL, '2015-07-09 15:20:17', '2015-07-09 15:20:17', '2bfe4f14-2671-4139-8de3-709a29e9aef4'),
(300, 2, 2, 1, '2015-07-09 15:20:17', NULL, '2015-07-09 15:20:17', '2015-07-09 15:20:17', '819aba44-4482-4d03-9486-fdc15f0ff7ff'),
(301, 2, 2, 1, '2015-07-09 15:20:17', NULL, '2015-07-09 15:20:17', '2015-07-09 15:20:17', 'a82cdea7-d95a-4c8a-a86b-a65fad802395'),
(302, 2, 2, 1, '2015-07-09 15:20:17', NULL, '2015-07-09 15:20:17', '2015-07-09 15:20:17', 'c454638d-bd23-44a0-a846-cc3850c67509'),
(303, 2, 2, 1, '2015-07-09 15:20:17', NULL, '2015-07-09 15:20:17', '2015-07-09 15:20:17', 'bf9611df-70d0-487a-8802-c3157dbceb35'),
(304, 2, 2, 1, '2015-07-09 15:20:17', NULL, '2015-07-09 15:20:17', '2015-07-09 15:20:17', '2d442ed5-4e65-4574-8eb4-b40298a4030b'),
(305, 2, 2, 1, '2015-07-09 15:20:17', NULL, '2015-07-09 15:20:17', '2015-07-09 15:20:17', 'cc13e97f-7587-4528-b055-0fd5f40ec5ec'),
(306, 2, 2, 1, '2015-07-09 15:20:17', NULL, '2015-07-09 15:20:17', '2015-07-09 15:20:17', '403a5d1b-a03c-4c2a-920b-1f59d99bfa89'),
(307, 2, 2, 1, '2015-07-09 15:20:17', NULL, '2015-07-09 15:20:17', '2015-07-09 15:20:17', 'ce559c33-dc67-4346-94f5-9af9869e71e4'),
(308, 2, 2, 1, '2015-07-09 15:20:17', NULL, '2015-07-09 15:20:18', '2015-07-09 15:20:18', 'c3f2e839-1e83-408e-977c-c462f5b469e3'),
(309, 2, 2, 1, '2015-07-09 15:20:18', NULL, '2015-07-09 15:20:18', '2015-07-09 15:20:18', 'e9581de1-c29f-4cc4-94ef-618664d29193'),
(310, 2, 2, 1, '2015-07-09 15:20:18', NULL, '2015-07-09 15:20:18', '2015-07-09 15:20:18', 'c72af4a3-9ee3-4516-9809-4dabf4986250'),
(311, 2, 2, 1, '2015-07-09 15:20:18', NULL, '2015-07-09 15:20:18', '2015-07-09 15:20:18', '01e4d504-cc0f-4443-b437-d02ce205b6f6'),
(312, 2, 2, 1, '2015-07-09 15:20:18', NULL, '2015-07-09 15:20:18', '2015-07-09 15:20:18', 'a6df1b97-4f82-47ae-b22c-ae6a174809d8'),
(313, 2, 2, 1, '2015-07-09 15:20:18', NULL, '2015-07-09 15:20:18', '2015-07-09 15:20:18', 'f6a0e98e-0769-4f20-95bd-3f64b22c0109'),
(314, 2, 2, 1, '2015-07-09 15:20:18', NULL, '2015-07-09 15:20:18', '2015-07-09 15:20:18', '33663cdb-0fcd-4482-9680-7d041314678f'),
(315, 2, 2, 1, '2015-07-09 15:20:18', NULL, '2015-07-09 15:20:18', '2015-07-09 15:20:18', '509c6aae-3010-4730-92ac-6735355832d8'),
(316, 2, 2, 1, '2015-07-09 15:20:18', NULL, '2015-07-09 15:20:18', '2015-07-09 15:20:18', 'b740e3f3-c9dd-4989-a8ce-31ac7e0a9572'),
(317, 2, 2, 1, '2015-07-09 15:20:18', NULL, '2015-07-09 15:20:18', '2015-07-09 15:20:18', '56f0a51c-32fa-4760-b1cf-5ef06ff58a34'),
(318, 2, 2, 1, '2015-07-09 15:20:18', NULL, '2015-07-09 15:20:18', '2015-07-09 15:20:18', '8933fde6-cbd5-41c4-92a2-0f3dc8c62641'),
(319, 2, 2, 1, '2015-07-09 15:20:18', NULL, '2015-07-09 15:20:18', '2015-07-09 15:20:18', '7d1152a5-b361-4764-a314-0a86784ba1c7'),
(320, 2, 2, 1, '2015-07-09 15:20:18', NULL, '2015-07-09 15:20:18', '2015-07-09 15:20:18', 'f00e02f7-3947-4b16-b942-87a98398e0d7'),
(321, 2, 2, 1, '2015-07-09 15:20:18', NULL, '2015-07-09 15:20:18', '2015-07-09 15:20:18', 'f620a9b6-babc-4092-9a17-0ed1b68eaece'),
(322, 2, 2, 1, '2015-07-09 15:20:18', NULL, '2015-07-09 15:20:18', '2015-07-09 15:20:18', 'f30c45b0-f836-4866-b111-72da7d46c8be'),
(323, 2, 2, 1, '2015-07-09 15:20:18', NULL, '2015-07-09 15:20:18', '2015-07-09 15:20:18', 'd373eac8-0b50-4ab2-8c6f-074b9c54610d'),
(324, 2, 2, 1, '2015-07-09 15:20:18', NULL, '2015-07-09 15:20:18', '2015-07-09 15:20:18', '1e221f2d-e679-4fec-bae2-b15887723907'),
(325, 2, 2, 1, '2015-07-09 15:20:18', NULL, '2015-07-09 15:20:18', '2015-07-09 15:20:18', '9b8def34-3497-4071-8773-34d7c67ef6ea'),
(326, 2, 2, 1, '2015-07-09 15:20:19', NULL, '2015-07-09 15:20:19', '2015-07-09 15:20:19', '6da751e1-e131-41ac-a364-27b459bfc087'),
(327, 2, 2, 1, '2015-07-09 15:20:19', NULL, '2015-07-09 15:20:19', '2015-07-09 15:20:19', 'dd3de99d-423b-4f7b-9661-14a14e730354'),
(328, 2, 2, 1, '2015-07-09 15:20:19', NULL, '2015-07-09 15:20:19', '2015-07-09 15:20:19', '46f78dab-b40c-412c-9f1b-ee9d422a5820'),
(329, 2, 2, 1, '2015-07-09 15:20:19', NULL, '2015-07-09 15:20:19', '2015-07-09 15:20:19', 'ec428fc7-272d-4cf9-9b7a-11d7d851f4de'),
(330, 2, 2, 1, '2015-07-09 15:20:19', NULL, '2015-07-09 15:20:19', '2015-07-09 15:20:19', '21594acf-c5af-4e2d-881c-e3c3e890e650'),
(331, 2, 2, 1, '2015-07-09 15:20:19', NULL, '2015-07-09 15:20:19', '2015-07-09 15:20:19', 'fddc37f2-ba24-41d5-9261-0391aac2b3d3'),
(332, 2, 2, 1, '2015-07-09 15:20:19', NULL, '2015-07-09 15:20:19', '2015-07-09 15:20:19', '907514a1-af13-45f0-8ed4-466b112bd847'),
(333, 2, 2, 1, '2015-07-09 15:20:19', NULL, '2015-07-09 15:20:19', '2015-07-09 15:20:19', '437e6be3-819f-4d3e-a411-350bee3585b5'),
(334, 2, 2, 1, '2015-07-09 15:20:19', NULL, '2015-07-09 15:20:19', '2015-07-09 15:20:19', 'd5daa235-c404-4f65-a965-7702572b7caf'),
(335, 2, 2, 1, '2015-07-09 15:20:19', NULL, '2015-07-09 15:20:19', '2015-07-09 15:20:19', '076da1fb-1ec6-486b-a8c1-61da586d025a'),
(336, 2, 2, 1, '2015-07-09 15:20:19', NULL, '2015-07-09 15:20:19', '2015-07-09 15:20:19', 'd75dce42-6f0c-43ab-8069-3f7760e3f1dc'),
(337, 2, 2, 1, '2015-07-09 15:20:19', NULL, '2015-07-09 15:20:19', '2015-07-09 15:20:19', '68167842-b304-4353-b0c7-845a6b3834a3'),
(338, 2, 2, 1, '2015-07-09 15:20:19', NULL, '2015-07-09 15:20:19', '2015-07-09 15:20:19', '6368231a-6d5c-44ab-8795-3b50140b49c8'),
(339, 2, 2, 1, '2015-07-09 15:20:19', NULL, '2015-07-09 15:20:19', '2015-07-09 15:20:19', '4bb270cd-6837-4edd-b31a-3c209f5fdc73'),
(340, 2, 2, 1, '2015-07-09 15:20:19', NULL, '2015-07-09 15:20:19', '2015-07-09 15:20:19', '878587c7-8c78-4366-a37b-89c4402a5200'),
(341, 2, 2, 1, '2015-07-09 15:20:19', NULL, '2015-07-09 15:20:19', '2015-07-09 15:20:19', '7c2c7c36-ba98-4304-9e2e-3b8c7aea5ef9'),
(342, 2, 2, 1, '2015-07-09 15:20:19', NULL, '2015-07-09 15:20:19', '2015-07-09 15:20:19', '5fd3ea47-c98e-4928-8fbc-33f77332a71c'),
(343, 2, 2, 1, '2015-07-09 15:20:19', NULL, '2015-07-09 15:20:19', '2015-07-09 15:20:19', '94423e96-42fc-473d-a0f6-3ef5a1af80d0'),
(344, 2, 2, 1, '2015-07-09 15:20:19', NULL, '2015-07-09 15:20:19', '2015-07-09 15:20:19', '94d55d22-1cae-4bf8-bf54-b8b5ae250643'),
(345, 2, 2, 1, '2015-07-09 15:20:19', NULL, '2015-07-09 15:20:20', '2015-07-09 15:20:20', '4019e6a0-36df-4fe0-aa60-b3efd42c2507'),
(346, 2, 2, 1, '2015-07-09 15:20:20', NULL, '2015-07-09 15:20:20', '2015-07-09 15:20:20', 'cc165937-d739-4490-9d1d-91a9cf848a57'),
(347, 2, 2, 1, '2015-07-09 15:20:20', NULL, '2015-07-09 15:20:20', '2015-07-09 15:20:20', 'a18d31f3-7631-480d-a91e-c93a9cb79b48'),
(348, 2, 2, 1, '2015-07-09 15:20:20', NULL, '2015-07-09 15:20:20', '2015-07-09 15:20:20', 'faa3f256-ef7b-4e27-82d2-0efb5f70cead'),
(349, 2, 2, 1, '2015-07-09 15:20:20', NULL, '2015-07-09 15:20:20', '2015-07-09 15:20:20', '0a598f38-c702-44b1-9c1d-a67d83580f09'),
(350, 2, 2, 1, '2015-07-09 15:20:20', NULL, '2015-07-09 15:20:20', '2015-07-09 15:20:20', 'e6515185-c895-48fa-87c5-b9f572eefbbb'),
(351, 2, 2, 1, '2015-07-09 15:20:20', NULL, '2015-07-09 15:20:20', '2015-07-09 15:20:20', 'b9860e46-0f28-4df3-a696-7c2087b7db87'),
(352, 2, 2, 1, '2015-07-09 15:20:20', NULL, '2015-07-09 15:20:20', '2015-07-09 15:20:20', '5e4d3bd7-de53-4f00-ac44-3497497b8971'),
(353, 2, 2, 1, '2015-07-09 15:20:20', NULL, '2015-07-09 15:20:20', '2015-07-09 15:20:20', '5c0d4893-5cac-4a0c-9d82-d2f9dfeb6980'),
(354, 2, 2, 1, '2015-07-09 15:20:20', NULL, '2015-07-09 15:20:20', '2015-07-09 15:20:20', 'c03d78b9-29ec-450d-83c0-3e21931ea319'),
(355, 2, 2, 1, '2015-07-09 15:20:20', NULL, '2015-07-09 15:20:20', '2015-07-09 15:20:20', '12acbeb2-f32f-4051-9fb7-4765cd8be5b6'),
(356, 2, 2, 1, '2015-07-09 15:20:20', NULL, '2015-07-09 15:20:20', '2015-07-09 15:20:20', '8abc44ea-5b41-40b4-bedb-bdb5d482f060'),
(357, 2, 2, 1, '2015-07-09 15:20:20', NULL, '2015-07-09 15:20:20', '2015-07-09 15:20:20', '2f5b51e3-3b42-4445-8721-2072e8383e7f'),
(358, 2, 2, 1, '2015-07-09 15:20:20', NULL, '2015-07-09 15:20:20', '2015-07-09 15:20:20', '3da333e0-0ea0-48be-8cdb-d1ba592b79b6'),
(359, 2, 2, 1, '2015-07-09 15:20:20', NULL, '2015-07-09 15:20:20', '2015-07-09 15:20:20', 'be80314c-ce3e-40ac-885b-88769a599c35'),
(360, 2, 2, 1, '2015-07-09 15:20:20', NULL, '2015-07-09 15:20:20', '2015-07-09 15:20:20', '0db630f4-3ee1-4b05-a9ca-5d4806d78c6e'),
(361, 2, 2, 1, '2015-07-09 15:20:20', NULL, '2015-07-09 15:20:20', '2015-07-09 15:20:20', 'b226f73a-6eed-4b47-9ee6-f11192c2f56d'),
(362, 2, 2, 1, '2015-07-09 15:20:20', NULL, '2015-07-09 15:20:20', '2015-07-09 15:20:20', 'df368366-84a9-4672-9c1c-7d6e55590733'),
(363, 2, 2, 1, '2015-07-09 15:20:20', NULL, '2015-07-09 15:20:21', '2015-07-09 15:20:21', 'df0d4069-5db1-4cea-8b74-4c12cc0b5647'),
(364, 2, 2, 1, '2015-07-09 15:20:21', NULL, '2015-07-09 15:20:21', '2015-07-09 15:20:21', '3cff7f9d-6942-4003-9b68-cad952362279'),
(365, 2, 2, 1, '2015-07-09 15:20:21', NULL, '2015-07-09 15:20:21', '2015-07-09 15:20:21', '1892097f-13cf-4923-9b7e-2fde5011f743'),
(366, 2, 2, 1, '2015-07-09 15:20:21', NULL, '2015-07-09 15:20:21', '2015-07-09 15:20:21', '3e794b60-eaa0-40ec-8a3e-835bfa228b3e'),
(367, 2, 2, 1, '2015-07-09 15:20:21', NULL, '2015-07-09 15:20:21', '2015-07-09 15:20:21', '3a5b436e-5cf3-4ba2-b640-51c9bd971ded'),
(368, 2, 2, 1, '2015-07-09 15:20:21', NULL, '2015-07-09 15:20:21', '2015-07-09 15:20:21', '6621810c-dc4c-4354-ab8a-08024dd9b018'),
(369, 2, 2, 1, '2015-07-09 15:20:21', NULL, '2015-07-09 15:20:21', '2015-07-09 15:20:21', '1502f215-5225-430c-9b0f-19ca16f540df'),
(370, 2, 2, 1, '2015-07-09 15:20:21', NULL, '2015-07-09 15:20:21', '2015-07-09 15:20:21', 'd52592bd-efb4-4f41-8bdf-0d259c8a0bd0');

-- --------------------------------------------------------

--
-- Table structure for table `craft_entrydrafts`
--

CREATE TABLE IF NOT EXISTS `craft_entrydrafts` (
  `id` int(11) NOT NULL,
  `entryId` int(11) NOT NULL,
  `sectionId` int(11) NOT NULL,
  `creatorId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `notes` tinytext COLLATE utf8_unicode_ci,
  `data` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `craft_entrytypes`
--

CREATE TABLE IF NOT EXISTS `craft_entrytypes` (
  `id` int(11) NOT NULL,
  `sectionId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `hasTitleField` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `titleLabel` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'Title',
  `titleFormat` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sortOrder` tinyint(4) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `craft_entrytypes`
--

INSERT INTO `craft_entrytypes` (`id`, `sectionId`, `fieldLayoutId`, `name`, `handle`, `hasTitleField`, `titleLabel`, `titleFormat`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 1, 3, 'Homepage', 'homepage', 1, 'Title', NULL, NULL, '2015-06-25 14:04:24', '2015-06-25 14:04:24', 'c9fa348f-1f2b-4cb7-ad8f-d14c9a75a977'),
(2, 2, 14, 'Videos', 'videos', 1, 'Track title', NULL, NULL, '2015-06-25 14:04:24', '2015-07-09 14:23:28', '3d1c686f-4d51-47f8-aefc-7c5497d5261d'),
(3, 3, 6, 'About', 'about', 0, NULL, '{section.name|raw}', NULL, '2015-06-25 14:29:31', '2015-06-25 14:29:31', 'e37efbce-4c6f-414a-a7cb-6b905e598f5d'),
(4, 4, 7, 'Contact', 'contact', 0, NULL, '{section.name|raw}', NULL, '2015-06-25 14:29:40', '2015-06-25 14:29:40', 'e6476522-7849-4943-8cb3-40bc997104f0');

-- --------------------------------------------------------

--
-- Table structure for table `craft_entryversions`
--

CREATE TABLE IF NOT EXISTS `craft_entryversions` (
  `id` int(11) NOT NULL,
  `entryId` int(11) NOT NULL,
  `sectionId` int(11) NOT NULL,
  `creatorId` int(11) DEFAULT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `num` smallint(6) unsigned NOT NULL,
  `notes` tinytext COLLATE utf8_unicode_ci,
  `data` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `craft_fieldgroups`
--

CREATE TABLE IF NOT EXISTS `craft_fieldgroups` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `craft_fieldgroups`
--

INSERT INTO `craft_fieldgroups` (`id`, `name`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 'Default', '2015-06-25 14:04:23', '2015-06-25 14:04:23', '1a3209d1-5ff7-4d2f-8be9-6f4a45b95383');

-- --------------------------------------------------------

--
-- Table structure for table `craft_fieldlayoutfields`
--

CREATE TABLE IF NOT EXISTS `craft_fieldlayoutfields` (
  `id` int(11) NOT NULL,
  `layoutId` int(11) NOT NULL,
  `tabId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `required` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `sortOrder` tinyint(4) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `craft_fieldlayoutfields`
--

INSERT INTO `craft_fieldlayoutfields` (`id`, `layoutId`, `tabId`, `fieldId`, `required`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 3, 1, 1, 1, 1, '2015-06-25 14:04:24', '2015-06-25 14:04:24', '2719c262-acfe-4dde-b740-877a0d82546c'),
(32, 14, 6, 10, 1, 1, '2015-07-09 14:23:28', '2015-07-09 14:23:28', 'fec0f0aa-4953-4f20-9ef9-80b398bfe4e8'),
(33, 14, 6, 11, 0, 2, '2015-07-09 14:23:28', '2015-07-09 14:23:28', '2d8b020f-7b55-474b-8e29-fd2e556b8a21'),
(34, 14, 6, 3, 0, 3, '2015-07-09 14:23:28', '2015-07-09 14:23:28', 'da6c9086-84ea-4276-8f82-34b9d6177c88'),
(35, 14, 6, 4, 0, 4, '2015-07-09 14:23:28', '2015-07-09 14:23:28', '9c3c185f-bead-4b63-b3d0-dca2e8d02bea'),
(36, 14, 6, 6, 0, 5, '2015-07-09 14:23:28', '2015-07-09 14:23:28', '8de4f138-95c6-41df-9f99-c666f198ef64'),
(37, 14, 6, 7, 0, 6, '2015-07-09 14:23:28', '2015-07-09 14:23:28', '96dd0594-e582-42ef-bd57-09b3025b62c8'),
(38, 14, 6, 2, 0, 7, '2015-07-09 14:23:28', '2015-07-09 14:23:28', 'f40ab4ff-7f69-47aa-ab7f-d9557237bf39'),
(39, 14, 6, 8, 0, 8, '2015-07-09 14:23:28', '2015-07-09 14:23:28', 'd18890fa-2751-4ee3-a697-c1e6f09d6516'),
(40, 14, 6, 9, 0, 9, '2015-07-09 14:23:28', '2015-07-09 14:23:28', '2682629e-6d13-4a6e-88d7-15b8a4c01bb4'),
(41, 14, 6, 1, 0, 10, '2015-07-09 14:23:28', '2015-07-09 14:23:28', 'fc460118-015b-4513-b02c-d8eacf594fcf');

-- --------------------------------------------------------

--
-- Table structure for table `craft_fieldlayouts`
--

CREATE TABLE IF NOT EXISTS `craft_fieldlayouts` (
  `id` int(11) NOT NULL,
  `type` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `craft_fieldlayouts`
--

INSERT INTO `craft_fieldlayouts` (`id`, `type`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 'Tag', '2015-06-25 14:04:23', '2015-06-25 14:04:23', 'e28ee610-38fc-48ce-8aca-09ae4c89183a'),
(3, 'Entry', '2015-06-25 14:04:24', '2015-06-25 14:04:24', '87f47add-145d-467b-ad36-ad2784beb428'),
(6, 'Entry', '2015-06-25 14:29:31', '2015-06-25 14:29:31', '2b8b7ad8-0fba-4e5c-954e-7945809f3c60'),
(7, 'Entry', '2015-06-25 14:29:40', '2015-06-25 14:29:40', '02828243-1e2c-4de5-bdba-52b98a459525'),
(12, 'Asset', '2015-06-25 15:37:25', '2015-06-25 15:37:25', '216844ae-f91f-4f9a-a5f6-4f6026250641'),
(14, 'Entry', '2015-07-09 14:23:28', '2015-07-09 14:23:28', 'b3ff4da9-71a4-4efd-b5d6-e4147d60e374');

-- --------------------------------------------------------

--
-- Table structure for table `craft_fieldlayouttabs`
--

CREATE TABLE IF NOT EXISTS `craft_fieldlayouttabs` (
  `id` int(11) NOT NULL,
  `layoutId` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sortOrder` tinyint(4) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `craft_fieldlayouttabs`
--

INSERT INTO `craft_fieldlayouttabs` (`id`, `layoutId`, `name`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 3, 'Content', 1, '2015-06-25 14:04:24', '2015-06-25 14:04:24', '0e278036-1815-4e6c-9052-3b24c8ab78ac'),
(6, 14, 'Content', 1, '2015-07-09 14:23:28', '2015-07-09 14:23:28', '4b091447-907f-47a2-b05f-186edf7911b0');

-- --------------------------------------------------------

--
-- Table structure for table `craft_fields`
--

CREATE TABLE IF NOT EXISTS `craft_fields` (
  `id` int(11) NOT NULL,
  `groupId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(58) COLLATE utf8_unicode_ci NOT NULL,
  `context` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'global',
  `instructions` text COLLATE utf8_unicode_ci,
  `translatable` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `type` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `settings` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `craft_fields`
--

INSERT INTO `craft_fields` (`id`, `groupId`, `name`, `handle`, `context`, `instructions`, `translatable`, `type`, `settings`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 1, 'Body', 'body', 'global', NULL, 1, 'RichText', '{"configFile":"Standard.json","columnType":"text"}', '2015-06-25 14:04:23', '2015-06-25 14:04:23', '299ec342-447f-49db-a869-337360f5f245'),
(2, 1, 'Tags', 'tags', 'global', NULL, 0, 'Tags', '{"source":"taggroup:1"}', '2015-06-25 14:04:24', '2015-06-25 14:04:24', '46541075-1ee1-4c49-90b7-83231951515f'),
(3, 1, 'Artist', 'artist', 'global', '', 0, 'PlainText', '{"placeholder":"","maxLength":"","multiline":"","initialRows":"4"}', '2015-06-25 14:23:47', '2015-06-25 14:23:47', 'a904be36-9aa6-44f2-b7bb-44ee5377e796'),
(4, 1, 'Label', 'label', 'global', '', 0, 'PlainText', '{"placeholder":"","maxLength":"","multiline":"","initialRows":"4"}', '2015-06-25 14:23:57', '2015-06-25 14:23:57', 'c08a7d9a-e59f-4a4f-b20f-dea89eb7f59a'),
(5, 1, 'Track title', 'trackTitle', 'global', '', 0, 'PlainText', '{"placeholder":"","maxLength":"","multiline":"","initialRows":"4"}', '2015-06-25 14:24:05', '2015-06-25 14:24:05', '7f64d79a-b571-45e9-95ff-29e231ca50ac'),
(6, 1, 'Publisher', 'publisher', 'global', '', 0, 'PlainText', '{"placeholder":"","maxLength":"","multiline":"","initialRows":"4"}', '2015-06-25 14:24:20', '2015-06-25 14:24:20', '631278d1-da11-4027-842b-2d83534d22b7'),
(7, 1, 'Album', 'album', 'global', '', 0, 'PlainText', '{"placeholder":"","maxLength":"","multiline":"","initialRows":"4"}', '2015-06-25 14:24:30', '2015-06-25 14:24:30', 'dc89ba64-5675-495b-ad58-f33d2171aa18'),
(8, 1, 'FB image', 'fbImage', 'global', '', 0, 'Assets', '{"useSingleFolder":"","defaultUploadLocationSubpath":"","singleUploadLocationSubpath":"","restrictFiles":"","limit":"","selectionLabel":"Add an asset"}', '2015-06-25 14:25:07', '2015-06-25 14:25:07', '984aab1d-5df0-433e-b902-e16212beab35'),
(9, 1, 'Twitter image', 'twitterImage', 'global', '', 0, 'Assets', '{"useSingleFolder":"","defaultUploadLocationSubpath":"","singleUploadLocationSubpath":"","restrictFiles":"","limit":"","selectionLabel":"Add an asset"}', '2015-06-25 14:25:23', '2015-06-25 14:25:23', 'b8ebf745-f321-447e-823c-2233bcd800b5'),
(10, 1, 'Video URL', 'videoUrl', 'global', '', 0, 'PlainText', '{"placeholder":"","maxLength":"","multiline":"","initialRows":"4"}', '2015-06-25 14:39:45', '2015-06-25 14:39:45', 'e5f1ca72-8d60-4681-baac-37538b54e67e'),
(11, 1, 'Videotype', 'videotype', 'global', 'youtube or vimeo', 0, 'Dropdown', '{"options":[{"label":"youtube","value":"video\\/youtube","default":"1"},{"label":"vimeo","value":"video\\/vimeo","default":""}]}', '2015-07-09 14:22:25', '2015-07-09 14:24:40', 'd990313d-6470-4703-ae42-434364dff86a');

-- --------------------------------------------------------

--
-- Table structure for table `craft_globalsets`
--

CREATE TABLE IF NOT EXISTS `craft_globalsets` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fieldLayoutId` int(10) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `craft_import_entries`
--

CREATE TABLE IF NOT EXISTS `craft_import_entries` (
  `id` int(11) NOT NULL,
  `historyId` int(11) DEFAULT NULL,
  `entryId` int(11) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `craft_import_history`
--

CREATE TABLE IF NOT EXISTS `craft_import_history` (
  `id` int(11) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `file` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `rows` int(10) DEFAULT NULL,
  `behavior` enum('append','replace','delete') COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` enum('started','finished','reverted') COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `craft_import_history`
--

INSERT INTO `craft_import_history` (`id`, `userId`, `type`, `file`, `rows`, `behavior`, `status`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(3, 1, 'Entry', 'Untitled spreadsheet - Sheet1 (1).csv', 307, 'append', 'finished', '2015-07-09 15:20:06', '2015-07-09 15:20:21', '6422b7d7-fd52-48fa-a5f0-e837769827c5');

-- --------------------------------------------------------

--
-- Table structure for table `craft_import_log`
--

CREATE TABLE IF NOT EXISTS `craft_import_log` (
  `id` int(11) NOT NULL,
  `historyId` int(11) DEFAULT NULL,
  `line` int(10) DEFAULT NULL,
  `errors` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `craft_info`
--

CREATE TABLE IF NOT EXISTS `craft_info` (
  `id` int(11) NOT NULL,
  `version` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `build` int(11) unsigned NOT NULL,
  `schemaVersion` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `releaseDate` datetime NOT NULL,
  `edition` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `siteName` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `siteUrl` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `timezone` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `on` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `maintenance` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `track` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `craft_info`
--

INSERT INTO `craft_info` (`id`, `version`, `build`, `schemaVersion`, `releaseDate`, `edition`, `siteName`, `siteUrl`, `timezone`, `on`, `maintenance`, `track`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, '2.4', 2670, '2.4.0', '2015-06-16 18:59:31', 0, 'Vagrant', 'http://vagrant.local', 'UTC', 1, 0, 'stable', '2015-06-25 14:04:21', '2015-06-25 14:04:21', 'd173f437-b0b0-4dfd-8b55-fd090af31b9f');

-- --------------------------------------------------------

--
-- Table structure for table `craft_locales`
--

CREATE TABLE IF NOT EXISTS `craft_locales` (
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `sortOrder` tinyint(4) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `craft_locales`
--

INSERT INTO `craft_locales` (`locale`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`) VALUES
('en_us', 1, '2015-06-25 14:04:22', '2015-06-25 14:04:22', '11f42744-0f28-4640-95d5-d6c4cb7aa14a');

-- --------------------------------------------------------

--
-- Table structure for table `craft_matrixblocks`
--

CREATE TABLE IF NOT EXISTS `craft_matrixblocks` (
  `id` int(11) NOT NULL,
  `ownerId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `typeId` int(11) DEFAULT NULL,
  `sortOrder` tinyint(4) DEFAULT NULL,
  `ownerLocale` char(12) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `craft_matrixblocktypes`
--

CREATE TABLE IF NOT EXISTS `craft_matrixblocktypes` (
  `id` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sortOrder` tinyint(4) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `craft_migrations`
--

CREATE TABLE IF NOT EXISTS `craft_migrations` (
  `id` int(11) NOT NULL,
  `pluginId` int(11) DEFAULT NULL,
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `applyTime` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `craft_migrations`
--

INSERT INTO `craft_migrations` (`id`, `pluginId`, `version`, `applyTime`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, NULL, 'm000000_000000_base', '2015-06-25 14:04:22', '2015-06-25 14:04:22', '2015-06-25 14:04:22', 'e980a76a-eed1-44da-a13b-04583b6bfa40'),
(2, NULL, 'm140730_000001_add_filename_and_format_to_transformindex', '2015-06-25 14:04:22', '2015-06-25 14:04:22', '2015-06-25 14:04:22', '4ed2692c-96e9-4c3a-919c-8e3b6c07bfa8'),
(3, NULL, 'm140815_000001_add_format_to_transforms', '2015-06-25 14:04:22', '2015-06-25 14:04:22', '2015-06-25 14:04:22', 'a77ae461-616c-4bb2-8104-61b96b2e2e90'),
(4, NULL, 'm140822_000001_allow_more_than_128_items_per_field', '2015-06-25 14:04:22', '2015-06-25 14:04:22', '2015-06-25 14:04:22', '294e062c-97cc-43ea-a71e-86f1723cca01'),
(5, NULL, 'm140829_000001_single_title_formats', '2015-06-25 14:04:22', '2015-06-25 14:04:22', '2015-06-25 14:04:22', 'bed08384-9f0c-46f3-8dc4-109d35d7ca5f'),
(6, NULL, 'm140831_000001_extended_cache_keys', '2015-06-25 14:04:22', '2015-06-25 14:04:22', '2015-06-25 14:04:22', '1ddc5d40-3448-4a37-a389-2e0ab9029675'),
(7, NULL, 'm140922_000001_delete_orphaned_matrix_blocks', '2015-06-25 14:04:22', '2015-06-25 14:04:22', '2015-06-25 14:04:22', '8b887764-9690-44da-82ef-a82a2a42fb19'),
(8, NULL, 'm141008_000001_elements_index_tune', '2015-06-25 14:04:22', '2015-06-25 14:04:22', '2015-06-25 14:04:22', '6440c312-a831-433c-a676-8dea9bfa3744'),
(9, NULL, 'm141009_000001_assets_source_handle', '2015-06-25 14:04:22', '2015-06-25 14:04:22', '2015-06-25 14:04:22', '4a4eb1bc-7689-4ca6-a20a-3a28f48f5e1d'),
(10, NULL, 'm141024_000001_field_layout_tabs', '2015-06-25 14:04:22', '2015-06-25 14:04:22', '2015-06-25 14:04:22', '006bda84-f33b-42a9-ad04-c1f14b676ae0'),
(11, NULL, 'm141030_000001_drop_structure_move_permission', '2015-06-25 14:04:22', '2015-06-25 14:04:22', '2015-06-25 14:04:22', 'cb2d9f31-f804-40dc-88d8-ca9ca6af8549'),
(12, NULL, 'm141103_000001_tag_titles', '2015-06-25 14:04:22', '2015-06-25 14:04:22', '2015-06-25 14:04:22', '3b6118f9-e0b5-40b0-bf0d-9abe98c33868'),
(13, NULL, 'm141109_000001_user_status_shuffle', '2015-06-25 14:04:22', '2015-06-25 14:04:22', '2015-06-25 14:04:22', 'd5038c43-e7c0-4ca0-9d05-e47261fb1336'),
(14, NULL, 'm141126_000001_user_week_start_day', '2015-06-25 14:04:22', '2015-06-25 14:04:22', '2015-06-25 14:04:22', '28a1bf01-606e-4930-bf45-fcd473ed4e56'),
(15, NULL, 'm150210_000001_adjust_user_photo_size', '2015-06-25 14:04:22', '2015-06-25 14:04:22', '2015-06-25 14:04:22', 'a3aeef6e-6acd-4498-b87b-f75ee2ce1273'),
(16, 1, 'm140430_122214_import_ImportHistory', '2015-07-09 14:50:53', '2015-07-09 14:50:53', '2015-07-09 14:50:53', 'cf88adaf-dd95-4e01-8267-e78be129c258'),
(17, 1, 'm140616_080724_import_saveEntryIdAndVersion', '2015-07-09 14:50:53', '2015-07-09 14:50:53', '2015-07-09 14:50:53', '018ee4bc-618f-4730-aec5-542421ebb24b'),
(18, 1, 'm140903_075432_import_ImportElements', '2015-07-09 14:50:53', '2015-07-09 14:50:53', '2015-07-09 14:50:53', 'ca10acc1-0fc4-470c-a0c5-b34438359ae5');

-- --------------------------------------------------------

--
-- Table structure for table `craft_plugins`
--

CREATE TABLE IF NOT EXISTS `craft_plugins` (
  `id` int(11) NOT NULL,
  `class` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `version` char(15) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `settings` text COLLATE utf8_unicode_ci,
  `installDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `craft_plugins`
--

INSERT INTO `craft_plugins` (`id`, `class`, `version`, `enabled`, `settings`, `installDate`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 'Import', '0.8.24', 1, NULL, '2015-07-09 14:50:53', '2015-07-09 14:50:53', '2015-07-09 14:50:53', '7136b2a3-1e2f-460f-a0e4-eeb9822f6909');

-- --------------------------------------------------------

--
-- Table structure for table `craft_rackspaceaccess`
--

CREATE TABLE IF NOT EXISTS `craft_rackspaceaccess` (
  `id` int(11) NOT NULL,
  `connectionKey` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `storageUrl` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `cdnUrl` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `craft_relations`
--

CREATE TABLE IF NOT EXISTS `craft_relations` (
  `id` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `sourceId` int(11) NOT NULL,
  `sourceLocale` char(12) COLLATE utf8_unicode_ci DEFAULT NULL,
  `targetId` int(11) NOT NULL,
  `sortOrder` smallint(6) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `craft_routes`
--

CREATE TABLE IF NOT EXISTS `craft_routes` (
  `id` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci DEFAULT NULL,
  `urlParts` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `urlPattern` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `template` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sortOrder` tinyint(4) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `craft_searchindex`
--

CREATE TABLE IF NOT EXISTS `craft_searchindex` (
  `elementId` int(11) NOT NULL,
  `attribute` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `fieldId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `keywords` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `craft_searchindex`
--

INSERT INTO `craft_searchindex` (`elementId`, `attribute`, `fieldId`, `locale`, `keywords`) VALUES
(1, 'username', 0, 'en_us', ' paul '),
(1, 'firstname', 0, 'en_us', ''),
(1, 'lastname', 0, 'en_us', ''),
(1, 'fullname', 0, 'en_us', ''),
(1, 'email', 0, 'en_us', ' paul paulcarvill com '),
(1, 'slug', 0, 'en_us', ''),
(2, 'slug', 0, 'en_us', ' homepage '),
(2, 'title', 0, 'en_us', ' welcome to vagrant local '),
(2, 'field', 1, 'en_us', ' it s true this site doesn t have a whole lot of content yet but don t worry our web developers have just installed the cms and they re setting things up for the content editors this very moment soon vagrant local will be an oasis of fresh perspectives sharp analyses and astute opinions that will keep you coming back again and again '),
(8, 'name', 0, 'en_us', ' hot '),
(8, 'slug', 0, 'en_us', ''),
(8, 'title', 0, 'en_us', ' hot '),
(9, 'filename', 0, 'en_us', ' screen shot 2015 06 22 at 12 48 57 png '),
(9, 'extension', 0, 'en_us', ' png '),
(9, 'kind', 0, 'en_us', ' image '),
(9, 'slug', 0, 'en_us', ''),
(9, 'title', 0, 'en_us', ' screen shot 2015 06 22 at 12 48 57 '),
(7, 'title', 0, 'en_us', ' grime '),
(7, 'slug', 0, 'en_us', ''),
(7, 'name', 0, 'en_us', ' grime '),
(4, 'slug', 0, 'en_us', ''),
(4, 'title', 0, 'en_us', ' about '),
(5, 'slug', 0, 'en_us', ''),
(5, 'title', 0, 'en_us', ' contact '),
(102, 'title', 0, 'en_us', ' king krule rock bottom official video '),
(102, 'slug', 0, 'en_us', ''),
(102, 'field', 1, 'en_us', ''),
(102, 'field', 8, 'en_us', ''),
(102, 'field', 9, 'en_us', ''),
(102, 'field', 7, 'en_us', ''),
(102, 'field', 2, 'en_us', ''),
(102, 'field', 4, 'en_us', ''),
(102, 'field', 6, 'en_us', ''),
(102, 'field', 3, 'en_us', ''),
(102, 'field', 11, 'en_us', ' video youtube '),
(102, 'field', 10, 'en_us', ' http www youtube com watch v=hvzji8rerwa '),
(101, 'title', 0, 'en_us', ' king krule a lizard state official video '),
(101, 'slug', 0, 'en_us', ''),
(101, 'field', 9, 'en_us', ''),
(101, 'field', 1, 'en_us', ''),
(101, 'field', 8, 'en_us', ''),
(101, 'field', 2, 'en_us', ''),
(101, 'field', 7, 'en_us', ''),
(101, 'field', 6, 'en_us', ''),
(101, 'field', 4, 'en_us', ''),
(101, 'field', 3, 'en_us', ''),
(101, 'field', 11, 'en_us', ' video youtube '),
(101, 'field', 10, 'en_us', ' http www youtube com watch v=kpkr79srkte '),
(100, 'title', 0, 'en_us', ' king krule the noose of jah city '),
(100, 'slug', 0, 'en_us', ''),
(100, 'field', 1, 'en_us', ''),
(100, 'field', 9, 'en_us', ''),
(100, 'field', 8, 'en_us', ''),
(100, 'field', 7, 'en_us', ''),
(100, 'field', 2, 'en_us', ''),
(100, 'field', 6, 'en_us', ''),
(100, 'field', 4, 'en_us', ''),
(100, 'field', 3, 'en_us', ''),
(100, 'field', 11, 'en_us', ' video youtube '),
(100, 'field', 10, 'en_us', ' http www youtube com watch v=xi1_gyahcss '),
(99, 'slug', 0, 'en_us', ''),
(99, 'title', 0, 'en_us', ' juice vcr ident 001 '),
(99, 'field', 1, 'en_us', ''),
(99, 'field', 9, 'en_us', ''),
(99, 'field', 8, 'en_us', ''),
(99, 'field', 2, 'en_us', ''),
(99, 'field', 7, 'en_us', ''),
(99, 'field', 6, 'en_us', ''),
(99, 'field', 4, 'en_us', ''),
(99, 'field', 3, 'en_us', ''),
(99, 'field', 11, 'en_us', ' video youtube '),
(99, 'field', 10, 'en_us', ' http www youtube com watch v=sti1yu xtkk '),
(98, 'title', 0, 'en_us', ' juice vcr ident 002 '),
(98, 'slug', 0, 'en_us', ''),
(98, 'field', 1, 'en_us', ''),
(98, 'field', 9, 'en_us', ''),
(98, 'field', 8, 'en_us', ''),
(98, 'field', 2, 'en_us', ''),
(98, 'field', 7, 'en_us', ''),
(98, 'field', 6, 'en_us', ''),
(98, 'field', 4, 'en_us', ''),
(98, 'field', 3, 'en_us', ''),
(98, 'field', 11, 'en_us', ' video youtube '),
(98, 'field', 10, 'en_us', ' http www youtube com watch v=kswqtkvpoci '),
(97, 'title', 0, 'en_us', ' juice vcr ident 004 '),
(97, 'slug', 0, 'en_us', ''),
(97, 'field', 1, 'en_us', ''),
(97, 'field', 9, 'en_us', ''),
(97, 'field', 8, 'en_us', ''),
(97, 'field', 2, 'en_us', ''),
(97, 'field', 7, 'en_us', ''),
(97, 'field', 6, 'en_us', ''),
(97, 'field', 4, 'en_us', ''),
(97, 'field', 3, 'en_us', ''),
(97, 'field', 11, 'en_us', ' video youtube '),
(97, 'field', 10, 'en_us', ' http www youtube com watch v=lo8ig8jyymq '),
(96, 'title', 0, 'en_us', ' juice vcr ident 003 '),
(96, 'slug', 0, 'en_us', ''),
(96, 'field', 1, 'en_us', ''),
(96, 'field', 8, 'en_us', ''),
(96, 'field', 9, 'en_us', ''),
(96, 'field', 2, 'en_us', ''),
(96, 'field', 7, 'en_us', ''),
(96, 'field', 6, 'en_us', ''),
(96, 'field', 4, 'en_us', ''),
(96, 'field', 3, 'en_us', ''),
(96, 'field', 11, 'en_us', ' video youtube '),
(96, 'field', 10, 'en_us', ' http www youtube com watch v=b2yyv8inttk '),
(95, 'title', 0, 'en_us', ' run the jewels early official music video from run the jewels 2 '),
(95, 'slug', 0, 'en_us', ''),
(95, 'field', 1, 'en_us', ''),
(95, 'field', 9, 'en_us', ''),
(95, 'field', 8, 'en_us', ''),
(95, 'field', 2, 'en_us', ''),
(95, 'field', 7, 'en_us', ''),
(95, 'field', 6, 'en_us', ''),
(95, 'field', 4, 'en_us', ''),
(95, 'field', 3, 'en_us', ''),
(95, 'field', 11, 'en_us', ' video youtube '),
(95, 'field', 10, 'en_us', ' http www youtube com watch v=pjjyklrxyva '),
(94, 'slug', 0, 'en_us', ''),
(94, 'title', 0, 'en_us', ' rone acid reflux binaural audio version optimized for headphones '),
(94, 'field', 1, 'en_us', ''),
(94, 'field', 9, 'en_us', ''),
(94, 'field', 8, 'en_us', ''),
(94, 'field', 2, 'en_us', ''),
(94, 'field', 7, 'en_us', ''),
(94, 'field', 6, 'en_us', ''),
(94, 'field', 4, 'en_us', ''),
(94, 'field', 3, 'en_us', ''),
(94, 'field', 11, 'en_us', ' video youtube '),
(94, 'field', 10, 'en_us', ' http www youtube com watch v=5tv37e7xie4 '),
(93, 'title', 0, 'en_us', ' remy banks exhale '),
(93, 'slug', 0, 'en_us', ''),
(93, 'field', 1, 'en_us', ''),
(93, 'field', 9, 'en_us', ''),
(93, 'field', 8, 'en_us', ''),
(93, 'field', 2, 'en_us', ''),
(93, 'field', 7, 'en_us', ''),
(93, 'field', 6, 'en_us', ''),
(93, 'field', 4, 'en_us', ''),
(93, 'field', 3, 'en_us', ''),
(93, 'field', 11, 'en_us', ' video youtube '),
(93, 'field', 10, 'en_us', ' http www youtube com watch v=bhsc_ijmecw '),
(92, 'title', 0, 'en_us', ' tilapia jaguar '),
(92, 'slug', 0, 'en_us', ''),
(92, 'field', 1, 'en_us', ''),
(92, 'field', 9, 'en_us', ''),
(92, 'field', 8, 'en_us', ''),
(92, 'field', 2, 'en_us', ''),
(92, 'field', 7, 'en_us', ''),
(92, 'field', 6, 'en_us', ''),
(92, 'field', 3, 'en_us', ''),
(92, 'field', 4, 'en_us', ''),
(92, 'field', 11, 'en_us', ' video youtube '),
(92, 'field', 10, 'en_us', ' http www youtube com watch v=bf2o7wophcg '),
(91, 'title', 0, 'en_us', ' more fire crew oi '),
(91, 'slug', 0, 'en_us', ''),
(91, 'field', 1, 'en_us', ''),
(91, 'field', 9, 'en_us', ''),
(91, 'field', 8, 'en_us', ''),
(91, 'field', 2, 'en_us', ''),
(91, 'field', 7, 'en_us', ''),
(91, 'field', 6, 'en_us', ''),
(91, 'field', 4, 'en_us', ''),
(91, 'field', 3, 'en_us', ''),
(91, 'field', 11, 'en_us', ' video youtube '),
(91, 'field', 10, 'en_us', ' http www youtube com watch v=dtek4adpkik '),
(90, 'title', 0, 'en_us', ' redrawing taylor swift shake it off rotoscoped '),
(90, 'slug', 0, 'en_us', ''),
(90, 'field', 1, 'en_us', ''),
(90, 'field', 9, 'en_us', ''),
(90, 'field', 8, 'en_us', ''),
(90, 'field', 2, 'en_us', ''),
(90, 'field', 7, 'en_us', ''),
(90, 'field', 6, 'en_us', ''),
(90, 'field', 4, 'en_us', ''),
(90, 'field', 3, 'en_us', ''),
(90, 'field', 11, 'en_us', ' video youtube '),
(90, 'field', 10, 'en_us', ' http www youtube com watch v=rht_gvh_73w '),
(89, 'title', 0, 'en_us', ' juiceboxxx walking in milwaukee official video '),
(89, 'slug', 0, 'en_us', ''),
(89, 'field', 1, 'en_us', ''),
(89, 'field', 9, 'en_us', ''),
(89, 'field', 8, 'en_us', ''),
(89, 'field', 2, 'en_us', ''),
(89, 'field', 7, 'en_us', ''),
(89, 'field', 6, 'en_us', ''),
(89, 'field', 4, 'en_us', ''),
(89, 'field', 3, 'en_us', ''),
(89, 'field', 11, 'en_us', ' video youtube '),
(89, 'field', 10, 'en_us', ' http www youtube com watch v=ofbl9n04ena '),
(88, 'title', 0, 'en_us', ' aldous rh seductive atmospheres '),
(88, 'slug', 0, 'en_us', ''),
(88, 'field', 1, 'en_us', ''),
(88, 'field', 9, 'en_us', ''),
(88, 'field', 8, 'en_us', ''),
(88, 'field', 2, 'en_us', ''),
(88, 'field', 7, 'en_us', ''),
(88, 'field', 6, 'en_us', ''),
(88, 'field', 4, 'en_us', ''),
(88, 'field', 3, 'en_us', ''),
(88, 'field', 11, 'en_us', ' video youtube '),
(88, 'field', 10, 'en_us', ' http www youtube com watch v=d89tkcsij6o '),
(87, 'title', 0, 'en_us', ' little simz guess who ft josh arce chuck20 and tilla '),
(87, 'slug', 0, 'en_us', ''),
(87, 'field', 1, 'en_us', ''),
(87, 'field', 9, 'en_us', ''),
(87, 'field', 8, 'en_us', ''),
(87, 'field', 2, 'en_us', ''),
(87, 'field', 7, 'en_us', ''),
(87, 'field', 6, 'en_us', ''),
(87, 'field', 4, 'en_us', ''),
(87, 'field', 3, 'en_us', ''),
(87, 'field', 11, 'en_us', ' video youtube '),
(87, 'field', 10, 'en_us', ' http www youtube com watch v=gr76bxhuprg '),
(86, 'title', 0, 'en_us', ' towkio reflection prod kaytranada '),
(86, 'slug', 0, 'en_us', ''),
(86, 'field', 1, 'en_us', ''),
(86, 'field', 9, 'en_us', ''),
(86, 'field', 8, 'en_us', ''),
(86, 'field', 2, 'en_us', ''),
(86, 'field', 7, 'en_us', ''),
(86, 'field', 6, 'en_us', ''),
(86, 'field', 4, 'en_us', ''),
(86, 'field', 3, 'en_us', ''),
(86, 'field', 11, 'en_us', ' video youtube '),
(86, 'field', 10, 'en_us', ' http www youtube com watch v=rpe5ruj67sg '),
(85, 'title', 0, 'en_us', ' jaws bad company '),
(85, 'slug', 0, 'en_us', ''),
(85, 'field', 1, 'en_us', ''),
(85, 'field', 9, 'en_us', ''),
(85, 'field', 8, 'en_us', ''),
(85, 'field', 2, 'en_us', ''),
(85, 'field', 7, 'en_us', ''),
(85, 'field', 6, 'en_us', ''),
(85, 'field', 4, 'en_us', ''),
(85, 'field', 3, 'en_us', ''),
(85, 'field', 11, 'en_us', ' video youtube '),
(85, 'field', 10, 'en_us', ' http www youtube com watch v=2ivf1jctxte '),
(84, 'title', 0, 'en_us', ' kr play my shit official music video '),
(84, 'slug', 0, 'en_us', ''),
(84, 'field', 1, 'en_us', ''),
(84, 'field', 9, 'en_us', ''),
(84, 'field', 8, 'en_us', ''),
(84, 'field', 2, 'en_us', ''),
(84, 'field', 7, 'en_us', ''),
(84, 'field', 6, 'en_us', ''),
(84, 'field', 4, 'en_us', ''),
(84, 'field', 3, 'en_us', ''),
(84, 'field', 11, 'en_us', ' video youtube '),
(84, 'field', 10, 'en_us', ' http www youtube com watch v=p8nfprzp5ke '),
(83, 'title', 0, 'en_us', ' awate birthday '),
(83, 'slug', 0, 'en_us', ''),
(83, 'field', 1, 'en_us', ''),
(83, 'field', 9, 'en_us', ''),
(83, 'field', 8, 'en_us', ''),
(83, 'field', 2, 'en_us', ''),
(83, 'field', 7, 'en_us', ''),
(83, 'field', 6, 'en_us', ''),
(83, 'field', 4, 'en_us', ''),
(83, 'field', 3, 'en_us', ''),
(83, 'field', 11, 'en_us', ' video youtube '),
(83, 'field', 10, 'en_us', ' http www youtube com watch v=2wduyl9fe_u '),
(82, 'title', 0, 'en_us', ' bobby raps corbin welcome to the hell zone '),
(82, 'slug', 0, 'en_us', ''),
(82, 'field', 1, 'en_us', ''),
(82, 'field', 9, 'en_us', ''),
(82, 'field', 8, 'en_us', ''),
(82, 'field', 2, 'en_us', ''),
(82, 'field', 7, 'en_us', ''),
(82, 'field', 6, 'en_us', ''),
(82, 'field', 4, 'en_us', ''),
(82, 'field', 3, 'en_us', ''),
(82, 'field', 11, 'en_us', ' video youtube '),
(82, 'field', 10, 'en_us', ' http www youtube com watch v=93jc2m4_gpy '),
(81, 'title', 0, 'en_us', ' salomon faye black power '),
(81, 'slug', 0, 'en_us', ''),
(81, 'field', 1, 'en_us', ''),
(81, 'field', 9, 'en_us', ''),
(81, 'field', 8, 'en_us', ''),
(81, 'field', 2, 'en_us', ''),
(81, 'field', 7, 'en_us', ''),
(81, 'field', 6, 'en_us', ''),
(81, 'field', 4, 'en_us', ''),
(81, 'field', 3, 'en_us', ''),
(81, 'field', 11, 'en_us', ' video youtube '),
(81, 'field', 10, 'en_us', ' http www youtube com watch v=mx32paeph9q '),
(80, 'slug', 0, 'en_us', ''),
(80, 'title', 0, 'en_us', ' anderson paak the city official video '),
(80, 'field', 1, 'en_us', ''),
(80, 'field', 9, 'en_us', ''),
(80, 'field', 8, 'en_us', ''),
(80, 'field', 2, 'en_us', ''),
(80, 'field', 7, 'en_us', ''),
(80, 'field', 6, 'en_us', ''),
(80, 'field', 4, 'en_us', ''),
(80, 'field', 3, 'en_us', ''),
(80, 'field', 11, 'en_us', ' video youtube '),
(80, 'field', 10, 'en_us', ' http www youtube com watch v=k91gxps9mvi '),
(79, 'title', 0, 'en_us', ' omar souleyman bahdeni nami prod by four tet '),
(79, 'slug', 0, 'en_us', ''),
(79, 'field', 1, 'en_us', ''),
(79, 'field', 9, 'en_us', ''),
(79, 'field', 8, 'en_us', ''),
(79, 'field', 2, 'en_us', ''),
(79, 'field', 7, 'en_us', ''),
(79, 'field', 6, 'en_us', ''),
(79, 'field', 4, 'en_us', ''),
(79, 'field', 3, 'en_us', ''),
(79, 'field', 11, 'en_us', ' video youtube '),
(79, 'field', 10, 'en_us', ' http www youtube com watch v=jlu1xypexn8 '),
(78, 'title', 0, 'en_us', ' fidlar 40oz on repeat '),
(78, 'slug', 0, 'en_us', ''),
(78, 'field', 1, 'en_us', ''),
(78, 'field', 9, 'en_us', ''),
(78, 'field', 8, 'en_us', ''),
(78, 'field', 2, 'en_us', ''),
(78, 'field', 7, 'en_us', ''),
(78, 'field', 6, 'en_us', ''),
(78, 'field', 4, 'en_us', ''),
(78, 'field', 3, 'en_us', ''),
(78, 'field', 11, 'en_us', ' video youtube '),
(78, 'field', 10, 'en_us', ' http www youtube com watch v=ijy8vgb83oq '),
(77, 'title', 0, 'en_us', ' expressive feat bj the chicago kid illa j rosewood 2055 '),
(77, 'slug', 0, 'en_us', ''),
(77, 'field', 1, 'en_us', ''),
(77, 'field', 9, 'en_us', ''),
(77, 'field', 8, 'en_us', ''),
(77, 'field', 2, 'en_us', ''),
(77, 'field', 7, 'en_us', ''),
(77, 'field', 6, 'en_us', ''),
(77, 'field', 4, 'en_us', ''),
(77, 'field', 11, 'en_us', ' video youtube '),
(77, 'field', 3, 'en_us', ''),
(77, 'field', 10, 'en_us', ' http www youtube com watch v=r9ecooqv7 g '),
(76, 'title', 0, 'en_us', ' beach baby no mind no money '),
(76, 'slug', 0, 'en_us', ''),
(76, 'field', 1, 'en_us', ''),
(76, 'field', 9, 'en_us', ''),
(76, 'field', 8, 'en_us', ''),
(76, 'field', 2, 'en_us', ''),
(76, 'field', 7, 'en_us', ''),
(76, 'field', 6, 'en_us', ''),
(76, 'field', 3, 'en_us', ''),
(76, 'field', 4, 'en_us', ''),
(76, 'field', 11, 'en_us', ' video youtube '),
(76, 'field', 10, 'en_us', ' http www youtube com watch v= umrkwtzcco '),
(75, 'title', 0, 'en_us', ' amani fela night zoo prod jax '),
(75, 'slug', 0, 'en_us', ''),
(75, 'field', 1, 'en_us', ''),
(75, 'field', 9, 'en_us', ''),
(75, 'field', 8, 'en_us', ''),
(75, 'field', 2, 'en_us', ''),
(75, 'field', 7, 'en_us', ''),
(75, 'field', 6, 'en_us', ''),
(75, 'field', 4, 'en_us', ''),
(75, 'field', 3, 'en_us', ''),
(75, 'field', 11, 'en_us', ' video youtube '),
(75, 'field', 10, 'en_us', ' http www youtube com watch v=sruueeqqsoy '),
(74, 'title', 0, 'en_us', ' bullion saysah official video '),
(74, 'slug', 0, 'en_us', ''),
(74, 'field', 1, 'en_us', ''),
(74, 'field', 9, 'en_us', ''),
(74, 'field', 8, 'en_us', ''),
(74, 'field', 2, 'en_us', ''),
(74, 'field', 7, 'en_us', ''),
(74, 'field', 6, 'en_us', ''),
(74, 'field', 4, 'en_us', ''),
(74, 'field', 3, 'en_us', ''),
(74, 'field', 11, 'en_us', ' video youtube '),
(74, 'field', 10, 'en_us', ' http www youtube com watch v=qbcbrhqadsm '),
(73, 'title', 0, 'en_us', ' este '),
(73, 'slug', 0, 'en_us', ''),
(73, 'field', 1, 'en_us', ''),
(73, 'field', 9, 'en_us', ''),
(73, 'field', 8, 'en_us', ''),
(73, 'field', 2, 'en_us', ''),
(73, 'field', 7, 'en_us', ''),
(73, 'field', 6, 'en_us', ''),
(73, 'field', 4, 'en_us', ''),
(73, 'field', 3, 'en_us', ''),
(73, 'field', 11, 'en_us', ' video youtube '),
(73, 'field', 10, 'en_us', ' http www youtube com watch v=h hfgfwzj0c '),
(72, 'title', 0, 'en_us', ' black josh pete cannon know about it official video '),
(72, 'slug', 0, 'en_us', ''),
(72, 'field', 1, 'en_us', ''),
(72, 'field', 9, 'en_us', ''),
(72, 'field', 8, 'en_us', ''),
(72, 'field', 2, 'en_us', ''),
(72, 'field', 7, 'en_us', ''),
(72, 'field', 6, 'en_us', ''),
(72, 'field', 4, 'en_us', ''),
(72, 'field', 3, 'en_us', ''),
(72, 'field', 11, 'en_us', ' video youtube '),
(72, 'field', 10, 'en_us', ' http www youtube com watch v=g4ggbu0qglm '),
(71, 'title', 0, 'en_us', ' klein fake frendz '),
(71, 'slug', 0, 'en_us', ''),
(71, 'field', 1, 'en_us', ''),
(71, 'field', 9, 'en_us', ''),
(71, 'field', 8, 'en_us', ''),
(71, 'field', 2, 'en_us', ''),
(71, 'field', 7, 'en_us', ''),
(71, 'field', 6, 'en_us', ''),
(71, 'field', 4, 'en_us', ''),
(71, 'field', 3, 'en_us', ''),
(71, 'field', 11, 'en_us', ' video youtube '),
(71, 'field', 10, 'en_us', ' http www youtube com watch v=1fkoovyeuwg '),
(70, 'title', 0, 'en_us', ' storm from my 4th solo album in a low light '),
(70, 'slug', 0, 'en_us', ''),
(70, 'field', 1, 'en_us', ''),
(70, 'field', 9, 'en_us', ''),
(70, 'field', 8, 'en_us', ''),
(70, 'field', 2, 'en_us', ''),
(70, 'field', 7, 'en_us', ''),
(70, 'field', 6, 'en_us', ''),
(70, 'field', 4, 'en_us', ''),
(70, 'field', 3, 'en_us', ''),
(70, 'field', 11, 'en_us', ' video youtube '),
(70, 'field', 10, 'en_us', ' http www youtube com watch v=j4ngcp8nzne '),
(69, 'title', 0, 'en_us', ' donmonique you ain t heard prod by ryan scott official video '),
(69, 'slug', 0, 'en_us', ''),
(69, 'field', 1, 'en_us', ''),
(69, 'field', 9, 'en_us', ''),
(69, 'field', 8, 'en_us', ''),
(69, 'field', 2, 'en_us', ''),
(69, 'field', 7, 'en_us', ''),
(69, 'field', 6, 'en_us', ''),
(69, 'field', 4, 'en_us', ''),
(69, 'field', 3, 'en_us', ''),
(69, 'field', 11, 'en_us', ' video youtube '),
(69, 'field', 10, 'en_us', ' http www youtube com watch v=gwydhyftd3u '),
(68, 'title', 0, 'en_us', ' deecee what you know about music video '),
(68, 'slug', 0, 'en_us', ''),
(68, 'field', 1, 'en_us', ''),
(68, 'field', 9, 'en_us', ''),
(68, 'field', 8, 'en_us', ''),
(68, 'field', 2, 'en_us', ''),
(68, 'field', 7, 'en_us', ''),
(68, 'field', 6, 'en_us', ''),
(68, 'field', 4, 'en_us', ''),
(68, 'field', 3, 'en_us', ''),
(68, 'field', 11, 'en_us', ' video youtube '),
(68, 'field', 10, 'en_us', ' http www youtube com watch v=vyvrjas3rha '),
(67, 'title', 0, 'en_us', ' another one '),
(67, 'slug', 0, 'en_us', ''),
(67, 'field', 1, 'en_us', ''),
(67, 'field', 9, 'en_us', ''),
(67, 'field', 8, 'en_us', ''),
(67, 'field', 2, 'en_us', ''),
(67, 'field', 7, 'en_us', ''),
(67, 'field', 6, 'en_us', ''),
(67, 'field', 4, 'en_us', ''),
(67, 'field', 3, 'en_us', ''),
(67, 'field', 11, 'en_us', ' video youtube '),
(67, 'field', 10, 'en_us', ' http www youtube com watch v=gbg27ot8z9m '),
(66, 'title', 0, 'en_us', ' final flash lord rao cupp cave herrmutt lobby '),
(66, 'slug', 0, 'en_us', ''),
(66, 'field', 1, 'en_us', ''),
(66, 'field', 9, 'en_us', ''),
(66, 'field', 8, 'en_us', ''),
(66, 'field', 2, 'en_us', ''),
(66, 'field', 7, 'en_us', ''),
(66, 'field', 6, 'en_us', ''),
(66, 'field', 4, 'en_us', ''),
(66, 'field', 3, 'en_us', ''),
(66, 'field', 11, 'en_us', ' video youtube '),
(66, 'field', 10, 'en_us', ' http www youtube com watch v=y38c1tbfbdc '),
(65, 'title', 0, 'en_us', ' private video '),
(65, 'slug', 0, 'en_us', ''),
(65, 'field', 1, 'en_us', ''),
(65, 'field', 9, 'en_us', ''),
(65, 'field', 8, 'en_us', ''),
(65, 'field', 2, 'en_us', ''),
(65, 'field', 7, 'en_us', ''),
(65, 'field', 6, 'en_us', ''),
(65, 'field', 4, 'en_us', ''),
(65, 'field', 3, 'en_us', ''),
(65, 'field', 11, 'en_us', ' video youtube '),
(65, 'field', 10, 'en_us', ' http www youtube com watch v=zswwx_9ui6q '),
(64, 'slug', 0, 'en_us', ''),
(64, 'title', 0, 'en_us', ' eyedress lies tear us apart when the planets align '),
(64, 'field', 1, 'en_us', ''),
(64, 'field', 9, 'en_us', ''),
(64, 'field', 8, 'en_us', ''),
(64, 'field', 2, 'en_us', ''),
(64, 'field', 7, 'en_us', ''),
(64, 'field', 6, 'en_us', ''),
(64, 'field', 4, 'en_us', ''),
(64, 'field', 3, 'en_us', ''),
(64, 'field', 11, 'en_us', ' video youtube '),
(64, 'field', 10, 'en_us', ' http www youtube com watch v=xuimzfkmbe8 '),
(103, 'field', 10, 'en_us', ' http www youtube com watch v=o 3q0e zrsg '),
(103, 'field', 11, 'en_us', ' video youtube '),
(103, 'field', 3, 'en_us', ''),
(103, 'field', 4, 'en_us', ''),
(103, 'field', 6, 'en_us', ''),
(103, 'field', 7, 'en_us', ''),
(103, 'field', 2, 'en_us', ''),
(103, 'field', 8, 'en_us', ''),
(103, 'field', 9, 'en_us', ''),
(103, 'field', 1, 'en_us', ''),
(103, 'slug', 0, 'en_us', ''),
(103, 'title', 0, 'en_us', ' rejjie snow lost in empathy official video '),
(104, 'field', 10, 'en_us', ' http www youtube com watch v=2jidzsto53w '),
(104, 'field', 11, 'en_us', ' video youtube '),
(104, 'field', 3, 'en_us', ''),
(104, 'field', 4, 'en_us', ''),
(104, 'field', 6, 'en_us', ''),
(104, 'field', 7, 'en_us', ''),
(104, 'field', 2, 'en_us', ''),
(104, 'field', 8, 'en_us', ''),
(104, 'field', 9, 'en_us', ''),
(104, 'field', 1, 'en_us', ''),
(104, 'slug', 0, 'en_us', ''),
(104, 'title', 0, 'en_us', ' black pancakes '),
(105, 'field', 10, 'en_us', ' http www youtube com watch v=rxcmblhat3s '),
(105, 'field', 11, 'en_us', ' video youtube '),
(105, 'field', 3, 'en_us', ''),
(105, 'field', 4, 'en_us', ''),
(105, 'field', 6, 'en_us', ''),
(105, 'field', 7, 'en_us', ''),
(105, 'field', 2, 'en_us', ''),
(105, 'field', 8, 'en_us', ''),
(105, 'field', 9, 'en_us', ''),
(105, 'field', 1, 'en_us', ''),
(105, 'slug', 0, 'en_us', ''),
(105, 'title', 0, 'en_us', ' rejjie snow nights over georgia '),
(106, 'field', 10, 'en_us', ' http www youtube com watch v=9z9okqrzw60 '),
(106, 'field', 11, 'en_us', ' video youtube '),
(106, 'field', 3, 'en_us', ''),
(106, 'field', 4, 'en_us', ''),
(106, 'field', 6, 'en_us', ''),
(106, 'field', 7, 'en_us', ''),
(106, 'field', 2, 'en_us', ''),
(106, 'field', 8, 'en_us', ''),
(106, 'field', 9, 'en_us', ''),
(106, 'field', 1, 'en_us', ''),
(106, 'slug', 0, 'en_us', ''),
(106, 'title', 0, 'en_us', ' cayucas will the thrill official video '),
(107, 'field', 10, 'en_us', ' http www youtube com watch v=ahq5d5mdyie '),
(107, 'field', 11, 'en_us', ' video youtube '),
(107, 'field', 3, 'en_us', ''),
(107, 'field', 4, 'en_us', ''),
(107, 'field', 6, 'en_us', ''),
(107, 'field', 7, 'en_us', ''),
(107, 'field', 2, 'en_us', ''),
(107, 'field', 8, 'en_us', ''),
(107, 'field', 9, 'en_us', ''),
(107, 'field', 1, 'en_us', ''),
(107, 'slug', 0, 'en_us', ''),
(107, 'title', 0, 'en_us', ' video yung simmie popeye ft cashy '),
(108, 'field', 10, 'en_us', ' http www youtube com watch v=oacqygim9lg '),
(108, 'field', 11, 'en_us', ' video youtube '),
(108, 'field', 3, 'en_us', ''),
(108, 'field', 4, 'en_us', ''),
(108, 'field', 6, 'en_us', ''),
(108, 'field', 7, 'en_us', ''),
(108, 'field', 2, 'en_us', ''),
(108, 'field', 8, 'en_us', ''),
(108, 'field', 9, 'en_us', ''),
(108, 'field', 1, 'en_us', ''),
(108, 'slug', 0, 'en_us', ''),
(108, 'title', 0, 'en_us', ' django django first light official video '),
(109, 'field', 10, 'en_us', ' http www youtube com watch v=cpo ffqgjjc '),
(109, 'field', 11, 'en_us', ' video youtube '),
(109, 'field', 3, 'en_us', ''),
(109, 'field', 4, 'en_us', ''),
(109, 'field', 6, 'en_us', ''),
(109, 'field', 7, 'en_us', ''),
(109, 'field', 2, 'en_us', ''),
(109, 'field', 8, 'en_us', ''),
(109, 'field', 9, 'en_us', ''),
(109, 'field', 1, 'en_us', ''),
(109, 'slug', 0, 'en_us', ''),
(109, 'title', 0, 'en_us', ' obey city waterbed ft anthony flammia official video '),
(110, 'field', 10, 'en_us', ' http www youtube com watch v=kesiovoufm4 '),
(110, 'field', 11, 'en_us', ' video youtube '),
(110, 'field', 3, 'en_us', ''),
(110, 'field', 4, 'en_us', ''),
(110, 'field', 6, 'en_us', ''),
(110, 'field', 7, 'en_us', ''),
(110, 'field', 2, 'en_us', ''),
(110, 'field', 8, 'en_us', ''),
(110, 'field', 9, 'en_us', ''),
(110, 'field', 1, 'en_us', ''),
(110, 'slug', 0, 'en_us', ''),
(110, 'title', 0, 'en_us', ' dutch uncles decided knowledge '),
(111, 'field', 10, 'en_us', ' http www youtube com watch v=jnmt5bv_7my '),
(111, 'field', 11, 'en_us', ' video youtube '),
(111, 'field', 3, 'en_us', ''),
(111, 'field', 4, 'en_us', ''),
(111, 'field', 6, 'en_us', ''),
(111, 'field', 7, 'en_us', ''),
(111, 'field', 2, 'en_us', ''),
(111, 'field', 8, 'en_us', ''),
(111, 'field', 9, 'en_us', ''),
(111, 'field', 1, 'en_us', ''),
(111, 'slug', 0, 'en_us', ''),
(111, 'title', 0, 'en_us', ' mutual attraction lost tape '),
(112, 'field', 10, 'en_us', ' http www youtube com watch v=tw3jeuupchg '),
(112, 'field', 11, 'en_us', ' video youtube '),
(112, 'field', 3, 'en_us', ''),
(112, 'field', 4, 'en_us', ''),
(112, 'field', 6, 'en_us', ''),
(112, 'field', 7, 'en_us', ''),
(112, 'field', 2, 'en_us', ''),
(112, 'field', 8, 'en_us', ''),
(112, 'field', 9, 'en_us', ''),
(112, 'field', 1, 'en_us', ''),
(112, 'slug', 0, 'en_us', ''),
(112, 'title', 0, 'en_us', ' stinkin slumrok bisk catfish official video '),
(113, 'field', 10, 'en_us', ' http www youtube com watch v=ebxfrjj_s1k '),
(113, 'field', 11, 'en_us', ' video youtube '),
(113, 'field', 3, 'en_us', ''),
(113, 'field', 4, 'en_us', ''),
(113, 'field', 6, 'en_us', ''),
(113, 'field', 7, 'en_us', ''),
(113, 'field', 2, 'en_us', ''),
(113, 'field', 8, 'en_us', ''),
(113, 'field', 9, 'en_us', ''),
(113, 'field', 1, 'en_us', ''),
(113, 'slug', 0, 'en_us', ''),
(113, 'title', 0, 'en_us', ' palmbomen ii carina sayles official video '),
(114, 'field', 10, 'en_us', ' http www youtube com watch v=qrx1fun4zb4 '),
(114, 'field', 11, 'en_us', ' video youtube '),
(114, 'field', 3, 'en_us', ''),
(114, 'field', 4, 'en_us', ''),
(114, 'field', 6, 'en_us', ''),
(114, 'field', 7, 'en_us', ''),
(114, 'field', 2, 'en_us', ''),
(114, 'field', 8, 'en_us', ''),
(114, 'field', 9, 'en_us', ''),
(114, 'field', 1, 'en_us', ''),
(114, 'slug', 0, 'en_us', ''),
(114, 'title', 0, 'en_us', ' jam baxter caravan official video prod chemo '),
(115, 'field', 10, 'en_us', ' http www youtube com watch v=w ba3h_sv6o '),
(115, 'field', 11, 'en_us', ' video youtube '),
(115, 'field', 3, 'en_us', ''),
(115, 'field', 4, 'en_us', ''),
(115, 'field', 6, 'en_us', ''),
(115, 'field', 7, 'en_us', ''),
(115, 'field', 2, 'en_us', ''),
(115, 'field', 8, 'en_us', ''),
(115, 'field', 9, 'en_us', ''),
(115, 'field', 1, 'en_us', ''),
(115, 'slug', 0, 'en_us', ''),
(115, 'title', 0, 'en_us', ' loyle carner bfg official video '),
(116, 'field', 10, 'en_us', ' http www youtube com watch v=mul1tqclutu '),
(116, 'field', 11, 'en_us', ' video youtube '),
(116, 'field', 3, 'en_us', ''),
(116, 'field', 4, 'en_us', ''),
(116, 'field', 6, 'en_us', ''),
(116, 'field', 7, 'en_us', ''),
(116, 'field', 2, 'en_us', ''),
(116, 'field', 8, 'en_us', ''),
(116, 'field', 9, 'en_us', ''),
(116, 'field', 1, 'en_us', ''),
(116, 'slug', 0, 'en_us', ''),
(116, 'title', 0, 'en_us', ' proxima trapped official video '),
(117, 'field', 10, 'en_us', ' http www youtube com watch v=t0f5k9sgefi '),
(117, 'field', 11, 'en_us', ' video youtube '),
(117, 'field', 3, 'en_us', ''),
(117, 'field', 4, 'en_us', ''),
(117, 'field', 6, 'en_us', ''),
(117, 'field', 7, 'en_us', ''),
(117, 'field', 2, 'en_us', ''),
(117, 'field', 8, 'en_us', ''),
(117, 'field', 9, 'en_us', ''),
(117, 'field', 1, 'en_us', ''),
(117, 'slug', 0, 'en_us', ''),
(117, 'title', 0, 'en_us', ' broncho nc 17 official music video '),
(118, 'field', 10, 'en_us', ' http www youtube com watch v=pms yrjdzcq '),
(118, 'field', 11, 'en_us', ' video youtube '),
(118, 'field', 3, 'en_us', ''),
(118, 'field', 4, 'en_us', ''),
(118, 'field', 6, 'en_us', ''),
(118, 'field', 7, 'en_us', ''),
(118, 'field', 2, 'en_us', ''),
(118, 'field', 8, 'en_us', ''),
(118, 'field', 9, 'en_us', ''),
(118, 'field', 1, 'en_us', ''),
(118, 'slug', 0, 'en_us', ''),
(118, 'title', 0, 'en_us', ' fort romeau new jackson not a word '),
(119, 'field', 10, 'en_us', ' http www youtube com watch v=46jvvr6jw1e '),
(119, 'field', 11, 'en_us', ' video youtube '),
(119, 'field', 3, 'en_us', ''),
(119, 'field', 4, 'en_us', ''),
(119, 'field', 6, 'en_us', ''),
(119, 'field', 7, 'en_us', ''),
(119, 'field', 2, 'en_us', ''),
(119, 'field', 8, 'en_us', ''),
(119, 'field', 9, 'en_us', ''),
(119, 'field', 1, 'en_us', ''),
(119, 'slug', 0, 'en_us', ''),
(119, 'title', 0, 'en_us', ' kano hail official video '),
(120, 'field', 10, 'en_us', ' http www youtube com watch v=kofw2upldpk '),
(120, 'field', 11, 'en_us', ' video youtube '),
(120, 'field', 3, 'en_us', ''),
(120, 'field', 4, 'en_us', ''),
(120, 'field', 6, 'en_us', ''),
(120, 'field', 7, 'en_us', ''),
(120, 'field', 2, 'en_us', ''),
(120, 'field', 8, 'en_us', ''),
(120, 'field', 9, 'en_us', ''),
(120, 'field', 1, 'en_us', ''),
(120, 'slug', 0, 'en_us', ''),
(120, 'title', 0, 'en_us', ' yung lean thaiboy digital diamonds '),
(121, 'field', 10, 'en_us', ' http www youtube com watch v=jzmhcp7ab3k '),
(121, 'field', 11, 'en_us', ' video youtube '),
(121, 'field', 3, 'en_us', ''),
(121, 'field', 4, 'en_us', ''),
(121, 'field', 6, 'en_us', ''),
(121, 'field', 7, 'en_us', ''),
(121, 'field', 2, 'en_us', ''),
(121, 'field', 8, 'en_us', ''),
(121, 'field', 9, 'en_us', ''),
(121, 'field', 1, 'en_us', ''),
(121, 'slug', 0, 'en_us', ''),
(121, 'title', 0, 'en_us', ' d r a m cha cha official music video '),
(122, 'field', 10, 'en_us', ' http www youtube com watch v=fvrml2tfpy8 '),
(122, 'field', 11, 'en_us', ' video youtube '),
(122, 'field', 3, 'en_us', ''),
(122, 'field', 4, 'en_us', ''),
(122, 'field', 6, 'en_us', ''),
(122, 'field', 7, 'en_us', ''),
(122, 'field', 2, 'en_us', ''),
(122, 'field', 8, 'en_us', ''),
(122, 'field', 9, 'en_us', ''),
(122, 'field', 1, 'en_us', ''),
(122, 'slug', 0, 'en_us', ''),
(122, 'title', 0, 'en_us', ' casisdead nigella '),
(123, 'field', 10, 'en_us', ' http www youtube com watch v=lwwr3x_d5ru '),
(123, 'field', 11, 'en_us', ' video youtube '),
(123, 'field', 3, 'en_us', ''),
(123, 'field', 4, 'en_us', ''),
(123, 'field', 6, 'en_us', ''),
(123, 'field', 7, 'en_us', ''),
(123, 'field', 2, 'en_us', ''),
(123, 'field', 8, 'en_us', ''),
(123, 'field', 9, 'en_us', ''),
(123, 'field', 1, 'en_us', ''),
(123, 'slug', 0, 'en_us', ''),
(123, 'title', 0, 'en_us', ' marching church hungry for love official music video '),
(124, 'field', 10, 'en_us', ' http www youtube com watch v=nzqnzx2l0t4 '),
(124, 'field', 11, 'en_us', ' video youtube '),
(124, 'field', 3, 'en_us', ''),
(124, 'field', 4, 'en_us', ''),
(124, 'field', 6, 'en_us', ''),
(124, 'field', 7, 'en_us', ''),
(124, 'field', 2, 'en_us', ''),
(124, 'field', 8, 'en_us', ''),
(124, 'field', 9, 'en_us', ''),
(124, 'field', 1, 'en_us', ''),
(124, 'slug', 0, 'en_us', ''),
(124, 'title', 0, 'en_us', ' sir e u fireday official music video '),
(125, 'field', 10, 'en_us', ' http www youtube com watch v=wjnrk63xfdk '),
(125, 'field', 11, 'en_us', ' video youtube '),
(125, 'field', 3, 'en_us', ''),
(125, 'field', 4, 'en_us', ''),
(125, 'field', 6, 'en_us', ''),
(125, 'field', 7, 'en_us', ''),
(125, 'field', 2, 'en_us', ''),
(125, 'field', 8, 'en_us', ''),
(125, 'field', 9, 'en_us', ''),
(125, 'field', 1, 'en_us', ''),
(125, 'slug', 0, 'en_us', ''),
(125, 'title', 0, 'en_us', ' los yumas los foreign official video '),
(126, 'field', 10, 'en_us', ' http www youtube com watch v=j f3_me a4 '),
(126, 'field', 11, 'en_us', ' video youtube '),
(126, 'field', 3, 'en_us', ''),
(126, 'field', 4, 'en_us', ''),
(126, 'field', 6, 'en_us', ''),
(126, 'field', 7, 'en_us', ''),
(126, 'field', 2, 'en_us', ''),
(126, 'field', 8, 'en_us', ''),
(126, 'field', 9, 'en_us', ''),
(126, 'field', 1, 'en_us', ''),
(126, 'slug', 0, 'en_us', ''),
(126, 'title', 0, 'en_us', ' errors slow rotor official music video '),
(127, 'field', 10, 'en_us', ' http www youtube com watch v=jybnc0f5jla '),
(127, 'field', 11, 'en_us', ' video youtube '),
(127, 'field', 3, 'en_us', ''),
(127, 'field', 4, 'en_us', ''),
(127, 'field', 6, 'en_us', ''),
(127, 'field', 7, 'en_us', ''),
(127, 'field', 2, 'en_us', ''),
(127, 'field', 8, 'en_us', ''),
(127, 'field', 9, 'en_us', ''),
(127, 'field', 1, 'en_us', ''),
(127, 'slug', 0, 'en_us', ''),
(127, 'title', 0, 'en_us', ' dta official video feat sendawg yt prod by dj $abrewatts '),
(128, 'field', 10, 'en_us', ' http www youtube com watch v=calcg23hiba '),
(128, 'field', 11, 'en_us', ' video youtube '),
(128, 'field', 3, 'en_us', ''),
(128, 'field', 4, 'en_us', ''),
(128, 'field', 6, 'en_us', ''),
(128, 'field', 7, 'en_us', ''),
(128, 'field', 2, 'en_us', ''),
(128, 'field', 8, 'en_us', ''),
(128, 'field', 9, 'en_us', ''),
(128, 'field', 1, 'en_us', ''),
(128, 'slug', 0, 'en_us', ''),
(128, 'title', 0, 'en_us', ' sekuoia somewhere '),
(129, 'field', 10, 'en_us', ' http www youtube com watch v=4gpu62ps0b4 '),
(129, 'field', 11, 'en_us', ' video youtube '),
(129, 'field', 3, 'en_us', ''),
(129, 'field', 4, 'en_us', ''),
(129, 'field', 6, 'en_us', ''),
(129, 'field', 7, 'en_us', ''),
(129, 'field', 2, 'en_us', ''),
(129, 'field', 8, 'en_us', ''),
(129, 'field', 9, 'en_us', ''),
(129, 'field', 1, 'en_us', ''),
(129, 'slug', 0, 'en_us', ''),
(129, 'title', 0, 'en_us', ' yung nobody cares '),
(130, 'field', 10, 'en_us', ' http www youtube com watch v=kc8jhrf u60 '),
(130, 'field', 11, 'en_us', ' video youtube '),
(130, 'field', 3, 'en_us', ''),
(130, 'field', 4, 'en_us', ''),
(130, 'field', 6, 'en_us', ''),
(130, 'field', 7, 'en_us', ''),
(130, 'field', 2, 'en_us', ''),
(130, 'field', 8, 'en_us', ''),
(130, 'field', 9, 'en_us', ''),
(130, 'field', 1, 'en_us', ''),
(130, 'slug', 0, 'en_us', ''),
(130, 'title', 0, 'en_us', ' nick edward harris trying to be silent official video '),
(131, 'field', 10, 'en_us', ' http www youtube com watch v=dfq1256osca '),
(131, 'field', 11, 'en_us', ' video youtube '),
(131, 'field', 3, 'en_us', ''),
(131, 'field', 4, 'en_us', ''),
(131, 'field', 6, 'en_us', ''),
(131, 'field', 7, 'en_us', ''),
(131, 'field', 2, 'en_us', ''),
(131, 'field', 8, 'en_us', ''),
(131, 'field', 9, 'en_us', ''),
(131, 'field', 1, 'en_us', ''),
(131, 'slug', 0, 'en_us', ''),
(131, 'title', 0, 'en_us', ' elijah bank$y samo '),
(132, 'field', 10, 'en_us', ' http www youtube com watch v=hoamcsapwou '),
(132, 'field', 11, 'en_us', ' video youtube '),
(132, 'field', 3, 'en_us', ''),
(132, 'field', 4, 'en_us', ''),
(132, 'field', 6, 'en_us', ''),
(132, 'field', 7, 'en_us', ''),
(132, 'field', 2, 'en_us', ''),
(132, 'field', 8, 'en_us', ''),
(132, 'field', 9, 'en_us', ''),
(132, 'field', 1, 'en_us', ''),
(132, 'slug', 0, 'en_us', ''),
(132, 'title', 0, 'en_us', ' flako kuku official video hd '),
(133, 'field', 10, 'en_us', ' http www youtube com watch v=rvpxabhwcha '),
(133, 'field', 11, 'en_us', ' video youtube '),
(133, 'field', 3, 'en_us', ''),
(133, 'field', 4, 'en_us', ''),
(133, 'field', 6, 'en_us', ''),
(133, 'field', 7, 'en_us', ''),
(133, 'field', 2, 'en_us', ''),
(133, 'field', 8, 'en_us', ''),
(133, 'field', 9, 'en_us', ''),
(133, 'field', 1, 'en_us', ''),
(133, 'slug', 0, 'en_us', ''),
(133, 'title', 0, 'en_us', ' kid smpl ja official video '),
(134, 'field', 10, 'en_us', ' http www youtube com watch v=5pthfl63stq '),
(134, 'field', 11, 'en_us', ' video youtube '),
(134, 'field', 3, 'en_us', ''),
(134, 'field', 4, 'en_us', ''),
(134, 'field', 6, 'en_us', ''),
(134, 'field', 7, 'en_us', ''),
(134, 'field', 2, 'en_us', ''),
(134, 'field', 8, 'en_us', ''),
(134, 'field', 9, 'en_us', ''),
(134, 'field', 1, 'en_us', ''),
(134, 'slug', 0, 'en_us', ''),
(134, 'title', 0, 'en_us', ' doomtree final boss official music video '),
(135, 'field', 10, 'en_us', ' http www youtube com watch v=fpk2ejybfho '),
(135, 'field', 11, 'en_us', ' video youtube '),
(135, 'field', 3, 'en_us', ''),
(135, 'field', 4, 'en_us', ''),
(135, 'field', 6, 'en_us', ''),
(135, 'field', 7, 'en_us', ''),
(135, 'field', 2, 'en_us', ''),
(135, 'field', 8, 'en_us', ''),
(135, 'field', 9, 'en_us', ''),
(135, 'field', 1, 'en_us', ''),
(135, 'slug', 0, 'en_us', ''),
(135, 'title', 0, 'en_us', ' shamz le roc bus route '),
(136, 'field', 10, 'en_us', ' http www youtube com watch v= 7a9213oz5s '),
(136, 'field', 11, 'en_us', ' video youtube '),
(136, 'field', 3, 'en_us', ''),
(136, 'field', 4, 'en_us', ''),
(136, 'field', 6, 'en_us', ''),
(136, 'field', 7, 'en_us', ''),
(136, 'field', 2, 'en_us', ''),
(136, 'field', 8, 'en_us', ''),
(136, 'field', 9, 'en_us', ''),
(136, 'field', 1, 'en_us', ''),
(136, 'slug', 0, 'en_us', ''),
(136, 'title', 0, 'en_us', ' panes stills '),
(137, 'field', 10, 'en_us', ' http www youtube com watch v=otgvyuqhvj4 '),
(137, 'field', 11, 'en_us', ' video youtube '),
(137, 'field', 3, 'en_us', ''),
(137, 'field', 4, 'en_us', ''),
(137, 'field', 6, 'en_us', ''),
(137, 'field', 7, 'en_us', ''),
(137, 'field', 2, 'en_us', ''),
(137, 'field', 8, 'en_us', ''),
(137, 'field', 9, 'en_us', ''),
(137, 'field', 1, 'en_us', ''),
(137, 'slug', 0, 'en_us', ''),
(137, 'title', 0, 'en_us', ' lee scott black josh skedaddle prod by baileys brown official video '),
(138, 'field', 10, 'en_us', ' http www youtube com watch v=vktwbv3u4sm '),
(138, 'field', 11, 'en_us', ' video youtube '),
(138, 'field', 3, 'en_us', ''),
(138, 'field', 4, 'en_us', ''),
(138, 'field', 6, 'en_us', ''),
(138, 'field', 7, 'en_us', ''),
(138, 'field', 2, 'en_us', ''),
(138, 'field', 8, 'en_us', ''),
(138, 'field', 9, 'en_us', ''),
(138, 'field', 1, 'en_us', ''),
(138, 'slug', 0, 'en_us', ''),
(138, 'title', 0, 'en_us', ' black josh sky high ft bill shakes prod by reklews official video '),
(139, 'field', 10, 'en_us', ' http www youtube com watch v=b5tcedmwdbc '),
(139, 'field', 11, 'en_us', ' video youtube '),
(139, 'field', 3, 'en_us', ''),
(139, 'field', 4, 'en_us', ''),
(139, 'field', 6, 'en_us', ''),
(139, 'field', 7, 'en_us', ''),
(139, 'field', 2, 'en_us', ''),
(139, 'field', 8, 'en_us', ''),
(139, 'field', 9, 'en_us', ''),
(139, 'field', 1, 'en_us', ''),
(139, 'slug', 0, 'en_us', ''),
(139, 'title', 0, 'en_us', ' latrell james the button official video '),
(140, 'field', 10, 'en_us', ' http www youtube com watch v=oqtimq0rqng '),
(140, 'field', 11, 'en_us', ' video youtube '),
(140, 'field', 3, 'en_us', ''),
(140, 'field', 4, 'en_us', ''),
(140, 'field', 6, 'en_us', ''),
(140, 'field', 7, 'en_us', ''),
(140, 'field', 2, 'en_us', ''),
(140, 'field', 8, 'en_us', ''),
(140, 'field', 9, 'en_us', ''),
(140, 'field', 1, 'en_us', ''),
(140, 'slug', 0, 'en_us', ''),
(140, 'title', 0, 'en_us', ' bones sodium '),
(141, 'field', 10, 'en_us', ' http www youtube com watch v=wohgkblvzbo '),
(141, 'field', 11, 'en_us', ' video youtube '),
(141, 'field', 3, 'en_us', ''),
(141, 'field', 4, 'en_us', ''),
(141, 'field', 6, 'en_us', ''),
(141, 'field', 7, 'en_us', ''),
(141, 'field', 2, 'en_us', ''),
(141, 'field', 8, 'en_us', ''),
(141, 'field', 9, 'en_us', ''),
(141, 'field', 1, 'en_us', ''),
(141, 'slug', 0, 'en_us', ''),
(141, 'title', 0, 'en_us', ' salute silver tides official video '),
(142, 'field', 10, 'en_us', ' http www youtube com watch v=kc1htx3q f0 '),
(142, 'field', 11, 'en_us', ' video youtube '),
(142, 'field', 3, 'en_us', ''),
(142, 'field', 4, 'en_us', ''),
(142, 'field', 6, 'en_us', ''),
(142, 'field', 7, 'en_us', ''),
(142, 'field', 2, 'en_us', ''),
(142, 'field', 8, 'en_us', ''),
(142, 'field', 9, 'en_us', ''),
(142, 'field', 1, 'en_us', ''),
(142, 'slug', 0, 'en_us', ''),
(142, 'title', 0, 'en_us', ' sleater kinney a new wave official video '),
(143, 'field', 10, 'en_us', ' http www youtube com watch v=dxcta2bqf9a '),
(143, 'field', 11, 'en_us', ' video youtube '),
(143, 'field', 3, 'en_us', ''),
(143, 'field', 4, 'en_us', ''),
(143, 'field', 6, 'en_us', ''),
(143, 'field', 7, 'en_us', ''),
(143, 'field', 2, 'en_us', ''),
(143, 'field', 8, 'en_us', ''),
(143, 'field', 9, 'en_us', ''),
(143, 'field', 1, 'en_us', ''),
(143, 'slug', 0, 'en_us', ''),
(143, 'title', 0, 'en_us', ' pussy riot i can t breathe '),
(144, 'field', 10, 'en_us', ' http www youtube com watch v=coeiv_cfnnc '),
(144, 'field', 11, 'en_us', ' video youtube '),
(144, 'field', 3, 'en_us', ''),
(144, 'field', 4, 'en_us', ''),
(144, 'field', 6, 'en_us', ''),
(144, 'field', 7, 'en_us', ''),
(144, 'field', 2, 'en_us', ''),
(144, 'field', 8, 'en_us', ''),
(144, 'field', 9, 'en_us', ''),
(144, 'field', 1, 'en_us', ''),
(144, 'slug', 0, 'en_us', ''),
(144, 'title', 0, 'en_us', ' man z coulda told the truth official music video '),
(145, 'field', 10, 'en_us', ' http www youtube com watch v=wcbyftdi8mk '),
(145, 'field', 11, 'en_us', ' video youtube '),
(145, 'field', 3, 'en_us', ''),
(145, 'field', 4, 'en_us', ''),
(145, 'field', 6, 'en_us', ''),
(145, 'field', 7, 'en_us', ''),
(145, 'field', 2, 'en_us', ''),
(145, 'field', 8, 'en_us', ''),
(145, 'field', 9, 'en_us', ''),
(145, 'field', 1, 'en_us', ''),
(145, 'slug', 0, 'en_us', ''),
(145, 'title', 0, 'en_us', ' im crazy official music video '),
(146, 'field', 10, 'en_us', ' http www youtube com watch v=uwntf94ydyc '),
(146, 'field', 11, 'en_us', ' video youtube '),
(146, 'field', 3, 'en_us', ''),
(146, 'field', 4, 'en_us', ''),
(146, 'field', 6, 'en_us', ''),
(146, 'field', 7, 'en_us', ''),
(146, 'field', 2, 'en_us', ''),
(146, 'field', 8, 'en_us', ''),
(146, 'field', 9, 'en_us', ''),
(146, 'field', 1, 'en_us', ''),
(146, 'slug', 0, 'en_us', ''),
(146, 'title', 0, 'en_us', ' jalali set sura target official music video '),
(147, 'field', 10, 'en_us', ' http www youtube com watch v=fq0gt hurwq '),
(147, 'field', 11, 'en_us', ' video youtube '),
(147, 'field', 3, 'en_us', ''),
(147, 'field', 4, 'en_us', ''),
(147, 'field', 6, 'en_us', ''),
(147, 'field', 7, 'en_us', ''),
(147, 'field', 2, 'en_us', ''),
(147, 'field', 8, 'en_us', ''),
(147, 'field', 9, 'en_us', ''),
(147, 'field', 1, 'en_us', ''),
(147, 'slug', 0, 'en_us', ''),
(147, 'title', 0, 'en_us', ' onoe caponoe horse in the hill quadrant official video prod chemo '),
(148, 'field', 10, 'en_us', ' http www youtube com watch v=urvg4al2kqm '),
(148, 'field', 11, 'en_us', ' video youtube '),
(148, 'field', 3, 'en_us', ''),
(148, 'field', 4, 'en_us', ''),
(148, 'field', 6, 'en_us', ''),
(148, 'field', 7, 'en_us', ''),
(148, 'field', 2, 'en_us', ''),
(148, 'field', 8, 'en_us', ''),
(148, 'field', 9, 'en_us', ''),
(148, 'field', 1, 'en_us', ''),
(148, 'slug', 0, 'en_us', ''),
(148, 'title', 0, 'en_us', ' air pop intelexual '),
(149, 'field', 10, 'en_us', ' http www youtube com watch v=9bvshzyr_tq '),
(149, 'field', 11, 'en_us', ' video youtube '),
(149, 'field', 3, 'en_us', ''),
(149, 'field', 4, 'en_us', ''),
(149, 'field', 6, 'en_us', ''),
(149, 'field', 7, 'en_us', ''),
(149, 'field', 2, 'en_us', ''),
(149, 'field', 8, 'en_us', ''),
(149, 'field', 9, 'en_us', ''),
(149, 'field', 1, 'en_us', ''),
(149, 'slug', 0, 'en_us', ''),
(149, 'title', 0, 'en_us', ' pyramid quince we don t hear you prod dexter dukarus '),
(150, 'field', 10, 'en_us', ' http www youtube com watch v=m4 9myrbxvi '),
(150, 'field', 11, 'en_us', ' video youtube '),
(150, 'field', 3, 'en_us', ''),
(150, 'field', 4, 'en_us', ''),
(150, 'field', 6, 'en_us', ''),
(150, 'field', 7, 'en_us', ''),
(150, 'field', 2, 'en_us', ''),
(150, 'field', 8, 'en_us', ''),
(150, 'field', 9, 'en_us', ''),
(150, 'field', 1, 'en_us', ''),
(150, 'slug', 0, 'en_us', ''),
(150, 'title', 0, 'en_us', ' kelela a message official video '),
(151, 'field', 10, 'en_us', ' http www youtube com watch v=nvmqigerl7q '),
(151, 'field', 11, 'en_us', ' video youtube '),
(151, 'field', 3, 'en_us', ''),
(151, 'field', 4, 'en_us', ''),
(151, 'field', 6, 'en_us', ''),
(151, 'field', 7, 'en_us', ''),
(151, 'field', 2, 'en_us', ''),
(151, 'field', 8, 'en_us', ''),
(151, 'field', 9, 'en_us', ''),
(151, 'field', 1, 'en_us', ''),
(151, 'slug', 0, 'en_us', ''),
(151, 'title', 0, 'en_us', ' azealia banks wallace official '),
(152, 'field', 10, 'en_us', ' http www youtube com watch v=ybtxoagh8tu '),
(152, 'field', 11, 'en_us', ' video youtube '),
(152, 'field', 3, 'en_us', ''),
(152, 'field', 4, 'en_us', ''),
(152, 'field', 6, 'en_us', ''),
(152, 'field', 7, 'en_us', ''),
(152, 'field', 2, 'en_us', ''),
(152, 'field', 8, 'en_us', ''),
(152, 'field', 9, 'en_us', ''),
(152, 'field', 1, 'en_us', ''),
(152, 'slug', 0, 'en_us', ''),
(152, 'title', 0, 'en_us', ' dr yen lo day 3 '),
(153, 'field', 10, 'en_us', ' http www youtube com watch v=ybzswlpgjoa '),
(153, 'field', 11, 'en_us', ' video youtube '),
(153, 'field', 3, 'en_us', ''),
(153, 'field', 4, 'en_us', ''),
(153, 'field', 6, 'en_us', ''),
(153, 'field', 7, 'en_us', ''),
(153, 'field', 2, 'en_us', ''),
(153, 'field', 8, 'en_us', ''),
(153, 'field', 9, 'en_us', ''),
(153, 'field', 1, 'en_us', ''),
(153, 'slug', 0, 'en_us', ''),
(153, 'title', 0, 'en_us', ' holly herndon interference official video '),
(154, 'field', 10, 'en_us', ' http www youtube com watch v= p9wnmaa xk '),
(154, 'field', 11, 'en_us', ' video youtube '),
(154, 'field', 3, 'en_us', ''),
(154, 'field', 4, 'en_us', ''),
(154, 'field', 6, 'en_us', ''),
(154, 'field', 7, 'en_us', ''),
(154, 'field', 2, 'en_us', ''),
(154, 'field', 8, 'en_us', ''),
(154, 'field', 9, 'en_us', ''),
(154, 'field', 1, 'en_us', ''),
(154, 'slug', 0, 'en_us', ''),
(154, 'title', 0, 'en_us', ' subzy all i see music video sbtv '),
(155, 'field', 10, 'en_us', ' http www youtube com watch v=1gnfa7cil24 '),
(155, 'field', 11, 'en_us', ' video youtube '),
(155, 'field', 3, 'en_us', ''),
(155, 'field', 4, 'en_us', ''),
(155, 'field', 6, 'en_us', ''),
(155, 'field', 7, 'en_us', ''),
(155, 'field', 2, 'en_us', ''),
(155, 'field', 8, 'en_us', ''),
(155, 'field', 9, 'en_us', ''),
(155, 'field', 1, 'en_us', ''),
(155, 'slug', 0, 'en_us', ''),
(155, 'title', 0, 'en_us', ' filthy funk burn em up music video sbtv '),
(156, 'field', 10, 'en_us', ' http www youtube com watch v=tpy dpb2nyk '),
(156, 'field', 11, 'en_us', ' video youtube '),
(156, 'field', 3, 'en_us', ''),
(156, 'field', 4, 'en_us', ''),
(156, 'field', 6, 'en_us', ''),
(156, 'field', 7, 'en_us', ''),
(156, 'field', 2, 'en_us', ''),
(156, 'field', 8, 'en_us', ''),
(156, 'field', 9, 'en_us', ''),
(156, 'field', 1, 'en_us', ''),
(156, 'slug', 0, 'en_us', ''),
(156, 'title', 0, 'en_us', ' dizzee rascal ft giggs nutcrackerz official video '),
(157, 'field', 10, 'en_us', ' http www youtube com watch v=r5lm5i98lzg '),
(157, 'field', 11, 'en_us', ' video youtube '),
(157, 'field', 3, 'en_us', ''),
(157, 'field', 4, 'en_us', ''),
(157, 'field', 6, 'en_us', ''),
(157, 'field', 7, 'en_us', ''),
(157, 'field', 2, 'en_us', ''),
(157, 'field', 8, 'en_us', ''),
(157, 'field', 9, 'en_us', ''),
(157, 'field', 1, 'en_us', ''),
(157, 'slug', 0, 'en_us', ''),
(157, 'title', 0, 'en_us', ' g l o g a n g chief keef andy milonakis music video '),
(158, 'field', 10, 'en_us', ' http www youtube com watch v=hzxqvfpmeba '),
(158, 'field', 11, 'en_us', ' video youtube '),
(158, 'field', 3, 'en_us', ''),
(158, 'field', 4, 'en_us', ''),
(158, 'field', 6, 'en_us', ''),
(158, 'field', 7, 'en_us', ''),
(158, 'field', 2, 'en_us', ''),
(158, 'field', 8, 'en_us', ''),
(158, 'field', 9, 'en_us', ''),
(158, 'field', 1, 'en_us', ''),
(158, 'slug', 0, 'en_us', ''),
(158, 'title', 0, 'en_us', ' jazz cartier new religion '),
(159, 'field', 10, 'en_us', ' http www youtube com watch v=4q6 mxnjc5y '),
(159, 'field', 11, 'en_us', ' video youtube '),
(159, 'field', 3, 'en_us', ''),
(159, 'field', 4, 'en_us', ''),
(159, 'field', 6, 'en_us', ''),
(159, 'field', 7, 'en_us', ''),
(159, 'field', 2, 'en_us', ''),
(159, 'field', 8, 'en_us', ''),
(159, 'field', 9, 'en_us', ''),
(159, 'field', 1, 'en_us', ''),
(159, 'slug', 0, 'en_us', ''),
(159, 'title', 0, 'en_us', ' denzel curry ultimate teaser prod ronny j '),
(160, 'field', 10, 'en_us', ' http www youtube com watch v=qa2mwplqebq '),
(160, 'field', 11, 'en_us', ' video youtube '),
(160, 'field', 3, 'en_us', ''),
(160, 'field', 4, 'en_us', ''),
(160, 'field', 6, 'en_us', ''),
(160, 'field', 7, 'en_us', ''),
(160, 'field', 2, 'en_us', ''),
(160, 'field', 8, 'en_us', ''),
(160, 'field', 9, 'en_us', ''),
(160, 'field', 1, 'en_us', ''),
(160, 'slug', 0, 'en_us', ''),
(160, 'title', 0, 'en_us', ' pictureplane hyper real official video '),
(161, 'field', 10, 'en_us', ' http www youtube com watch v=cnbfc fa ww '),
(161, 'field', 11, 'en_us', ' video youtube '),
(161, 'field', 3, 'en_us', ''),
(161, 'field', 4, 'en_us', ''),
(161, 'field', 6, 'en_us', ''),
(161, 'field', 7, 'en_us', ''),
(161, 'field', 2, 'en_us', ''),
(161, 'field', 8, 'en_us', ''),
(161, 'field', 9, 'en_us', ''),
(161, 'field', 1, 'en_us', ''),
(161, 'slug', 0, 'en_us', ''),
(161, 'title', 0, 'en_us', ' fka twigs ­ glass patron official music video­ ytmas '),
(162, 'field', 10, 'en_us', ' http www youtube com watch v=tce3sb_bp74 '),
(162, 'field', 11, 'en_us', ' video youtube '),
(162, 'field', 3, 'en_us', ''),
(162, 'field', 4, 'en_us', ''),
(162, 'field', 6, 'en_us', ''),
(162, 'field', 7, 'en_us', ''),
(162, 'field', 2, 'en_us', ''),
(162, 'field', 8, 'en_us', ''),
(162, 'field', 9, 'en_us', ''),
(162, 'field', 1, 'en_us', ''),
(162, 'slug', 0, 'en_us', ''),
(162, 'title', 0, 'en_us', ' mc miliband x bbk that s not me '),
(163, 'field', 10, 'en_us', ' http www youtube com watch v=f7j6kll35e4 '),
(163, 'field', 11, 'en_us', ' video youtube '),
(163, 'field', 3, 'en_us', ''),
(163, 'field', 4, 'en_us', ''),
(163, 'field', 6, 'en_us', ''),
(163, 'field', 7, 'en_us', ''),
(163, 'field', 2, 'en_us', ''),
(163, 'field', 8, 'en_us', ''),
(163, 'field', 9, 'en_us', ''),
(163, 'field', 1, 'en_us', ''),
(163, 'slug', 0, 'en_us', ''),
(163, 'title', 0, 'en_us', ' dej loaf on my own video '),
(164, 'field', 10, 'en_us', ' http www youtube com watch v=7osj7fg8hnk '),
(164, 'field', 11, 'en_us', ' video youtube '),
(164, 'field', 3, 'en_us', ''),
(164, 'field', 4, 'en_us', ''),
(164, 'field', 6, 'en_us', ''),
(164, 'field', 7, 'en_us', ''),
(164, 'field', 2, 'en_us', ''),
(164, 'field', 8, 'en_us', ''),
(164, 'field', 9, 'en_us', ''),
(164, 'field', 1, 'en_us', ''),
(164, 'slug', 0, 'en_us', ''),
(164, 'title', 0, 'en_us', ' kindness i ll be back official video '),
(165, 'field', 10, 'en_us', ' http www youtube com watch v=6agm70qbvzk '),
(165, 'field', 11, 'en_us', ' video youtube '),
(165, 'field', 3, 'en_us', ''),
(165, 'field', 4, 'en_us', ''),
(165, 'field', 6, 'en_us', ''),
(165, 'field', 7, 'en_us', ''),
(165, 'field', 2, 'en_us', ''),
(165, 'field', 8, 'en_us', ''),
(165, 'field', 9, 'en_us', ''),
(165, 'field', 1, 'en_us', ''),
(165, 'slug', 0, 'en_us', ''),
(165, 'title', 0, 'en_us', ' uzzee the return music video sbtv '),
(166, 'field', 10, 'en_us', ' http www youtube com watch v=hhn4ebfwldk '),
(166, 'field', 11, 'en_us', ' video youtube '),
(166, 'field', 3, 'en_us', ''),
(166, 'field', 4, 'en_us', ''),
(166, 'field', 6, 'en_us', ''),
(166, 'field', 7, 'en_us', ''),
(166, 'field', 2, 'en_us', ''),
(166, 'field', 8, 'en_us', ''),
(166, 'field', 9, 'en_us', ''),
(166, 'field', 1, 'en_us', ''),
(166, 'slug', 0, 'en_us', ''),
(166, 'title', 0, 'en_us', ' chae buttuh bitch from the south promo '),
(167, 'field', 10, 'en_us', ' http www youtube com watch v=xgox2wvcluw '),
(167, 'field', 11, 'en_us', ' video youtube '),
(167, 'field', 3, 'en_us', ''),
(167, 'field', 4, 'en_us', ''),
(167, 'field', 6, 'en_us', ''),
(167, 'field', 7, 'en_us', ''),
(167, 'field', 2, 'en_us', ''),
(167, 'field', 8, 'en_us', ''),
(167, 'field', 9, 'en_us', ''),
(167, 'field', 1, 'en_us', ''),
(167, 'slug', 0, 'en_us', ''),
(167, 'title', 0, 'en_us', ' azealia banks ice princess '),
(168, 'field', 10, 'en_us', ' http www youtube com watch v=k5u4cwzt2jc '),
(168, 'field', 11, 'en_us', ' video youtube '),
(168, 'field', 3, 'en_us', ''),
(168, 'field', 4, 'en_us', ''),
(168, 'field', 6, 'en_us', ''),
(168, 'field', 7, 'en_us', ''),
(168, 'field', 2, 'en_us', ''),
(168, 'field', 8, 'en_us', ''),
(168, 'field', 9, 'en_us', ''),
(168, 'field', 1, 'en_us', ''),
(168, 'slug', 0, 'en_us', ''),
(168, 'title', 0, 'en_us', ' botzy couldn t believe my eyes '),
(169, 'field', 10, 'en_us', ' http www youtube com watch v=sihqvestdlg '),
(169, 'field', 11, 'en_us', ' video youtube '),
(169, 'field', 3, 'en_us', ''),
(169, 'field', 4, 'en_us', ''),
(169, 'field', 6, 'en_us', ''),
(169, 'field', 7, 'en_us', ''),
(169, 'field', 2, 'en_us', ''),
(169, 'field', 8, 'en_us', ''),
(169, 'field', 9, 'en_us', ''),
(169, 'field', 1, 'en_us', ''),
(169, 'slug', 0, 'en_us', ''),
(169, 'title', 0, 'en_us', ' metronomy the upsetter official video '),
(170, 'field', 10, 'en_us', ' http www youtube com watch v=jd13osxfqco '),
(170, 'field', 11, 'en_us', ' video youtube '),
(170, 'field', 3, 'en_us', ''),
(170, 'field', 4, 'en_us', ''),
(170, 'field', 6, 'en_us', ''),
(170, 'field', 7, 'en_us', ''),
(170, 'field', 2, 'en_us', ''),
(170, 'field', 8, 'en_us', ''),
(170, 'field', 9, 'en_us', ''),
(170, 'field', 1, 'en_us', ''),
(170, 'slug', 0, 'en_us', ''),
(170, 'title', 0, 'en_us', ' botzy flameburger '),
(171, 'field', 10, 'en_us', ' http www youtube com watch v=pwsvl08isho '),
(171, 'field', 11, 'en_us', ' video youtube '),
(171, 'field', 3, 'en_us', ''),
(171, 'field', 4, 'en_us', ''),
(171, 'field', 6, 'en_us', ''),
(171, 'field', 7, 'en_us', ''),
(171, 'field', 2, 'en_us', ''),
(171, 'field', 8, 'en_us', ''),
(171, 'field', 9, 'en_us', ''),
(171, 'field', 1, 'en_us', ''),
(171, 'slug', 0, 'en_us', ''),
(171, 'title', 0, 'en_us', ' death grips i break mirrors with my face in the united states ');
INSERT INTO `craft_searchindex` (`elementId`, `attribute`, `fieldId`, `locale`, `keywords`) VALUES
(172, 'field', 10, 'en_us', ' http www youtube com watch v=dwy7wm3p0u0 '),
(172, 'field', 11, 'en_us', ' video youtube '),
(172, 'field', 3, 'en_us', ''),
(172, 'field', 4, 'en_us', ''),
(172, 'field', 6, 'en_us', ''),
(172, 'field', 7, 'en_us', ''),
(172, 'field', 2, 'en_us', ''),
(172, 'field', 8, 'en_us', ''),
(172, 'field', 9, 'en_us', ''),
(172, 'field', 1, 'en_us', ''),
(172, 'slug', 0, 'en_us', ''),
(172, 'title', 0, 'en_us', ' gypjaq feat azealia banks blown away official video '),
(173, 'field', 10, 'en_us', ' http www youtube com watch v=hnmr1jpxwxo '),
(173, 'field', 11, 'en_us', ' video youtube '),
(173, 'field', 3, 'en_us', ''),
(173, 'field', 4, 'en_us', ''),
(173, 'field', 6, 'en_us', ''),
(173, 'field', 7, 'en_us', ''),
(173, 'field', 2, 'en_us', ''),
(173, 'field', 8, 'en_us', ''),
(173, 'field', 9, 'en_us', ''),
(173, 'field', 1, 'en_us', ''),
(173, 'slug', 0, 'en_us', ''),
(173, 'title', 0, 'en_us', ' towkio free your mind ft donnie trumpet prod cam obi the social experiment '),
(174, 'field', 10, 'en_us', ' http www youtube com watch v=_89iw1d8wmw '),
(174, 'field', 11, 'en_us', ' video youtube '),
(174, 'field', 3, 'en_us', ''),
(174, 'field', 4, 'en_us', ''),
(174, 'field', 6, 'en_us', ''),
(174, 'field', 7, 'en_us', ''),
(174, 'field', 2, 'en_us', ''),
(174, 'field', 8, 'en_us', ''),
(174, 'field', 9, 'en_us', ''),
(174, 'field', 1, 'en_us', ''),
(174, 'slug', 0, 'en_us', ''),
(174, 'title', 0, 'en_us', ' jme work '),
(175, 'field', 10, 'en_us', ' http www youtube com watch v=jz0nujrzfri '),
(175, 'field', 11, 'en_us', ' video youtube '),
(175, 'field', 3, 'en_us', ''),
(175, 'field', 4, 'en_us', ''),
(175, 'field', 6, 'en_us', ''),
(175, 'field', 7, 'en_us', ''),
(175, 'field', 2, 'en_us', ''),
(175, 'field', 8, 'en_us', ''),
(175, 'field', 9, 'en_us', ''),
(175, 'field', 1, 'en_us', ''),
(175, 'slug', 0, 'en_us', ''),
(175, 'title', 0, 'en_us', ' fliptrix jeheeze official video prod molotov '),
(176, 'field', 10, 'en_us', ' http www youtube com watch v=mwhpojt3qk4 '),
(176, 'field', 11, 'en_us', ' video youtube '),
(176, 'field', 3, 'en_us', ''),
(176, 'field', 4, 'en_us', ''),
(176, 'field', 6, 'en_us', ''),
(176, 'field', 7, 'en_us', ''),
(176, 'field', 2, 'en_us', ''),
(176, 'field', 8, 'en_us', ''),
(176, 'field', 9, 'en_us', ''),
(176, 'field', 1, 'en_us', ''),
(176, 'slug', 0, 'en_us', ''),
(176, 'title', 0, 'en_us', ' bjoerk lionsong '),
(177, 'field', 10, 'en_us', ' http www youtube com watch v=joj0jjcdco4 '),
(177, 'field', 11, 'en_us', ' video youtube '),
(177, 'field', 3, 'en_us', ''),
(177, 'field', 4, 'en_us', ''),
(177, 'field', 6, 'en_us', ''),
(177, 'field', 7, 'en_us', ''),
(177, 'field', 2, 'en_us', ''),
(177, 'field', 8, 'en_us', ''),
(177, 'field', 9, 'en_us', ''),
(177, 'field', 1, 'en_us', ''),
(177, 'slug', 0, 'en_us', ''),
(177, 'title', 0, 'en_us', ' whistlejacket mr melon '),
(178, 'field', 10, 'en_us', ' http www youtube com watch v=twhsg2xo c '),
(178, 'field', 11, 'en_us', ' video youtube '),
(178, 'field', 3, 'en_us', ''),
(178, 'field', 4, 'en_us', ''),
(178, 'field', 6, 'en_us', ''),
(178, 'field', 7, 'en_us', ''),
(178, 'field', 2, 'en_us', ''),
(178, 'field', 8, 'en_us', ''),
(178, 'field', 9, 'en_us', ''),
(178, 'field', 1, 'en_us', ''),
(178, 'slug', 0, 'en_us', ''),
(178, 'title', 0, 'en_us', ' jme integrity '),
(179, 'field', 10, 'en_us', ' http www youtube com watch v=0mmypnf7fo0 '),
(179, 'field', 11, 'en_us', ' video youtube '),
(179, 'field', 3, 'en_us', ''),
(179, 'field', 4, 'en_us', ''),
(179, 'field', 6, 'en_us', ''),
(179, 'field', 7, 'en_us', ''),
(179, 'field', 2, 'en_us', ''),
(179, 'field', 8, 'en_us', ''),
(179, 'field', 9, 'en_us', ''),
(179, 'field', 1, 'en_us', ''),
(179, 'slug', 0, 'en_us', ''),
(179, 'title', 0, 'en_us', ' lapsley brownlow '),
(180, 'field', 10, 'en_us', ' http www youtube com watch v=nblcm9gsqgg '),
(180, 'field', 11, 'en_us', ' video youtube '),
(180, 'field', 3, 'en_us', ''),
(180, 'field', 4, 'en_us', ''),
(180, 'field', 6, 'en_us', ''),
(180, 'field', 7, 'en_us', ''),
(180, 'field', 2, 'en_us', ''),
(180, 'field', 8, 'en_us', ''),
(180, 'field', 9, 'en_us', ''),
(180, 'field', 1, 'en_us', ''),
(180, 'slug', 0, 'en_us', ''),
(180, 'title', 0, 'en_us', ' eskmo mind of war official video '),
(181, 'field', 10, 'en_us', ' http www youtube com watch v=n9xklqgqwla '),
(181, 'field', 11, 'en_us', ' video youtube '),
(181, 'field', 3, 'en_us', ''),
(181, 'field', 4, 'en_us', ''),
(181, 'field', 6, 'en_us', ''),
(181, 'field', 7, 'en_us', ''),
(181, 'field', 2, 'en_us', ''),
(181, 'field', 8, 'en_us', ''),
(181, 'field', 9, 'en_us', ''),
(181, 'field', 1, 'en_us', ''),
(181, 'slug', 0, 'en_us', ''),
(181, 'title', 0, 'en_us', ' grimes realiti '),
(182, 'field', 10, 'en_us', ' http www youtube com watch v=bsd285vkb2e '),
(182, 'field', 11, 'en_us', ' video youtube '),
(182, 'field', 3, 'en_us', ''),
(182, 'field', 4, 'en_us', ''),
(182, 'field', 6, 'en_us', ''),
(182, 'field', 7, 'en_us', ''),
(182, 'field', 2, 'en_us', ''),
(182, 'field', 8, 'en_us', ''),
(182, 'field', 9, 'en_us', ''),
(182, 'field', 1, 'en_us', ''),
(182, 'slug', 0, 'en_us', ''),
(182, 'title', 0, 'en_us', ' jme taking over it ain t working '),
(183, 'field', 10, 'en_us', ' http www youtube com watch v=0w1hvzjyvjo '),
(183, 'field', 11, 'en_us', ' video youtube '),
(183, 'field', 3, 'en_us', ''),
(183, 'field', 4, 'en_us', ''),
(183, 'field', 6, 'en_us', ''),
(183, 'field', 7, 'en_us', ''),
(183, 'field', 2, 'en_us', ''),
(183, 'field', 8, 'en_us', ''),
(183, 'field', 9, 'en_us', ''),
(183, 'field', 1, 'en_us', ''),
(183, 'slug', 0, 'en_us', ''),
(183, 'title', 0, 'en_us', ' when did your last rose die '),
(184, 'field', 10, 'en_us', ' http www youtube com watch v=gl3iipt2ege '),
(184, 'field', 11, 'en_us', ' video youtube '),
(184, 'field', 3, 'en_us', ''),
(184, 'field', 4, 'en_us', ''),
(184, 'field', 6, 'en_us', ''),
(184, 'field', 7, 'en_us', ''),
(184, 'field', 2, 'en_us', ''),
(184, 'field', 8, 'en_us', ''),
(184, 'field', 9, 'en_us', ''),
(184, 'field', 1, 'en_us', ''),
(184, 'slug', 0, 'en_us', ''),
(184, 'title', 0, 'en_us', ' skepta all over the house official unsensored video '),
(185, 'field', 10, 'en_us', ' http www youtube com watch v=mhmcrfxxldm '),
(185, 'field', 11, 'en_us', ' video youtube '),
(185, 'field', 3, 'en_us', ''),
(185, 'field', 4, 'en_us', ''),
(185, 'field', 6, 'en_us', ''),
(185, 'field', 7, 'en_us', ''),
(185, 'field', 2, 'en_us', ''),
(185, 'field', 8, 'en_us', ''),
(185, 'field', 9, 'en_us', ''),
(185, 'field', 1, 'en_us', ''),
(185, 'slug', 0, 'en_us', ''),
(185, 'title', 0, 'en_us', ' shlohmo beams '),
(186, 'field', 10, 'en_us', ' http www youtube com watch v=haxvkbozk6e '),
(186, 'field', 11, 'en_us', ' video youtube '),
(186, 'field', 3, 'en_us', ''),
(186, 'field', 4, 'en_us', ''),
(186, 'field', 6, 'en_us', ''),
(186, 'field', 7, 'en_us', ''),
(186, 'field', 2, 'en_us', ''),
(186, 'field', 8, 'en_us', ''),
(186, 'field', 9, 'en_us', ''),
(186, 'field', 1, 'en_us', ''),
(186, 'slug', 0, 'en_us', ''),
(186, 'title', 0, 'en_us', ' bjoerk family moving album cover '),
(187, 'field', 10, 'en_us', ' http www youtube com watch v=kauyptdfo9y '),
(187, 'field', 11, 'en_us', ' video youtube '),
(187, 'field', 3, 'en_us', ''),
(187, 'field', 4, 'en_us', ''),
(187, 'field', 6, 'en_us', ''),
(187, 'field', 7, 'en_us', ''),
(187, 'field', 2, 'en_us', ''),
(187, 'field', 8, 'en_us', ''),
(187, 'field', 9, 'en_us', ''),
(187, 'field', 1, 'en_us', ''),
(187, 'slug', 0, 'en_us', ''),
(187, 'title', 0, 'en_us', ' james pants broth '),
(188, 'field', 10, 'en_us', ' http www youtube com watch v=mrsbsowhn94 '),
(188, 'field', 11, 'en_us', ' video youtube '),
(188, 'field', 3, 'en_us', ''),
(188, 'field', 4, 'en_us', ''),
(188, 'field', 6, 'en_us', ''),
(188, 'field', 7, 'en_us', ''),
(188, 'field', 2, 'en_us', ''),
(188, 'field', 8, 'en_us', ''),
(188, 'field', 9, 'en_us', ''),
(188, 'field', 1, 'en_us', ''),
(188, 'slug', 0, 'en_us', ''),
(188, 'title', 0, 'en_us', ' subzy music for your soul ft chany jungle vip official music video '),
(189, 'field', 10, 'en_us', ' http www youtube com watch v=cinjdxlusny '),
(189, 'field', 11, 'en_us', ' video youtube '),
(189, 'field', 3, 'en_us', ''),
(189, 'field', 4, 'en_us', ''),
(189, 'field', 6, 'en_us', ''),
(189, 'field', 7, 'en_us', ''),
(189, 'field', 2, 'en_us', ''),
(189, 'field', 8, 'en_us', ''),
(189, 'field', 9, 'en_us', ''),
(189, 'field', 1, 'en_us', ''),
(189, 'slug', 0, 'en_us', ''),
(189, 'title', 0, 'en_us', ' death grips on gp '),
(190, 'field', 10, 'en_us', ' http www youtube com watch v=0omtrtqew2s '),
(190, 'field', 11, 'en_us', ' video youtube '),
(190, 'field', 3, 'en_us', ''),
(190, 'field', 4, 'en_us', ''),
(190, 'field', 6, 'en_us', ''),
(190, 'field', 7, 'en_us', ''),
(190, 'field', 2, 'en_us', ''),
(190, 'field', 8, 'en_us', ''),
(190, 'field', 9, 'en_us', ''),
(190, 'field', 1, 'en_us', ''),
(190, 'slug', 0, 'en_us', ''),
(190, 'title', 0, 'en_us', ' ghostpoet x marks the spot feat nadine shah official video openshoot '),
(191, 'field', 10, 'en_us', ' http www youtube com watch v=eelljjfnksi '),
(191, 'field', 11, 'en_us', ' video youtube '),
(191, 'field', 3, 'en_us', ''),
(191, 'field', 4, 'en_us', ''),
(191, 'field', 6, 'en_us', ''),
(191, 'field', 7, 'en_us', ''),
(191, 'field', 2, 'en_us', ''),
(191, 'field', 8, 'en_us', ''),
(191, 'field', 9, 'en_us', ''),
(191, 'field', 1, 'en_us', ''),
(191, 'slug', 0, 'en_us', ''),
(191, 'title', 0, 'en_us', ' of montreal bassem sabry official music video '),
(192, 'field', 10, 'en_us', ' http www youtube com watch v=pxbzuja69da '),
(192, 'field', 11, 'en_us', ' video youtube '),
(192, 'field', 3, 'en_us', ''),
(192, 'field', 4, 'en_us', ''),
(192, 'field', 6, 'en_us', ''),
(192, 'field', 7, 'en_us', ''),
(192, 'field', 2, 'en_us', ''),
(192, 'field', 8, 'en_us', ''),
(192, 'field', 9, 'en_us', ''),
(192, 'field', 1, 'en_us', ''),
(192, 'slug', 0, 'en_us', ''),
(192, 'title', 0, 'en_us', ' stormzy stormzy1 know me from '),
(193, 'field', 10, 'en_us', ' http www youtube com watch v=_9rpiexwjja '),
(193, 'field', 11, 'en_us', ' video youtube '),
(193, 'field', 3, 'en_us', ''),
(193, 'field', 4, 'en_us', ''),
(193, 'field', 6, 'en_us', ''),
(193, 'field', 7, 'en_us', ''),
(193, 'field', 2, 'en_us', ''),
(193, 'field', 8, 'en_us', ''),
(193, 'field', 9, 'en_us', ''),
(193, 'field', 1, 'en_us', ''),
(193, 'slug', 0, 'en_us', ''),
(193, 'title', 0, 'en_us', ' devonte hynes and neneh cherry he she me '),
(194, 'field', 10, 'en_us', ' http www youtube com watch v=cr9hlzpuxym '),
(194, 'field', 11, 'en_us', ' video youtube '),
(194, 'field', 3, 'en_us', ''),
(194, 'field', 4, 'en_us', ''),
(194, 'field', 6, 'en_us', ''),
(194, 'field', 7, 'en_us', ''),
(194, 'field', 2, 'en_us', ''),
(194, 'field', 8, 'en_us', ''),
(194, 'field', 9, 'en_us', ''),
(194, 'field', 1, 'en_us', ''),
(194, 'slug', 0, 'en_us', ''),
(194, 'title', 0, 'en_us', ' yung simmie ill as fuk video '),
(195, 'field', 10, 'en_us', ' http www youtube com watch v=zsw28hve4ju '),
(195, 'field', 11, 'en_us', ' video youtube '),
(195, 'field', 3, 'en_us', ''),
(195, 'field', 4, 'en_us', ''),
(195, 'field', 6, 'en_us', ''),
(195, 'field', 7, 'en_us', ''),
(195, 'field', 2, 'en_us', ''),
(195, 'field', 8, 'en_us', ''),
(195, 'field', 9, 'en_us', ''),
(195, 'field', 1, 'en_us', ''),
(195, 'slug', 0, 'en_us', ''),
(195, 'title', 0, 'en_us', ' koosh official video feat sendawg yt '),
(196, 'field', 10, 'en_us', ' http www youtube com watch v=rbouurlip2u '),
(196, 'field', 11, 'en_us', ' video youtube '),
(196, 'field', 3, 'en_us', ''),
(196, 'field', 4, 'en_us', ''),
(196, 'field', 6, 'en_us', ''),
(196, 'field', 7, 'en_us', ''),
(196, 'field', 2, 'en_us', ''),
(196, 'field', 8, 'en_us', ''),
(196, 'field', 9, 'en_us', ''),
(196, 'field', 1, 'en_us', ''),
(196, 'slug', 0, 'en_us', ''),
(196, 'title', 0, 'en_us', ' dressin red our love official video '),
(197, 'field', 10, 'en_us', ' http www youtube com watch v=25sptjyn_bk '),
(197, 'field', 11, 'en_us', ' video youtube '),
(197, 'field', 3, 'en_us', ''),
(197, 'field', 4, 'en_us', ''),
(197, 'field', 6, 'en_us', ''),
(197, 'field', 7, 'en_us', ''),
(197, 'field', 2, 'en_us', ''),
(197, 'field', 8, 'en_us', ''),
(197, 'field', 9, 'en_us', ''),
(197, 'field', 1, 'en_us', ''),
(197, 'slug', 0, 'en_us', ''),
(197, 'title', 0, 'en_us', ' tygapaw keep on '),
(198, 'field', 10, 'en_us', ' http www youtube com watch v=ue6lpgzkyqo '),
(198, 'field', 11, 'en_us', ' video youtube '),
(198, 'field', 3, 'en_us', ''),
(198, 'field', 4, 'en_us', ''),
(198, 'field', 6, 'en_us', ''),
(198, 'field', 7, 'en_us', ''),
(198, 'field', 2, 'en_us', ''),
(198, 'field', 8, 'en_us', ''),
(198, 'field', 9, 'en_us', ''),
(198, 'field', 1, 'en_us', ''),
(198, 'slug', 0, 'en_us', ''),
(198, 'title', 0, 'en_us', ' tee vish jenna g don t hold back official video '),
(199, 'field', 10, 'en_us', ' http www youtube com watch v=rrqluz_5eea '),
(199, 'field', 11, 'en_us', ' video youtube '),
(199, 'field', 3, 'en_us', ''),
(199, 'field', 4, 'en_us', ''),
(199, 'field', 6, 'en_us', ''),
(199, 'field', 7, 'en_us', ''),
(199, 'field', 2, 'en_us', ''),
(199, 'field', 8, 'en_us', ''),
(199, 'field', 9, 'en_us', ''),
(199, 'field', 1, 'en_us', ''),
(199, 'slug', 0, 'en_us', ''),
(199, 'title', 0, 'en_us', ' alone now official music video zebra katz '),
(200, 'field', 10, 'en_us', ' http www youtube com watch v=mxeqws jgmi '),
(200, 'field', 11, 'en_us', ' video youtube '),
(200, 'field', 3, 'en_us', ''),
(200, 'field', 4, 'en_us', ''),
(200, 'field', 6, 'en_us', ''),
(200, 'field', 7, 'en_us', ''),
(200, 'field', 2, 'en_us', ''),
(200, 'field', 8, 'en_us', ''),
(200, 'field', 9, 'en_us', ''),
(200, 'field', 1, 'en_us', ''),
(200, 'slug', 0, 'en_us', ''),
(200, 'title', 0, 'en_us', ' sam binga tek nuh chat ft redders official video '),
(201, 'field', 10, 'en_us', ' http www youtube com watch v=9pqpukvqgtk '),
(201, 'field', 11, 'en_us', ' video youtube '),
(201, 'field', 3, 'en_us', ''),
(201, 'field', 4, 'en_us', ''),
(201, 'field', 6, 'en_us', ''),
(201, 'field', 7, 'en_us', ''),
(201, 'field', 2, 'en_us', ''),
(201, 'field', 8, 'en_us', ''),
(201, 'field', 9, 'en_us', ''),
(201, 'field', 1, 'en_us', ''),
(201, 'slug', 0, 'en_us', ''),
(201, 'title', 0, 'en_us', ' young girls princess nokia '),
(202, 'field', 10, 'en_us', ' http www youtube com watch v=3ydp9mkvhzc '),
(202, 'field', 11, 'en_us', ' video youtube '),
(202, 'field', 3, 'en_us', ''),
(202, 'field', 4, 'en_us', ''),
(202, 'field', 6, 'en_us', ''),
(202, 'field', 7, 'en_us', ''),
(202, 'field', 2, 'en_us', ''),
(202, 'field', 8, 'en_us', ''),
(202, 'field', 9, 'en_us', ''),
(202, 'field', 1, 'en_us', ''),
(202, 'slug', 0, 'en_us', ''),
(202, 'title', 0, 'en_us', ' fka twigs two weeks '),
(203, 'field', 10, 'en_us', ' http www youtube com watch v=o8yix8pzklw '),
(203, 'field', 11, 'en_us', ' video youtube '),
(203, 'field', 3, 'en_us', ''),
(203, 'field', 4, 'en_us', ''),
(203, 'field', 6, 'en_us', ''),
(203, 'field', 7, 'en_us', ''),
(203, 'field', 2, 'en_us', ''),
(203, 'field', 8, 'en_us', ''),
(203, 'field', 9, 'en_us', ''),
(203, 'field', 1, 'en_us', ''),
(203, 'slug', 0, 'en_us', ''),
(203, 'title', 0, 'en_us', ' fka twigs pendulum '),
(204, 'field', 10, 'en_us', ' http www youtube com watch v=5s7ny q1_cc '),
(204, 'field', 11, 'en_us', ' video youtube '),
(204, 'field', 3, 'en_us', ''),
(204, 'field', 4, 'en_us', ''),
(204, 'field', 6, 'en_us', ''),
(204, 'field', 7, 'en_us', ''),
(204, 'field', 2, 'en_us', ''),
(204, 'field', 8, 'en_us', ''),
(204, 'field', 9, 'en_us', ''),
(204, 'field', 1, 'en_us', ''),
(204, 'slug', 0, 'en_us', ''),
(204, 'title', 0, 'en_us', ' show me the body one train official video '),
(205, 'field', 10, 'en_us', ' http www youtube com watch v=nu36rz3ui1u '),
(205, 'field', 11, 'en_us', ' video youtube '),
(205, 'field', 3, 'en_us', ''),
(205, 'field', 4, 'en_us', ''),
(205, 'field', 6, 'en_us', ''),
(205, 'field', 7, 'en_us', ''),
(205, 'field', 2, 'en_us', ''),
(205, 'field', 8, 'en_us', ''),
(205, 'field', 9, 'en_us', ''),
(205, 'field', 1, 'en_us', ''),
(205, 'slug', 0, 'en_us', ''),
(205, 'title', 0, 'en_us', ' salomon faye luv feat raveena official music video '),
(206, 'field', 10, 'en_us', ' http www youtube com watch v=6lwbznxqeeg '),
(206, 'field', 11, 'en_us', ' video youtube '),
(206, 'field', 3, 'en_us', ''),
(206, 'field', 4, 'en_us', ''),
(206, 'field', 6, 'en_us', ''),
(206, 'field', 7, 'en_us', ''),
(206, 'field', 2, 'en_us', ''),
(206, 'field', 8, 'en_us', ''),
(206, 'field', 9, 'en_us', ''),
(206, 'field', 1, 'en_us', ''),
(206, 'slug', 0, 'en_us', ''),
(206, 'title', 0, 'en_us', ' loyle carner october ft kiko bun official video '),
(207, 'field', 10, 'en_us', ' http www youtube com watch v=6t zua0uaw0 '),
(207, 'field', 11, 'en_us', ' video youtube '),
(207, 'field', 3, 'en_us', ''),
(207, 'field', 4, 'en_us', ''),
(207, 'field', 6, 'en_us', ''),
(207, 'field', 7, 'en_us', ''),
(207, 'field', 2, 'en_us', ''),
(207, 'field', 8, 'en_us', ''),
(207, 'field', 9, 'en_us', ''),
(207, 'field', 1, 'en_us', ''),
(207, 'slug', 0, 'en_us', ''),
(207, 'title', 0, 'en_us', ' tops outside official video '),
(208, 'field', 10, 'en_us', ' http www youtube com watch v=xy6cttecxxw '),
(208, 'field', 11, 'en_us', ' video youtube '),
(208, 'field', 3, 'en_us', ''),
(208, 'field', 4, 'en_us', ''),
(208, 'field', 6, 'en_us', ''),
(208, 'field', 7, 'en_us', ''),
(208, 'field', 2, 'en_us', ''),
(208, 'field', 8, 'en_us', ''),
(208, 'field', 9, 'en_us', ''),
(208, 'field', 1, 'en_us', ''),
(208, 'slug', 0, 'en_us', ''),
(208, 'title', 0, 'en_us', ' oscar sometimes '),
(209, 'field', 10, 'en_us', ' http www youtube com watch v=0hsdhnwyu9i '),
(209, 'field', 11, 'en_us', ' video youtube '),
(209, 'field', 3, 'en_us', ''),
(209, 'field', 4, 'en_us', ''),
(209, 'field', 6, 'en_us', ''),
(209, 'field', 7, 'en_us', ''),
(209, 'field', 2, 'en_us', ''),
(209, 'field', 8, 'en_us', ''),
(209, 'field', 9, 'en_us', ''),
(209, 'field', 1, 'en_us', ''),
(209, 'slug', 0, 'en_us', ''),
(209, 'title', 0, 'en_us', ' sean nicholas savage spotted brown '),
(210, 'field', 10, 'en_us', ' http www youtube com watch v=fm8tvwsgoxm '),
(210, 'field', 11, 'en_us', ' video youtube '),
(210, 'field', 3, 'en_us', ''),
(210, 'field', 4, 'en_us', ''),
(210, 'field', 6, 'en_us', ''),
(210, 'field', 7, 'en_us', ''),
(210, 'field', 2, 'en_us', ''),
(210, 'field', 8, 'en_us', ''),
(210, 'field', 9, 'en_us', ''),
(210, 'field', 1, 'en_us', ''),
(210, 'slug', 0, 'en_us', ''),
(210, 'title', 0, 'en_us', ' antwon 3rd world grrl music video '),
(211, 'field', 10, 'en_us', ' http www youtube com watch v=kbll4n6tyce '),
(211, 'field', 11, 'en_us', ' video youtube '),
(211, 'field', 3, 'en_us', ''),
(211, 'field', 4, 'en_us', ''),
(211, 'field', 6, 'en_us', ''),
(211, 'field', 7, 'en_us', ''),
(211, 'field', 2, 'en_us', ''),
(211, 'field', 8, 'en_us', ''),
(211, 'field', 9, 'en_us', ''),
(211, 'field', 1, 'en_us', ''),
(211, 'slug', 0, 'en_us', ''),
(211, 'title', 0, 'en_us', ' sean nicholas savage empire official video '),
(212, 'field', 10, 'en_us', ' http www youtube com watch v=tcad8fqclrm '),
(212, 'field', 11, 'en_us', ' video youtube '),
(212, 'field', 3, 'en_us', ''),
(212, 'field', 4, 'en_us', ''),
(212, 'field', 6, 'en_us', ''),
(212, 'field', 7, 'en_us', ''),
(212, 'field', 2, 'en_us', ''),
(212, 'field', 8, 'en_us', ''),
(212, 'field', 9, 'en_us', ''),
(212, 'field', 1, 'en_us', ''),
(212, 'slug', 0, 'en_us', ''),
(212, 'title', 0, 'en_us', ' poison ivory mr wonderful '),
(213, 'field', 10, 'en_us', ' http www youtube com watch v=vqbblrcqv0w '),
(213, 'field', 11, 'en_us', ' video youtube '),
(213, 'field', 3, 'en_us', ''),
(213, 'field', 4, 'en_us', ''),
(213, 'field', 6, 'en_us', ''),
(213, 'field', 7, 'en_us', ''),
(213, 'field', 2, 'en_us', ''),
(213, 'field', 8, 'en_us', ''),
(213, 'field', 9, 'en_us', ''),
(213, 'field', 1, 'en_us', ''),
(213, 'slug', 0, 'en_us', ''),
(213, 'title', 0, 'en_us', ' denzel curry zone 3 official video '),
(214, 'field', 10, 'en_us', ' http www youtube com watch v=nwg51 erywe '),
(214, 'field', 11, 'en_us', ' video youtube '),
(214, 'field', 3, 'en_us', ''),
(214, 'field', 4, 'en_us', ''),
(214, 'field', 6, 'en_us', ''),
(214, 'field', 7, 'en_us', ''),
(214, 'field', 2, 'en_us', ''),
(214, 'field', 8, 'en_us', ''),
(214, 'field', 9, 'en_us', ''),
(214, 'field', 1, 'en_us', ''),
(214, 'slug', 0, 'en_us', ''),
(214, 'title', 0, 'en_us', ' phresh james indigo '),
(215, 'field', 10, 'en_us', ' http www youtube com watch v=7voxgd44fne '),
(215, 'field', 11, 'en_us', ' video youtube '),
(215, 'field', 3, 'en_us', ''),
(215, 'field', 4, 'en_us', ''),
(215, 'field', 6, 'en_us', ''),
(215, 'field', 7, 'en_us', ''),
(215, 'field', 2, 'en_us', ''),
(215, 'field', 8, 'en_us', ''),
(215, 'field', 9, 'en_us', ''),
(215, 'field', 1, 'en_us', ''),
(215, 'slug', 0, 'en_us', ''),
(215, 'title', 0, 'en_us', ' robb bank$ ice cold official video '),
(216, 'field', 10, 'en_us', ' http www youtube com watch v=t6vtsev83eq '),
(216, 'field', 11, 'en_us', ' video youtube '),
(216, 'field', 3, 'en_us', ''),
(216, 'field', 4, 'en_us', ''),
(216, 'field', 6, 'en_us', ''),
(216, 'field', 7, 'en_us', ''),
(216, 'field', 2, 'en_us', ''),
(216, 'field', 8, 'en_us', ''),
(216, 'field', 9, 'en_us', ''),
(216, 'field', 1, 'en_us', ''),
(216, 'slug', 0, 'en_us', ''),
(216, 'title', 0, 'en_us', ' cakes da killa living gud eating gud '),
(217, 'field', 10, 'en_us', ' http www youtube com watch v=atwvdabw0ge '),
(217, 'field', 11, 'en_us', ' video youtube '),
(217, 'field', 3, 'en_us', ''),
(217, 'field', 4, 'en_us', ''),
(217, 'field', 6, 'en_us', ''),
(217, 'field', 7, 'en_us', ''),
(217, 'field', 2, 'en_us', ''),
(217, 'field', 8, 'en_us', ''),
(217, 'field', 9, 'en_us', ''),
(217, 'field', 1, 'en_us', ''),
(217, 'slug', 0, 'en_us', ''),
(217, 'title', 0, 'en_us', ' junglepussy nah '),
(218, 'field', 10, 'en_us', ' http www youtube com watch v=r5gcn1bkkxg '),
(218, 'field', 11, 'en_us', ' video youtube '),
(218, 'field', 3, 'en_us', ''),
(218, 'field', 4, 'en_us', ''),
(218, 'field', 6, 'en_us', ''),
(218, 'field', 7, 'en_us', ''),
(218, 'field', 2, 'en_us', ''),
(218, 'field', 8, 'en_us', ''),
(218, 'field', 9, 'en_us', ''),
(218, 'field', 1, 'en_us', ''),
(218, 'slug', 0, 'en_us', ''),
(218, 'title', 0, 'en_us', ' death grips inanimate sensation '),
(219, 'field', 10, 'en_us', ' http www youtube com watch v=ud1s25wxn9i '),
(219, 'field', 11, 'en_us', ' video youtube '),
(219, 'field', 3, 'en_us', ''),
(219, 'field', 4, 'en_us', ''),
(219, 'field', 6, 'en_us', ''),
(219, 'field', 7, 'en_us', ''),
(219, 'field', 2, 'en_us', ''),
(219, 'field', 8, 'en_us', ''),
(219, 'field', 9, 'en_us', ''),
(219, 'field', 1, 'en_us', ''),
(219, 'slug', 0, 'en_us', ''),
(219, 'title', 0, 'en_us', ' trash talk the hole '),
(220, 'field', 10, 'en_us', ' http www youtube com watch v=oem2d bnvm8 '),
(220, 'field', 11, 'en_us', ' video youtube '),
(220, 'field', 3, 'en_us', ''),
(220, 'field', 4, 'en_us', ''),
(220, 'field', 6, 'en_us', ''),
(220, 'field', 7, 'en_us', ''),
(220, 'field', 2, 'en_us', ''),
(220, 'field', 8, 'en_us', ''),
(220, 'field', 9, 'en_us', ''),
(220, 'field', 1, 'en_us', ''),
(220, 'slug', 0, 'en_us', ''),
(220, 'title', 0, 'en_us', ' girlpool plants and worms official video '),
(221, 'field', 10, 'en_us', ' http www youtube com watch v=soxbve1doog '),
(221, 'field', 11, 'en_us', ' video youtube '),
(221, 'field', 3, 'en_us', ''),
(221, 'field', 4, 'en_us', ''),
(221, 'field', 6, 'en_us', ''),
(221, 'field', 7, 'en_us', ''),
(221, 'field', 2, 'en_us', ''),
(221, 'field', 8, 'en_us', ''),
(221, 'field', 9, 'en_us', ''),
(221, 'field', 1, 'en_us', ''),
(221, 'slug', 0, 'en_us', ''),
(221, 'title', 0, 'en_us', ' silk rhodes pains '),
(222, 'field', 10, 'en_us', ' http www youtube com watch v=vny_7txtgvc '),
(222, 'field', 11, 'en_us', ' video youtube '),
(222, 'field', 3, 'en_us', ''),
(222, 'field', 4, 'en_us', ''),
(222, 'field', 6, 'en_us', ''),
(222, 'field', 7, 'en_us', ''),
(222, 'field', 2, 'en_us', ''),
(222, 'field', 8, 'en_us', ''),
(222, 'field', 9, 'en_us', ''),
(222, 'field', 1, 'en_us', ''),
(222, 'slug', 0, 'en_us', ''),
(222, 'title', 0, 'en_us', ' pyramid vritra palace official video '),
(223, 'field', 10, 'en_us', ' http www youtube com watch v=6yw_rqtuzmw '),
(223, 'field', 11, 'en_us', ' video youtube '),
(223, 'field', 3, 'en_us', ''),
(223, 'field', 4, 'en_us', ''),
(223, 'field', 6, 'en_us', ''),
(223, 'field', 7, 'en_us', ''),
(223, 'field', 2, 'en_us', ''),
(223, 'field', 8, 'en_us', ''),
(223, 'field', 9, 'en_us', ''),
(223, 'field', 1, 'en_us', ''),
(223, 'slug', 0, 'en_us', ''),
(223, 'title', 0, 'en_us', ' badbadnotgood ghostface killah ray gun ft doom official video '),
(224, 'field', 10, 'en_us', ' http www youtube com watch v=beoximwofd0 '),
(224, 'field', 11, 'en_us', ' video youtube '),
(224, 'field', 3, 'en_us', ''),
(224, 'field', 4, 'en_us', ''),
(224, 'field', 6, 'en_us', ''),
(224, 'field', 7, 'en_us', ''),
(224, 'field', 2, 'en_us', ''),
(224, 'field', 8, 'en_us', ''),
(224, 'field', 9, 'en_us', ''),
(224, 'field', 1, 'en_us', ''),
(224, 'slug', 0, 'en_us', ''),
(224, 'title', 0, 'en_us', ' run the jewels lie cheat steal official video '),
(225, 'field', 10, 'en_us', ' http www youtube com watch v=6opdjbztihm '),
(225, 'field', 11, 'en_us', ' video youtube '),
(225, 'field', 3, 'en_us', ''),
(225, 'field', 4, 'en_us', ''),
(225, 'field', 6, 'en_us', ''),
(225, 'field', 7, 'en_us', ''),
(225, 'field', 2, 'en_us', ''),
(225, 'field', 8, 'en_us', ''),
(225, 'field', 9, 'en_us', ''),
(225, 'field', 1, 'en_us', ''),
(225, 'slug', 0, 'en_us', ''),
(225, 'title', 0, 'en_us', ' young thug freddie gibbs a$ap ferg old english '),
(226, 'field', 10, 'en_us', ' http www youtube com watch v=9h4ctdihdf0 '),
(226, 'field', 11, 'en_us', ' video youtube '),
(226, 'field', 3, 'en_us', ''),
(226, 'field', 4, 'en_us', ''),
(226, 'field', 6, 'en_us', ''),
(226, 'field', 7, 'en_us', ''),
(226, 'field', 2, 'en_us', ''),
(226, 'field', 8, 'en_us', ''),
(226, 'field', 9, 'en_us', ''),
(226, 'field', 1, 'en_us', ''),
(226, 'slug', 0, 'en_us', ''),
(226, 'title', 0, 'en_us', ' girlpool chinatown official video '),
(227, 'field', 10, 'en_us', ' http www youtube com watch v=ddrxczkjaga '),
(227, 'field', 11, 'en_us', ' video youtube '),
(227, 'field', 3, 'en_us', ''),
(227, 'field', 4, 'en_us', ''),
(227, 'field', 6, 'en_us', ''),
(227, 'field', 7, 'en_us', ''),
(227, 'field', 2, 'en_us', ''),
(227, 'field', 8, 'en_us', ''),
(227, 'field', 9, 'en_us', ''),
(227, 'field', 1, 'en_us', ''),
(227, 'slug', 0, 'en_us', ''),
(227, 'title', 0, 'en_us', ' riiahworld rinse repeat '),
(228, 'field', 10, 'en_us', ' http www youtube com watch v=xx4u7ldp jg '),
(228, 'field', 11, 'en_us', ' video youtube '),
(228, 'field', 3, 'en_us', ''),
(228, 'field', 4, 'en_us', ''),
(228, 'field', 6, 'en_us', ''),
(228, 'field', 7, 'en_us', ''),
(228, 'field', 2, 'en_us', ''),
(228, 'field', 8, 'en_us', ''),
(228, 'field', 9, 'en_us', ''),
(228, 'field', 1, 'en_us', ''),
(228, 'slug', 0, 'en_us', ''),
(228, 'title', 0, 'en_us', ' thekidd ep ft el caetano coca hiena music video '),
(229, 'field', 10, 'en_us', ' http www youtube com watch v=5ip4bfbfvgo '),
(229, 'field', 11, 'en_us', ' video youtube '),
(229, 'field', 3, 'en_us', ''),
(229, 'field', 4, 'en_us', ''),
(229, 'field', 6, 'en_us', ''),
(229, 'field', 7, 'en_us', ''),
(229, 'field', 2, 'en_us', ''),
(229, 'field', 8, 'en_us', ''),
(229, 'field', 9, 'en_us', ''),
(229, 'field', 1, 'en_us', ''),
(229, 'slug', 0, 'en_us', ''),
(229, 'title', 0, 'en_us', ' antwon metro nome featuring wiki '),
(230, 'field', 10, 'en_us', ' http www youtube com watch v= jttrd_xaj0 '),
(230, 'field', 11, 'en_us', ' video youtube '),
(230, 'field', 3, 'en_us', ''),
(230, 'field', 4, 'en_us', ''),
(230, 'field', 6, 'en_us', ''),
(230, 'field', 7, 'en_us', ''),
(230, 'field', 2, 'en_us', ''),
(230, 'field', 8, 'en_us', ''),
(230, 'field', 9, 'en_us', ''),
(230, 'field', 1, 'en_us', ''),
(230, 'slug', 0, 'en_us', ''),
(230, 'title', 0, 'en_us', ' antwon don t care '),
(231, 'field', 10, 'en_us', ' http www youtube com watch v=ihextxxslew '),
(231, 'field', 11, 'en_us', ' video youtube '),
(231, 'field', 3, 'en_us', ''),
(231, 'field', 4, 'en_us', ''),
(231, 'field', 6, 'en_us', ''),
(231, 'field', 7, 'en_us', ''),
(231, 'field', 2, 'en_us', ''),
(231, 'field', 8, 'en_us', ''),
(231, 'field', 9, 'en_us', ''),
(231, 'field', 1, 'en_us', ''),
(231, 'slug', 0, 'en_us', ''),
(231, 'title', 0, 'en_us', ' ratking snow beach '),
(232, 'field', 10, 'en_us', ' http www youtube com watch v=ak4vlebxio4 '),
(232, 'field', 11, 'en_us', ' video youtube '),
(232, 'field', 3, 'en_us', ''),
(232, 'field', 4, 'en_us', ''),
(232, 'field', 6, 'en_us', ''),
(232, 'field', 7, 'en_us', ''),
(232, 'field', 2, 'en_us', ''),
(232, 'field', 8, 'en_us', ''),
(232, 'field', 9, 'en_us', ''),
(232, 'field', 1, 'en_us', ''),
(232, 'slug', 0, 'en_us', ''),
(232, 'title', 0, 'en_us', ' flying lotus coronus the terminator '),
(233, 'field', 10, 'en_us', ' http www youtube com watch v=yzdb4geaf6e '),
(233, 'field', 11, 'en_us', ' video youtube '),
(233, 'field', 3, 'en_us', ''),
(233, 'field', 4, 'en_us', ''),
(233, 'field', 6, 'en_us', ''),
(233, 'field', 7, 'en_us', ''),
(233, 'field', 2, 'en_us', ''),
(233, 'field', 8, 'en_us', ''),
(233, 'field', 9, 'en_us', ''),
(233, 'field', 1, 'en_us', ''),
(233, 'slug', 0, 'en_us', ''),
(233, 'title', 0, 'en_us', ' ratking so it goes '),
(234, 'field', 10, 'en_us', ' http www youtube com watch v=cmjl7s kliy '),
(234, 'field', 11, 'en_us', ' video youtube '),
(234, 'field', 3, 'en_us', ''),
(234, 'field', 4, 'en_us', ''),
(234, 'field', 6, 'en_us', ''),
(234, 'field', 7, 'en_us', ''),
(234, 'field', 2, 'en_us', ''),
(234, 'field', 8, 'en_us', ''),
(234, 'field', 9, 'en_us', ''),
(234, 'field', 1, 'en_us', ''),
(234, 'slug', 0, 'en_us', ''),
(234, 'title', 0, 'en_us', ' spooky black dj khaled is my father '),
(235, 'field', 10, 'en_us', ' http www youtube com watch v=h_zkrfxxfu0 '),
(235, 'field', 11, 'en_us', ' video youtube '),
(235, 'field', 3, 'en_us', ''),
(235, 'field', 4, 'en_us', ''),
(235, 'field', 6, 'en_us', ''),
(235, 'field', 7, 'en_us', ''),
(235, 'field', 2, 'en_us', ''),
(235, 'field', 8, 'en_us', ''),
(235, 'field', 9, 'en_us', ''),
(235, 'field', 1, 'en_us', ''),
(235, 'slug', 0, 'en_us', ''),
(235, 'title', 0, 'en_us', ' mndsgn camelblues '),
(236, 'field', 10, 'en_us', ' http www youtube com watch v=lpha3yucb e '),
(236, 'field', 11, 'en_us', ' video youtube '),
(236, 'field', 3, 'en_us', ''),
(236, 'field', 4, 'en_us', ''),
(236, 'field', 6, 'en_us', ''),
(236, 'field', 7, 'en_us', ''),
(236, 'field', 2, 'en_us', ''),
(236, 'field', 8, 'en_us', ''),
(236, 'field', 9, 'en_us', ''),
(236, 'field', 1, 'en_us', ''),
(236, 'slug', 0, 'en_us', ''),
(236, 'title', 0, 'en_us', ' pyramid vritra like summer '),
(237, 'field', 10, 'en_us', ' http www youtube com watch v=nqod8m6okoc '),
(237, 'field', 11, 'en_us', ' video youtube '),
(237, 'field', 3, 'en_us', ''),
(237, 'field', 4, 'en_us', ''),
(237, 'field', 6, 'en_us', ''),
(237, 'field', 7, 'en_us', ''),
(237, 'field', 2, 'en_us', ''),
(237, 'field', 8, 'en_us', ''),
(237, 'field', 9, 'en_us', ''),
(237, 'field', 1, 'en_us', ''),
(237, 'slug', 0, 'en_us', ''),
(237, 'title', 0, 'en_us', ' heavy metal and reflective official music video azealia banks '),
(238, 'field', 10, 'en_us', ' http www youtube com watch v=im9uzhoxvli '),
(238, 'field', 11, 'en_us', ' video youtube '),
(238, 'field', 3, 'en_us', ''),
(238, 'field', 4, 'en_us', ''),
(238, 'field', 6, 'en_us', ''),
(238, 'field', 7, 'en_us', ''),
(238, 'field', 2, 'en_us', ''),
(238, 'field', 8, 'en_us', ''),
(238, 'field', 9, 'en_us', ''),
(238, 'field', 1, 'en_us', ''),
(238, 'slug', 0, 'en_us', ''),
(238, 'title', 0, 'en_us', ' spooky black reason '),
(239, 'field', 10, 'en_us', ' http www youtube com watch v=jttjzdtpx8o '),
(239, 'field', 11, 'en_us', ' video youtube '),
(239, 'field', 3, 'en_us', ''),
(239, 'field', 4, 'en_us', ''),
(239, 'field', 6, 'en_us', ''),
(239, 'field', 7, 'en_us', ''),
(239, 'field', 2, 'en_us', ''),
(239, 'field', 8, 'en_us', ''),
(239, 'field', 9, 'en_us', ''),
(239, 'field', 1, 'en_us', ''),
(239, 'slug', 0, 'en_us', ''),
(239, 'title', 0, 'en_us', ' azealia banks chasing time official '),
(240, 'field', 10, 'en_us', ' http www youtube com watch v=0hflzisdh4m '),
(240, 'field', 11, 'en_us', ' video youtube '),
(240, 'field', 3, 'en_us', ''),
(240, 'field', 4, 'en_us', ''),
(240, 'field', 6, 'en_us', ''),
(240, 'field', 7, 'en_us', ''),
(240, 'field', 2, 'en_us', ''),
(240, 'field', 8, 'en_us', ''),
(240, 'field', 9, 'en_us', ''),
(240, 'field', 1, 'en_us', ''),
(240, 'slug', 0, 'en_us', ''),
(240, 'title', 0, 'en_us', ' antwon handsome music video '),
(241, 'field', 10, 'en_us', ' http www youtube com watch v=n69dxq3djse '),
(241, 'field', 11, 'en_us', ' video youtube '),
(241, 'field', 3, 'en_us', ''),
(241, 'field', 4, 'en_us', ''),
(241, 'field', 6, 'en_us', ''),
(241, 'field', 7, 'en_us', ''),
(241, 'field', 2, 'en_us', ''),
(241, 'field', 8, 'en_us', ''),
(241, 'field', 9, 'en_us', ''),
(241, 'field', 1, 'en_us', ''),
(241, 'slug', 0, 'en_us', ''),
(241, 'title', 0, 'en_us', ' little simz intervention '),
(242, 'field', 10, 'en_us', ' http www youtube com watch v=gfhkrt5g7lu '),
(242, 'field', 11, 'en_us', ' video youtube '),
(242, 'field', 3, 'en_us', ''),
(242, 'field', 4, 'en_us', ''),
(242, 'field', 6, 'en_us', ''),
(242, 'field', 7, 'en_us', ''),
(242, 'field', 2, 'en_us', ''),
(242, 'field', 8, 'en_us', ''),
(242, 'field', 9, 'en_us', ''),
(242, 'field', 1, 'en_us', ''),
(242, 'slug', 0, 'en_us', ''),
(242, 'title', 0, 'en_us', ' moon duo animal featuring richie jackson official music video '),
(243, 'field', 10, 'en_us', ' http www youtube com watch v=07ss7horwfw '),
(243, 'field', 11, 'en_us', ' video youtube '),
(243, 'field', 3, 'en_us', ''),
(243, 'field', 4, 'en_us', ''),
(243, 'field', 6, 'en_us', ''),
(243, 'field', 7, 'en_us', ''),
(243, 'field', 2, 'en_us', ''),
(243, 'field', 8, 'en_us', ''),
(243, 'field', 9, 'en_us', ''),
(243, 'field', 1, 'en_us', ''),
(243, 'slug', 0, 'en_us', ''),
(243, 'title', 0, 'en_us', ' twerps stranger '),
(244, 'field', 10, 'en_us', ' http www youtube com watch v=a0hftccrvnc '),
(244, 'field', 11, 'en_us', ' video youtube '),
(244, 'field', 3, 'en_us', ''),
(244, 'field', 4, 'en_us', ''),
(244, 'field', 6, 'en_us', ''),
(244, 'field', 7, 'en_us', ''),
(244, 'field', 2, 'en_us', ''),
(244, 'field', 8, 'en_us', ''),
(244, 'field', 9, 'en_us', ''),
(244, 'field', 1, 'en_us', ''),
(244, 'slug', 0, 'en_us', ''),
(244, 'title', 0, 'en_us', ' jungle julia '),
(245, 'field', 10, 'en_us', ' http www youtube com watch v=siiz3q4n3lu '),
(245, 'field', 11, 'en_us', ' video youtube '),
(245, 'field', 3, 'en_us', ''),
(245, 'field', 4, 'en_us', ''),
(245, 'field', 6, 'en_us', ''),
(245, 'field', 7, 'en_us', ''),
(245, 'field', 2, 'en_us', ''),
(245, 'field', 8, 'en_us', ''),
(245, 'field', 9, 'en_us', ''),
(245, 'field', 1, 'en_us', ''),
(245, 'slug', 0, 'en_us', ''),
(245, 'title', 0, 'en_us', ' shinobi ninja saw red official '),
(246, 'field', 10, 'en_us', ' http www youtube com watch v=0qyutmmfys4 '),
(246, 'field', 11, 'en_us', ' video youtube '),
(246, 'field', 3, 'en_us', ''),
(246, 'field', 4, 'en_us', ''),
(246, 'field', 6, 'en_us', ''),
(246, 'field', 7, 'en_us', ''),
(246, 'field', 2, 'en_us', ''),
(246, 'field', 8, 'en_us', ''),
(246, 'field', 9, 'en_us', ''),
(246, 'field', 1, 'en_us', ''),
(246, 'slug', 0, 'en_us', ''),
(246, 'title', 0, 'en_us', ' clarence clarity meadow hopping traffic stopping death splash '),
(247, 'field', 10, 'en_us', ' http www youtube com watch v=krzeby0ytau '),
(247, 'field', 11, 'en_us', ' video youtube '),
(247, 'field', 3, 'en_us', ''),
(247, 'field', 4, 'en_us', ''),
(247, 'field', 6, 'en_us', ''),
(247, 'field', 7, 'en_us', ''),
(247, 'field', 2, 'en_us', ''),
(247, 'field', 8, 'en_us', ''),
(247, 'field', 9, 'en_us', ''),
(247, 'field', 1, 'en_us', ''),
(247, 'slug', 0, 'en_us', ''),
(247, 'title', 0, 'en_us', ' via rosa one more '),
(248, 'field', 10, 'en_us', ' http www youtube com watch v=5souw4k5uqc '),
(248, 'field', 11, 'en_us', ' video youtube '),
(248, 'field', 3, 'en_us', ''),
(248, 'field', 4, 'en_us', ''),
(248, 'field', 6, 'en_us', ''),
(248, 'field', 7, 'en_us', ''),
(248, 'field', 2, 'en_us', ''),
(248, 'field', 8, 'en_us', ''),
(248, 'field', 9, 'en_us', ''),
(248, 'field', 1, 'en_us', ''),
(248, 'slug', 0, 'en_us', ''),
(248, 'title', 0, 'en_us', ' bones hdmi '),
(249, 'field', 10, 'en_us', ' http www youtube com watch v=yitlykyve9g '),
(249, 'field', 11, 'en_us', ' video youtube '),
(249, 'field', 3, 'en_us', ''),
(249, 'field', 4, 'en_us', ''),
(249, 'field', 6, 'en_us', ''),
(249, 'field', 7, 'en_us', ''),
(249, 'field', 2, 'en_us', ''),
(249, 'field', 8, 'en_us', ''),
(249, 'field', 9, 'en_us', ''),
(249, 'field', 1, 'en_us', ''),
(249, 'slug', 0, 'en_us', ''),
(249, 'title', 0, 'en_us', ' big momma dentata official video '),
(250, 'field', 10, 'en_us', ' http www youtube com watch v=zwfhisrc19e '),
(250, 'field', 11, 'en_us', ' video youtube '),
(250, 'field', 3, 'en_us', ''),
(250, 'field', 4, 'en_us', ''),
(250, 'field', 6, 'en_us', ''),
(250, 'field', 7, 'en_us', ''),
(250, 'field', 2, 'en_us', ''),
(250, 'field', 8, 'en_us', ''),
(250, 'field', 9, 'en_us', ''),
(250, 'field', 1, 'en_us', ''),
(250, 'slug', 0, 'en_us', ''),
(250, 'title', 0, 'en_us', ' gang of four feat alison mosshart england s in my bones official video '),
(251, 'field', 10, 'en_us', ' http www youtube com watch v=b si8ffj5yi '),
(251, 'field', 11, 'en_us', ' video youtube '),
(251, 'field', 3, 'en_us', ''),
(251, 'field', 4, 'en_us', ''),
(251, 'field', 6, 'en_us', ''),
(251, 'field', 7, 'en_us', ''),
(251, 'field', 2, 'en_us', ''),
(251, 'field', 8, 'en_us', ''),
(251, 'field', 9, 'en_us', ''),
(251, 'field', 1, 'en_us', ''),
(251, 'slug', 0, 'en_us', ''),
(251, 'title', 0, 'en_us', ' suicide slide black shapes '),
(252, 'field', 10, 'en_us', ' http www youtube com watch v=mvr10cd2alk '),
(252, 'field', 11, 'en_us', ' video youtube '),
(252, 'field', 3, 'en_us', ''),
(252, 'field', 4, 'en_us', ''),
(252, 'field', 6, 'en_us', ''),
(252, 'field', 7, 'en_us', ''),
(252, 'field', 2, 'en_us', ''),
(252, 'field', 8, 'en_us', ''),
(252, 'field', 9, 'en_us', ''),
(252, 'field', 1, 'en_us', ''),
(252, 'slug', 0, 'en_us', ''),
(252, 'title', 0, 'en_us', ' shlohmo buried '),
(253, 'field', 10, 'en_us', ' http www youtube com watch v=bw3nfkjj5ts '),
(253, 'field', 11, 'en_us', ' video youtube '),
(253, 'field', 3, 'en_us', ''),
(253, 'field', 4, 'en_us', ''),
(253, 'field', 6, 'en_us', ''),
(253, 'field', 7, 'en_us', ''),
(253, 'field', 2, 'en_us', ''),
(253, 'field', 8, 'en_us', ''),
(253, 'field', 9, 'en_us', ''),
(253, 'field', 1, 'en_us', ''),
(253, 'slug', 0, 'en_us', ''),
(253, 'title', 0, 'en_us', ' east india youth carousel '),
(254, 'field', 10, 'en_us', ' http www youtube com watch v=jyoyqn4no1w '),
(254, 'field', 11, 'en_us', ' video youtube '),
(254, 'field', 3, 'en_us', ''),
(254, 'field', 4, 'en_us', ''),
(254, 'field', 6, 'en_us', ''),
(254, 'field', 7, 'en_us', ''),
(254, 'field', 2, 'en_us', ''),
(254, 'field', 8, 'en_us', ''),
(254, 'field', 9, 'en_us', ''),
(254, 'field', 1, 'en_us', ''),
(254, 'slug', 0, 'en_us', ''),
(254, 'title', 0, 'en_us', ' the four owls think twice prod dj premier official video '),
(255, 'field', 10, 'en_us', ' http www youtube com watch v=hn0_c7v7pmg '),
(255, 'field', 11, 'en_us', ' video youtube '),
(255, 'field', 3, 'en_us', ''),
(255, 'field', 4, 'en_us', ''),
(255, 'field', 6, 'en_us', ''),
(255, 'field', 7, 'en_us', ''),
(255, 'field', 2, 'en_us', ''),
(255, 'field', 8, 'en_us', ''),
(255, 'field', 9, 'en_us', ''),
(255, 'field', 1, 'en_us', ''),
(255, 'slug', 0, 'en_us', ''),
(255, 'title', 0, 'en_us', ' sendawg sen runner burning in hell official video '),
(256, 'field', 10, 'en_us', ' http www youtube com watch v=wye11fios9c '),
(256, 'field', 11, 'en_us', ' video youtube '),
(256, 'field', 3, 'en_us', ''),
(256, 'field', 4, 'en_us', ''),
(256, 'field', 6, 'en_us', ''),
(256, 'field', 7, 'en_us', ''),
(256, 'field', 2, 'en_us', ''),
(256, 'field', 8, 'en_us', ''),
(256, 'field', 9, 'en_us', ''),
(256, 'field', 1, 'en_us', ''),
(256, 'slug', 0, 'en_us', ''),
(256, 'title', 0, 'en_us', ' chevron shimoda '),
(257, 'field', 10, 'en_us', ' http www youtube com watch v=ppsidfpceym '),
(257, 'field', 11, 'en_us', ' video youtube '),
(257, 'field', 3, 'en_us', ''),
(257, 'field', 4, 'en_us', ''),
(257, 'field', 6, 'en_us', ''),
(257, 'field', 7, 'en_us', ''),
(257, 'field', 2, 'en_us', ''),
(257, 'field', 8, 'en_us', ''),
(257, 'field', 9, 'en_us', ''),
(257, 'field', 1, 'en_us', ''),
(257, 'slug', 0, 'en_us', ''),
(257, 'title', 0, 'en_us', ' rome fortune oneday official video prod by citoonthebeat richard adderley '),
(258, 'field', 10, 'en_us', ' http www youtube com watch v=s6n _fc5qx4 '),
(258, 'field', 11, 'en_us', ' video youtube '),
(258, 'field', 3, 'en_us', ''),
(258, 'field', 4, 'en_us', ''),
(258, 'field', 6, 'en_us', ''),
(258, 'field', 7, 'en_us', ''),
(258, 'field', 2, 'en_us', ''),
(258, 'field', 8, 'en_us', ''),
(258, 'field', 9, 'en_us', ''),
(258, 'field', 1, 'en_us', ''),
(258, 'slug', 0, 'en_us', ''),
(258, 'title', 0, 'en_us', ' rasklz superduper official music video '),
(259, 'field', 10, 'en_us', ' http www youtube com watch v=dpc9erc5wqu '),
(259, 'field', 11, 'en_us', ' video youtube '),
(259, 'field', 3, 'en_us', ''),
(259, 'field', 4, 'en_us', ''),
(259, 'field', 6, 'en_us', ''),
(259, 'field', 7, 'en_us', ''),
(259, 'field', 2, 'en_us', ''),
(259, 'field', 8, 'en_us', ''),
(259, 'field', 9, 'en_us', ''),
(259, 'field', 1, 'en_us', ''),
(259, 'slug', 0, 'en_us', ''),
(259, 'title', 0, 'en_us', ' keith ape 잊지마 it g ma feat jayallday loota okasian kohh official music video '),
(260, 'field', 10, 'en_us', ' http www youtube com watch v=dkuqmtp7umk '),
(260, 'field', 11, 'en_us', ' video youtube '),
(260, 'field', 3, 'en_us', ''),
(260, 'field', 4, 'en_us', ''),
(260, 'field', 6, 'en_us', ''),
(260, 'field', 7, 'en_us', ''),
(260, 'field', 2, 'en_us', ''),
(260, 'field', 8, 'en_us', ''),
(260, 'field', 9, 'en_us', ''),
(260, 'field', 1, 'en_us', ''),
(260, 'slug', 0, 'en_us', ''),
(260, 'title', 0, 'en_us', ' jgrxxn get buck official video '),
(261, 'field', 10, 'en_us', ' http www youtube com watch v=o nr1nnc3ds '),
(261, 'field', 11, 'en_us', ' video youtube '),
(261, 'field', 3, 'en_us', ''),
(261, 'field', 4, 'en_us', ''),
(261, 'field', 6, 'en_us', ''),
(261, 'field', 7, 'en_us', ''),
(261, 'field', 2, 'en_us', ''),
(261, 'field', 8, 'en_us', ''),
(261, 'field', 9, 'en_us', ''),
(261, 'field', 1, 'en_us', ''),
(261, 'slug', 0, 'en_us', ''),
(261, 'title', 0, 'en_us', ' pedestrian at best courtney barnett '),
(262, 'field', 10, 'en_us', ' http www youtube com watch v=zw1kp99mok4 '),
(262, 'field', 11, 'en_us', ' video youtube '),
(262, 'field', 3, 'en_us', ''),
(262, 'field', 4, 'en_us', ''),
(262, 'field', 6, 'en_us', ''),
(262, 'field', 7, 'en_us', ''),
(262, 'field', 2, 'en_us', ''),
(262, 'field', 8, 'en_us', ''),
(262, 'field', 9, 'en_us', ''),
(262, 'field', 1, 'en_us', ''),
(262, 'slug', 0, 'en_us', ''),
(262, 'title', 0, 'en_us', ' viet cong silhouettes official video '),
(263, 'field', 10, 'en_us', ' http www youtube com watch v=gtsmqjzgdig '),
(263, 'field', 11, 'en_us', ' video youtube '),
(263, 'field', 3, 'en_us', ''),
(263, 'field', 4, 'en_us', ''),
(263, 'field', 6, 'en_us', ''),
(263, 'field', 7, 'en_us', ''),
(263, 'field', 2, 'en_us', ''),
(263, 'field', 8, 'en_us', ''),
(263, 'field', 9, 'en_us', ''),
(263, 'field', 1, 'en_us', ''),
(263, 'slug', 0, 'en_us', ''),
(263, 'title', 0, 'en_us', ' batty boys just a taste tz023 '),
(264, 'field', 10, 'en_us', ' http www youtube com watch v=jdrijryvbri '),
(264, 'field', 11, 'en_us', ' video youtube '),
(264, 'field', 3, 'en_us', ''),
(264, 'field', 4, 'en_us', ''),
(264, 'field', 6, 'en_us', ''),
(264, 'field', 7, 'en_us', ''),
(264, 'field', 2, 'en_us', ''),
(264, 'field', 8, 'en_us', ''),
(264, 'field', 9, 'en_us', ''),
(264, 'field', 1, 'en_us', ''),
(264, 'slug', 0, 'en_us', ''),
(264, 'title', 0, 'en_us', ' juiceboxxx back seat crazy facial hair woah '),
(265, 'field', 10, 'en_us', ' http www youtube com watch v=_u389fisbxg '),
(265, 'field', 11, 'en_us', ' video youtube '),
(265, 'field', 3, 'en_us', ''),
(265, 'field', 4, 'en_us', ''),
(265, 'field', 6, 'en_us', ''),
(265, 'field', 7, 'en_us', ''),
(265, 'field', 2, 'en_us', ''),
(265, 'field', 8, 'en_us', ''),
(265, 'field', 9, 'en_us', ''),
(265, 'field', 1, 'en_us', ''),
(265, 'slug', 0, 'en_us', ''),
(265, 'title', 0, 'en_us', ' lxury square 1 feat deptford goth official video '),
(266, 'field', 10, 'en_us', ' http www youtube com watch v=88u_dmhhfni '),
(266, 'field', 11, 'en_us', ' video youtube '),
(266, 'field', 3, 'en_us', ''),
(266, 'field', 4, 'en_us', ''),
(266, 'field', 6, 'en_us', ''),
(266, 'field', 7, 'en_us', ''),
(266, 'field', 2, 'en_us', ''),
(266, 'field', 8, 'en_us', ''),
(266, 'field', 9, 'en_us', ''),
(266, 'field', 1, 'en_us', ''),
(266, 'slug', 0, 'en_us', ''),
(266, 'title', 0, 'en_us', ' ibeyi mama says official video '),
(267, 'field', 10, 'en_us', ' http www youtube com watch v=lduf6_ czeq '),
(267, 'field', 11, 'en_us', ' video youtube '),
(267, 'field', 3, 'en_us', ''),
(267, 'field', 4, 'en_us', ''),
(267, 'field', 6, 'en_us', ''),
(267, 'field', 7, 'en_us', ''),
(267, 'field', 2, 'en_us', ''),
(267, 'field', 8, 'en_us', ''),
(267, 'field', 9, 'en_us', ''),
(267, 'field', 1, 'en_us', ''),
(267, 'slug', 0, 'en_us', ''),
(267, 'title', 0, 'en_us', ' annelia anderson pour une infante defunte '),
(268, 'field', 10, 'en_us', ' http www youtube com watch v=nkpfk9knl08 '),
(268, 'field', 11, 'en_us', ' video youtube '),
(268, 'field', 3, 'en_us', ''),
(268, 'field', 4, 'en_us', ''),
(268, 'field', 6, 'en_us', ''),
(268, 'field', 7, 'en_us', ''),
(268, 'field', 2, 'en_us', ''),
(268, 'field', 8, 'en_us', ''),
(268, 'field', 9, 'en_us', ''),
(268, 'field', 1, 'en_us', ''),
(268, 'slug', 0, 'en_us', ''),
(268, 'title', 0, 'en_us', ' batty boys honey tz023 '),
(269, 'field', 10, 'en_us', ' http www youtube com watch v=y37d3aiq4oa '),
(269, 'field', 11, 'en_us', ' video youtube '),
(269, 'field', 3, 'en_us', ''),
(269, 'field', 4, 'en_us', ''),
(269, 'field', 6, 'en_us', ''),
(269, 'field', 7, 'en_us', ''),
(269, 'field', 2, 'en_us', ''),
(269, 'field', 8, 'en_us', ''),
(269, 'field', 9, 'en_us', ''),
(269, 'field', 1, 'en_us', ''),
(269, 'slug', 0, 'en_us', ''),
(269, 'title', 0, 'en_us', ' kill frenzy all night long official video '),
(270, 'field', 10, 'en_us', ' http www youtube com watch v=fmhp 1i9heg '),
(270, 'field', 11, 'en_us', ' video youtube '),
(270, 'field', 3, 'en_us', ''),
(270, 'field', 4, 'en_us', ''),
(270, 'field', 6, 'en_us', ''),
(270, 'field', 7, 'en_us', ''),
(270, 'field', 2, 'en_us', ''),
(270, 'field', 8, 'en_us', ''),
(270, 'field', 9, 'en_us', ''),
(270, 'field', 1, 'en_us', ''),
(270, 'slug', 0, 'en_us', ''),
(270, 'title', 0, 'en_us', ' antwon get out my face '),
(271, 'field', 10, 'en_us', ' http www youtube com watch v=kgth6urcmhq '),
(271, 'field', 11, 'en_us', ' video youtube '),
(271, 'field', 3, 'en_us', ''),
(271, 'field', 4, 'en_us', ''),
(271, 'field', 6, 'en_us', ''),
(271, 'field', 7, 'en_us', ''),
(271, 'field', 2, 'en_us', ''),
(271, 'field', 8, 'en_us', ''),
(271, 'field', 9, 'en_us', ''),
(271, 'field', 1, 'en_us', ''),
(271, 'slug', 0, 'en_us', ''),
(271, 'title', 0, 'en_us', ' francois the atlas mountains ayan file official video '),
(272, 'field', 10, 'en_us', ' http www youtube com watch v=ja4zkafoav8 '),
(272, 'field', 11, 'en_us', ' video youtube '),
(272, 'field', 3, 'en_us', ''),
(272, 'field', 4, 'en_us', ''),
(272, 'field', 6, 'en_us', ''),
(272, 'field', 7, 'en_us', ''),
(272, 'field', 2, 'en_us', ''),
(272, 'field', 8, 'en_us', ''),
(272, 'field', 9, 'en_us', ''),
(272, 'field', 1, 'en_us', ''),
(272, 'slug', 0, 'en_us', ''),
(272, 'title', 0, 'en_us', ' fatima biggest joke of all official video '),
(273, 'field', 10, 'en_us', ' http www youtube com watch v=kk 1axsgkxc '),
(273, 'field', 11, 'en_us', ' video youtube '),
(273, 'field', 3, 'en_us', ''),
(273, 'field', 4, 'en_us', ''),
(273, 'field', 6, 'en_us', ''),
(273, 'field', 7, 'en_us', ''),
(273, 'field', 2, 'en_us', ''),
(273, 'field', 8, 'en_us', ''),
(273, 'field', 9, 'en_us', ''),
(273, 'field', 1, 'en_us', ''),
(273, 'slug', 0, 'en_us', ''),
(273, 'title', 0, 'en_us', ' dan deacon feel the lightning official video '),
(274, 'field', 10, 'en_us', ' http www youtube com watch v=z pkqnoizk8 '),
(274, 'field', 11, 'en_us', ' video youtube '),
(274, 'field', 3, 'en_us', ''),
(274, 'field', 4, 'en_us', ''),
(274, 'field', 6, 'en_us', ''),
(274, 'field', 7, 'en_us', ''),
(274, 'field', 2, 'en_us', ''),
(274, 'field', 8, 'en_us', ''),
(274, 'field', 9, 'en_us', ''),
(274, 'field', 1, 'en_us', ''),
(274, 'slug', 0, 'en_us', ''),
(274, 'title', 0, 'en_us', ' papa j ruiz me against the world official music video '),
(275, 'field', 10, 'en_us', ' http www youtube com watch v=kapr0zhrzee '),
(275, 'field', 11, 'en_us', ' video youtube '),
(275, 'field', 3, 'en_us', ''),
(275, 'field', 4, 'en_us', ''),
(275, 'field', 6, 'en_us', ''),
(275, 'field', 7, 'en_us', ''),
(275, 'field', 2, 'en_us', ''),
(275, 'field', 8, 'en_us', ''),
(275, 'field', 9, 'en_us', ''),
(275, 'field', 1, 'en_us', ''),
(275, 'slug', 0, 'en_us', ''),
(275, 'title', 0, 'en_us', ' von poe vii everything has a meaning official music video '),
(276, 'field', 10, 'en_us', ' http www youtube com watch v=ulseihnbudm '),
(276, 'field', 11, 'en_us', ' video youtube '),
(276, 'field', 3, 'en_us', ''),
(276, 'field', 4, 'en_us', ''),
(276, 'field', 6, 'en_us', ''),
(276, 'field', 7, 'en_us', ''),
(276, 'field', 2, 'en_us', ''),
(276, 'field', 8, 'en_us', ''),
(276, 'field', 9, 'en_us', ''),
(276, 'field', 1, 'en_us', ''),
(276, 'slug', 0, 'en_us', ''),
(276, 'title', 0, 'en_us', ' u pilgrimage official video '),
(277, 'field', 10, 'en_us', ' http www youtube com watch v=dx6mu_tcapa '),
(277, 'field', 11, 'en_us', ' video youtube '),
(277, 'field', 3, 'en_us', ''),
(277, 'field', 4, 'en_us', ''),
(277, 'field', 6, 'en_us', ''),
(277, 'field', 7, 'en_us', ''),
(277, 'field', 2, 'en_us', ''),
(277, 'field', 8, 'en_us', ''),
(277, 'field', 9, 'en_us', ''),
(277, 'field', 1, 'en_us', ''),
(277, 'slug', 0, 'en_us', ''),
(277, 'title', 0, 'en_us', ' joey purp don t stop '),
(278, 'field', 10, 'en_us', ' http www youtube com watch v=a1dxxtsv ci '),
(278, 'field', 11, 'en_us', ' video youtube '),
(278, 'field', 3, 'en_us', ''),
(278, 'field', 4, 'en_us', ''),
(278, 'field', 6, 'en_us', ''),
(278, 'field', 7, 'en_us', ''),
(278, 'field', 2, 'en_us', ''),
(278, 'field', 8, 'en_us', ''),
(278, 'field', 9, 'en_us', ''),
(278, 'field', 1, 'en_us', ''),
(278, 'slug', 0, 'en_us', ''),
(278, 'title', 0, 'en_us', ' jabu chamber '),
(279, 'field', 10, 'en_us', ' http www youtube com watch v=vtlbtt3drdm '),
(279, 'field', 11, 'en_us', ' video youtube '),
(279, 'field', 3, 'en_us', ''),
(279, 'field', 4, 'en_us', ''),
(279, 'field', 6, 'en_us', ''),
(279, 'field', 7, 'en_us', ''),
(279, 'field', 2, 'en_us', ''),
(279, 'field', 8, 'en_us', ''),
(279, 'field', 9, 'en_us', ''),
(279, 'field', 1, 'en_us', ''),
(279, 'slug', 0, 'en_us', ''),
(279, 'title', 0, 'en_us', ' joseph marinetti ms telesales official '),
(280, 'field', 10, 'en_us', ' http www youtube com watch v=si3ymvirwfg '),
(280, 'field', 11, 'en_us', ' video youtube '),
(280, 'field', 3, 'en_us', ''),
(280, 'field', 4, 'en_us', ''),
(280, 'field', 6, 'en_us', ''),
(280, 'field', 7, 'en_us', ''),
(280, 'field', 2, 'en_us', ''),
(280, 'field', 8, 'en_us', ''),
(280, 'field', 9, 'en_us', ''),
(280, 'field', 1, 'en_us', ''),
(280, 'slug', 0, 'en_us', ''),
(280, 'title', 0, 'en_us', ' julio bashmore kong feat bixby '),
(281, 'field', 10, 'en_us', ' http www youtube com watch v= wuakslu7ts '),
(281, 'field', 11, 'en_us', ' video youtube '),
(281, 'field', 3, 'en_us', ''),
(281, 'field', 4, 'en_us', ''),
(281, 'field', 6, 'en_us', ''),
(281, 'field', 7, 'en_us', ''),
(281, 'field', 2, 'en_us', ''),
(281, 'field', 8, 'en_us', ''),
(281, 'field', 9, 'en_us', ''),
(281, 'field', 1, 'en_us', ''),
(281, 'slug', 0, 'en_us', '');
INSERT INTO `craft_searchindex` (`elementId`, `attribute`, `fieldId`, `locale`, `keywords`) VALUES
(281, 'title', 0, 'en_us', ' jacques greene after life after party official '),
(282, 'field', 10, 'en_us', ' http www youtube com watch v=m0e5iubdxi8 '),
(282, 'field', 11, 'en_us', ' video youtube '),
(282, 'field', 3, 'en_us', ''),
(282, 'field', 4, 'en_us', ''),
(282, 'field', 6, 'en_us', ''),
(282, 'field', 7, 'en_us', ''),
(282, 'field', 2, 'en_us', ''),
(282, 'field', 8, 'en_us', ''),
(282, 'field', 9, 'en_us', ''),
(282, 'field', 1, 'en_us', ''),
(282, 'slug', 0, 'en_us', ''),
(282, 'title', 0, 'en_us', ' two times a charm official video '),
(283, 'field', 10, 'en_us', ' http www youtube com watch v=5pxuhlqzfc4 '),
(283, 'field', 11, 'en_us', ' video youtube '),
(283, 'field', 3, 'en_us', ''),
(283, 'field', 4, 'en_us', ''),
(283, 'field', 6, 'en_us', ''),
(283, 'field', 7, 'en_us', ''),
(283, 'field', 2, 'en_us', ''),
(283, 'field', 8, 'en_us', ''),
(283, 'field', 9, 'en_us', ''),
(283, 'field', 1, 'en_us', ''),
(283, 'slug', 0, 'en_us', ''),
(283, 'title', 0, 'en_us', ' joseph marinetti lipsync official '),
(284, 'field', 10, 'en_us', ' http www youtube com watch v=pfwxe2mo5gg '),
(284, 'field', 11, 'en_us', ' video youtube '),
(284, 'field', 3, 'en_us', ''),
(284, 'field', 4, 'en_us', ''),
(284, 'field', 6, 'en_us', ''),
(284, 'field', 7, 'en_us', ''),
(284, 'field', 2, 'en_us', ''),
(284, 'field', 8, 'en_us', ''),
(284, 'field', 9, 'en_us', ''),
(284, 'field', 1, 'en_us', ''),
(284, 'slug', 0, 'en_us', ''),
(284, 'title', 0, 'en_us', ' claude speeed some other guy official '),
(285, 'field', 10, 'en_us', ' http www youtube com watch v=qc8few4gomo '),
(285, 'field', 11, 'en_us', ' video youtube '),
(285, 'field', 3, 'en_us', ''),
(285, 'field', 4, 'en_us', ''),
(285, 'field', 6, 'en_us', ''),
(285, 'field', 7, 'en_us', ''),
(285, 'field', 2, 'en_us', ''),
(285, 'field', 8, 'en_us', ''),
(285, 'field', 9, 'en_us', ''),
(285, 'field', 1, 'en_us', ''),
(285, 'slug', 0, 'en_us', ''),
(285, 'title', 0, 'en_us', ' kemekem i like your afro by meklit featuring samuel yirga '),
(286, 'field', 10, 'en_us', ' http www youtube com watch v=z_klmnploly '),
(286, 'field', 11, 'en_us', ' video youtube '),
(286, 'field', 3, 'en_us', ''),
(286, 'field', 4, 'en_us', ''),
(286, 'field', 6, 'en_us', ''),
(286, 'field', 7, 'en_us', ''),
(286, 'field', 2, 'en_us', ''),
(286, 'field', 8, 'en_us', ''),
(286, 'field', 9, 'en_us', ''),
(286, 'field', 1, 'en_us', ''),
(286, 'slug', 0, 'en_us', ''),
(286, 'title', 0, 'en_us', ' hudson mohawke very first breath official video ft irfane '),
(287, 'field', 10, 'en_us', ' http www youtube com watch v=auko2u6q60g '),
(287, 'field', 11, 'en_us', ' video youtube '),
(287, 'field', 3, 'en_us', ''),
(287, 'field', 4, 'en_us', ''),
(287, 'field', 6, 'en_us', ''),
(287, 'field', 7, 'en_us', ''),
(287, 'field', 2, 'en_us', ''),
(287, 'field', 8, 'en_us', ''),
(287, 'field', 9, 'en_us', ''),
(287, 'field', 1, 'en_us', ''),
(287, 'slug', 0, 'en_us', ''),
(287, 'title', 0, 'en_us', ' lapalux puzzle feat andreya triana official video '),
(288, 'field', 10, 'en_us', ' http www youtube com watch v=n0kw lsepja '),
(288, 'field', 11, 'en_us', ' video youtube '),
(288, 'field', 3, 'en_us', ''),
(288, 'field', 4, 'en_us', ''),
(288, 'field', 6, 'en_us', ''),
(288, 'field', 7, 'en_us', ''),
(288, 'field', 2, 'en_us', ''),
(288, 'field', 8, 'en_us', ''),
(288, 'field', 9, 'en_us', ''),
(288, 'field', 1, 'en_us', ''),
(288, 'slug', 0, 'en_us', ''),
(288, 'title', 0, 'en_us', ' белка mp4 '),
(289, 'field', 10, 'en_us', ' http www youtube com watch v=luju06ocaeu '),
(289, 'field', 11, 'en_us', ' video youtube '),
(289, 'field', 3, 'en_us', ''),
(289, 'field', 4, 'en_us', ''),
(289, 'field', 6, 'en_us', ''),
(289, 'field', 7, 'en_us', ''),
(289, 'field', 2, 'en_us', ''),
(289, 'field', 8, 'en_us', ''),
(289, 'field', 9, 'en_us', ''),
(289, 'field', 1, 'en_us', ''),
(289, 'slug', 0, 'en_us', ''),
(289, 'title', 0, 'en_us', ' eternal promise '),
(290, 'field', 10, 'en_us', ' http www youtube com watch v=ksc5f8et0iy '),
(290, 'field', 11, 'en_us', ' video youtube '),
(290, 'field', 3, 'en_us', ''),
(290, 'field', 4, 'en_us', ''),
(290, 'field', 6, 'en_us', ''),
(290, 'field', 7, 'en_us', ''),
(290, 'field', 2, 'en_us', ''),
(290, 'field', 8, 'en_us', ''),
(290, 'field', 9, 'en_us', ''),
(290, 'field', 1, 'en_us', ''),
(290, 'slug', 0, 'en_us', ''),
(290, 'title', 0, 'en_us', ' cyrax i like official video '),
(291, 'field', 10, 'en_us', ' http www youtube com watch v=arurooua6mu '),
(291, 'field', 11, 'en_us', ' video youtube '),
(291, 'field', 3, 'en_us', ''),
(291, 'field', 4, 'en_us', ''),
(291, 'field', 6, 'en_us', ''),
(291, 'field', 7, 'en_us', ''),
(291, 'field', 2, 'en_us', ''),
(291, 'field', 8, 'en_us', ''),
(291, 'field', 9, 'en_us', ''),
(291, 'field', 1, 'en_us', ''),
(291, 'slug', 0, 'en_us', ''),
(291, 'title', 0, 'en_us', ' poshgod shawty get me high '),
(292, 'field', 10, 'en_us', ' http www youtube com watch v=t99r8jsdi7s '),
(292, 'field', 11, 'en_us', ' video youtube '),
(292, 'field', 3, 'en_us', ''),
(292, 'field', 4, 'en_us', ''),
(292, 'field', 6, 'en_us', ''),
(292, 'field', 7, 'en_us', ''),
(292, 'field', 2, 'en_us', ''),
(292, 'field', 8, 'en_us', ''),
(292, 'field', 9, 'en_us', ''),
(292, 'field', 1, 'en_us', ''),
(292, 'slug', 0, 'en_us', ''),
(292, 'title', 0, 'en_us', ' lil ugly mane throw dem gunz '),
(293, 'field', 10, 'en_us', ' http www youtube com watch v=eyufqpq dvy '),
(293, 'field', 11, 'en_us', ' video youtube '),
(293, 'field', 3, 'en_us', ''),
(293, 'field', 4, 'en_us', ''),
(293, 'field', 6, 'en_us', ''),
(293, 'field', 7, 'en_us', ''),
(293, 'field', 2, 'en_us', ''),
(293, 'field', 8, 'en_us', ''),
(293, 'field', 9, 'en_us', ''),
(293, 'field', 1, 'en_us', ''),
(293, 'slug', 0, 'en_us', ''),
(293, 'title', 0, 'en_us', ' drums of death featuring azealia banks franklin fuentes fierce official video '),
(294, 'field', 10, 'en_us', ' http www youtube com watch v=zlp7m5smbkq '),
(294, 'field', 11, 'en_us', ' video youtube '),
(294, 'field', 3, 'en_us', ''),
(294, 'field', 4, 'en_us', ''),
(294, 'field', 6, 'en_us', ''),
(294, 'field', 7, 'en_us', ''),
(294, 'field', 2, 'en_us', ''),
(294, 'field', 8, 'en_us', ''),
(294, 'field', 9, 'en_us', ''),
(294, 'field', 1, 'en_us', ''),
(294, 'slug', 0, 'en_us', ''),
(294, 'title', 0, 'en_us', ' vic mensa orange soda official music video '),
(295, 'field', 10, 'en_us', ' http www youtube com watch v=tfqz4_ssaak '),
(295, 'field', 11, 'en_us', ' video youtube '),
(295, 'field', 3, 'en_us', ''),
(295, 'field', 4, 'en_us', ''),
(295, 'field', 6, 'en_us', ''),
(295, 'field', 7, 'en_us', ''),
(295, 'field', 2, 'en_us', ''),
(295, 'field', 8, 'en_us', ''),
(295, 'field', 9, 'en_us', ''),
(295, 'field', 1, 'en_us', ''),
(295, 'slug', 0, 'en_us', ''),
(295, 'title', 0, 'en_us', ' dillon cooper state of elevation '),
(296, 'field', 10, 'en_us', ' http www youtube com watch v=iuc1tf4zisa '),
(296, 'field', 11, 'en_us', ' video youtube '),
(296, 'field', 3, 'en_us', ''),
(296, 'field', 4, 'en_us', ''),
(296, 'field', 6, 'en_us', ''),
(296, 'field', 7, 'en_us', ''),
(296, 'field', 2, 'en_us', ''),
(296, 'field', 8, 'en_us', ''),
(296, 'field', 9, 'en_us', ''),
(296, 'field', 1, 'en_us', ''),
(296, 'slug', 0, 'en_us', ''),
(296, 'title', 0, 'en_us', ' vic mensa ynsp feat eliza doolittle official video hd '),
(297, 'field', 10, 'en_us', ' http www youtube com watch v=kuiwnb pxcc '),
(297, 'field', 11, 'en_us', ' video youtube '),
(297, 'field', 3, 'en_us', ''),
(297, 'field', 4, 'en_us', ''),
(297, 'field', 6, 'en_us', ''),
(297, 'field', 7, 'en_us', ''),
(297, 'field', 2, 'en_us', ''),
(297, 'field', 8, 'en_us', ''),
(297, 'field', 9, 'en_us', ''),
(297, 'field', 1, 'en_us', ''),
(297, 'slug', 0, 'en_us', ''),
(297, 'title', 0, 'en_us', ' denzel curry parents official music video premiere first look '),
(298, 'field', 10, 'en_us', ' http www youtube com watch v=olik0n5ddac '),
(298, 'field', 11, 'en_us', ' video youtube '),
(298, 'field', 3, 'en_us', ''),
(298, 'field', 4, 'en_us', ''),
(298, 'field', 6, 'en_us', ''),
(298, 'field', 7, 'en_us', ''),
(298, 'field', 2, 'en_us', ''),
(298, 'field', 8, 'en_us', ''),
(298, 'field', 9, 'en_us', ''),
(298, 'field', 1, 'en_us', ''),
(298, 'slug', 0, 'en_us', ''),
(298, 'title', 0, 'en_us', ' the new mecca prod by thempeople '),
(299, 'field', 10, 'en_us', ' http www youtube com watch v=5poprdcswdo '),
(299, 'field', 11, 'en_us', ' video youtube '),
(299, 'field', 3, 'en_us', ''),
(299, 'field', 4, 'en_us', ''),
(299, 'field', 6, 'en_us', ''),
(299, 'field', 7, 'en_us', ''),
(299, 'field', 2, 'en_us', ''),
(299, 'field', 8, 'en_us', ''),
(299, 'field', 9, 'en_us', ''),
(299, 'field', 1, 'en_us', ''),
(299, 'slug', 0, 'en_us', ''),
(299, 'title', 0, 'en_us', ' show me the body death sounds '),
(300, 'field', 10, 'en_us', ' http www youtube com watch v=a7cto2 baa8 '),
(300, 'field', 11, 'en_us', ' video youtube '),
(300, 'field', 3, 'en_us', ''),
(300, 'field', 4, 'en_us', ''),
(300, 'field', 6, 'en_us', ''),
(300, 'field', 7, 'en_us', ''),
(300, 'field', 2, 'en_us', ''),
(300, 'field', 8, 'en_us', ''),
(300, 'field', 9, 'en_us', ''),
(300, 'field', 1, 'en_us', ''),
(300, 'slug', 0, 'en_us', ''),
(300, 'title', 0, 'en_us', ' fka twigs how s that '),
(301, 'field', 10, 'en_us', ' http www youtube com watch v=0 z5qmvbttu '),
(301, 'field', 11, 'en_us', ' video youtube '),
(301, 'field', 3, 'en_us', ''),
(301, 'field', 4, 'en_us', ''),
(301, 'field', 6, 'en_us', ''),
(301, 'field', 7, 'en_us', ''),
(301, 'field', 2, 'en_us', ''),
(301, 'field', 8, 'en_us', ''),
(301, 'field', 9, 'en_us', ''),
(301, 'field', 1, 'en_us', ''),
(301, 'slug', 0, 'en_us', ''),
(301, 'title', 0, 'en_us', ' remy banks 7th heaven interlude prod mackrule '),
(302, 'field', 10, 'en_us', ' http www youtube com watch v=83p69jhdnwu '),
(302, 'field', 11, 'en_us', ' video youtube '),
(302, 'field', 3, 'en_us', ''),
(302, 'field', 4, 'en_us', ''),
(302, 'field', 6, 'en_us', ''),
(302, 'field', 7, 'en_us', ''),
(302, 'field', 2, 'en_us', ''),
(302, 'field', 8, 'en_us', ''),
(302, 'field', 9, 'en_us', ''),
(302, 'field', 1, 'en_us', ''),
(302, 'slug', 0, 'en_us', ''),
(302, 'title', 0, 'en_us', ' lil b no black person is ugly music video most powerful song of the decade '),
(303, 'field', 10, 'en_us', ' http www youtube com watch v=pmm oad3i54 '),
(303, 'field', 11, 'en_us', ' video youtube '),
(303, 'field', 3, 'en_us', ''),
(303, 'field', 4, 'en_us', ''),
(303, 'field', 6, 'en_us', ''),
(303, 'field', 7, 'en_us', ''),
(303, 'field', 2, 'en_us', ''),
(303, 'field', 8, 'en_us', ''),
(303, 'field', 9, 'en_us', ''),
(303, 'field', 1, 'en_us', ''),
(303, 'slug', 0, 'en_us', ''),
(303, 'title', 0, 'en_us', ' detroit in effect r u married 1997 '),
(304, 'field', 10, 'en_us', ' http www youtube com watch v=j_56qekdthe '),
(304, 'field', 11, 'en_us', ' video youtube '),
(304, 'field', 3, 'en_us', ''),
(304, 'field', 4, 'en_us', ''),
(304, 'field', 6, 'en_us', ''),
(304, 'field', 7, 'en_us', ''),
(304, 'field', 2, 'en_us', ''),
(304, 'field', 8, 'en_us', ''),
(304, 'field', 9, 'en_us', ''),
(304, 'field', 1, 'en_us', ''),
(304, 'slug', 0, 'en_us', ''),
(304, 'title', 0, 'en_us', ' homeboy sandman america the beautiful '),
(305, 'field', 10, 'en_us', ' http www youtube com watch v=8pbdlqth_x4 '),
(305, 'field', 11, 'en_us', ' video youtube '),
(305, 'field', 3, 'en_us', ''),
(305, 'field', 4, 'en_us', ''),
(305, 'field', 6, 'en_us', ''),
(305, 'field', 7, 'en_us', ''),
(305, 'field', 2, 'en_us', ''),
(305, 'field', 8, 'en_us', ''),
(305, 'field', 9, 'en_us', ''),
(305, 'field', 1, 'en_us', ''),
(305, 'slug', 0, 'en_us', ''),
(305, 'title', 0, 'en_us', ' darwin deez radar detector official video '),
(306, 'field', 10, 'en_us', ' http www youtube com watch v=9nnmbtqq5uu '),
(306, 'field', 11, 'en_us', ' video youtube '),
(306, 'field', 3, 'en_us', ''),
(306, 'field', 4, 'en_us', ''),
(306, 'field', 6, 'en_us', ''),
(306, 'field', 7, 'en_us', ''),
(306, 'field', 2, 'en_us', ''),
(306, 'field', 8, 'en_us', ''),
(306, 'field', 9, 'en_us', ''),
(306, 'field', 1, 'en_us', ''),
(306, 'slug', 0, 'en_us', ''),
(306, 'title', 0, 'en_us', ' lofty305 poshburger dream sequence '),
(307, 'field', 10, 'en_us', ' http www youtube com watch v=vnh3djgyfdm '),
(307, 'field', 11, 'en_us', ' video youtube '),
(307, 'field', 3, 'en_us', ''),
(307, 'field', 4, 'en_us', ''),
(307, 'field', 6, 'en_us', ''),
(307, 'field', 7, 'en_us', ''),
(307, 'field', 2, 'en_us', ''),
(307, 'field', 8, 'en_us', ''),
(307, 'field', 9, 'en_us', ''),
(307, 'field', 1, 'en_us', ''),
(307, 'slug', 0, 'en_us', ''),
(307, 'title', 0, 'en_us', ' octopusbacon '),
(308, 'field', 10, 'en_us', ' http www youtube com watch v=jky_hlmyhvk '),
(308, 'field', 11, 'en_us', ' video youtube '),
(308, 'field', 3, 'en_us', ''),
(308, 'field', 4, 'en_us', ''),
(308, 'field', 6, 'en_us', ''),
(308, 'field', 7, 'en_us', ''),
(308, 'field', 2, 'en_us', ''),
(308, 'field', 8, 'en_us', ''),
(308, 'field', 9, 'en_us', ''),
(308, 'field', 1, 'en_us', ''),
(308, 'slug', 0, 'en_us', ''),
(308, 'title', 0, 'en_us', ' howes crease fusion '),
(309, 'field', 10, 'en_us', ' http www youtube com watch v=9gnhd1n9eay '),
(309, 'field', 11, 'en_us', ' video youtube '),
(309, 'field', 3, 'en_us', ''),
(309, 'field', 4, 'en_us', ''),
(309, 'field', 6, 'en_us', ''),
(309, 'field', 7, 'en_us', ''),
(309, 'field', 2, 'en_us', ''),
(309, 'field', 8, 'en_us', ''),
(309, 'field', 9, 'en_us', ''),
(309, 'field', 1, 'en_us', ''),
(309, 'slug', 0, 'en_us', ''),
(309, 'title', 0, 'en_us', ' cult mountain smfdb '),
(310, 'field', 10, 'en_us', ' http www youtube com watch v=o_pizwmfnou '),
(310, 'field', 11, 'en_us', ' video youtube '),
(310, 'field', 3, 'en_us', ''),
(310, 'field', 4, 'en_us', ''),
(310, 'field', 6, 'en_us', ''),
(310, 'field', 7, 'en_us', ''),
(310, 'field', 2, 'en_us', ''),
(310, 'field', 8, 'en_us', ''),
(310, 'field', 9, 'en_us', ''),
(310, 'field', 1, 'en_us', ''),
(310, 'slug', 0, 'en_us', ''),
(310, 'title', 0, 'en_us', ' da$h parachute escape counseling official music video '),
(311, 'field', 10, 'en_us', ' http www youtube com watch v=rqrdgqiwjv0 '),
(311, 'field', 11, 'en_us', ' video youtube '),
(311, 'field', 3, 'en_us', ''),
(311, 'field', 4, 'en_us', ''),
(311, 'field', 6, 'en_us', ''),
(311, 'field', 7, 'en_us', ''),
(311, 'field', 2, 'en_us', ''),
(311, 'field', 8, 'en_us', ''),
(311, 'field', 9, 'en_us', ''),
(311, 'field', 1, 'en_us', ''),
(311, 'slug', 0, 'en_us', ''),
(311, 'title', 0, 'en_us', ' king krule border line '),
(312, 'field', 10, 'en_us', ' http www youtube com watch v=zef0rh1_ueg '),
(312, 'field', 11, 'en_us', ' video youtube '),
(312, 'field', 3, 'en_us', ''),
(312, 'field', 4, 'en_us', ''),
(312, 'field', 6, 'en_us', ''),
(312, 'field', 7, 'en_us', ''),
(312, 'field', 2, 'en_us', ''),
(312, 'field', 8, 'en_us', ''),
(312, 'field', 9, 'en_us', ''),
(312, 'field', 1, 'en_us', ''),
(312, 'slug', 0, 'en_us', ''),
(312, 'title', 0, 'en_us', ' francescasortino_inside art_gerardo frisina mix_featuring fabrizio bosso '),
(313, 'field', 10, 'en_us', ' http www youtube com watch v=edmzuoq5gnq '),
(313, 'field', 11, 'en_us', ' video youtube '),
(313, 'field', 3, 'en_us', ''),
(313, 'field', 4, 'en_us', ''),
(313, 'field', 6, 'en_us', ''),
(313, 'field', 7, 'en_us', ''),
(313, 'field', 2, 'en_us', ''),
(313, 'field', 8, 'en_us', ''),
(313, 'field', 9, 'en_us', ''),
(313, 'field', 1, 'en_us', ''),
(313, 'slug', 0, 'en_us', ''),
(313, 'title', 0, 'en_us', ' remy banks rem feat nasty nigel '),
(314, 'field', 10, 'en_us', ' http www youtube com watch v=tujquvbj4re '),
(314, 'field', 11, 'en_us', ' video youtube '),
(314, 'field', 3, 'en_us', ''),
(314, 'field', 4, 'en_us', ''),
(314, 'field', 6, 'en_us', ''),
(314, 'field', 7, 'en_us', ''),
(314, 'field', 2, 'en_us', ''),
(314, 'field', 8, 'en_us', ''),
(314, 'field', 9, 'en_us', ''),
(314, 'field', 1, 'en_us', ''),
(314, 'slug', 0, 'en_us', ''),
(314, 'title', 0, 'en_us', ' ddwiwdd dan deacon when i was done dying off the air adult swim '),
(315, 'field', 10, 'en_us', ' http www youtube com watch v=wiubcb2t55q '),
(315, 'field', 11, 'en_us', ' video youtube '),
(315, 'field', 3, 'en_us', ''),
(315, 'field', 4, 'en_us', ''),
(315, 'field', 6, 'en_us', ''),
(315, 'field', 7, 'en_us', ''),
(315, 'field', 2, 'en_us', ''),
(315, 'field', 8, 'en_us', ''),
(315, 'field', 9, 'en_us', ''),
(315, 'field', 1, 'en_us', ''),
(315, 'slug', 0, 'en_us', ''),
(315, 'title', 0, 'en_us', ' mac demarco my kind of woman official video '),
(316, 'field', 10, 'en_us', ' http www youtube com watch v=ifyohrwi w8 '),
(316, 'field', 11, 'en_us', ' video youtube '),
(316, 'field', 3, 'en_us', ''),
(316, 'field', 4, 'en_us', ''),
(316, 'field', 6, 'en_us', ''),
(316, 'field', 7, 'en_us', ''),
(316, 'field', 2, 'en_us', ''),
(316, 'field', 8, 'en_us', ''),
(316, 'field', 9, 'en_us', ''),
(316, 'field', 1, 'en_us', ''),
(316, 'slug', 0, 'en_us', ''),
(316, 'title', 0, 'en_us', ' hot chocolate emma '),
(317, 'field', 10, 'en_us', ' http www youtube com watch v=_wprtdxs3ma '),
(317, 'field', 11, 'en_us', ' video youtube '),
(317, 'field', 3, 'en_us', ''),
(317, 'field', 4, 'en_us', ''),
(317, 'field', 6, 'en_us', ''),
(317, 'field', 7, 'en_us', ''),
(317, 'field', 2, 'en_us', ''),
(317, 'field', 8, 'en_us', ''),
(317, 'field', 9, 'en_us', ''),
(317, 'field', 1, 'en_us', ''),
(317, 'slug', 0, 'en_us', ''),
(317, 'title', 0, 'en_us', ' oscar daffodil days '),
(318, 'field', 10, 'en_us', ' http www youtube com watch v=jnwe_lviko8 '),
(318, 'field', 11, 'en_us', ' video youtube '),
(318, 'field', 3, 'en_us', ''),
(318, 'field', 4, 'en_us', ''),
(318, 'field', 6, 'en_us', ''),
(318, 'field', 7, 'en_us', ''),
(318, 'field', 2, 'en_us', ''),
(318, 'field', 8, 'en_us', ''),
(318, 'field', 9, 'en_us', ''),
(318, 'field', 1, 'en_us', ''),
(318, 'slug', 0, 'en_us', ''),
(318, 'title', 0, 'en_us', ' klein open mind '),
(319, 'field', 10, 'en_us', ' http www youtube com watch v=ox5s9m6iank '),
(319, 'field', 11, 'en_us', ' video youtube '),
(319, 'field', 3, 'en_us', ''),
(319, 'field', 4, 'en_us', ''),
(319, 'field', 6, 'en_us', ''),
(319, 'field', 7, 'en_us', ''),
(319, 'field', 2, 'en_us', ''),
(319, 'field', 8, 'en_us', ''),
(319, 'field', 9, 'en_us', ''),
(319, 'field', 1, 'en_us', ''),
(319, 'slug', 0, 'en_us', ''),
(319, 'title', 0, 'en_us', ' klein witch '),
(320, 'field', 10, 'en_us', ' http www youtube com watch v=srfe453yepi '),
(320, 'field', 11, 'en_us', ' video youtube '),
(320, 'field', 3, 'en_us', ''),
(320, 'field', 4, 'en_us', ''),
(320, 'field', 6, 'en_us', ''),
(320, 'field', 7, 'en_us', ''),
(320, 'field', 2, 'en_us', ''),
(320, 'field', 8, 'en_us', ''),
(320, 'field', 9, 'en_us', ''),
(320, 'field', 1, 'en_us', ''),
(320, 'slug', 0, 'en_us', ''),
(320, 'title', 0, 'en_us', ' kali uchis rush official video '),
(321, 'field', 10, 'en_us', ' http www youtube com watch v=rivfcwwvoh8 '),
(321, 'field', 11, 'en_us', ' video youtube '),
(321, 'field', 3, 'en_us', ''),
(321, 'field', 4, 'en_us', ''),
(321, 'field', 6, 'en_us', ''),
(321, 'field', 7, 'en_us', ''),
(321, 'field', 2, 'en_us', ''),
(321, 'field', 8, 'en_us', ''),
(321, 'field', 9, 'en_us', ''),
(321, 'field', 1, 'en_us', ''),
(321, 'slug', 0, 'en_us', ''),
(321, 'title', 0, 'en_us', ' man don t care jme ft giggs '),
(322, 'field', 10, 'en_us', ' http www youtube com watch v=rjz0rq1gvlk '),
(322, 'field', 11, 'en_us', ' video youtube '),
(322, 'field', 3, 'en_us', ''),
(322, 'field', 4, 'en_us', ''),
(322, 'field', 6, 'en_us', ''),
(322, 'field', 7, 'en_us', ''),
(322, 'field', 2, 'en_us', ''),
(322, 'field', 8, 'en_us', ''),
(322, 'field', 9, 'en_us', ''),
(322, 'field', 1, 'en_us', ''),
(322, 'slug', 0, 'en_us', ''),
(322, 'title', 0, 'en_us', ' death from above 1979 virgins official video '),
(323, 'field', 10, 'en_us', ' http www youtube com watch v=uimvs9x9duy '),
(323, 'field', 11, 'en_us', ' video youtube '),
(323, 'field', 3, 'en_us', ''),
(323, 'field', 4, 'en_us', ''),
(323, 'field', 6, 'en_us', ''),
(323, 'field', 7, 'en_us', ''),
(323, 'field', 2, 'en_us', ''),
(323, 'field', 8, 'en_us', ''),
(323, 'field', 9, 'en_us', ''),
(323, 'field', 1, 'en_us', ''),
(323, 'slug', 0, 'en_us', ''),
(323, 'title', 0, 'en_us', ' have mercy eryn allen kane '),
(324, 'field', 10, 'en_us', ' http www youtube com watch v=u4c9bbeue4m '),
(324, 'field', 11, 'en_us', ' video youtube '),
(324, 'field', 3, 'en_us', ''),
(324, 'field', 4, 'en_us', ''),
(324, 'field', 6, 'en_us', ''),
(324, 'field', 7, 'en_us', ''),
(324, 'field', 2, 'en_us', ''),
(324, 'field', 8, 'en_us', ''),
(324, 'field', 9, 'en_us', ''),
(324, 'field', 1, 'en_us', ''),
(324, 'slug', 0, 'en_us', ''),
(324, 'title', 0, 'en_us', ' towkio wav theory prod towkio the social experiment '),
(325, 'field', 10, 'en_us', ' http www youtube com watch v=1unmeipkgz4 '),
(325, 'field', 11, 'en_us', ' video youtube '),
(325, 'field', 3, 'en_us', ''),
(325, 'field', 4, 'en_us', ''),
(325, 'field', 6, 'en_us', ''),
(325, 'field', 7, 'en_us', ''),
(325, 'field', 2, 'en_us', ''),
(325, 'field', 8, 'en_us', ''),
(325, 'field', 9, 'en_us', ''),
(325, 'field', 1, 'en_us', ''),
(325, 'slug', 0, 'en_us', ''),
(325, 'title', 0, 'en_us', ' cousin brian disposer '),
(326, 'field', 10, 'en_us', ' http www youtube com watch v=cn10ylp9ht0 '),
(326, 'field', 11, 'en_us', ' video youtube '),
(326, 'field', 3, 'en_us', ''),
(326, 'field', 4, 'en_us', ''),
(326, 'field', 6, 'en_us', ''),
(326, 'field', 7, 'en_us', ''),
(326, 'field', 2, 'en_us', ''),
(326, 'field', 8, 'en_us', ''),
(326, 'field', 9, 'en_us', ''),
(326, 'field', 1, 'en_us', ''),
(326, 'slug', 0, 'en_us', ''),
(326, 'title', 0, 'en_us', ' private video '),
(327, 'field', 10, 'en_us', ' http www youtube com watch v=10kc7rk2ros '),
(327, 'field', 11, 'en_us', ' video youtube '),
(327, 'field', 3, 'en_us', ''),
(327, 'field', 4, 'en_us', ''),
(327, 'field', 6, 'en_us', ''),
(327, 'field', 7, 'en_us', ''),
(327, 'field', 2, 'en_us', ''),
(327, 'field', 8, 'en_us', ''),
(327, 'field', 9, 'en_us', ''),
(327, 'field', 1, 'en_us', ''),
(327, 'slug', 0, 'en_us', ''),
(327, 'title', 0, 'en_us', ' shamir call it off official music video ytmas '),
(328, 'field', 10, 'en_us', ' http www youtube com watch v=5ebcbuxmej4 '),
(328, 'field', 11, 'en_us', ' video youtube '),
(328, 'field', 3, 'en_us', ''),
(328, 'field', 4, 'en_us', ''),
(328, 'field', 6, 'en_us', ''),
(328, 'field', 7, 'en_us', ''),
(328, 'field', 2, 'en_us', ''),
(328, 'field', 8, 'en_us', ''),
(328, 'field', 9, 'en_us', ''),
(328, 'field', 1, 'en_us', ''),
(328, 'slug', 0, 'en_us', ''),
(328, 'title', 0, 'en_us', ' portico 101 feat joe newman official video '),
(329, 'field', 10, 'en_us', ' http www youtube com watch v=6uvtpodgzry '),
(329, 'field', 11, 'en_us', ' video youtube '),
(329, 'field', 3, 'en_us', ''),
(329, 'field', 4, 'en_us', ''),
(329, 'field', 6, 'en_us', ''),
(329, 'field', 7, 'en_us', ''),
(329, 'field', 2, 'en_us', ''),
(329, 'field', 8, 'en_us', ''),
(329, 'field', 9, 'en_us', ''),
(329, 'field', 1, 'en_us', ''),
(329, 'slug', 0, 'en_us', ''),
(329, 'title', 0, 'en_us', ' pins too little too late '),
(330, 'field', 10, 'en_us', ' http www youtube com watch v= _ej1kp_h0g '),
(330, 'field', 11, 'en_us', ' video youtube '),
(330, 'field', 3, 'en_us', ''),
(330, 'field', 4, 'en_us', ''),
(330, 'field', 6, 'en_us', ''),
(330, 'field', 7, 'en_us', ''),
(330, 'field', 2, 'en_us', ''),
(330, 'field', 8, 'en_us', ''),
(330, 'field', 9, 'en_us', ''),
(330, 'field', 1, 'en_us', ''),
(330, 'slug', 0, 'en_us', ''),
(330, 'title', 0, 'en_us', ' brtsh knights outta your mind stuck on u '),
(331, 'field', 10, 'en_us', ' http www youtube com watch v=pkww8qpoyq4 '),
(331, 'field', 11, 'en_us', ' video youtube '),
(331, 'field', 3, 'en_us', ''),
(331, 'field', 4, 'en_us', ''),
(331, 'field', 6, 'en_us', ''),
(331, 'field', 7, 'en_us', ''),
(331, 'field', 2, 'en_us', ''),
(331, 'field', 8, 'en_us', ''),
(331, 'field', 9, 'en_us', ''),
(331, 'field', 1, 'en_us', ''),
(331, 'slug', 0, 'en_us', ''),
(331, 'title', 0, 'en_us', ' show me the body bone soup '),
(332, 'field', 10, 'en_us', ' http www youtube com watch v=tp9lurteqjc '),
(332, 'field', 11, 'en_us', ' video youtube '),
(332, 'field', 3, 'en_us', ''),
(332, 'field', 4, 'en_us', ''),
(332, 'field', 6, 'en_us', ''),
(332, 'field', 7, 'en_us', ''),
(332, 'field', 2, 'en_us', ''),
(332, 'field', 8, 'en_us', ''),
(332, 'field', 9, 'en_us', ''),
(332, 'field', 1, 'en_us', ''),
(332, 'slug', 0, 'en_us', ''),
(332, 'title', 0, 'en_us', ' jamie xx loud places ft romy '),
(333, 'field', 10, 'en_us', ' http www youtube com watch v=nhy379hldsk '),
(333, 'field', 11, 'en_us', ' video youtube '),
(333, 'field', 3, 'en_us', ''),
(333, 'field', 4, 'en_us', ''),
(333, 'field', 6, 'en_us', ''),
(333, 'field', 7, 'en_us', ''),
(333, 'field', 2, 'en_us', ''),
(333, 'field', 8, 'en_us', ''),
(333, 'field', 9, 'en_us', ''),
(333, 'field', 1, 'en_us', ''),
(333, 'slug', 0, 'en_us', ''),
(333, 'title', 0, 'en_us', ' donmonique pilates kendall kylie miley official video '),
(334, 'field', 10, 'en_us', ' http www youtube com watch v=3xdatkom4nc '),
(334, 'field', 11, 'en_us', ' video youtube '),
(334, 'field', 3, 'en_us', ''),
(334, 'field', 4, 'en_us', ''),
(334, 'field', 6, 'en_us', ''),
(334, 'field', 7, 'en_us', ''),
(334, 'field', 2, 'en_us', ''),
(334, 'field', 8, 'en_us', ''),
(334, 'field', 9, 'en_us', ''),
(334, 'field', 1, 'en_us', ''),
(334, 'slug', 0, 'en_us', ''),
(334, 'title', 0, 'en_us', ' okay kaya damn gravity '),
(335, 'field', 10, 'en_us', ' http www youtube com watch v=i8bbcpw br4 '),
(335, 'field', 11, 'en_us', ' video youtube '),
(335, 'field', 3, 'en_us', ''),
(335, 'field', 4, 'en_us', ''),
(335, 'field', 6, 'en_us', ''),
(335, 'field', 7, 'en_us', ''),
(335, 'field', 2, 'en_us', ''),
(335, 'field', 8, 'en_us', ''),
(335, 'field', 9, 'en_us', ''),
(335, 'field', 1, 'en_us', ''),
(335, 'slug', 0, 'en_us', ''),
(335, 'title', 0, 'en_us', ' dems wake official video '),
(336, 'field', 10, 'en_us', ' http www youtube com watch v=2ywsx88lzbm '),
(336, 'field', 11, 'en_us', ' video youtube '),
(336, 'field', 3, 'en_us', ''),
(336, 'field', 4, 'en_us', ''),
(336, 'field', 6, 'en_us', ''),
(336, 'field', 7, 'en_us', ''),
(336, 'field', 2, 'en_us', ''),
(336, 'field', 8, 'en_us', ''),
(336, 'field', 9, 'en_us', ''),
(336, 'field', 1, 'en_us', ''),
(336, 'slug', 0, 'en_us', ''),
(336, 'title', 0, 'en_us', ' perfect blunt 2 feat stevie la fuhk sendawg yt '),
(337, 'field', 10, 'en_us', ' http www youtube com watch v=jr7hzifiqwm '),
(337, 'field', 11, 'en_us', ' video youtube '),
(337, 'field', 3, 'en_us', ''),
(337, 'field', 4, 'en_us', ''),
(337, 'field', 6, 'en_us', ''),
(337, 'field', 7, 'en_us', ''),
(337, 'field', 2, 'en_us', ''),
(337, 'field', 8, 'en_us', ''),
(337, 'field', 9, 'en_us', ''),
(337, 'field', 1, 'en_us', ''),
(337, 'slug', 0, 'en_us', ''),
(337, 'title', 0, 'en_us', ' andre jakai actuality directed by dave phoenix '),
(338, 'field', 10, 'en_us', ' http www youtube com watch v=wdr mse4voe '),
(338, 'field', 11, 'en_us', ' video youtube '),
(338, 'field', 3, 'en_us', ''),
(338, 'field', 4, 'en_us', ''),
(338, 'field', 6, 'en_us', ''),
(338, 'field', 7, 'en_us', ''),
(338, 'field', 2, 'en_us', ''),
(338, 'field', 8, 'en_us', ''),
(338, 'field', 9, 'en_us', ''),
(338, 'field', 1, 'en_us', ''),
(338, 'slug', 0, 'en_us', ''),
(338, 'title', 0, 'en_us', ' squad deep antwon wiki ft lee spielman prod by skywlkr '),
(339, 'field', 10, 'en_us', ' http www youtube com watch v=jmqlfou4stw '),
(339, 'field', 11, 'en_us', ' video youtube '),
(339, 'field', 3, 'en_us', ''),
(339, 'field', 4, 'en_us', ''),
(339, 'field', 6, 'en_us', ''),
(339, 'field', 7, 'en_us', ''),
(339, 'field', 2, 'en_us', ''),
(339, 'field', 8, 'en_us', ''),
(339, 'field', 9, 'en_us', ''),
(339, 'field', 1, 'en_us', ''),
(339, 'slug', 0, 'en_us', ''),
(339, 'title', 0, 'en_us', ' salomon faye w t f '),
(340, 'field', 10, 'en_us', ' http www youtube com watch v=cwgskqo4edw '),
(340, 'field', 11, 'en_us', ' video youtube '),
(340, 'field', 3, 'en_us', ''),
(340, 'field', 4, 'en_us', ''),
(340, 'field', 6, 'en_us', ''),
(340, 'field', 7, 'en_us', ''),
(340, 'field', 2, 'en_us', ''),
(340, 'field', 8, 'en_us', ''),
(340, 'field', 9, 'en_us', ''),
(340, 'field', 1, 'en_us', ''),
(340, 'slug', 0, 'en_us', ''),
(340, 'title', 0, 'en_us', ' slickyboy karma '),
(341, 'field', 10, 'en_us', ' http www youtube com watch v=awdt7ogjwcy '),
(341, 'field', 11, 'en_us', ' video youtube '),
(341, 'field', 3, 'en_us', ''),
(341, 'field', 4, 'en_us', ''),
(341, 'field', 6, 'en_us', ''),
(341, 'field', 7, 'en_us', ''),
(341, 'field', 2, 'en_us', ''),
(341, 'field', 8, 'en_us', ''),
(341, 'field', 9, 'en_us', ''),
(341, 'field', 1, 'en_us', ''),
(341, 'slug', 0, 'en_us', ''),
(341, 'title', 0, 'en_us', ' junglepussy me '),
(342, 'field', 10, 'en_us', ' http www youtube com watch v=f8iwgbh9sx0 '),
(342, 'field', 11, 'en_us', ' video youtube '),
(342, 'field', 3, 'en_us', ''),
(342, 'field', 4, 'en_us', ''),
(342, 'field', 6, 'en_us', ''),
(342, 'field', 7, 'en_us', ''),
(342, 'field', 2, 'en_us', ''),
(342, 'field', 8, 'en_us', ''),
(342, 'field', 9, 'en_us', ''),
(342, 'field', 1, 'en_us', ''),
(342, 'slug', 0, 'en_us', ''),
(342, 'title', 0, 'en_us', ' faik oops '),
(343, 'field', 10, 'en_us', ' http www youtube com watch v=xunzkijq 30 '),
(343, 'field', 11, 'en_us', ' video youtube '),
(343, 'field', 3, 'en_us', ''),
(343, 'field', 4, 'en_us', ''),
(343, 'field', 6, 'en_us', ''),
(343, 'field', 7, 'en_us', ''),
(343, 'field', 2, 'en_us', ''),
(343, 'field', 8, 'en_us', ''),
(343, 'field', 9, 'en_us', ''),
(343, 'field', 1, 'en_us', ''),
(343, 'slug', 0, 'en_us', ''),
(343, 'title', 0, 'en_us', ' lee scott butter fly official video prod dirty dike '),
(344, 'field', 10, 'en_us', ' http www youtube com watch v=nhm87yivswm '),
(344, 'field', 11, 'en_us', ' video youtube '),
(344, 'field', 3, 'en_us', ''),
(344, 'field', 4, 'en_us', ''),
(344, 'field', 6, 'en_us', ''),
(344, 'field', 7, 'en_us', ''),
(344, 'field', 2, 'en_us', ''),
(344, 'field', 8, 'en_us', ''),
(344, 'field', 9, 'en_us', ''),
(344, 'field', 1, 'en_us', ''),
(344, 'slug', 0, 'en_us', ''),
(344, 'title', 0, 'en_us', ' goldlink sober thoughts official video '),
(345, 'field', 10, 'en_us', ' http www youtube com watch v=msibb8ihf6q '),
(345, 'field', 11, 'en_us', ' video youtube '),
(345, 'field', 3, 'en_us', ''),
(345, 'field', 4, 'en_us', ''),
(345, 'field', 6, 'en_us', ''),
(345, 'field', 7, 'en_us', ''),
(345, 'field', 2, 'en_us', ''),
(345, 'field', 8, 'en_us', ''),
(345, 'field', 9, 'en_us', ''),
(345, 'field', 1, 'en_us', ''),
(345, 'slug', 0, 'en_us', ''),
(345, 'title', 0, 'en_us', ' bok bok sweyn jupiter papaya lipgloss '),
(346, 'field', 10, 'en_us', ' http www youtube com watch v=4wwaro7az6y '),
(346, 'field', 11, 'en_us', ' video youtube '),
(346, 'field', 3, 'en_us', ''),
(346, 'field', 4, 'en_us', ''),
(346, 'field', 6, 'en_us', ''),
(346, 'field', 7, 'en_us', ''),
(346, 'field', 2, 'en_us', ''),
(346, 'field', 8, 'en_us', ''),
(346, 'field', 9, 'en_us', ''),
(346, 'field', 1, 'en_us', ''),
(346, 'slug', 0, 'en_us', ''),
(346, 'title', 0, 'en_us', ' jfse '),
(347, 'field', 10, 'en_us', ' http www youtube com watch v=yjtggzz4src '),
(347, 'field', 11, 'en_us', ' video youtube '),
(347, 'field', 3, 'en_us', ''),
(347, 'field', 4, 'en_us', ''),
(347, 'field', 6, 'en_us', ''),
(347, 'field', 7, 'en_us', ''),
(347, 'field', 2, 'en_us', ''),
(347, 'field', 8, 'en_us', ''),
(347, 'field', 9, 'en_us', ''),
(347, 'field', 1, 'en_us', ''),
(347, 'slug', 0, 'en_us', ''),
(347, 'title', 0, 'en_us', ' overreacting under the sea official video '),
(348, 'field', 10, 'en_us', ' http www youtube com watch v=wb4sylujxis '),
(348, 'field', 11, 'en_us', ' video youtube '),
(348, 'field', 3, 'en_us', ''),
(348, 'field', 4, 'en_us', ''),
(348, 'field', 6, 'en_us', ''),
(348, 'field', 7, 'en_us', ''),
(348, 'field', 2, 'en_us', ''),
(348, 'field', 8, 'en_us', ''),
(348, 'field', 9, 'en_us', ''),
(348, 'field', 1, 'en_us', ''),
(348, 'slug', 0, 'en_us', ''),
(348, 'title', 0, 'en_us', ' todd terje alfonso muskedunder official video '),
(349, 'field', 10, 'en_us', ' http www youtube com watch v=2pdyvkaysau '),
(349, 'field', 11, 'en_us', ' video youtube '),
(349, 'field', 3, 'en_us', ''),
(349, 'field', 4, 'en_us', ''),
(349, 'field', 6, 'en_us', ''),
(349, 'field', 7, 'en_us', ''),
(349, 'field', 2, 'en_us', ''),
(349, 'field', 8, 'en_us', ''),
(349, 'field', 9, 'en_us', ''),
(349, 'field', 1, 'en_us', ''),
(349, 'slug', 0, 'en_us', ''),
(349, 'title', 0, 'en_us', ' young fathers shame '),
(350, 'field', 10, 'en_us', ' http www youtube com watch v=oni0bxp2clu '),
(350, 'field', 11, 'en_us', ' video youtube '),
(350, 'field', 3, 'en_us', ''),
(350, 'field', 4, 'en_us', ''),
(350, 'field', 6, 'en_us', ''),
(350, 'field', 7, 'en_us', ''),
(350, 'field', 2, 'en_us', ''),
(350, 'field', 8, 'en_us', ''),
(350, 'field', 9, 'en_us', ''),
(350, 'field', 1, 'en_us', ''),
(350, 'slug', 0, 'en_us', ''),
(350, 'title', 0, 'en_us', ' illaman bam bam official video '),
(351, 'field', 10, 'en_us', ' http www youtube com watch v=gwihiacusxa '),
(351, 'field', 11, 'en_us', ' video youtube '),
(351, 'field', 3, 'en_us', ''),
(351, 'field', 4, 'en_us', ''),
(351, 'field', 6, 'en_us', ''),
(351, 'field', 7, 'en_us', ''),
(351, 'field', 2, 'en_us', ''),
(351, 'field', 8, 'en_us', ''),
(351, 'field', 9, 'en_us', ''),
(351, 'field', 1, 'en_us', ''),
(351, 'slug', 0, 'en_us', ''),
(351, 'title', 0, 'en_us', ' dam funk when i m with u i think of her adolescent funk '),
(352, 'field', 10, 'en_us', ' http www youtube com watch v=iaieconvvge '),
(352, 'field', 11, 'en_us', ' video youtube '),
(352, 'field', 3, 'en_us', ''),
(352, 'field', 4, 'en_us', ''),
(352, 'field', 6, 'en_us', ''),
(352, 'field', 7, 'en_us', ''),
(352, 'field', 2, 'en_us', ''),
(352, 'field', 8, 'en_us', ''),
(352, 'field', 9, 'en_us', ''),
(352, 'field', 1, 'en_us', ''),
(352, 'slug', 0, 'en_us', ''),
(352, 'title', 0, 'en_us', ' ariel pink jell o official video '),
(353, 'field', 10, 'en_us', ' http www youtube com watch v=rwj389sszd4 '),
(353, 'field', 11, 'en_us', ' video youtube '),
(353, 'field', 3, 'en_us', ''),
(353, 'field', 4, 'en_us', ''),
(353, 'field', 6, 'en_us', ''),
(353, 'field', 7, 'en_us', ''),
(353, 'field', 2, 'en_us', ''),
(353, 'field', 8, 'en_us', ''),
(353, 'field', 9, 'en_us', ''),
(353, 'field', 1, 'en_us', ''),
(353, 'slug', 0, 'en_us', ''),
(353, 'title', 0, 'en_us', ' towkio world turning feat joey purp prod caleb james '),
(354, 'field', 10, 'en_us', ' http www youtube com watch v=8imtkq5yotw '),
(354, 'field', 11, 'en_us', ' video youtube '),
(354, 'field', 3, 'en_us', ''),
(354, 'field', 4, 'en_us', ''),
(354, 'field', 6, 'en_us', ''),
(354, 'field', 7, 'en_us', ''),
(354, 'field', 2, 'en_us', ''),
(354, 'field', 8, 'en_us', ''),
(354, 'field', 9, 'en_us', ''),
(354, 'field', 1, 'en_us', ''),
(354, 'slug', 0, 'en_us', ''),
(354, 'title', 0, 'en_us', ' this will destroy you new topia music video adult swim '),
(355, 'field', 10, 'en_us', ' http www youtube com watch v=j8jqi8qmhjg '),
(355, 'field', 11, 'en_us', ' video youtube '),
(355, 'field', 3, 'en_us', ''),
(355, 'field', 4, 'en_us', ''),
(355, 'field', 6, 'en_us', ''),
(355, 'field', 7, 'en_us', ''),
(355, 'field', 2, 'en_us', ''),
(355, 'field', 8, 'en_us', ''),
(355, 'field', 9, 'en_us', ''),
(355, 'field', 1, 'en_us', ''),
(355, 'slug', 0, 'en_us', ''),
(355, 'title', 0, 'en_us', ' lee scott don t tell me official video prod dirty dike '),
(356, 'field', 10, 'en_us', ' http www youtube com watch v=qhui7inm0dm '),
(356, 'field', 11, 'en_us', ' video youtube '),
(356, 'field', 3, 'en_us', ''),
(356, 'field', 4, 'en_us', ''),
(356, 'field', 6, 'en_us', ''),
(356, 'field', 7, 'en_us', ''),
(356, 'field', 2, 'en_us', ''),
(356, 'field', 8, 'en_us', ''),
(356, 'field', 9, 'en_us', ''),
(356, 'field', 1, 'en_us', ''),
(356, 'slug', 0, 'en_us', ''),
(356, 'title', 0, 'en_us', ' james pants artificial lover '),
(357, 'field', 10, 'en_us', ' http www youtube com watch v=btv_fw3vvom '),
(357, 'field', 11, 'en_us', ' video youtube '),
(357, 'field', 3, 'en_us', ''),
(357, 'field', 4, 'en_us', ''),
(357, 'field', 6, 'en_us', ''),
(357, 'field', 7, 'en_us', ''),
(357, 'field', 2, 'en_us', ''),
(357, 'field', 8, 'en_us', ''),
(357, 'field', 9, 'en_us', ''),
(357, 'field', 1, 'en_us', ''),
(357, 'slug', 0, 'en_us', ''),
(357, 'title', 0, 'en_us', ' josiahwise is the serpentwithfeet curiosity of other men '),
(358, 'field', 10, 'en_us', ' http www youtube com watch v=cufmkvornqm '),
(358, 'field', 11, 'en_us', ' video youtube '),
(358, 'field', 3, 'en_us', ''),
(358, 'field', 4, 'en_us', ''),
(358, 'field', 6, 'en_us', ''),
(358, 'field', 7, 'en_us', ''),
(358, 'field', 2, 'en_us', ''),
(358, 'field', 8, 'en_us', ''),
(358, 'field', 9, 'en_us', ''),
(358, 'field', 1, 'en_us', ''),
(358, 'slug', 0, 'en_us', ''),
(358, 'title', 0, 'en_us', ' arca sad bitch '),
(359, 'field', 10, 'en_us', ' http www youtube com watch v=vmz3yyj8vzo '),
(359, 'field', 11, 'en_us', ' video youtube '),
(359, 'field', 3, 'en_us', ''),
(359, 'field', 4, 'en_us', ''),
(359, 'field', 6, 'en_us', ''),
(359, 'field', 7, 'en_us', ''),
(359, 'field', 2, 'en_us', ''),
(359, 'field', 8, 'en_us', ''),
(359, 'field', 9, 'en_us', ''),
(359, 'field', 1, 'en_us', ''),
(359, 'slug', 0, 'en_us', ''),
(359, 'title', 0, 'en_us', ' salomon faye faye feat enasni leber official music video '),
(360, 'field', 10, 'en_us', ' http www youtube com watch v=yxnp5zyxjxq '),
(360, 'field', 11, 'en_us', ' video youtube '),
(360, 'field', 3, 'en_us', ''),
(360, 'field', 4, 'en_us', ''),
(360, 'field', 6, 'en_us', ''),
(360, 'field', 7, 'en_us', ''),
(360, 'field', 2, 'en_us', ''),
(360, 'field', 8, 'en_us', ''),
(360, 'field', 9, 'en_us', ''),
(360, 'field', 1, 'en_us', ''),
(360, 'slug', 0, 'en_us', ''),
(360, 'title', 0, 'en_us', ' show me the body space faithful '),
(361, 'field', 10, 'en_us', ' http www youtube com watch v=0payjj7i7i0 '),
(361, 'field', 11, 'en_us', ' video youtube '),
(361, 'field', 3, 'en_us', ''),
(361, 'field', 4, 'en_us', ''),
(361, 'field', 6, 'en_us', ''),
(361, 'field', 7, 'en_us', ''),
(361, 'field', 2, 'en_us', ''),
(361, 'field', 8, 'en_us', ''),
(361, 'field', 9, 'en_us', ''),
(361, 'field', 1, 'en_us', ''),
(361, 'slug', 0, 'en_us', ''),
(361, 'title', 0, 'en_us', ' save the child life andre jakai '),
(362, 'field', 10, 'en_us', ' http www youtube com watch v=0dfbor_koae '),
(362, 'field', 11, 'en_us', ' video youtube '),
(362, 'field', 3, 'en_us', ''),
(362, 'field', 4, 'en_us', ''),
(362, 'field', 6, 'en_us', ''),
(362, 'field', 7, 'en_us', ''),
(362, 'field', 2, 'en_us', ''),
(362, 'field', 8, 'en_us', ''),
(362, 'field', 9, 'en_us', ''),
(362, 'field', 1, 'en_us', ''),
(362, 'slug', 0, 'en_us', ''),
(362, 'title', 0, 'en_us', ' henry wu just negotiate ft simeon jones '),
(363, 'field', 10, 'en_us', ' http www youtube com watch v=l2tux_our_k '),
(363, 'field', 11, 'en_us', ' video youtube '),
(363, 'field', 3, 'en_us', ''),
(363, 'field', 4, 'en_us', ''),
(363, 'field', 6, 'en_us', ''),
(363, 'field', 7, 'en_us', ''),
(363, 'field', 2, 'en_us', ''),
(363, 'field', 8, 'en_us', ''),
(363, 'field', 9, 'en_us', ''),
(363, 'field', 1, 'en_us', ''),
(363, 'slug', 0, 'en_us', ''),
(363, 'title', 0, 'en_us', ' danny lover jesus prod by 19 thou$and official video '),
(364, 'field', 10, 'en_us', ' http www youtube com watch v=c47samqcalq '),
(364, 'field', 11, 'en_us', ' video youtube '),
(364, 'field', 3, 'en_us', ''),
(364, 'field', 4, 'en_us', ''),
(364, 'field', 6, 'en_us', ''),
(364, 'field', 7, 'en_us', ''),
(364, 'field', 2, 'en_us', ''),
(364, 'field', 8, 'en_us', ''),
(364, 'field', 9, 'en_us', ''),
(364, 'field', 1, 'en_us', ''),
(364, 'slug', 0, 'en_us', ''),
(364, 'title', 0, 'en_us', ' jonwayne minerals gems '),
(365, 'field', 10, 'en_us', ' http www youtube com watch v=u_ ivcx5ytm '),
(365, 'field', 11, 'en_us', ' video youtube '),
(365, 'field', 3, 'en_us', ''),
(365, 'field', 4, 'en_us', ''),
(365, 'field', 6, 'en_us', ''),
(365, 'field', 7, 'en_us', ''),
(365, 'field', 2, 'en_us', ''),
(365, 'field', 8, 'en_us', ''),
(365, 'field', 9, 'en_us', ''),
(365, 'field', 1, 'en_us', ''),
(365, 'slug', 0, 'en_us', ''),
(365, 'title', 0, 'en_us', ' marz léon w h i t e l i o n z official music video '),
(366, 'field', 10, 'en_us', ' http www youtube com watch v=43x1ghkyucc '),
(366, 'field', 11, 'en_us', ' video youtube '),
(366, 'field', 3, 'en_us', ''),
(366, 'field', 4, 'en_us', ''),
(366, 'field', 6, 'en_us', ''),
(366, 'field', 7, 'en_us', ''),
(366, 'field', 2, 'en_us', ''),
(366, 'field', 8, 'en_us', ''),
(366, 'field', 9, 'en_us', ''),
(366, 'field', 1, 'en_us', ''),
(366, 'slug', 0, 'en_us', ''),
(366, 'title', 0, 'en_us', ' lydia knows stevie la fuhk feat yt sendawg prod by yt '),
(367, 'field', 10, 'en_us', ' http www youtube com watch v=vrhbgw9c4 m '),
(367, 'field', 11, 'en_us', ' video youtube '),
(367, 'field', 3, 'en_us', ''),
(367, 'field', 4, 'en_us', ''),
(367, 'field', 6, 'en_us', ''),
(367, 'field', 7, 'en_us', ''),
(367, 'field', 2, 'en_us', ''),
(367, 'field', 8, 'en_us', ''),
(367, 'field', 9, 'en_us', ''),
(367, 'field', 1, 'en_us', ''),
(367, 'slug', 0, 'en_us', ''),
(367, 'title', 0, 'en_us', ' configa hastyle wut you got '),
(368, 'field', 10, 'en_us', ' http www youtube com watch v=q7hki3wbvic '),
(368, 'field', 11, 'en_us', ' video youtube '),
(368, 'field', 3, 'en_us', ''),
(368, 'field', 4, 'en_us', ''),
(368, 'field', 6, 'en_us', ''),
(368, 'field', 7, 'en_us', ''),
(368, 'field', 2, 'en_us', ''),
(368, 'field', 8, 'en_us', ''),
(368, 'field', 9, 'en_us', ''),
(368, 'field', 1, 'en_us', ''),
(368, 'slug', 0, 'en_us', ''),
(368, 'title', 0, 'en_us', ' poshgod freeze me '),
(369, 'field', 10, 'en_us', ' http www youtube com watch v=mqog5bky2bc '),
(369, 'field', 11, 'en_us', ' video youtube '),
(369, 'field', 3, 'en_us', ''),
(369, 'field', 4, 'en_us', ''),
(369, 'field', 6, 'en_us', ''),
(369, 'field', 7, 'en_us', ''),
(369, 'field', 2, 'en_us', ''),
(369, 'field', 8, 'en_us', ''),
(369, 'field', 9, 'en_us', ''),
(369, 'field', 1, 'en_us', ''),
(369, 'slug', 0, 'en_us', ''),
(369, 'title', 0, 'en_us', ' skepta shutdown '),
(370, 'field', 10, 'en_us', ' http www youtube com watch v=ur8dj t20f4 '),
(370, 'field', 11, 'en_us', ' video youtube '),
(370, 'field', 3, 'en_us', ''),
(370, 'field', 4, 'en_us', ''),
(370, 'field', 6, 'en_us', ''),
(370, 'field', 7, 'en_us', ''),
(370, 'field', 2, 'en_us', ''),
(370, 'field', 8, 'en_us', ''),
(370, 'field', 9, 'en_us', ''),
(370, 'field', 1, 'en_us', ''),
(370, 'slug', 0, 'en_us', ''),
(370, 'title', 0, 'en_us', ' saba feat eryn allen kane burnout official video hotc_tv ');

-- --------------------------------------------------------

--
-- Table structure for table `craft_sections`
--

CREATE TABLE IF NOT EXISTS `craft_sections` (
  `id` int(11) NOT NULL,
  `structureId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` enum('single','channel','structure') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'channel',
  `hasUrls` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `template` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `enableVersioning` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `craft_sections`
--

INSERT INTO `craft_sections` (`id`, `structureId`, `name`, `handle`, `type`, `hasUrls`, `template`, `enableVersioning`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, NULL, 'Homepage', 'homepage', 'single', 1, 'index', 1, '2015-06-25 14:04:24', '2015-06-25 14:04:24', '0d1fb630-0095-4712-8cb4-01b56923be2a'),
(2, NULL, 'videos', 'videos', 'channel', 1, 'videos/_entry', 1, '2015-06-25 14:04:24', '2015-07-09 14:12:16', '5bd5e1f6-4bd3-4f5d-bf08-cb948cd9f4a6'),
(3, NULL, 'About', 'about', 'single', 1, 'about', 1, '2015-06-25 14:29:31', '2015-06-25 14:29:31', '8edf14b9-2997-446f-a8d7-593de08c49a3'),
(4, NULL, 'Contact', 'contact', 'single', 1, 'contact', 1, '2015-06-25 14:29:40', '2015-06-25 14:29:40', 'f0e0f155-e94c-48c7-83d1-3606c15d1855');

-- --------------------------------------------------------

--
-- Table structure for table `craft_sections_i18n`
--

CREATE TABLE IF NOT EXISTS `craft_sections_i18n` (
  `id` int(11) NOT NULL,
  `sectionId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `enabledByDefault` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `urlFormat` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nestedUrlFormat` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `craft_sections_i18n`
--

INSERT INTO `craft_sections_i18n` (`id`, `sectionId`, `locale`, `enabledByDefault`, `urlFormat`, `nestedUrlFormat`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 1, 'en_us', 1, '__home__', NULL, '2015-06-25 14:04:24', '2015-06-25 14:04:24', '3e34d07d-6c89-44ad-b4e4-5d01a906f2ad'),
(2, 2, 'en_us', 0, 'videos/{slug}', NULL, '2015-06-25 14:04:24', '2015-07-09 14:12:16', '8fd6fda8-8a55-4741-a332-e2a802e1de17'),
(3, 3, 'en_us', 0, 'about', NULL, '2015-06-25 14:29:31', '2015-06-25 14:29:31', '48135e2a-15bf-4a8e-a56a-af1176ecee7c'),
(4, 4, 'en_us', 0, 'contact', NULL, '2015-06-25 14:29:40', '2015-06-25 14:29:40', '482c9f29-ba6c-4548-b126-9466e322e99f');

-- --------------------------------------------------------

--
-- Table structure for table `craft_sessions`
--

CREATE TABLE IF NOT EXISTS `craft_sessions` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `token` char(100) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `craft_sessions`
--

INSERT INTO `craft_sessions` (`id`, `userId`, `token`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 1, '42d8db80c7830417d69a1b370eb8e5bde576ae67czozMjoiR0tYc2xib3hyOThkNGNHQXY0STRmZX54Y1I0aHdReHQiOw==', '2015-06-25 14:04:23', '2015-06-25 14:04:23', '7faf4b7a-1796-4cb9-978e-2930c63c338c'),
(2, 1, '35b3a8daca16e9bf2d2e2424bd6283b82c82a0efczozMjoiYXdGUGV4UkVaQzVHMmVwTW5nYWJRd2JSSVZBRmFKekEiOw==', '2015-07-08 23:07:39', '2015-07-08 23:07:39', '5830135c-dd73-4200-94d8-547f02247ee7'),
(3, 1, '6f911ee89c391977856b87f582a6b32dc4594239czozMjoiZ3ZGSGxyOXlBdmhaV2h2YmdMb0JzVnlmOGRZXzRnaG0iOw==', '2015-07-09 13:42:43', '2015-07-09 13:42:43', 'b3e43853-b89f-4419-ac86-ee37b7b6efb0');

-- --------------------------------------------------------

--
-- Table structure for table `craft_shunnedmessages`
--

CREATE TABLE IF NOT EXISTS `craft_shunnedmessages` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `message` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `craft_structureelements`
--

CREATE TABLE IF NOT EXISTS `craft_structureelements` (
  `id` int(11) NOT NULL,
  `structureId` int(11) NOT NULL,
  `elementId` int(11) DEFAULT NULL,
  `root` int(11) unsigned DEFAULT NULL,
  `lft` int(11) unsigned NOT NULL,
  `rgt` int(11) unsigned NOT NULL,
  `level` smallint(6) unsigned NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `craft_structures`
--

CREATE TABLE IF NOT EXISTS `craft_structures` (
  `id` int(11) NOT NULL,
  `maxLevels` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `craft_systemsettings`
--

CREATE TABLE IF NOT EXISTS `craft_systemsettings` (
  `id` int(11) NOT NULL,
  `category` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `settings` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `craft_systemsettings`
--

INSERT INTO `craft_systemsettings` (`id`, `category`, `settings`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 'email', '{"protocol":"php","emailAddress":"paul@paulcarvill.com","senderName":"Vagrant"}', '2015-06-25 14:04:23', '2015-06-25 14:04:23', '657b97ad-4976-42ef-bb09-3c46eccb4e99');

-- --------------------------------------------------------

--
-- Table structure for table `craft_taggroups`
--

CREATE TABLE IF NOT EXISTS `craft_taggroups` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fieldLayoutId` int(10) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `craft_taggroups`
--

INSERT INTO `craft_taggroups` (`id`, `name`, `handle`, `fieldLayoutId`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 'Default', 'default', 1, '2015-06-25 14:04:23', '2015-06-25 14:04:23', '06f47a0c-756e-4089-b080-065d76744df0');

-- --------------------------------------------------------

--
-- Table structure for table `craft_tags`
--

CREATE TABLE IF NOT EXISTS `craft_tags` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `craft_tags`
--

INSERT INTO `craft_tags` (`id`, `groupId`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(7, 1, '2015-06-25 15:11:58', '2015-06-25 15:11:58', '0907e492-d777-40dc-a02d-80ed8e843010'),
(8, 1, '2015-06-25 15:12:05', '2015-06-25 15:12:05', 'a316f37f-5c09-4fa1-b52a-04b1ac495c0b');

-- --------------------------------------------------------

--
-- Table structure for table `craft_tasks`
--

CREATE TABLE IF NOT EXISTS `craft_tasks` (
  `id` int(11) NOT NULL,
  `root` int(11) unsigned DEFAULT NULL,
  `lft` int(11) unsigned NOT NULL,
  `rgt` int(11) unsigned NOT NULL,
  `level` smallint(6) unsigned NOT NULL,
  `currentStep` int(11) unsigned DEFAULT NULL,
  `totalSteps` int(11) unsigned DEFAULT NULL,
  `status` enum('pending','error','running') COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `settings` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `craft_templatecachecriteria`
--

CREATE TABLE IF NOT EXISTS `craft_templatecachecriteria` (
  `id` int(11) NOT NULL,
  `cacheId` int(11) NOT NULL,
  `type` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `criteria` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `craft_templatecacheelements`
--

CREATE TABLE IF NOT EXISTS `craft_templatecacheelements` (
  `cacheId` int(11) NOT NULL,
  `elementId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `craft_templatecaches`
--

CREATE TABLE IF NOT EXISTS `craft_templatecaches` (
  `id` int(11) NOT NULL,
  `cacheKey` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `expiryDate` datetime NOT NULL,
  `body` mediumtext COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `craft_tokens`
--

CREATE TABLE IF NOT EXISTS `craft_tokens` (
  `id` int(11) NOT NULL,
  `token` char(32) COLLATE utf8_unicode_ci NOT NULL,
  `route` text COLLATE utf8_unicode_ci,
  `usageLimit` tinyint(3) unsigned DEFAULT NULL,
  `usageCount` tinyint(3) unsigned DEFAULT NULL,
  `expiryDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `craft_usergroups`
--

CREATE TABLE IF NOT EXISTS `craft_usergroups` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `craft_usergroups_users`
--

CREATE TABLE IF NOT EXISTS `craft_usergroups_users` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `craft_userpermissions`
--

CREATE TABLE IF NOT EXISTS `craft_userpermissions` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `craft_userpermissions_usergroups`
--

CREATE TABLE IF NOT EXISTS `craft_userpermissions_usergroups` (
  `id` int(11) NOT NULL,
  `permissionId` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `craft_userpermissions_users`
--

CREATE TABLE IF NOT EXISTS `craft_userpermissions_users` (
  `id` int(11) NOT NULL,
  `permissionId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `craft_users`
--

CREATE TABLE IF NOT EXISTS `craft_users` (
  `id` int(11) NOT NULL,
  `username` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `photo` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `firstName` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lastName` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `preferredLocale` char(12) COLLATE utf8_unicode_ci DEFAULT NULL,
  `weekStartDay` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `admin` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `client` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `locked` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `suspended` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `pending` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `archived` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `lastLoginDate` datetime DEFAULT NULL,
  `lastLoginAttemptIPAddress` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `invalidLoginWindowStart` datetime DEFAULT NULL,
  `invalidLoginCount` tinyint(4) unsigned DEFAULT NULL,
  `lastInvalidLoginDate` datetime DEFAULT NULL,
  `lockoutDate` datetime DEFAULT NULL,
  `verificationCode` char(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `verificationCodeIssuedDate` datetime DEFAULT NULL,
  `unverifiedEmail` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `passwordResetRequired` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `lastPasswordChangeDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `craft_users`
--

INSERT INTO `craft_users` (`id`, `username`, `photo`, `firstName`, `lastName`, `email`, `password`, `preferredLocale`, `weekStartDay`, `admin`, `client`, `locked`, `suspended`, `pending`, `archived`, `lastLoginDate`, `lastLoginAttemptIPAddress`, `invalidLoginWindowStart`, `invalidLoginCount`, `lastInvalidLoginDate`, `lockoutDate`, `verificationCode`, `verificationCodeIssuedDate`, `unverifiedEmail`, `passwordResetRequired`, `lastPasswordChangeDate`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 'paul', NULL, NULL, NULL, 'paul@paulcarvill.com', '$2y$13$VLihL72jLLy7RoS58bug1OLgK.np4P4AnPLf8MoOnox0CPBMQr6Xy', NULL, 0, 1, 0, 0, 0, 0, 0, '2015-07-09 13:42:43', '10.0.2.2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-06-25 14:04:22', '2015-06-25 14:04:23', '2015-07-09 13:42:43', 'bc517999-2de1-47e5-8baf-6405a9dd666c');

-- --------------------------------------------------------

--
-- Table structure for table `craft_widgets`
--

CREATE TABLE IF NOT EXISTS `craft_widgets` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `type` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `sortOrder` tinyint(4) DEFAULT NULL,
  `settings` text COLLATE utf8_unicode_ci,
  `enabled` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `craft_widgets`
--

INSERT INTO `craft_widgets` (`id`, `userId`, `type`, `sortOrder`, `settings`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 1, 'RecentEntries', 1, NULL, 1, '2015-06-25 14:04:28', '2015-06-25 14:04:28', '7b40e0ec-e51c-4fa2-858a-deffde302418'),
(2, 1, 'GetHelp', 2, NULL, 1, '2015-06-25 14:04:28', '2015-06-25 14:04:28', 'd316110b-159b-42a7-bd65-b5f574ff9fa8'),
(3, 1, 'Updates', 3, NULL, 1, '2015-06-25 14:04:28', '2015-06-25 14:04:28', '93b17bb2-a9c8-442b-808e-ff9760133c81'),
(4, 1, 'Feed', 4, '{"url":"http:\\/\\/feeds.feedburner.com\\/blogandtonic","title":"Blog & Tonic"}', 1, '2015-06-25 14:04:28', '2015-06-25 14:04:28', '36c64597-fb57-4297-b313-f5cb5fee5c97');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `craft_assetfiles`
--
ALTER TABLE `craft_assetfiles`
  ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `craft_assetfiles_filename_folderId_unq_idx` (`filename`,`folderId`), ADD KEY `craft_assetfiles_sourceId_fk` (`sourceId`), ADD KEY `craft_assetfiles_folderId_fk` (`folderId`);

--
-- Indexes for table `craft_assetfolders`
--
ALTER TABLE `craft_assetfolders`
  ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `craft_assetfolders_name_parentId_sourceId_unq_idx` (`name`,`parentId`,`sourceId`), ADD KEY `craft_assetfolders_parentId_fk` (`parentId`), ADD KEY `craft_assetfolders_sourceId_fk` (`sourceId`);

--
-- Indexes for table `craft_assetindexdata`
--
ALTER TABLE `craft_assetindexdata`
  ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `craft_assetindexdata_sessionId_sourceId_offset_unq_idx` (`sessionId`,`sourceId`,`offset`), ADD KEY `craft_assetindexdata_sourceId_fk` (`sourceId`);

--
-- Indexes for table `craft_assetsources`
--
ALTER TABLE `craft_assetsources`
  ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `craft_assetsources_name_unq_idx` (`name`), ADD UNIQUE KEY `craft_assetsources_handle_unq_idx` (`handle`), ADD KEY `craft_assetsources_fieldLayoutId_fk` (`fieldLayoutId`);

--
-- Indexes for table `craft_assettransformindex`
--
ALTER TABLE `craft_assettransformindex`
  ADD PRIMARY KEY (`id`), ADD KEY `craft_assettransformindex_sourceId_fileId_location_idx` (`sourceId`,`fileId`,`location`);

--
-- Indexes for table `craft_assettransforms`
--
ALTER TABLE `craft_assettransforms`
  ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `craft_assettransforms_name_unq_idx` (`name`), ADD UNIQUE KEY `craft_assettransforms_handle_unq_idx` (`handle`);

--
-- Indexes for table `craft_categories`
--
ALTER TABLE `craft_categories`
  ADD PRIMARY KEY (`id`), ADD KEY `craft_categories_groupId_fk` (`groupId`);

--
-- Indexes for table `craft_categorygroups`
--
ALTER TABLE `craft_categorygroups`
  ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `craft_categorygroups_name_unq_idx` (`name`), ADD UNIQUE KEY `craft_categorygroups_handle_unq_idx` (`handle`), ADD KEY `craft_categorygroups_structureId_fk` (`structureId`), ADD KEY `craft_categorygroups_fieldLayoutId_fk` (`fieldLayoutId`);

--
-- Indexes for table `craft_categorygroups_i18n`
--
ALTER TABLE `craft_categorygroups_i18n`
  ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `craft_categorygroups_i18n_groupId_locale_unq_idx` (`groupId`,`locale`), ADD KEY `craft_categorygroups_i18n_locale_fk` (`locale`);

--
-- Indexes for table `craft_content`
--
ALTER TABLE `craft_content`
  ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `craft_content_elementId_locale_unq_idx` (`elementId`,`locale`), ADD KEY `craft_content_title_idx` (`title`), ADD KEY `craft_content_locale_fk` (`locale`);

--
-- Indexes for table `craft_deprecationerrors`
--
ALTER TABLE `craft_deprecationerrors`
  ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `craft_deprecationerrors_key_fingerprint_unq_idx` (`key`,`fingerprint`);

--
-- Indexes for table `craft_elements`
--
ALTER TABLE `craft_elements`
  ADD PRIMARY KEY (`id`), ADD KEY `craft_elements_type_idx` (`type`), ADD KEY `craft_elements_enabled_idx` (`enabled`), ADD KEY `craft_elements_archived_dateCreated_idx` (`archived`,`dateCreated`);

--
-- Indexes for table `craft_elements_i18n`
--
ALTER TABLE `craft_elements_i18n`
  ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `craft_elements_i18n_elementId_locale_unq_idx` (`elementId`,`locale`), ADD UNIQUE KEY `craft_elements_i18n_uri_locale_unq_idx` (`uri`,`locale`), ADD KEY `craft_elements_i18n_slug_locale_idx` (`slug`,`locale`), ADD KEY `craft_elements_i18n_enabled_idx` (`enabled`), ADD KEY `craft_elements_i18n_locale_fk` (`locale`);

--
-- Indexes for table `craft_emailmessages`
--
ALTER TABLE `craft_emailmessages`
  ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `craft_emailmessages_key_locale_unq_idx` (`key`,`locale`), ADD KEY `craft_emailmessages_locale_fk` (`locale`);

--
-- Indexes for table `craft_entries`
--
ALTER TABLE `craft_entries`
  ADD PRIMARY KEY (`id`), ADD KEY `craft_entries_sectionId_idx` (`sectionId`), ADD KEY `craft_entries_typeId_idx` (`typeId`), ADD KEY `craft_entries_postDate_idx` (`postDate`), ADD KEY `craft_entries_expiryDate_idx` (`expiryDate`), ADD KEY `craft_entries_authorId_fk` (`authorId`);

--
-- Indexes for table `craft_entrydrafts`
--
ALTER TABLE `craft_entrydrafts`
  ADD PRIMARY KEY (`id`), ADD KEY `craft_entrydrafts_entryId_locale_idx` (`entryId`,`locale`), ADD KEY `craft_entrydrafts_sectionId_fk` (`sectionId`), ADD KEY `craft_entrydrafts_creatorId_fk` (`creatorId`), ADD KEY `craft_entrydrafts_locale_fk` (`locale`);

--
-- Indexes for table `craft_entrytypes`
--
ALTER TABLE `craft_entrytypes`
  ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `craft_entrytypes_name_sectionId_unq_idx` (`name`,`sectionId`), ADD UNIQUE KEY `craft_entrytypes_handle_sectionId_unq_idx` (`handle`,`sectionId`), ADD KEY `craft_entrytypes_sectionId_fk` (`sectionId`), ADD KEY `craft_entrytypes_fieldLayoutId_fk` (`fieldLayoutId`);

--
-- Indexes for table `craft_entryversions`
--
ALTER TABLE `craft_entryversions`
  ADD PRIMARY KEY (`id`), ADD KEY `craft_entryversions_entryId_locale_idx` (`entryId`,`locale`), ADD KEY `craft_entryversions_sectionId_fk` (`sectionId`), ADD KEY `craft_entryversions_creatorId_fk` (`creatorId`), ADD KEY `craft_entryversions_locale_fk` (`locale`);

--
-- Indexes for table `craft_fieldgroups`
--
ALTER TABLE `craft_fieldgroups`
  ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `craft_fieldgroups_name_unq_idx` (`name`);

--
-- Indexes for table `craft_fieldlayoutfields`
--
ALTER TABLE `craft_fieldlayoutfields`
  ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `craft_fieldlayoutfields_layoutId_fieldId_unq_idx` (`layoutId`,`fieldId`), ADD KEY `craft_fieldlayoutfields_sortOrder_idx` (`sortOrder`), ADD KEY `craft_fieldlayoutfields_tabId_fk` (`tabId`), ADD KEY `craft_fieldlayoutfields_fieldId_fk` (`fieldId`);

--
-- Indexes for table `craft_fieldlayouts`
--
ALTER TABLE `craft_fieldlayouts`
  ADD PRIMARY KEY (`id`), ADD KEY `craft_fieldlayouts_type_idx` (`type`);

--
-- Indexes for table `craft_fieldlayouttabs`
--
ALTER TABLE `craft_fieldlayouttabs`
  ADD PRIMARY KEY (`id`), ADD KEY `craft_fieldlayouttabs_sortOrder_idx` (`sortOrder`), ADD KEY `craft_fieldlayouttabs_layoutId_fk` (`layoutId`);

--
-- Indexes for table `craft_fields`
--
ALTER TABLE `craft_fields`
  ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `craft_fields_handle_context_unq_idx` (`handle`,`context`), ADD KEY `craft_fields_context_idx` (`context`), ADD KEY `craft_fields_groupId_fk` (`groupId`);

--
-- Indexes for table `craft_globalsets`
--
ALTER TABLE `craft_globalsets`
  ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `craft_globalsets_name_unq_idx` (`name`), ADD UNIQUE KEY `craft_globalsets_handle_unq_idx` (`handle`), ADD KEY `craft_globalsets_fieldLayoutId_fk` (`fieldLayoutId`);

--
-- Indexes for table `craft_import_entries`
--
ALTER TABLE `craft_import_entries`
  ADD PRIMARY KEY (`id`), ADD KEY `craft_import_entries_historyId_fk` (`historyId`), ADD KEY `craft_import_entries_entryId_fk` (`entryId`);

--
-- Indexes for table `craft_import_history`
--
ALTER TABLE `craft_import_history`
  ADD PRIMARY KEY (`id`), ADD KEY `craft_import_history_userId_fk` (`userId`);

--
-- Indexes for table `craft_import_log`
--
ALTER TABLE `craft_import_log`
  ADD PRIMARY KEY (`id`), ADD KEY `craft_import_log_historyId_fk` (`historyId`);

--
-- Indexes for table `craft_info`
--
ALTER TABLE `craft_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `craft_locales`
--
ALTER TABLE `craft_locales`
  ADD PRIMARY KEY (`locale`), ADD KEY `craft_locales_sortOrder_idx` (`sortOrder`);

--
-- Indexes for table `craft_matrixblocks`
--
ALTER TABLE `craft_matrixblocks`
  ADD PRIMARY KEY (`id`), ADD KEY `craft_matrixblocks_ownerId_idx` (`ownerId`), ADD KEY `craft_matrixblocks_fieldId_idx` (`fieldId`), ADD KEY `craft_matrixblocks_typeId_idx` (`typeId`), ADD KEY `craft_matrixblocks_sortOrder_idx` (`sortOrder`), ADD KEY `craft_matrixblocks_ownerLocale_fk` (`ownerLocale`);

--
-- Indexes for table `craft_matrixblocktypes`
--
ALTER TABLE `craft_matrixblocktypes`
  ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `craft_matrixblocktypes_name_fieldId_unq_idx` (`name`,`fieldId`), ADD UNIQUE KEY `craft_matrixblocktypes_handle_fieldId_unq_idx` (`handle`,`fieldId`), ADD KEY `craft_matrixblocktypes_fieldId_fk` (`fieldId`), ADD KEY `craft_matrixblocktypes_fieldLayoutId_fk` (`fieldLayoutId`);

--
-- Indexes for table `craft_migrations`
--
ALTER TABLE `craft_migrations`
  ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `craft_migrations_version_unq_idx` (`version`), ADD KEY `craft_migrations_pluginId_fk` (`pluginId`);

--
-- Indexes for table `craft_plugins`
--
ALTER TABLE `craft_plugins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `craft_rackspaceaccess`
--
ALTER TABLE `craft_rackspaceaccess`
  ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `craft_rackspaceaccess_connectionKey_unq_idx` (`connectionKey`);

--
-- Indexes for table `craft_relations`
--
ALTER TABLE `craft_relations`
  ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `craft_relations_fieldId_sourceId_sourceLocale_targetId_unq_idx` (`fieldId`,`sourceId`,`sourceLocale`,`targetId`), ADD KEY `craft_relations_sourceId_fk` (`sourceId`), ADD KEY `craft_relations_sourceLocale_fk` (`sourceLocale`), ADD KEY `craft_relations_targetId_fk` (`targetId`);

--
-- Indexes for table `craft_routes`
--
ALTER TABLE `craft_routes`
  ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `craft_routes_urlPattern_unq_idx` (`urlPattern`), ADD KEY `craft_routes_locale_idx` (`locale`);

--
-- Indexes for table `craft_searchindex`
--
ALTER TABLE `craft_searchindex`
  ADD PRIMARY KEY (`elementId`,`attribute`,`fieldId`,`locale`), ADD FULLTEXT KEY `craft_searchindex_keywords_idx` (`keywords`);

--
-- Indexes for table `craft_sections`
--
ALTER TABLE `craft_sections`
  ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `craft_sections_name_unq_idx` (`name`), ADD UNIQUE KEY `craft_sections_handle_unq_idx` (`handle`), ADD KEY `craft_sections_structureId_fk` (`structureId`);

--
-- Indexes for table `craft_sections_i18n`
--
ALTER TABLE `craft_sections_i18n`
  ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `craft_sections_i18n_sectionId_locale_unq_idx` (`sectionId`,`locale`), ADD KEY `craft_sections_i18n_locale_fk` (`locale`);

--
-- Indexes for table `craft_sessions`
--
ALTER TABLE `craft_sessions`
  ADD PRIMARY KEY (`id`), ADD KEY `craft_sessions_uid_idx` (`uid`), ADD KEY `craft_sessions_token_idx` (`token`), ADD KEY `craft_sessions_dateUpdated_idx` (`dateUpdated`), ADD KEY `craft_sessions_userId_fk` (`userId`);

--
-- Indexes for table `craft_shunnedmessages`
--
ALTER TABLE `craft_shunnedmessages`
  ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `craft_shunnedmessages_userId_message_unq_idx` (`userId`,`message`);

--
-- Indexes for table `craft_structureelements`
--
ALTER TABLE `craft_structureelements`
  ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `craft_structureelements_structureId_elementId_unq_idx` (`structureId`,`elementId`), ADD KEY `craft_structureelements_root_idx` (`root`), ADD KEY `craft_structureelements_lft_idx` (`lft`), ADD KEY `craft_structureelements_rgt_idx` (`rgt`), ADD KEY `craft_structureelements_level_idx` (`level`), ADD KEY `craft_structureelements_elementId_fk` (`elementId`);

--
-- Indexes for table `craft_structures`
--
ALTER TABLE `craft_structures`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `craft_systemsettings`
--
ALTER TABLE `craft_systemsettings`
  ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `craft_systemsettings_category_unq_idx` (`category`);

--
-- Indexes for table `craft_taggroups`
--
ALTER TABLE `craft_taggroups`
  ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `craft_taggroups_name_unq_idx` (`name`), ADD UNIQUE KEY `craft_taggroups_handle_unq_idx` (`handle`), ADD KEY `craft_taggroups_fieldLayoutId_fk` (`fieldLayoutId`);

--
-- Indexes for table `craft_tags`
--
ALTER TABLE `craft_tags`
  ADD PRIMARY KEY (`id`), ADD KEY `craft_tags_groupId_fk` (`groupId`);

--
-- Indexes for table `craft_tasks`
--
ALTER TABLE `craft_tasks`
  ADD PRIMARY KEY (`id`), ADD KEY `craft_tasks_root_idx` (`root`), ADD KEY `craft_tasks_lft_idx` (`lft`), ADD KEY `craft_tasks_rgt_idx` (`rgt`), ADD KEY `craft_tasks_level_idx` (`level`);

--
-- Indexes for table `craft_templatecachecriteria`
--
ALTER TABLE `craft_templatecachecriteria`
  ADD PRIMARY KEY (`id`), ADD KEY `craft_templatecachecriteria_cacheId_fk` (`cacheId`), ADD KEY `craft_templatecachecriteria_type_idx` (`type`);

--
-- Indexes for table `craft_templatecacheelements`
--
ALTER TABLE `craft_templatecacheelements`
  ADD KEY `craft_templatecacheelements_cacheId_fk` (`cacheId`), ADD KEY `craft_templatecacheelements_elementId_fk` (`elementId`);

--
-- Indexes for table `craft_templatecaches`
--
ALTER TABLE `craft_templatecaches`
  ADD PRIMARY KEY (`id`), ADD KEY `craft_templatecaches_expiryDate_cacheKey_locale_path_idx` (`expiryDate`,`cacheKey`,`locale`,`path`), ADD KEY `craft_templatecaches_locale_fk` (`locale`);

--
-- Indexes for table `craft_tokens`
--
ALTER TABLE `craft_tokens`
  ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `craft_tokens_token_unq_idx` (`token`), ADD KEY `craft_tokens_expiryDate_idx` (`expiryDate`);

--
-- Indexes for table `craft_usergroups`
--
ALTER TABLE `craft_usergroups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `craft_usergroups_users`
--
ALTER TABLE `craft_usergroups_users`
  ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `craft_usergroups_users_groupId_userId_unq_idx` (`groupId`,`userId`), ADD KEY `craft_usergroups_users_userId_fk` (`userId`);

--
-- Indexes for table `craft_userpermissions`
--
ALTER TABLE `craft_userpermissions`
  ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `craft_userpermissions_name_unq_idx` (`name`);

--
-- Indexes for table `craft_userpermissions_usergroups`
--
ALTER TABLE `craft_userpermissions_usergroups`
  ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `craft_userpermissions_usergroups_permissionId_groupId_unq_idx` (`permissionId`,`groupId`), ADD KEY `craft_userpermissions_usergroups_groupId_fk` (`groupId`);

--
-- Indexes for table `craft_userpermissions_users`
--
ALTER TABLE `craft_userpermissions_users`
  ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `craft_userpermissions_users_permissionId_userId_unq_idx` (`permissionId`,`userId`), ADD KEY `craft_userpermissions_users_userId_fk` (`userId`);

--
-- Indexes for table `craft_users`
--
ALTER TABLE `craft_users`
  ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `craft_users_username_unq_idx` (`username`), ADD UNIQUE KEY `craft_users_email_unq_idx` (`email`), ADD KEY `craft_users_verificationCode_idx` (`verificationCode`), ADD KEY `craft_users_uid_idx` (`uid`), ADD KEY `craft_users_preferredLocale_fk` (`preferredLocale`);

--
-- Indexes for table `craft_widgets`
--
ALTER TABLE `craft_widgets`
  ADD PRIMARY KEY (`id`), ADD KEY `craft_widgets_userId_fk` (`userId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `craft_assetfolders`
--
ALTER TABLE `craft_assetfolders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `craft_assetindexdata`
--
ALTER TABLE `craft_assetindexdata`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `craft_assetsources`
--
ALTER TABLE `craft_assetsources`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `craft_assettransformindex`
--
ALTER TABLE `craft_assettransformindex`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `craft_assettransforms`
--
ALTER TABLE `craft_assettransforms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `craft_categorygroups`
--
ALTER TABLE `craft_categorygroups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `craft_categorygroups_i18n`
--
ALTER TABLE `craft_categorygroups_i18n`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `craft_content`
--
ALTER TABLE `craft_content`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=371;
--
-- AUTO_INCREMENT for table `craft_deprecationerrors`
--
ALTER TABLE `craft_deprecationerrors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `craft_elements`
--
ALTER TABLE `craft_elements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=371;
--
-- AUTO_INCREMENT for table `craft_elements_i18n`
--
ALTER TABLE `craft_elements_i18n`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=371;
--
-- AUTO_INCREMENT for table `craft_emailmessages`
--
ALTER TABLE `craft_emailmessages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `craft_entrydrafts`
--
ALTER TABLE `craft_entrydrafts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `craft_entrytypes`
--
ALTER TABLE `craft_entrytypes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `craft_entryversions`
--
ALTER TABLE `craft_entryversions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `craft_fieldgroups`
--
ALTER TABLE `craft_fieldgroups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `craft_fieldlayoutfields`
--
ALTER TABLE `craft_fieldlayoutfields`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=42;
--
-- AUTO_INCREMENT for table `craft_fieldlayouts`
--
ALTER TABLE `craft_fieldlayouts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `craft_fieldlayouttabs`
--
ALTER TABLE `craft_fieldlayouttabs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `craft_fields`
--
ALTER TABLE `craft_fields`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `craft_import_entries`
--
ALTER TABLE `craft_import_entries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `craft_import_history`
--
ALTER TABLE `craft_import_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `craft_import_log`
--
ALTER TABLE `craft_import_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `craft_info`
--
ALTER TABLE `craft_info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `craft_matrixblocktypes`
--
ALTER TABLE `craft_matrixblocktypes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `craft_migrations`
--
ALTER TABLE `craft_migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT for table `craft_plugins`
--
ALTER TABLE `craft_plugins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `craft_rackspaceaccess`
--
ALTER TABLE `craft_rackspaceaccess`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `craft_relations`
--
ALTER TABLE `craft_relations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT for table `craft_routes`
--
ALTER TABLE `craft_routes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `craft_sections`
--
ALTER TABLE `craft_sections`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `craft_sections_i18n`
--
ALTER TABLE `craft_sections_i18n`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `craft_sessions`
--
ALTER TABLE `craft_sessions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `craft_shunnedmessages`
--
ALTER TABLE `craft_shunnedmessages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `craft_structureelements`
--
ALTER TABLE `craft_structureelements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `craft_structures`
--
ALTER TABLE `craft_structures`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `craft_systemsettings`
--
ALTER TABLE `craft_systemsettings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `craft_taggroups`
--
ALTER TABLE `craft_taggroups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `craft_tasks`
--
ALTER TABLE `craft_tasks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT for table `craft_templatecachecriteria`
--
ALTER TABLE `craft_templatecachecriteria`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `craft_templatecaches`
--
ALTER TABLE `craft_templatecaches`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `craft_tokens`
--
ALTER TABLE `craft_tokens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `craft_usergroups`
--
ALTER TABLE `craft_usergroups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `craft_usergroups_users`
--
ALTER TABLE `craft_usergroups_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `craft_userpermissions`
--
ALTER TABLE `craft_userpermissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `craft_userpermissions_usergroups`
--
ALTER TABLE `craft_userpermissions_usergroups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `craft_userpermissions_users`
--
ALTER TABLE `craft_userpermissions_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `craft_widgets`
--
ALTER TABLE `craft_widgets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `craft_assetfiles`
--
ALTER TABLE `craft_assetfiles`
ADD CONSTRAINT `craft_assetfiles_folderId_fk` FOREIGN KEY (`folderId`) REFERENCES `craft_assetfolders` (`id`) ON DELETE CASCADE,
ADD CONSTRAINT `craft_assetfiles_id_fk` FOREIGN KEY (`id`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
ADD CONSTRAINT `craft_assetfiles_sourceId_fk` FOREIGN KEY (`sourceId`) REFERENCES `craft_assetsources` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `craft_assetfolders`
--
ALTER TABLE `craft_assetfolders`
ADD CONSTRAINT `craft_assetfolders_sourceId_fk` FOREIGN KEY (`sourceId`) REFERENCES `craft_assetsources` (`id`) ON DELETE CASCADE,
ADD CONSTRAINT `craft_assetfolders_parentId_fk` FOREIGN KEY (`parentId`) REFERENCES `craft_assetfolders` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `craft_assetindexdata`
--
ALTER TABLE `craft_assetindexdata`
ADD CONSTRAINT `craft_assetindexdata_sourceId_fk` FOREIGN KEY (`sourceId`) REFERENCES `craft_assetsources` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `craft_assetsources`
--
ALTER TABLE `craft_assetsources`
ADD CONSTRAINT `craft_assetsources_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `craft_fieldlayouts` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `craft_categories`
--
ALTER TABLE `craft_categories`
ADD CONSTRAINT `craft_categories_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `craft_categorygroups` (`id`) ON DELETE CASCADE,
ADD CONSTRAINT `craft_categories_id_fk` FOREIGN KEY (`id`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `craft_categorygroups`
--
ALTER TABLE `craft_categorygroups`
ADD CONSTRAINT `craft_categorygroups_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `craft_fieldlayouts` (`id`) ON DELETE SET NULL,
ADD CONSTRAINT `craft_categorygroups_structureId_fk` FOREIGN KEY (`structureId`) REFERENCES `craft_structures` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `craft_categorygroups_i18n`
--
ALTER TABLE `craft_categorygroups_i18n`
ADD CONSTRAINT `craft_categorygroups_i18n_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `craft_categorygroups_i18n_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `craft_categorygroups` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `craft_content`
--
ALTER TABLE `craft_content`
ADD CONSTRAINT `craft_content_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
ADD CONSTRAINT `craft_content_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `craft_elements_i18n`
--
ALTER TABLE `craft_elements_i18n`
ADD CONSTRAINT `craft_elements_i18n_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `craft_elements_i18n_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `craft_emailmessages`
--
ALTER TABLE `craft_emailmessages`
ADD CONSTRAINT `craft_emailmessages_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `craft_entries`
--
ALTER TABLE `craft_entries`
ADD CONSTRAINT `craft_entries_authorId_fk` FOREIGN KEY (`authorId`) REFERENCES `craft_users` (`id`) ON DELETE CASCADE,
ADD CONSTRAINT `craft_entries_id_fk` FOREIGN KEY (`id`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
ADD CONSTRAINT `craft_entries_sectionId_fk` FOREIGN KEY (`sectionId`) REFERENCES `craft_sections` (`id`) ON DELETE CASCADE,
ADD CONSTRAINT `craft_entries_typeId_fk` FOREIGN KEY (`typeId`) REFERENCES `craft_entrytypes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `craft_entrydrafts`
--
ALTER TABLE `craft_entrydrafts`
ADD CONSTRAINT `craft_entrydrafts_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `craft_entrydrafts_creatorId_fk` FOREIGN KEY (`creatorId`) REFERENCES `craft_users` (`id`) ON DELETE CASCADE,
ADD CONSTRAINT `craft_entrydrafts_entryId_fk` FOREIGN KEY (`entryId`) REFERENCES `craft_entries` (`id`) ON DELETE CASCADE,
ADD CONSTRAINT `craft_entrydrafts_sectionId_fk` FOREIGN KEY (`sectionId`) REFERENCES `craft_sections` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `craft_entrytypes`
--
ALTER TABLE `craft_entrytypes`
ADD CONSTRAINT `craft_entrytypes_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `craft_fieldlayouts` (`id`) ON DELETE SET NULL,
ADD CONSTRAINT `craft_entrytypes_sectionId_fk` FOREIGN KEY (`sectionId`) REFERENCES `craft_sections` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `craft_entryversions`
--
ALTER TABLE `craft_entryversions`
ADD CONSTRAINT `craft_entryversions_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `craft_entryversions_creatorId_fk` FOREIGN KEY (`creatorId`) REFERENCES `craft_users` (`id`) ON DELETE SET NULL,
ADD CONSTRAINT `craft_entryversions_entryId_fk` FOREIGN KEY (`entryId`) REFERENCES `craft_entries` (`id`) ON DELETE CASCADE,
ADD CONSTRAINT `craft_entryversions_sectionId_fk` FOREIGN KEY (`sectionId`) REFERENCES `craft_sections` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `craft_fieldlayoutfields`
--
ALTER TABLE `craft_fieldlayoutfields`
ADD CONSTRAINT `craft_fieldlayoutfields_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `craft_fields` (`id`) ON DELETE CASCADE,
ADD CONSTRAINT `craft_fieldlayoutfields_layoutId_fk` FOREIGN KEY (`layoutId`) REFERENCES `craft_fieldlayouts` (`id`) ON DELETE CASCADE,
ADD CONSTRAINT `craft_fieldlayoutfields_tabId_fk` FOREIGN KEY (`tabId`) REFERENCES `craft_fieldlayouttabs` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `craft_fieldlayouttabs`
--
ALTER TABLE `craft_fieldlayouttabs`
ADD CONSTRAINT `craft_fieldlayouttabs_layoutId_fk` FOREIGN KEY (`layoutId`) REFERENCES `craft_fieldlayouts` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `craft_fields`
--
ALTER TABLE `craft_fields`
ADD CONSTRAINT `craft_fields_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `craft_fieldgroups` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `craft_globalsets`
--
ALTER TABLE `craft_globalsets`
ADD CONSTRAINT `craft_globalsets_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `craft_fieldlayouts` (`id`) ON DELETE SET NULL,
ADD CONSTRAINT `craft_globalsets_id_fk` FOREIGN KEY (`id`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `craft_import_entries`
--
ALTER TABLE `craft_import_entries`
ADD CONSTRAINT `craft_import_entries_entryId_fk` FOREIGN KEY (`entryId`) REFERENCES `craft_entries` (`id`) ON DELETE CASCADE,
ADD CONSTRAINT `craft_import_entries_historyId_fk` FOREIGN KEY (`historyId`) REFERENCES `craft_import_history` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `craft_import_history`
--
ALTER TABLE `craft_import_history`
ADD CONSTRAINT `craft_import_history_userId_fk` FOREIGN KEY (`userId`) REFERENCES `craft_users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `craft_import_log`
--
ALTER TABLE `craft_import_log`
ADD CONSTRAINT `craft_import_log_historyId_fk` FOREIGN KEY (`historyId`) REFERENCES `craft_import_history` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `craft_matrixblocks`
--
ALTER TABLE `craft_matrixblocks`
ADD CONSTRAINT `craft_matrixblocks_typeId_fk` FOREIGN KEY (`typeId`) REFERENCES `craft_matrixblocktypes` (`id`) ON DELETE CASCADE,
ADD CONSTRAINT `craft_matrixblocks_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `craft_fields` (`id`) ON DELETE CASCADE,
ADD CONSTRAINT `craft_matrixblocks_id_fk` FOREIGN KEY (`id`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
ADD CONSTRAINT `craft_matrixblocks_ownerId_fk` FOREIGN KEY (`ownerId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
ADD CONSTRAINT `craft_matrixblocks_ownerLocale_fk` FOREIGN KEY (`ownerLocale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `craft_matrixblocktypes`
--
ALTER TABLE `craft_matrixblocktypes`
ADD CONSTRAINT `craft_matrixblocktypes_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `craft_fieldlayouts` (`id`) ON DELETE SET NULL,
ADD CONSTRAINT `craft_matrixblocktypes_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `craft_fields` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `craft_migrations`
--
ALTER TABLE `craft_migrations`
ADD CONSTRAINT `craft_migrations_pluginId_fk` FOREIGN KEY (`pluginId`) REFERENCES `craft_plugins` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `craft_relations`
--
ALTER TABLE `craft_relations`
ADD CONSTRAINT `craft_relations_targetId_fk` FOREIGN KEY (`targetId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
ADD CONSTRAINT `craft_relations_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `craft_fields` (`id`) ON DELETE CASCADE,
ADD CONSTRAINT `craft_relations_sourceId_fk` FOREIGN KEY (`sourceId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
ADD CONSTRAINT `craft_relations_sourceLocale_fk` FOREIGN KEY (`sourceLocale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `craft_routes`
--
ALTER TABLE `craft_routes`
ADD CONSTRAINT `craft_routes_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `craft_sections`
--
ALTER TABLE `craft_sections`
ADD CONSTRAINT `craft_sections_structureId_fk` FOREIGN KEY (`structureId`) REFERENCES `craft_structures` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `craft_sections_i18n`
--
ALTER TABLE `craft_sections_i18n`
ADD CONSTRAINT `craft_sections_i18n_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `craft_sections_i18n_sectionId_fk` FOREIGN KEY (`sectionId`) REFERENCES `craft_sections` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `craft_sessions`
--
ALTER TABLE `craft_sessions`
ADD CONSTRAINT `craft_sessions_userId_fk` FOREIGN KEY (`userId`) REFERENCES `craft_users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `craft_shunnedmessages`
--
ALTER TABLE `craft_shunnedmessages`
ADD CONSTRAINT `craft_shunnedmessages_userId_fk` FOREIGN KEY (`userId`) REFERENCES `craft_users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `craft_structureelements`
--
ALTER TABLE `craft_structureelements`
ADD CONSTRAINT `craft_structureelements_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
ADD CONSTRAINT `craft_structureelements_structureId_fk` FOREIGN KEY (`structureId`) REFERENCES `craft_structures` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `craft_taggroups`
--
ALTER TABLE `craft_taggroups`
ADD CONSTRAINT `craft_taggroups_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `craft_fieldlayouts` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `craft_tags`
--
ALTER TABLE `craft_tags`
ADD CONSTRAINT `craft_tags_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `craft_taggroups` (`id`) ON DELETE CASCADE,
ADD CONSTRAINT `craft_tags_id_fk` FOREIGN KEY (`id`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `craft_templatecachecriteria`
--
ALTER TABLE `craft_templatecachecriteria`
ADD CONSTRAINT `craft_templatecachecriteria_cacheId_fk` FOREIGN KEY (`cacheId`) REFERENCES `craft_templatecaches` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `craft_templatecacheelements`
--
ALTER TABLE `craft_templatecacheelements`
ADD CONSTRAINT `craft_templatecacheelements_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
ADD CONSTRAINT `craft_templatecacheelements_cacheId_fk` FOREIGN KEY (`cacheId`) REFERENCES `craft_templatecaches` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `craft_templatecaches`
--
ALTER TABLE `craft_templatecaches`
ADD CONSTRAINT `craft_templatecaches_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `craft_usergroups_users`
--
ALTER TABLE `craft_usergroups_users`
ADD CONSTRAINT `craft_usergroups_users_userId_fk` FOREIGN KEY (`userId`) REFERENCES `craft_users` (`id`) ON DELETE CASCADE,
ADD CONSTRAINT `craft_usergroups_users_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `craft_usergroups` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `craft_userpermissions_usergroups`
--
ALTER TABLE `craft_userpermissions_usergroups`
ADD CONSTRAINT `craft_userpermissions_usergroups_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `craft_usergroups` (`id`) ON DELETE CASCADE,
ADD CONSTRAINT `craft_userpermissions_usergroups_permissionId_fk` FOREIGN KEY (`permissionId`) REFERENCES `craft_userpermissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `craft_userpermissions_users`
--
ALTER TABLE `craft_userpermissions_users`
ADD CONSTRAINT `craft_userpermissions_users_userId_fk` FOREIGN KEY (`userId`) REFERENCES `craft_users` (`id`) ON DELETE CASCADE,
ADD CONSTRAINT `craft_userpermissions_users_permissionId_fk` FOREIGN KEY (`permissionId`) REFERENCES `craft_userpermissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `craft_users`
--
ALTER TABLE `craft_users`
ADD CONSTRAINT `craft_users_preferredLocale_fk` FOREIGN KEY (`preferredLocale`) REFERENCES `craft_locales` (`locale`) ON DELETE SET NULL ON UPDATE CASCADE,
ADD CONSTRAINT `craft_users_id_fk` FOREIGN KEY (`id`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `craft_widgets`
--
ALTER TABLE `craft_widgets`
ADD CONSTRAINT `craft_widgets_userId_fk` FOREIGN KEY (`userId`) REFERENCES `craft_users` (`id`) ON DELETE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
