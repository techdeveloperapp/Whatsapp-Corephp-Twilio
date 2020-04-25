-- phpMyAdmin SQL Dump
-- version 4.9.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Apr 25, 2020 at 08:41 PM
-- Server version: 10.3.22-MariaDB
-- PHP Version: 7.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `easifixco_test_shubham`
--

-- --------------------------------------------------------

--
-- Table structure for table `chat`
--

CREATE TABLE `chat` (
  `id` int(11) NOT NULL,
  `sender_id` varchar(50) NOT NULL,
  `receiver_id` varchar(50) NOT NULL,
  `message` text NOT NULL,
  `status` enum('receive','send') NOT NULL,
  `response_json` longtext NOT NULL,
  `lead_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `bunch_id` int(11) NOT NULL,
  `api_status` enum('1','2','3','4') NOT NULL DEFAULT '1' COMMENT '1->pending,2->delivered,3->read,4->fail',
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `chat`
--

INSERT INTO `chat` (`id`, `sender_id`, `receiver_id`, `message`, `status`, `response_json`, `lead_id`, `user_id`, `bunch_id`, `api_status`, `created_at`, `updated_at`) VALUES
(5, '+14155238886', '+918318080107', 'hi\n', 'send', '\"SM721d4b77ae8a48cfad73d5b43886d00d\"', 1, 1, 0, '1', '2020-04-24 18:32:17', '2020-04-24 18:32:17'),
(6, '+14155238886', '+918318080107', 'hello okay\n', 'receive', '\"SM226c214e4cf34493a96ded768411c77a\"', 1, 1, 0, '1', '2020-04-24 18:53:53', '2020-04-24 19:01:50'),
(7, '+14155238886', '+919875444120', 'hi\n', 'send', '\"SM6d85074183354961931c4f236fdad105\"', 2, 1, 0, '1', '2020-04-24 19:05:15', '2020-04-24 19:05:15'),
(8, '+14155238886', '+918318080107', 'ghg\n', 'send', '\"SM646530bb44114531b04293e4e00a2b9d\"', 1, 1, 0, '1', '2020-04-24 19:11:47', '2020-04-24 19:11:47'),
(9, '+14155238886', '+918318080107', 'test\n', 'send', '\"SMdc9b46311ec6463b8e54f822a943b176\"', 1, 1, 0, '1', '2020-04-24 15:52:12', '2020-04-24 15:52:12'),
(10, '+14155238886', '+919875444120', 'Hello\n', 'send', '\"SM072707119dcf4f1b87d93cc65fc4f1df\"', 2, 1, 0, '1', '2020-04-24 17:41:11', '2020-04-24 17:41:11'),
(11, '+14155238886', '+919875444120', 'Hello\n', 'send', '\"SMa8d0ec2b7f584d3fb4d79ba80fdec4b4\"', 2, 1, 0, '1', '2020-04-24 17:44:31', '2020-04-24 17:44:31'),
(14, '+918318080107', '+14155238886', 'Opps', 'receive', '{\"SmsMessageSid\":\"SMf7994df4d26ba3b0d2b69108eea0c168\",\"NumMedia\":\"0\",\"SmsSid\":\"SMf7994df4d26ba3b0d2b69108eea0c168\",\"SmsStatus\":\"received\",\"Body\":\"Opps\",\"To\":\"whatsapp:+14155238886\",\"NumSegments\":\"1\",\"MessageSid\":\"SMf7994df4d26ba3b0d2b69108eea0c168\",\"AccountSid\":\"ACcccfe6ce8d9b9e8ec0ed9e42284bc92f\",\"From\":\"whatsapp:+918318080107\",\"ApiVersion\":\"2010-04-01\"}', 1, 1, 0, '1', '2020-04-24 18:09:09', '2020-04-24 18:09:09'),
(15, '+14155238886', '+919875444120', 'hi\n', 'send', '\"SMe08e6e918a274a7a80a33ef3d676c64e\"', 2, 2, 0, '1', '2020-04-24 18:22:21', '2020-04-24 18:22:21'),
(16, '+14155238886', '+918318080107', 'jai mata di :)\n', 'send', '\"SM0dafc722e87644288147888826d32855\"', 1, 1, 0, '1', '2020-04-24 18:23:25', '2020-04-24 18:23:25'),
(17, '+918318080107', '+14155238886', 'Okay', 'receive', '{\"SmsMessageSid\":\"SM2861966e1c323c921203a7f36a911f7c\",\"NumMedia\":\"0\",\"SmsSid\":\"SM2861966e1c323c921203a7f36a911f7c\",\"SmsStatus\":\"received\",\"Body\":\"Okay\",\"To\":\"whatsapp:+14155238886\",\"NumSegments\":\"1\",\"MessageSid\":\"SM2861966e1c323c921203a7f36a911f7c\",\"AccountSid\":\"ACcccfe6ce8d9b9e8ec0ed9e42284bc92f\",\"From\":\"whatsapp:+918318080107\",\"ApiVersion\":\"2010-04-01\"}', 1, 1, 0, '1', '2020-04-24 18:23:37', '2020-04-24 18:23:37'),
(18, '+919875444120', '+14155238886', 'Hiii', 'receive', '{\"SmsMessageSid\":\"SMff7ae10acfba937db5db43933e479ad6\",\"NumMedia\":\"0\",\"SmsSid\":\"SMff7ae10acfba937db5db43933e479ad6\",\"SmsStatus\":\"received\",\"Body\":\"Hiii\",\"To\":\"whatsapp:+14155238886\",\"NumSegments\":\"1\",\"MessageSid\":\"SMff7ae10acfba937db5db43933e479ad6\",\"AccountSid\":\"ACcccfe6ce8d9b9e8ec0ed9e42284bc92f\",\"From\":\"whatsapp:+919875444120\",\"ApiVersion\":\"2010-04-01\"}', 2, 2, 0, '1', '2020-04-24 18:25:06', '2020-04-24 18:25:06'),
(19, '+14155238886', '+918318080107', 'How are you?\n', 'send', '\"SM15c56b424b594926bf28999efd1fa693\"', 1, 1, 0, '1', '2020-04-24 18:25:28', '2020-04-24 18:25:28'),
(20, '+918318080107', '+14155238886', 'I am fine', 'receive', '{\"SmsMessageSid\":\"SM87b06a48e2a7fbad4eb9f79b339a3df5\",\"NumMedia\":\"0\",\"SmsSid\":\"SM87b06a48e2a7fbad4eb9f79b339a3df5\",\"SmsStatus\":\"received\",\"Body\":\"I am fine\",\"To\":\"whatsapp:+14155238886\",\"NumSegments\":\"1\",\"MessageSid\":\"SM87b06a48e2a7fbad4eb9f79b339a3df5\",\"AccountSid\":\"ACcccfe6ce8d9b9e8ec0ed9e42284bc92f\",\"From\":\"whatsapp:+918318080107\",\"ApiVersion\":\"2010-04-01\"}', 1, 1, 0, '1', '2020-04-24 18:25:38', '2020-04-24 18:25:38'),
(21, '+14155238886', '+918318080107', 'okay\n', 'send', '\"SM386a9264c8d74b849b545dd1e47b4251\"', 1, 1, 0, '1', '2020-04-24 18:25:59', '2020-04-24 18:25:59'),
(22, '+14155238886', '+919875444120', 'Hello Harish ji\n', 'send', '\"SMc891403a825049c6a82e1e0cb2ebd185\"', 2, 1, 0, '1', '2020-04-24 18:26:49', '2020-04-24 18:26:49'),
(23, '+919875444120', '+14155238886', 'Hi Shubham', 'receive', '{\"SmsMessageSid\":\"SM658c57de2a7c51a48f68345b2ce71978\",\"NumMedia\":\"0\",\"SmsSid\":\"SM658c57de2a7c51a48f68345b2ce71978\",\"SmsStatus\":\"received\",\"Body\":\"Hi Shubham\",\"To\":\"whatsapp:+14155238886\",\"NumSegments\":\"1\",\"MessageSid\":\"SM658c57de2a7c51a48f68345b2ce71978\",\"AccountSid\":\"ACcccfe6ce8d9b9e8ec0ed9e42284bc92f\",\"From\":\"whatsapp:+919875444120\",\"ApiVersion\":\"2010-04-01\"}', 2, 1, 0, '1', '2020-04-24 18:27:01', '2020-04-24 18:27:01'),
(24, '+14155238886', '+919875444120', 'hi\n', 'send', '\"SM9e1bbc07daa24811b5eb55f4a274b966\"', 2, 1, 0, '1', '2020-04-24 21:36:21', '2020-04-24 21:36:21'),
(25, '+919875444120', '+14155238886', 'Hello', 'receive', '{\"SmsMessageSid\":\"SMfd0077355e247cd541f15654ca7b17b6\",\"NumMedia\":\"0\",\"SmsSid\":\"SMfd0077355e247cd541f15654ca7b17b6\",\"SmsStatus\":\"received\",\"Body\":\"Hello\",\"To\":\"whatsapp:+14155238886\",\"NumSegments\":\"1\",\"MessageSid\":\"SMfd0077355e247cd541f15654ca7b17b6\",\"AccountSid\":\"ACcccfe6ce8d9b9e8ec0ed9e42284bc92f\",\"From\":\"whatsapp:+919875444120\",\"ApiVersion\":\"2010-04-01\"}', 2, 1, 0, '1', '2020-04-24 21:37:00', '2020-04-24 21:37:00'),
(26, '+919875444120', '+14155238886', 'Hi h h h', 'receive', '{\"SmsMessageSid\":\"SM840d19fa75b29835637583806a865934\",\"NumMedia\":\"0\",\"SmsSid\":\"SM840d19fa75b29835637583806a865934\",\"SmsStatus\":\"received\",\"Body\":\"Hi h h h\",\"To\":\"whatsapp:+14155238886\",\"NumSegments\":\"1\",\"MessageSid\":\"SM840d19fa75b29835637583806a865934\",\"AccountSid\":\"ACcccfe6ce8d9b9e8ec0ed9e42284bc92f\",\"From\":\"whatsapp:+919875444120\",\"ApiVersion\":\"2010-04-01\"}', 2, 1, 0, '1', '2020-04-24 21:37:21', '2020-04-24 21:37:21'),
(27, '+919875444120', '+14155238886', 'Gegrg', 'receive', '{\"SmsMessageSid\":\"SMd02d054f7c14a827632496f353f0eb4a\",\"NumMedia\":\"0\",\"SmsSid\":\"SMd02d054f7c14a827632496f353f0eb4a\",\"SmsStatus\":\"received\",\"Body\":\"Gegrg\",\"To\":\"whatsapp:+14155238886\",\"NumSegments\":\"1\",\"MessageSid\":\"SMd02d054f7c14a827632496f353f0eb4a\",\"AccountSid\":\"ACcccfe6ce8d9b9e8ec0ed9e42284bc92f\",\"From\":\"whatsapp:+919875444120\",\"ApiVersion\":\"2010-04-01\"}', 2, 1, 0, '1', '2020-04-24 21:37:26', '2020-04-24 21:37:26'),
(28, '+919875444120', '+14155238886', 'Hrhrgr', 'receive', '{\"SmsMessageSid\":\"SM92897615914e54fbe00bfab1578809c6\",\"NumMedia\":\"0\",\"SmsSid\":\"SM92897615914e54fbe00bfab1578809c6\",\"SmsStatus\":\"received\",\"Body\":\"Hrhrgr\",\"To\":\"whatsapp:+14155238886\",\"NumSegments\":\"1\",\"MessageSid\":\"SM92897615914e54fbe00bfab1578809c6\",\"AccountSid\":\"ACcccfe6ce8d9b9e8ec0ed9e42284bc92f\",\"From\":\"whatsapp:+919875444120\",\"ApiVersion\":\"2010-04-01\"}', 2, 1, 0, '1', '2020-04-24 21:37:38', '2020-04-24 21:37:38'),
(29, '+919875444120', '+14155238886', 'Hrhrhrh', 'receive', '{\"SmsMessageSid\":\"SM597740aec589db3b0300d5f23c48e2ec\",\"NumMedia\":\"0\",\"SmsSid\":\"SM597740aec589db3b0300d5f23c48e2ec\",\"SmsStatus\":\"received\",\"Body\":\"Hrhrhrh\",\"To\":\"whatsapp:+14155238886\",\"NumSegments\":\"1\",\"MessageSid\":\"SM597740aec589db3b0300d5f23c48e2ec\",\"AccountSid\":\"ACcccfe6ce8d9b9e8ec0ed9e42284bc92f\",\"From\":\"whatsapp:+919875444120\",\"ApiVersion\":\"2010-04-01\"}', 2, 1, 0, '1', '2020-04-24 21:37:51', '2020-04-24 21:37:51'),
(30, '+919875444120', '+14155238886', 'Hrjhrhjrj', 'receive', '{\"SmsMessageSid\":\"SM0d0ec84456582105652801981f4ef1e0\",\"NumMedia\":\"0\",\"SmsSid\":\"SM0d0ec84456582105652801981f4ef1e0\",\"SmsStatus\":\"received\",\"Body\":\"Hrjhrhjrj\",\"To\":\"whatsapp:+14155238886\",\"NumSegments\":\"1\",\"MessageSid\":\"SM0d0ec84456582105652801981f4ef1e0\",\"AccountSid\":\"ACcccfe6ce8d9b9e8ec0ed9e42284bc92f\",\"From\":\"whatsapp:+919875444120\",\"ApiVersion\":\"2010-04-01\"}', 2, 1, 0, '1', '2020-04-24 21:39:23', '2020-04-24 21:39:23'),
(31, '+919875444120', '+14155238886', 'ðŸ‘', 'receive', '{\"SmsMessageSid\":\"SM041e59285f5983b135fd32511776d63a\",\"NumMedia\":\"0\",\"SmsSid\":\"SM041e59285f5983b135fd32511776d63a\",\"SmsStatus\":\"received\",\"Body\":\"ud83dudc4d\",\"To\":\"whatsapp:+14155238886\",\"NumSegments\":\"1\",\"MessageSid\":\"SM041e59285f5983b135fd32511776d63a\",\"AccountSid\":\"ACcccfe6ce8d9b9e8ec0ed9e42284bc92f\",\"From\":\"whatsapp:+919875444120\",\"ApiVersion\":\"2010-04-01\"}', 2, 1, 0, '1', '2020-04-24 21:39:38', '2020-04-24 21:39:38'),
(32, '+919875444120', '+14155238886', 'ðŸ’¹', 'receive', '{\"SmsMessageSid\":\"SM084b6fcad1404388e8897ac57d5ad96d\",\"NumMedia\":\"0\",\"SmsSid\":\"SM084b6fcad1404388e8897ac57d5ad96d\",\"SmsStatus\":\"received\",\"Body\":\"ud83dudcb9\",\"To\":\"whatsapp:+14155238886\",\"NumSegments\":\"1\",\"MessageSid\":\"SM084b6fcad1404388e8897ac57d5ad96d\",\"AccountSid\":\"ACcccfe6ce8d9b9e8ec0ed9e42284bc92f\",\"From\":\"whatsapp:+919875444120\",\"ApiVersion\":\"2010-04-01\"}', 2, 1, 0, '1', '2020-04-24 21:40:01', '2020-04-24 21:40:01'),
(33, '+918318080107', '+14155238886', 'ðŸ˜‹', 'receive', '{\"SmsMessageSid\":\"SM783c818d8391158facd3c835d20aac9a\",\"NumMedia\":\"0\",\"SmsSid\":\"SM783c818d8391158facd3c835d20aac9a\",\"SmsStatus\":\"received\",\"Body\":\"ud83dude0b\",\"To\":\"whatsapp:+14155238886\",\"NumSegments\":\"1\",\"MessageSid\":\"SM783c818d8391158facd3c835d20aac9a\",\"AccountSid\":\"ACcccfe6ce8d9b9e8ec0ed9e42284bc92f\",\"From\":\"whatsapp:+918318080107\",\"ApiVersion\":\"2010-04-01\"}', 1, 1, 0, '1', '2020-04-25 10:21:22', '2020-04-25 10:21:22'),
(34, '+14155238886', '+917888586276', 'hi\n', 'send', '\"SMd9e18404294e48ac869136b8a0d43788\"', 3, 1, 0, '1', '2020-04-25 10:34:04', '2020-04-25 10:34:04'),
(35, '+14155238886', '+919875444120', 'hello\n', 'send', '\"SMde62e35ab2d2447f852229780c60f7fb\"', 2, 1, 0, '1', '2020-04-25 10:37:00', '2020-04-25 10:37:00'),
(36, '+919875444120', '+14155238886', 'Hii', 'receive', '{\"SmsMessageSid\":\"SM09e60b3e29cfab65a4fda00d68081e83\",\"NumMedia\":\"0\",\"SmsSid\":\"SM09e60b3e29cfab65a4fda00d68081e83\",\"SmsStatus\":\"received\",\"Body\":\"Hii\",\"To\":\"whatsapp:+14155238886\",\"NumSegments\":\"1\",\"MessageSid\":\"SM09e60b3e29cfab65a4fda00d68081e83\",\"AccountSid\":\"ACcccfe6ce8d9b9e8ec0ed9e42284bc92f\",\"From\":\"whatsapp:+919875444120\",\"ApiVersion\":\"2010-04-01\"}', 2, 1, 0, '1', '2020-04-25 10:37:08', '2020-04-25 10:37:08'),
(37, '+919875444120', '+14155238886', 'How are you Shubham', 'receive', '{\"SmsMessageSid\":\"SMa4ffaa7e2acd1d68833fef4776568a4c\",\"NumMedia\":\"0\",\"SmsSid\":\"SMa4ffaa7e2acd1d68833fef4776568a4c\",\"SmsStatus\":\"received\",\"Body\":\"How are you Shubham\",\"To\":\"whatsapp:+14155238886\",\"NumSegments\":\"1\",\"MessageSid\":\"SMa4ffaa7e2acd1d68833fef4776568a4c\",\"AccountSid\":\"ACcccfe6ce8d9b9e8ec0ed9e42284bc92f\",\"From\":\"whatsapp:+919875444120\",\"ApiVersion\":\"2010-04-01\"}', 2, 1, 0, '1', '2020-04-25 10:37:24', '2020-04-25 10:37:24'),
(38, '+14155238886', '+919875444120', 'am fine!\n', 'send', '\"SM7d1a9af092834df7994f84e9da29e43a\"', 2, 1, 0, '1', '2020-04-25 10:37:49', '2020-04-25 10:37:49'),
(39, '+14155238886', '+917888586276', 'hello sir\n', 'send', '\"SM9c6fad65352244df89df568f94d43881\"', 3, 1, 0, '1', '2020-04-25 10:38:06', '2020-04-25 10:38:06'),
(40, '+14155238886', '+917888586276', 'hello\n', 'send', '\"SM2accf9c17e52455caab143bb35d1987a\"', 3, 1, 0, '1', '2020-04-25 10:40:29', '2020-04-25 10:40:29'),
(41, '+917888586276', '+14155238886', 'Testing', 'receive', '{\"SmsMessageSid\":\"SM7571841bf84bdf5e5fcda6e1e21a57ef\",\"NumMedia\":\"0\",\"SmsSid\":\"SM7571841bf84bdf5e5fcda6e1e21a57ef\",\"SmsStatus\":\"received\",\"Body\":\"Testing\",\"To\":\"whatsapp:+14155238886\",\"NumSegments\":\"1\",\"MessageSid\":\"SM7571841bf84bdf5e5fcda6e1e21a57ef\",\"AccountSid\":\"ACcccfe6ce8d9b9e8ec0ed9e42284bc92f\",\"From\":\"whatsapp:+917888586276\",\"ApiVersion\":\"2010-04-01\"}', 3, 1, 0, '1', '2020-04-25 10:42:01', '2020-04-25 10:42:01'),
(42, '+14155238886', '+917888586276', 'thx\n', 'send', '\"SMf9f1968d02964234b8e8f78782199a70\"', 3, 1, 0, '1', '2020-04-25 10:42:31', '2020-04-25 10:42:31'),
(43, '+917888586276', '+14155238886', 'Good', 'receive', '{\"SmsMessageSid\":\"SM722de63a474b29a458c5add57ae0269b\",\"NumMedia\":\"0\",\"SmsSid\":\"SM722de63a474b29a458c5add57ae0269b\",\"SmsStatus\":\"received\",\"Body\":\"Good\",\"To\":\"whatsapp:+14155238886\",\"NumSegments\":\"1\",\"MessageSid\":\"SM722de63a474b29a458c5add57ae0269b\",\"AccountSid\":\"ACcccfe6ce8d9b9e8ec0ed9e42284bc92f\",\"From\":\"whatsapp:+917888586276\",\"ApiVersion\":\"2010-04-01\"}', 3, 1, 0, '1', '2020-04-25 10:42:55', '2020-04-25 10:42:55'),
(44, '+917888586276', '+14155238886', 'ðŸ˜Š', 'receive', '{\"SmsMessageSid\":\"SMd76ea1f6d9e96ab14cd2a3bc0bc3b76e\",\"NumMedia\":\"0\",\"SmsSid\":\"SMd76ea1f6d9e96ab14cd2a3bc0bc3b76e\",\"SmsStatus\":\"received\",\"Body\":\"ud83dude0a\",\"To\":\"whatsapp:+14155238886\",\"NumSegments\":\"1\",\"MessageSid\":\"SMd76ea1f6d9e96ab14cd2a3bc0bc3b76e\",\"AccountSid\":\"ACcccfe6ce8d9b9e8ec0ed9e42284bc92f\",\"From\":\"whatsapp:+917888586276\",\"ApiVersion\":\"2010-04-01\"}', 3, 1, 0, '1', '2020-04-25 10:43:44', '2020-04-25 10:43:44'),
(45, '+14155238886', '+917888586276', '\n', 'send', '\"SM7bf8af26bc954a1297f462110d9881c5\"', 3, 1, 0, '1', '2020-04-25 10:46:50', '2020-04-25 10:46:50'),
(46, '+917888586276', '+14155238886', '', 'receive', '{\"MediaContentType0\":\"image/jpeg\",\"SmsMessageSid\":\"MMf287bdde76f37572e46e6dc2a8e14339\",\"NumMedia\":\"1\",\"SmsSid\":\"MMf287bdde76f37572e46e6dc2a8e14339\",\"SmsStatus\":\"received\",\"Body\":\"\",\"To\":\"whatsapp:+14155238886\",\"NumSegments\":\"1\",\"MessageSid\":\"MMf287bdde76f37572e46e6dc2a8e14339\",\"AccountSid\":\"ACcccfe6ce8d9b9e8ec0ed9e42284bc92f\",\"From\":\"whatsapp:+917888586276\",\"MediaUrl0\":\"https://api.twilio.com/2010-04-01/Accounts/ACcccfe6ce8d9b9e8ec0ed9e42284bc92f/Messages/MMf287bdde76f37572e46e6dc2a8e14339/Media/MEa028cc0f7d16214932ef3b816171a2fe\",\"ApiVersion\":\"2010-04-01\"}', 3, 1, 0, '1', '2020-04-25 10:46:55', '2020-04-25 10:46:55'),
(47, '+14155238886', '+917888586276', ':)\n', 'send', '\"SM5188ae136437499a89f0255a54058f13\"', 3, 1, 0, '1', '2020-04-25 10:47:01', '2020-04-25 10:47:01'),
(48, '+14155238886', '+917888586276', 'https://www.twilio.com/console/sms/whatsapp/sandbox\n', 'send', '\"SM3a44229ed5274daa932e0890319e9c82\"', 3, 1, 0, '1', '2020-04-25 10:47:31', '2020-04-25 10:47:31'),
(49, '+917888586276', '+14155238886', 'https://www.twilio.com/console/sms/whatsapp/sandbox', 'receive', '{\"SmsMessageSid\":\"SM420ad349018bc99703b899be044e08f7\",\"NumMedia\":\"0\",\"SmsSid\":\"SM420ad349018bc99703b899be044e08f7\",\"SmsStatus\":\"received\",\"Body\":\"https://www.twilio.com/console/sms/whatsapp/sandbox\",\"To\":\"whatsapp:+14155238886\",\"NumSegments\":\"1\",\"MessageSid\":\"SM420ad349018bc99703b899be044e08f7\",\"AccountSid\":\"ACcccfe6ce8d9b9e8ec0ed9e42284bc92f\",\"From\":\"whatsapp:+917888586276\",\"ApiVersion\":\"2010-04-01\"}', 3, 1, 0, '1', '2020-04-25 10:49:03', '2020-04-25 10:49:03'),
(50, '+918318080107', '+14155238886', 'Hi', 'receive', '{\"SmsMessageSid\":\"SMc5de3653753c370699a0027e6759b45b\",\"NumMedia\":\"0\",\"SmsSid\":\"SMc5de3653753c370699a0027e6759b45b\",\"SmsStatus\":\"received\",\"Body\":\"Hi\",\"To\":\"whatsapp:+14155238886\",\"NumSegments\":\"1\",\"MessageSid\":\"SMc5de3653753c370699a0027e6759b45b\",\"AccountSid\":\"ACcccfe6ce8d9b9e8ec0ed9e42284bc92f\",\"From\":\"whatsapp:+918318080107\",\"ApiVersion\":\"2010-04-01\"}', 1, 1, 0, '1', '2020-04-25 14:40:09', '2020-04-25 14:40:09'),
(51, '+918318080107', '+14155238886', 'Vvg', 'receive', '{\"SmsMessageSid\":\"SM6c7bc80b71a2655483efa768e77d1f19\",\"NumMedia\":\"0\",\"SmsSid\":\"SM6c7bc80b71a2655483efa768e77d1f19\",\"SmsStatus\":\"received\",\"Body\":\"Vvg\",\"To\":\"whatsapp:+14155238886\",\"NumSegments\":\"1\",\"MessageSid\":\"SM6c7bc80b71a2655483efa768e77d1f19\",\"AccountSid\":\"ACcccfe6ce8d9b9e8ec0ed9e42284bc92f\",\"From\":\"whatsapp:+918318080107\",\"ApiVersion\":\"2010-04-01\"}', 1, 1, 0, '1', '2020-04-25 14:40:56', '2020-04-25 14:40:56'),
(52, '+14155238886', '+918318080107', 'hi\n', 'send', '\"SM4d6f9952e73a4aabad65abd56204080d\"', 1, 1, 0, '1', '2020-04-25 14:56:56', '2020-04-25 14:56:56'),
(53, '+14155238886', '+918318080107', '', 'receive', '{\"SmsSid\":\"SM4d6f9952e73a4aabad65abd56204080d\",\"SmsStatus\":\"sent\",\"MessageStatus\":\"sent\",\"ChannelToAddress\":\"+91831808XXXX\",\"To\":\"whatsapp:+918318080107\",\"ChannelPrefix\":\"whatsapp\",\"MessageSid\":\"SM4d6f9952e73a4aabad65abd56204080d\",\"AccountSid\":\"ACcccfe6ce8d9b9e8ec0ed9e42284bc92f\",\"From\":\"whatsapp:+14155238886\",\"ApiVersion\":\"2010-04-01\",\"ChannelInstallSid\":\"XEcc20d939f803ee381f2442185d0d5dc5\"}', 1, 1, 0, '1', '2020-04-25 14:56:57', '2020-04-25 14:56:57'),
(54, '+14155238886', '+918318080107', '', 'receive', '{\"EventType\":\"DELIVERED\",\"SmsSid\":\"SM4d6f9952e73a4aabad65abd56204080d\",\"SmsStatus\":\"delivered\",\"MessageStatus\":\"delivered\",\"ChannelToAddress\":\"+91831808XXXX\",\"To\":\"whatsapp:+918318080107\",\"ChannelPrefix\":\"whatsapp\",\"MessageSid\":\"SM4d6f9952e73a4aabad65abd56204080d\",\"AccountSid\":\"ACcccfe6ce8d9b9e8ec0ed9e42284bc92f\",\"From\":\"whatsapp:+14155238886\",\"ApiVersion\":\"2010-04-01\",\"ChannelInstallSid\":\"XE8cb0cdec59441965a1e5b9027c668f4d\"}', 1, 1, 0, '1', '2020-04-25 14:57:44', '2020-04-25 14:57:44'),
(55, '+14155238886', '+918318080107', 'hi\n', 'send', '\"SMf1529e39c5404b7f80bd25c56b41ae0d\"', 1, 1, 0, '1', '2020-04-25 15:14:40', '2020-04-25 15:14:40'),
(56, '+14155238886', '+918318080107', 'hi\n', 'send', '\"SMfdbe11dc94b04326a04b102fcdcda214\"', 1, 1, 0, '2', '2020-04-25 15:19:01', '2020-04-25 15:19:01'),
(57, '+14155238886', '+918318080107', 'hi\n', 'send', '\"SM01631963e4ab4848900110649da638bf\"', 1, 1, 0, '2', '2020-04-25 15:21:15', '2020-04-25 15:21:15'),
(58, '+14155238886', '+918318080107', 'gh\n', 'send', '\"SM966dd9c4e32f4b18b71d3987f46b7342\"', 1, 1, 0, '2', '2020-04-25 15:23:54', '2020-04-25 15:23:54'),
(59, '+14155238886', '+918318080107', 'hhfgh\n', 'send', '\"SM0cb702d873304427a6c6cb10469c2d04\"', 1, 1, 0, '2', '2020-04-25 15:24:50', '2020-04-25 15:24:50'),
(60, '+14155238886', '+918318080107', 'jj\n', 'send', '\"SM4845540f0cb8455cbbd48d41317a2ca5\"', 1, 1, 0, '2', '2020-04-25 15:25:18', '2020-04-25 15:25:18'),
(61, '+14155238886', '+918318080107', 'hi\n', 'send', '\"SM2e3dee6b11814f0da4eae49155614409\"', 1, 1, 0, '2', '2020-04-25 15:38:53', '2020-04-25 15:39:31');

-- --------------------------------------------------------

--
-- Table structure for table `leads`
--

CREATE TABLE `leads` (
  `id` int(11) NOT NULL,
  `name` varchar(200) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `mobile` varchar(100) DEFAULT NULL,
  `profile` varchar(100) DEFAULT NULL,
  `status` enum('1','2') NOT NULL DEFAULT '1' COMMENT '1->active,2->deactive',
  `assign_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `deleted_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `leads`
--

INSERT INTO `leads` (`id`, `name`, `email`, `mobile`, `profile`, `status`, `assign_id`, `created_at`, `deleted_at`) VALUES
(1, 'Shubham', 'shubham@gmail.com', '+918318080107', 'assets/image/avatar2.png', '1', 1, '0000-00-00 00:00:00', '2020-04-24 18:31:31'),
(2, 'Harish', 'harish@gmail.com', '+919875444120', 'assets/image/avatar.png', '1', 2, '0000-00-00 00:00:00', '2020-04-25 11:07:43'),
(3, 'Palvender', 'palvender@gmail.com', '+917888586276', 'assets/image/avatar.png', '1', 1, '0000-00-00 00:00:00', '2020-04-24 18:31:35');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(200) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `mobile` varchar(100) DEFAULT NULL,
  `profile` varchar(100) DEFAULT NULL,
  `status` enum('1','2') NOT NULL DEFAULT '1' COMMENT '1->active,2->deactivate',
  `created_at` datetime NOT NULL,
  `deleted_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `mobile`, `profile`, `status`, `created_at`, `deleted_at`) VALUES
(1, 'Shubham', 'shubham@gmail.com', '+918318080107', 'assets/image/avatar2.png', '1', '0000-00-00 00:00:00', '2020-04-24 17:29:53'),
(2, 'Harish', 'shubham1@gmail.com', '+918318080107', 'assets/image/avatar2.png', '1', '0000-00-00 00:00:00', '2020-04-24 18:30:30'),
(4, 'Palvinder', 'palvender@gmail.com', '+917888586276', 'assets/image/avatar2.png', '1', '0000-00-00 00:00:00', '2020-04-24 18:30:30');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `chat`
--
ALTER TABLE `chat`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `leads`
--
ALTER TABLE `leads`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `chat`
--
ALTER TABLE `chat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT for table `leads`
--
ALTER TABLE `leads`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
