-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: localhost    Database: blog_db
-- ------------------------------------------------------
-- Server version	8.0.30

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `id` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_id` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_title` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(90) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_category_parent` (`parent_id`),
  KEY `idx_category_title` (`title`),
  CONSTRAINT `fk_category_parent` FOREIGN KEY (`parent_id`) REFERENCES `category` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES ('1h-6Tz_PQlsm-X46LMiOg',NULL,'test category','lskdf lkdif ei f',' fksjeoi lksjei llskjief','test-category'),('E-DDXyPOZpumR75BbvJeI',NULL,'राजकीय ','म्हणून गिरीश बापटांना पुण्याच्या राजकारणातले चाणक्य म्हणलं जातं…','भाजप खासदार गिरीश बापट यांचं दीर्घ आजाराने निधन झालं आहे. मागील काही दिवस त्यांच्यावर पुण्यातील दीनानाथ रुग्णालयात उपचार सुरु होते. उपचारादरम्यान त्यांची प्राणज्योत मालवली. वयाच्या ७३ व्या वर्षी त्यांनी अखेरचा श्वास घेतला.','politics'),('z29m6CaoRHNcOPCLr6Ljx',NULL,'भारत','भारतातली सर्वात पहिली मारुती कार आत्ता कुठे आहे माहित आहे का ?','भारतातली सर्वात पहिली मारुती कार आत्ता कुठे आहे माहित आहे का ? या ऐतिहासिक कारला Maruti सर्व्हिस सेंटरमध्ये पुन्हा एकदा रिस्टोअर करण्यात आले आहे.','bharat-news');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post`
--

DROP TABLE IF EXISTS `post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post` (
  `id` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(300) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('Draft','Public','Private') COLLATE utf8mb4_unicode_ci DEFAULT 'Draft',
  `thumbnail` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_title` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `parent_id` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_slug` (`slug`),
  KEY `idx_post_parent` (`parent_id`),
  CONSTRAINT `fk_post_parent` FOREIGN KEY (`parent_id`) REFERENCES `post` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post`
--

LOCK TABLES `post` WRITE;
/*!40000 ALTER TABLE `post` DISABLE KEYS */;
INSERT INTO `post` VALUES ('eSteNGAmm_ZWAiH60fjnB','Lorem ipsum dolor sit amet consectetur adipisicing elit. Facere non perspiciatis soluta! Commodi,','<div>\n<h3>Lorem ipsum dolor sit amet consectetur adipisicing elit. Facere non perspiciatis soluta! Commodi, dolores totam.</h3>\n<br>\n<div>Lorem ipsum dolor sit amet consectetur adipisicing elit. Expedita fugiat consectetur ad facilis minima neque quae debitis, explicabo aperiam corrupti exercitationem dolore magnam illo ducimus at iste voluptas perspiciatis pariatur ullam omnis iure facere dolorem totam! Repellat ipsa ab fuga natus. Beatae placeat cumque cupiditate ab aut, ex a dicta porro itaque soluta, repellat ducimus nobis illum sequi accusamus doloremque eveniet sapiente nisi numquam consequuntur tenetur? Dicta repudiandae enim, totam necessitatibus architecto adipisci vel modi consequatur maxime aperiam magnam ad dolor consectetur cupiditate tempore animi eveniet facere? Quos cum vel molestias sit perferendis, qui libero voluptas tempore ad pariatur consequatur ut dolorum quisquam et quidem? Quo sed totam exercitationem est, culpa ex at voluptates eos nam ipsa autem deserunt ut ducimus eius mollitia adipisci fugit incidunt vero nesciunt facilis qui odit. Illum officia error nemo dolor neque at modi ipsam esse laudantium quas, ullam repellendus totam accusantium dicta culpa earum velit ratione asperiores voluptate similique nisi eum atque maiores harum! Eligendi provident doloremque illo quia sit hic earum ullam! Tempore amet dolorem nam molestiae consequatur neque debitis. Praesentium nihil vero sint. Voluptatem sapiente non ipsa omnis culpa vitae accusantium mollitia? Id illo eligendi corporis officiis, est quasi sequi minima qui itaque eum saepe eos molestias! Obcaecati possimus aut excepturi cumque eveniet. Deleniti iusto necessitatibus voluptatum molestias nam vero! Saepe, sint totam? Maxime nam fugiat qui, doloribus aliquam velit deserunt voluptatibus eligendi nemo voluptates unde laudantium aperiam error. Non velit illum quaerat aut, cupiditate assumenda dolores commodi labore placeat fuga dicta? Distinctio minima laboriosam dicta blanditiis dolorem facilis ipsam ullam magni! Dicta reprehenderit consequuntur maxime, quibusdam dolorum nulla reiciendis. Molestiae beatae consequuntur tenetur est vitae provident, dolorum corporis libero, ducimus reiciendis voluptatum labore autem architecto sapiente! Expedita debitis nulla distinctio totam amet modi facere cum a ullam fugit, provident laudantium perspiciatis sapiente hic quis labore, quod autem, accusamus dolorum ex. Excepturi, ratione temporibus? Neque ea vel facere dolores ex quis ullam nisi libero exercitationem totam, quisquam voluptate aut ad. Excepturi, id animi culpa molestiae quo sequi distinctio est. Neque, et. Perspiciatis iusto fugit aspernatur ullam sapiente tempore quidem veritatis quia. Eligendi deserunt aperiam fuga libero ipsum nemo consequuntur, temporibus quasi eum earum quisquam eos consequatur magnam, cupiditate natus ad autem porro odio architecto! Qui eligendi ut, consectetur reiciendis, velit nulla, deleniti cum adipisci quos commodi minima sunt nam alias nemo. Enim, quasi? Aperiam nemo ipsam nam similique possimus doloremque ratione, quasi ex consectetur suscipit assumenda sed adipisci dolore numquam quam veniam vero. Accusantium error suscipit rerum! Eum, labore molestiae consequatur, beatae eius, unde consectetur saepe voluptate aperiam voluptates nihil doloremque maxime modi est. Eveniet dolore dolorum, dignissimos perspiciatis nam accusantium, porro fuga placeat temporibus quaerat saepe voluptate incidunt repudiandae est! Voluptate enim perferendis rem sunt officiis, eos aut, iusto similique illo vero omnis impedit molestiae soluta quae inventore et. Repudiandae, quos? Officia ratione aspernatur, voluptatum a veniam consectetur, commodi inventore maxime ut autem sit labore earum dicta, nemo dignissimos? Rem at tempore quibusdam eligendi eveniet tempora unde ullam exercitationem et delectus?</div>\n</div>','Public','1680459394092_Tata elxsi off campus hiring 2022.jpg','Lorem ipsum dolor sit','lorem-ipsum-dolor-sit','2023-04-02 18:16:35','2023-04-02 23:46:35',NULL),('F7B_xcCYZLZ7FXWQw9VJu','Final Testing','<p>skdjf a</p>\n<p>df a\'d</p>\n<p>f lskdf</p>','Public','1680461664460_im.jpeg','fsdfsdfs','final-testing','2023-04-02 18:54:26','2023-04-03 00:24:26',NULL),('GMgTppljDSEXZQ2fja3OJ','दुसऱ्या देशांचे सॅटेलाइट अंतराळात पाठवून इस्रो नेमकं किती कमवतं?','<p>तर याबाबद्दल स्वतः सरकारनेच लोकसभेत माहिती दिली होती. डिसेंबर २०२२ यामध्ये भारत सरकारने याबद्दल लोकसभेत माहिती देखील दिली होती.</p>\n<p>गेल्या पाच वर्षांत म्हणजेच जानेवारी 2018 &ndash; नोव्हेंबर 2022&nbsp; या काळात ISRO ने आपल्या व्यावसायिक रॉकेट्सद्वारे नेदरलँड, कोरिया प्रजासत्ताक, सिंगापूर, स्पेन, स्वित्झर्लंड, युनायटेड किंगडम आणि युनायटेड स्टेट्स, ऑस्ट्रेलिया, ब्राझील, कॅनडा, कोलंबिया, फिनलंड, फ्रान्स, इस्रायल, इटली, जपान, लिथुआनिया, लक्झेंबर्ग, मलेशिया या 19 देशांचे 177 परदेशी उपग्रहांचे यशस्वी प्रक्षेपित केले होते.</p>\n<ol>\n<li>आणि या उपग्रहांच्या प्रक्षेपणातून इस्रोला</li>\n<li>जवळपास ११०० कोटींचं उत्पन्न मिळालं होतं</li>\n<li>अशी माहिती अंतराळ विभागाचा कार्यभार</li>\n<li>पाहणारे मंत्री जितेंद्र सिंह यांनी दिली होती. त्यामुळे इस्रोच्या</li>\n<li>उत्पन्नाचा एक प्रमुख सोर्स असल्याचं समोर आलं होतं.</li>\n</ol>\n<div id=\"bolbh-1976943960\" class=\"bolbh-content_2\"></div>\n<p>जगातील अनेक प्रगत देश <a href=\"youtube.com\" target=\"_blank\" rel=\"noopener\">भारताच्या </a>इस्रोला प्रेफरन्स देण्यामागे अनेक कारणं सांगितली जातात त्यामागचं महत्वाचं कारण बघायचं झाल्यास पाहिलं कारण समोर येतं भारतातून सॅटेलाइट पाठवणं स्वस्त आहे. त्यामुळे अनेक देशांकडून आणि देशातील प्रायव्हेट कंपन्यांकडून इस्रोला पसंती दिली आहे. त्यातच इस्रो हा <em><strong>सॅटेलाइट </strong></em>पाठवण्याचा एक भरवशाच्या ऑप्शन देखील आहे.</p>\n<p>इस्रोकडून गेल्या काही वर्षात स्टॅटलाइट पाठवताना जवळपास नाहीच्या बरोबरीनेच अपघात झाले आहेत. अशावेळी इस्रोकडे कामाची जबाबदारी देणं या कंपन्यांना किंवा देशांना नुकसानदायक वाटत नाही.</p>','Public','1680101667610_Intel Zehntech Hiring Interns as Engineering Intern and Intern Software Engineer 2022.jpeg','अलीकडच्या काळात आपण इस्रोच्या ज्या आपण बातम्या ऐकत असतो त्यात एक पॅटर्न आपल्याला दिसतो तो म्हणजे ','how-much-does-isro-earn-by-sending-other-countries-satellites-into-space','2023-03-29 14:54:29','2023-03-29 20:24:29',NULL),('mmhomGED2VB9Y-0_mG5IG','म्हणून गिरीश बापटांना पुण्याच्या राजकारणातले चाणक्य म्हणलं जातं…','<h3>कसब्याचा <strong>आधारवड गेला&hellip;</strong></h3>\n<p>भाजप खासदार गिरीश बापट यांचं दीर्घ आजाराने निधन झालं आहे. मागील काही दिवस त्यांच्यावर पुण्यातील दीनानाथ रुग्णालयात उपचार सुरु होते. उपचारादरम्यान त्यांची प्राणज्योत मालवली. वयाच्या ७३ व्या वर्षी त्यांनी अखेरचा श्वास घेतला.&nbsp;अंत्यविधी संध्याकाळी ७ वाजता वैकुंठ स्मशान भूमीत होणार आहे.&nbsp;</p>\n<div id=\"bolbh-1396131924\" class=\"bolbh-content\"></div>\n<p>पुण्याच्या राजकारणातले चाणक्य म्हणून ओळखले जाणारे गिरीश बापट&nbsp;१९७३ पासून ते राजकारणात सक्रिय होते. पुण्यात भाजपची यशस्वी वाटचाल करण्यात त्यांचा महत्वाचा वाटा आहे.&nbsp; त्यांच्या निधनाने भाजपमध्ये मोठी पोकळी निर्माण झाली आहे.&nbsp; पुण्यात भाजप पक्ष वाढवण्यासाठी त्यांनी प्रचंड मेहनत केली होती.</p>\n<p>गिरीश बापटांचं कसबव्यावरचं असलेले वर्चस्व त्यांची राजकीय ताकद दाखवून देते.</p>\n<ul>\n<li>टेल्को कंपनीत १९७३ ला कर्मचारी म्हणून काम करत असताना कामगार संघटनेच्या माध्यमातून राजकारणात प्रवेश केला होता. १९८३ ला पुणे महापालिकेत नगरसेवक म्हणून निवडून आले. सलग ३ वेळा नगरसेवक म्हणून निवडून आले होते.</li>\n<li id=\"bolbh-1410467271\" class=\"bolbh-content_2\"></li>\n<li>१९९३ ला झालेल्या कसबा पेठ विधानसभेच्या पोटनिवडणुकीत गिरीश बापट यांचा पराभव पत्करावा लागला होता. त्यानंतर त्यांनी राजकारणात मागे वळून पाहिलं नाही.&nbsp;कसबा पेठ मतदार संघातून १९९५ पासून सलग २५ वर्ष गिरीश बापट यांनी एक हाती आपलं साम्राज्य प्रस्थापित केलं होतं</li>\n<li>राज्याच्या मंत्रिमंडळात अनेक खात्यांचे मंत्री आणि पुण्याचे पालकमंत्री म्हणून काम केलं आहे. त्यानंतर २०१९ ला पुण्याचे खासदार म्हणून विक्रमी मताधिक्याने निवडून आले होते.&nbsp;&nbsp;कसब्यात गिरीश बापट यांचं एकमुखी नेतृत्व होतं.&nbsp;</li>\n</ul>\n<div id=\"bolbh-434910368\" class=\"bolbh-content_3\"></div>\n<p>मात्र २०१९ च्या लोकसभा निवडणुकीत गिरीश बापट यांना खासदारकीचं तिकीट मिळालं आणि मुक्ता टिळक या कसबा पेठमधून आमदार झाल्या. असं असलं तरी मतदारसंघावर गिरीश बापट यांचाच वरचष्मा होता. मात्र गेल्या काही काळापासून आजारपणामुळे ते राजकारणात सक्रिय नव्हते.&nbsp;</p>\n<p><strong>कसब्याच्या पोटनिवडणुकीमुळे चर्चेत आलेले&hellip;</strong></p>\n<p>नाकात नळी, ऑक्सिजन सिलेंडर आणि व्हिलचेअरवर बसून गिरीश बापट&nbsp;अगदी कसब्याच्या निवडणुकीच्या प्रचारात ते मैदानात उतरले होते.&nbsp;बापटांच्या या एन्ट्रीमुळे त्यांचे कार्यकर्ते, कसब्यातील जनता भावुक झाले होते. त्यांचं भाषण सुरु असताना कित्येकांच्या डोळ्यात पाणी होतं हेच नेत्याबद्दलचं प्रेम दिसून आलं. गिरीश&nbsp;बापट+ कसबा हे समीकरण इतकं घट्ट झालेलं कि, कसब्यात त्यांच्याएवढा ताकदीचा दुसरा नेता तरी दिसून येत नाही.&nbsp;त्यांना मानणारा मोठा वर्ग मतदारसंघात आहे हे प्रचार सभेतून दिसून आलं.</p>\n<div id=\"bolbh-33101965\" class=\"bolbh-content_6\"></div>\n<p><strong>विशेष म्हणजे बापटांचं कसब्यातील राजकारण नेहमी सर्वसमावेशक राहिलंय.&nbsp;</strong></p>\n<p>गिरीश बापट हे पुण्याच्या राजकारणात &lsquo;सर्वसमावेशक&rsquo; राजकारणासाठी ओळखले जातात. विरोधी पक्षाची सत्ता असली तरी आपले काम साधून घेण्याचे कसब गिरीश बापट यांना उत्तम अवगत असल्याचं पुण्यातले पत्रकार सांगत आलेत.&nbsp;</p>\n<p>मतदारसंघात कुठं काय घडतंय याची बित्तंबातमी त्यांना असते. मतदारसंघातला असलेला त्यांचा दांडगा जनसंपर्क, सर्वपक्षीय कनेक्शन या त्यांच्या जमेच्या बाजू मानल्या जातात.&nbsp;</p>\n<div id=\"bolbh-2094408143\" class=\"bolbh-content_7\"></div>\n<p>जातीपातीचं राजकारण त्यांनी कधी केलं नाही, त्यांनी&nbsp;फक्त ब्राम्हण वर्गावर फोकस न करता इतर जातिवर्गातील जनतेला तितकंच महत्व दिलं.&nbsp;&nbsp;बापटांचं राजकारण आजवर सर्वसमावेशक राजकारण राहिल्याने त्यांना आजवर सर्वच जाती-वर्गातून मते मिळत आलीत हेच त्यांच्या राजकीय कारकिर्दीचं यश म्हणावं लागेल.</p>\n<p>गेल्या काही काळापासून&nbsp;गिरीश बापट आजारी असताना भाजपच्याच नाहीतर विरोधी पक्षाच्या नेत्यांनीही त्यांची भेट घेतली होती. त्यांच्या प्रकृतीची विचारपूस केली होती. मुख्यमंत्री एकनाथ शिंदे, उपमुख्यमंत्री देवेंद्र फडणवीस आणि राष्ट्रवादीचे सर्वेसर्वा शरद पवार यांच्यासोबतच इतर नेत्यांनीही भेट घेऊन त्यांच्या प्रकृतीची विचारपूस केली होती.&nbsp;त्यांच्या जाण्याने भाजपच मोठी पोकळी निर्माण झाली आहे.</p>\n<p><strong>गिरीश बापटांना भावपूर्ण श्रद्धांजली !</strong></p>','Public','1680102115462_Infosys Deloitte Hiring freshers 2022.jpg','गेल्या काही काळापासून गिरीश बापट आजारी असताना भाजपच्याच नाहीतर विरोधी पक्षाच्या नेत्यांनीही त्यांची भेट घेतली होती. त्यांच्या प्रकृतीची विचारपूस केली होती. ','girish-bapat-passed-away','2023-03-29 15:01:56','2023-03-29 20:31:56',NULL);
/*!40000 ALTER TABLE `post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_category`
--

DROP TABLE IF EXISTS `post_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post_category` (
  `post_id` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`post_id`,`category_id`),
  KEY `idx_pc_category` (`category_id`),
  KEY `idx_pc_post` (`post_id`),
  CONSTRAINT `fk_pc_category` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_pc_post` FOREIGN KEY (`post_id`) REFERENCES `post` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_category`
--

LOCK TABLES `post_category` WRITE;
/*!40000 ALTER TABLE `post_category` DISABLE KEYS */;
INSERT INTO `post_category` VALUES ('0FShuOsKFZ_l0u77UI0Y4','1'),('4bkxRB8m3TY9JhbUgen5q','1h-6Tz_PQlsm-X46LMiOg'),('F7B_xcCYZLZ7FXWQw9VJu','1h-6Tz_PQlsm-X46LMiOg'),('FRurwQjQk3GrHHXvWKQ78','1h-6Tz_PQlsm-X46LMiOg'),('R0hcU-TDf8nOdAgAl91Bv','1h-6Tz_PQlsm-X46LMiOg'),('RhVN8UMCbE4MfsssLj4Up','1h-6Tz_PQlsm-X46LMiOg'),('0FShuOsKFZ_l0u77UI0Y4','2'),('0FShuOsKFZ_l0u77UI0Y4','3'),('eSteNGAmm_ZWAiH60fjnB','E-DDXyPOZpumR75BbvJeI'),('GMgTppljDSEXZQ2fja3OJ','E-DDXyPOZpumR75BbvJeI'),('mmhomGED2VB9Y-0_mG5IG','E-DDXyPOZpumR75BbvJeI'),('R0hcU-TDf8nOdAgAl91Bv','E-DDXyPOZpumR75BbvJeI'),('RhVN8UMCbE4MfsssLj4Up','E-DDXyPOZpumR75BbvJeI'),('sgO2_s6eLpAjqwUqKcpsI','E-DDXyPOZpumR75BbvJeI'),('GMgTppljDSEXZQ2fja3OJ','z29m6CaoRHNcOPCLr6Ljx'),('mhYuVYA1h04ZGGz_rrUJC','z29m6CaoRHNcOPCLr6Ljx'),('mmhomGED2VB9Y-0_mG5IG','z29m6CaoRHNcOPCLr6Ljx'),('MMlzvLFIG7R7qG4q4x_DT','z29m6CaoRHNcOPCLr6Ljx');
/*!40000 ALTER TABLE `post_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_comment`
--

DROP TABLE IF EXISTS `post_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post_comment` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `post_id` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_id` int unsigned DEFAULT NULL,
  `content` varchar(600) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_comment_post` (`post_id`),
  KEY `idx_comment_parent` (`parent_id`),
  KEY `fk_comment_user` (`user_id`),
  CONSTRAINT `fk_comment_parent` FOREIGN KEY (`parent_id`) REFERENCES `post_comment` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_comment_post` FOREIGN KEY (`post_id`) REFERENCES `post` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_comment_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_comment`
--

LOCK TABLES `post_comment` WRITE;
/*!40000 ALTER TABLE `post_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `post_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_meta`
--

DROP TABLE IF EXISTS `post_meta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post_meta` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `post_id` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` varchar(600) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_post_meta` (`post_id`,`name`),
  KEY `idx_post_meta` (`post_id`),
  CONSTRAINT `fk_metaData` FOREIGN KEY (`post_id`) REFERENCES `post` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_meta`
--

LOCK TABLES `post_meta` WRITE;
/*!40000 ALTER TABLE `post_meta` DISABLE KEYS */;
INSERT INTO `post_meta` VALUES (1,'GMgTppljDSEXZQ2fja3OJ','title','अलीकडच्या काळात आपण इस्रोच्या ज्या आपण बातम्या ऐकत असतो त्यात एक पॅटर्न आपल्याला दिसतो तो म्हणजे '),(2,'GMgTppljDSEXZQ2fja3OJ','description','अलीकडच्या काळात आपण इस्रोच्या ज्या आपण बातम्या ऐकत असतो त्यात एक पॅटर्न आपल्याला दिसतो तो म्हणजे अनेक बातम्यात इस्रोने इतर देशांचे, कंपन्यांचे उपग्रह अंतराळात सोडल्याच्या. आजही अशीच बातमी आली आहे.'),(3,'mmhomGED2VB9Y-0_mG5IG','title','गेल्या काही काळापासून गिरीश बापट आजारी असताना भाजपच्याच नाहीतर विरोधी पक्षाच्या नेत्यांनीही त्यांची भेट घेतली होती. त्यांच्या प्रकृतीची विचारपूस केली होती. '),(4,'mmhomGED2VB9Y-0_mG5IG','description','गेल्या काही काळापासून गिरीश बापट आजारी असताना भाजपच्याच नाहीतर विरोधी पक्षाच्या नेत्यांनीही त्यांची भेट घेतली होती. त्यांच्या प्रकृतीची विचारपूस केली होती. मुख्यमंत्री एकनाथ शिंदे, उपमुख्यमंत्री देवेंद्र फडणवीस आणि राष्ट्रवादीचे सर्वेसर्वा शरद पवार यांच्यासोबतच इतर नेत्यांनीही भेट घेऊन त्यांच्या प्रकृतीची विचारपूस केली होती. त्यांच्या जाण्याने भाजपच मोठी पोकळी निर्माण झाली आहे.'),(9,'OCpN-obTISVOtSVRuQrcQ','title',''),(10,'OCpN-obTISVOtSVRuQrcQ','description',''),(29,'JMETyo4pGqukhj2rtHjlZ','key 1','values 1'),(30,'JMETyo4pGqukhj2rtHjlZ','key 2','values 2'),(31,'JMETyo4pGqukhj2rtHjlZ','key 3','values 3'),(36,'K_EMvr3VCwH7XXALXtg_Y','key 1','values 1'),(37,'K_EMvr3VCwH7XXALXtg_Y','key 2','values 2'),(38,'K_EMvr3VCwH7XXALXtg_Y','key 3','values 3'),(39,'0FShuOsKFZ_l0u77UI0Y4','key 1','values 1'),(40,'0FShuOsKFZ_l0u77UI0Y4','key 2','values 2'),(41,'0FShuOsKFZ_l0u77UI0Y4','key 3','values 3'),(42,'RhVN8UMCbE4MfsssLj4Up','key 1','values 1'),(43,'RhVN8UMCbE4MfsssLj4Up','key 2','values 2'),(44,'RhVN8UMCbE4MfsssLj4Up','key 3','values 3'),(45,'4bkxRB8m3TY9JhbUgen5q','title','test title meta'),(46,'4bkxRB8m3TY9JhbUgen5q','description','test desc'),(47,'MVlQdOjmKjouMj8hY-jkc','title',''),(48,'MVlQdOjmKjouMj8hY-jkc','description',''),(49,'Ths4SVl-kznAYxxJbZKRz','title',''),(50,'Ths4SVl-kznAYxxJbZKRz','description',''),(51,'R0hcU-TDf8nOdAgAl91Bv','title','test'),(52,'R0hcU-TDf8nOdAgAl91Bv','description','test'),(53,'mhYuVYA1h04ZGGz_rrUJC','title','test'),(54,'mhYuVYA1h04ZGGz_rrUJC','description','test'),(55,'eSteNGAmm_ZWAiH60fjnB','title','Lorem ipsum dolor sit'),(56,'eSteNGAmm_ZWAiH60fjnB','description','Lorem ipsum dolor sit'),(57,'b4PiAxwsSc9qW3m9wYuiG','title',''),(58,'b4PiAxwsSc9qW3m9wYuiG','description',''),(59,'MMlzvLFIG7R7qG4q4x_DT','title','test'),(60,'MMlzvLFIG7R7qG4q4x_DT','description','test'),(61,'FRurwQjQk3GrHHXvWKQ78','title',''),(62,'FRurwQjQk3GrHHXvWKQ78','description',''),(63,'sgO2_s6eLpAjqwUqKcpsI','title','fslkdjf'),(64,'sgO2_s6eLpAjqwUqKcpsI','description','fsdfj'),(65,'F7B_xcCYZLZ7FXWQw9VJu','title','fsdfsdfs'),(66,'F7B_xcCYZLZ7FXWQw9VJu','description','fs');
/*!40000 ALTER TABLE `post_meta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_tag`
--

DROP TABLE IF EXISTS `post_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post_tag` (
  `post_id` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tag_id` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`post_id`,`tag_id`),
  KEY `idx_pt_tag` (`tag_id`),
  KEY `idx_pt_post` (`post_id`),
  CONSTRAINT `fk_pt_post` FOREIGN KEY (`post_id`) REFERENCES `post` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_pt_tag` FOREIGN KEY (`tag_id`) REFERENCES `tag` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_tag`
--

LOCK TABLES `post_tag` WRITE;
/*!40000 ALTER TABLE `post_tag` DISABLE KEYS */;
INSERT INTO `post_tag` VALUES ('0FShuOsKFZ_l0u77UI0Y4','1'),('0FShuOsKFZ_l0u77UI0Y4','2'),('0FShuOsKFZ_l0u77UI0Y4','3'),('R0hcU-TDf8nOdAgAl91Bv','52Yk2KPrBZXkdLHU5Gfj2'),('RhVN8UMCbE4MfsssLj4Up','52Yk2KPrBZXkdLHU5Gfj2'),('eSteNGAmm_ZWAiH60fjnB','Dbbr1OdmX2x0mMSLfKuWE'),('GMgTppljDSEXZQ2fja3OJ','Dbbr1OdmX2x0mMSLfKuWE'),('mhYuVYA1h04ZGGz_rrUJC','Dbbr1OdmX2x0mMSLfKuWE'),('mmhomGED2VB9Y-0_mG5IG','Dbbr1OdmX2x0mMSLfKuWE'),('MMlzvLFIG7R7qG4q4x_DT','Dbbr1OdmX2x0mMSLfKuWE'),('4bkxRB8m3TY9JhbUgen5q','fEsf6C1gv5Ixto_APxq7b'),('eSteNGAmm_ZWAiH60fjnB','fEsf6C1gv5Ixto_APxq7b'),('F7B_xcCYZLZ7FXWQw9VJu','fEsf6C1gv5Ixto_APxq7b'),('FRurwQjQk3GrHHXvWKQ78','fEsf6C1gv5Ixto_APxq7b'),('mhYuVYA1h04ZGGz_rrUJC','fEsf6C1gv5Ixto_APxq7b'),('R0hcU-TDf8nOdAgAl91Bv','fEsf6C1gv5Ixto_APxq7b'),('sgO2_s6eLpAjqwUqKcpsI','fEsf6C1gv5Ixto_APxq7b'),('F7B_xcCYZLZ7FXWQw9VJu','IP1b4c1QhAe0w5FlX2RVk'),('MMlzvLFIG7R7qG4q4x_DT','IP1b4c1QhAe0w5FlX2RVk'),('R0hcU-TDf8nOdAgAl91Bv','IP1b4c1QhAe0w5FlX2RVk'),('RhVN8UMCbE4MfsssLj4Up','IP1b4c1QhAe0w5FlX2RVk'),('sgO2_s6eLpAjqwUqKcpsI','IP1b4c1QhAe0w5FlX2RVk');
/*!40000 ALTER TABLE `post_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tag`
--

DROP TABLE IF EXISTS `tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tag` (
  `id` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(90) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_title` varchar(90) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(90) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag`
--

LOCK TABLES `tag` WRITE;
/*!40000 ALTER TABLE `tag` DISABLE KEYS */;
INSERT INTO `tag` VALUES ('52Yk2KPrBZXkdLHU5Gfj2','शेअर मार्केट','अदानीनंतर हिंडेनबर्गचं टार्गेट जॅक डॉर्सी….पण जॅक नक्की कशात घावलाय ?','अदानीनंतर हिंडेनबर्गचं टार्गेट जॅक डॉर्सी….पण जॅक नक्की कशात घावलाय ? त्यामुळे सकाळपासून सोशल मीडियावर हिंडेनबर्गच्या निशाण्यावर अदानी नंतर आता कोण असेल याची चर्चा सुरु होती. ','share-market'),('Dbbr1OdmX2x0mMSLfKuWE','विज्ञान आणि तंत्रज्ञान ','दुसऱ्या देशांचे सॅटेलाइट अंतराळात पाठवून इस्रो नेमकं किती कमवतं?','अलीकडच्या काळात आपण इस्रोच्या ज्या आपण बातम्या ऐकत असतो त्यात एक पॅटर्न आपल्याला दिसतो तो म्हणजे अनेक बातम्यात इस्रोने इतर देशांचे, कंपन्यांचे उपग्रह अंतराळात सोडल्याच्या. आजही अशीच बातमी आली आहे.','science-and-technology'),('fEsf6C1gv5Ixto_APxq7b','test 2','fse fsdf','fst gere','test-2'),('IP1b4c1QhAe0w5FlX2RVk','next title tag','sgfdgsfgdf fgd','next description tag','next-title-tag');
/*!40000 ALTER TABLE `tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(90) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hashed_password` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` enum('User','Teacher','Admin') COLLATE utf8mb4_unicode_ci DEFAULT 'User',
  `first_name` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `profile` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `registered_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_email` (`email`),
  UNIQUE KEY `uq_mobile` (`mobile`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-04-05 21:26:30
