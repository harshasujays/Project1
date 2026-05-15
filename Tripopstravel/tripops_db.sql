-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 15, 2026 at 12:08 PM
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
-- Database: `tripops_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `destinations`
--

CREATE TABLE `destinations` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `slug` varchar(100) DEFAULT NULL,
  `category` varchar(50) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `destinations`
--

INSERT INTO `destinations` (`id`, `name`, `country`, `slug`, `category`, `image`) VALUES
(1, 'Goa', 'India', 'goa', 'beach', 'destinations\\goa.jpg'),
(2, 'Kerala', 'India', 'kerala', 'countryside', 'destinations\\kerala.jpg'),
(3, 'Bali', 'Indonesia', 'bali', 'countryside', 'destinations\\bali.jpg'),
(4, 'London', 'UK', 'london', 'city', 'destinations\\london.jpg'),
(5, 'Paris', 'France', 'paris', 'city', 'destinations\\paris.jpg'),
(6, 'Tokyo', 'Japan', 'tokyo', 'city', 'destinations\\tokyo.jpg'),
(17, 'Zurich', 'Switzerland', 'zurich', 'city', 'destinations\\zurich.jpg'),
(18, 'Rome', 'Italy', 'rome', 'city', 'destinations\\rome.jpg'),
(19, 'Hallstatt', 'Austria', 'hallstatt', 'village', 'destinations\\hallstatt.jpg'),
(20, 'New York', 'USA', 'newyork', 'city', 'destinations\\newyork.jpg'),
(21, 'Toronto', 'Canada', 'toronto', 'city', 'destinations\\toronto.jpg'),
(22, 'Sydney', 'Australia', 'sydney', 'city', 'destinations\\sydney.jpg'),
(23, 'Queenstown', 'New Zealand', 'queenstown', 'mountains', 'destinations\\queen.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `destination_attractions`
--

CREATE TABLE `destination_attractions` (
  `id` int(11) NOT NULL,
  `destination_id` int(11) DEFAULT NULL,
  `category` varchar(50) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `display_order` int(11) DEFAULT 0,
  `rating` tinyint(4) DEFAULT 5
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `destination_attractions`
--

INSERT INTO `destination_attractions` (`id`, `destination_id`, `category`, `name`, `image`, `description`, `display_order`, `rating`) VALUES
(1, 1, 'nature', 'Baga Beach', 'baga.jpg', 'Popular beach known for nightlife and water sports', 1, 5),
(2, 1, 'nature', 'Calangute Beach', 'calangute.jpg', 'Largest and busiest beach in North Goa', 3, 5),
(3, 1, 'nature', 'Anjuna Beach', 'anjuna.jpg', 'Famous for flea market and relaxed vibe', 7, 5),
(4, 1, 'nature', 'Palolem Beach', 'palolem.jpg', 'Peaceful crescent-shaped beach in South Goa', 9, 5),
(5, 1, 'nature', 'Dudhsagar Waterfalls', 'dudhsagar.jpg', 'One of India’s tallest waterfalls', 10, 5),
(6, 1, 'heritage', 'Fort Aguada', 'aguada.jpg', '17th century Portuguese fort with lighthouse', 2, 5),
(7, 1, 'heritage', 'Chapora Fort', 'chapora.jpg', 'Historic hilltop fort offering stunning views of Vagator Beach and the Arabian Sea.', 2, 5),
(8, 1, 'religious', 'Basilica of Bom Jesus', 'bom_jesus.jpg', 'UNESCO World Heritage church', 4, 5),
(9, 1, 'religious', 'Se Cathedral', 'se_cathedral.jpg', 'One of the largest churches in Asia', 2, 5),
(10, 1, 'urban', 'Anjuna Flea Market', 'anjuna_market.jpg', 'Weekly flea market with local shopping', 1, 5),
(11, 1, 'urban', 'Fontainhas', 'fontainhas.jpg', 'Latin quarter with colorful streets', 2, 5),
(12, 1, 'experience', 'Mandovi River Cruise', 'mandovi_cruise.jpg', 'Evening cruise with music and views', 2, 5),
(13, 1, 'experience', 'Tito’s Lane', 'titos.jpg', 'Famous nightlife street in Baga', 2, 5),
(14, 1, 'wildlife', 'Salim Ali Bird Sanctuary', 'salim_ali.jpg', 'Mangrove forest with rich birdlife, perfect for nature lovers and birdwatching.', 1, 5),
(15, 1, 'heritage', 'Reis Magos Fort', 'reis_magos.jpg', 'Restored historic fort with museum and beautiful river views.', 2, 5),
(16, 1, 'experience', 'Spice Plantation', 'spice_plantation.jpg', 'Explore Goa’s famous spices, tropical gardens, and enjoy guided tours.', 3, 5),
(17, 1, NULL, 'Chapora Fort', 'chap.jpg', 'Historic hilltop fort offering stunning views of Vagator Beach and the Arabian Sea.', 0, 5),
(18, 1, NULL, 'Dona Paula Viewpoint', 'don.jpg', 'Popular viewpoint where visitors enjoy sea views, sunsets, and coastal scenery.', 0, 5),
(19, 1, NULL, 'Fontainhas Latin Quarter', 'fon.jpg', 'Colorful heritage area with Portuguese houses, art galleries, and charming streets.', 0, 5),
(20, 1, NULL, 'Divar Island', 'div.jpg', 'Peaceful island known for quiet villages, scenic roads, and traditional Goan life.', 0, 5),
(21, 2, 'nature', 'Munnar Tea Gardens', 'munnar.jpg', 'Rolling hills covered with lush tea plantations and misty landscapes', 15, 5),
(22, 2, 'nature', 'Alleppey Backwaters', 'alleppey.jpg', 'Famous network of canals and lagoons best explored by houseboats', 19, 5),
(23, 2, 'nature', 'Wayanad Wildlife Sanctuary', 'wayanad.jpg', 'Dense forest reserve home to elephants, deer, and rare wildlife', 2, 5),
(24, 2, 'nature', 'Athirappilly Waterfalls', 'athirappilly.jpg', 'Kerala’s largest waterfall often called the Niagara of India', 16, 5),
(25, 2, 'nature', 'Varkala Cliff Beach', 'varkala.jpg', 'Unique beach with dramatic cliffs and beautiful sunset views', 8, 5),
(26, 2, 'nature', 'Periyar Lake', 'periyar.jpg', 'Scenic lake inside Periyar Tiger Reserve surrounded by forests', 13, 5),
(27, 2, 'heritage', 'Mattancherry Palace', 'palace.jpg', 'Historic palace known for murals and colonial architecture', 6, 5),
(28, 2, 'heritage', 'Bekal Fort', 'bekal.jpg', 'Massive seaside fort with panoramic views of the Arabian Sea', 14, 5),
(29, 2, 'heritage', 'St Francis Church', 'francis.jpg', 'One of the oldest European churches built in India', 17, 5),
(30, 2, 'religious', 'Sabarimala Temple', 'sabarimala.jpg', 'Major Hindu pilgrimage temple located deep in forest hills', 10, 5),
(31, 2, 'religious', 'Padmanabhaswamy Temple', 'padmanabha.jpg', 'Famous temple known for its treasure vaults and architecture', 9, 5),
(32, 2, 'religious', 'Guruvayur Temple', 'guruvayur.jpg', 'Important Krishna temple attracting thousands of devotees', 17, 5),
(33, 2, 'urban', 'Marine Drive Kochi', 'marine.jpg', 'Popular waterfront promenade with sunset views and cafes', 3, 5),
(34, 2, 'urban', 'Lulu Mall Kochi', 'lulu.jpg', 'One of India’s largest shopping malls and entertainment hubs', 4, 5),
(35, 2, 'urban', 'Jew Town Kochi', 'jewtown.jpg', 'Historic street known for antique shops and heritage buildings', 5, 5),
(36, 2, 'experience', 'Kerala Houseboat Cruise', 'houseboat.jpg', 'Traditional cruise through the calm backwaters', 15, 5),
(37, 2, 'experience', 'Kathakali Cultural Show', 'kathakali.jpg', 'Traditional dance drama performance with elaborate costumes', 9, 5),
(38, 2, 'experience', 'Ayurvedic Spa Retreat', 'ayurveda.jpg', 'Wellness therapy using ancient Ayurvedic healing methods', 1, 5),
(39, 2, 'wildlife', 'Silent Valley National Park', 'silentvalley.jpg', 'Protected rainforest known for rare biodiversity', 19, 5),
(40, 2, 'wildlife', 'Kumarakom Bird Sanctuary', 'kumarakom.jpg', 'Wetland sanctuary famous for migratory birds', 20, 5),
(41, 3, 'nature', 'Kuta Beach', 'kuta.jpg', 'Popular beach known for surfing and sunsets', 1, 5),
(42, 3, 'religious', 'Uluwatu Temple', 'uluwatu.jpg', 'Cliffside temple with stunning ocean views', 2, 5),
(43, 3, 'nature', 'Tegallalang Rice Terrace', 'tegal.jpg', 'Famous terraced fields with lush green views', 3, 5),
(44, 3, 'heritage', 'Ubud Palace', 'ubud.jpg', 'Traditional royal palace with Balinese architecture', 4, 5),
(45, 3, 'nature', 'Mount Batur', 'batur.jpg', 'Active volcano known for sunrise trekking views', 5, 5),
(46, 3, 'religious', 'Tanah Lot Temple', 'tanah.jpg', 'Iconic sea temple on a rocky formation', 6, 5),
(47, 3, 'urban', 'Ubud Market', 'market.jpg', 'Local market with crafts and souvenirs', 7, 5),
(48, 3, 'experience', 'Bali Swing', 'swing.jpg', 'Jungle swing with scenic valley views', 8, 5),
(49, 3, 'nature', 'Seminyak Beach', 'seminyak.jpg', 'Upscale beach with resorts and nightlife', 9, 5),
(50, 3, 'religious', 'Besakih Temple', 'besakih.jpg', 'Largest and holiest temple complex in Bali', 10, 5),
(51, 3, 'nature', 'Sekumpul Waterfall', 'sekum.jpg', 'Scenic waterfall surrounded by lush forest', 11, 5),
(52, 3, 'heritage', 'Tirta Gangga', 'tirta.jpg', 'Royal water palace with gardens and fountains', 12, 5),
(53, 3, 'urban', 'Seminyak Square', 'square.jpg', 'Shopping and dining area in Seminyak', 13, 5),
(54, 3, 'experience', 'Ayung River Rafting', 'raft.jpg', 'White water rafting through scenic jungle', 14, 5),
(55, 3, 'nature', 'Nusa Dua Beach', 'nusadua.jpg', 'Clean beach with calm and clear waters', 15, 5),
(56, 3, 'religious', 'Ulun Danu Temple', 'ulun.jpg', 'Lake temple surrounded by mountain scenery', 16, 5),
(57, 3, 'nature', 'Sanur Beach', 'sanur.jpg', 'Peaceful beach known for sunrise views', 17, 5),
(58, 3, 'heritage', 'Goa Gajah', 'gajah.jpg', 'Ancient cave temple with stone carvings', 18, 5),
(59, 3, 'experience', 'Kecak Dance Uluwatu', 'kecak.jpg', 'Traditional dance performance at sunset', 19, 5),
(60, 3, 'wildlife', 'Sacred Monkey Forest', 'monkey.jpg', 'Forest sanctuary home to playful monkeys', 20, 5);

-- --------------------------------------------------------

--
-- Table structure for table `destination_details`
--

CREATE TABLE `destination_details` (
  `id` int(11) NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `best_time` varchar(100) DEFAULT NULL,
  `highlights` varchar(255) DEFAULT NULL,
  `currency_name` varchar(50) DEFAULT NULL,
  `currency_code` varchar(10) DEFAULT NULL,
  `currency_symbol` varchar(5) DEFAULT NULL,
  `common_gestures` text DEFAULT NULL,
  `category` varchar(50) DEFAULT NULL,
  `main_image` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `destination_details`
--

INSERT INTO `destination_details` (`id`, `slug`, `name`, `country`, `best_time`, `highlights`, `currency_name`, `currency_code`, `currency_symbol`, `common_gestures`, `category`, `main_image`, `description`) VALUES
(1, 'goa', 'Goa', 'India', 'Nov – Feb', 'Beaches, Nightlife, Portuguese Heritage', 'Indian Rupee', 'INR', '₹', 'People in Goa are generally warm, relaxed, and welcoming, and their common gestures and daily practices reflect this easygoing coastal lifestyle. A friendly smile, casual wave, or a simple nod is often used to greet others, even strangers, especially in villages and local neighborhoods. Goans usually speak politely and softly, mixing Konkani, English, and sometimes Hindi, and it’s common to hear friendly small talk in shops or cafés. Handshakes are common in formal or first-time meetings, while close friends may greet each other with a light hug or a pat on the shoulder. Respect for elders is important, shown through polite language and attentive listening. Daily life often revolves around community, food, music, and festivals, with people taking time to socialize, enjoy long meals, and celebrate traditions together, reflecting Goa’s calm, inclusive, and joyful way of living.', 'beach', 'destinations/goa.jpg', 'Goa, located along the Western coastline of India, is one of the country’s most loved and internationally recognized travel destinations, offering a perfect blend of history, culture, nature, and modern tourism. Known for its stunning beaches that stretch along the Arabian Sea, Goa attracts travelers with everything from lively beach parties and water sports to quiet shores ideal for relaxation. The state’s unique character is deeply influenced by its history as a former Portuguese colony for over 450 years, which is reflected in its UNESCO-listed churches, charming colonial architecture, old forts, and vibrant traditions. Beyond the beaches, Goa is rich in natural beauty, featuring lush green landscapes, spice plantations, rivers, and wildlife sanctuaries that appeal to nature lovers and adventure seekers alike. Goa is also a food lover’s paradise, famous for its distinctive cuisine that combines Indian spices with Portuguese flavors, offering fresh seafood, local curries, and street food experiences. Throughout the year, the state comes alive with festivals, music events, and cultural celebrations that attract visitors from across the globe, adding to its energetic and welcoming atmosphere. With its warm climate, friendly locals, diverse experiences, and relaxed coastal lifestyle, Goa continues to be a favorite destination for families, solo travelers, couples, and backpackers, making it an essential stop on any travel itinerary in India.\n\n'),
(2, 'kerala', 'Kerala', 'India', 'Oct – Mar', 'Backwaters, Hill Stations, Ayurveda, Beaches, Wildlife, Culture', 'Indian Rupee', 'INR', '₹', 'People in Kerala are generally polite, respectful, and community-oriented. A slight nod of the head or a warm smile is commonly used as a greeting. The traditional greeting \"Namaskaram\" is widely used, and removing footwear before entering homes or temples is considered respectful.', 'nature', 'destinations/kerala.jpg', 'Kerala, located on the southwestern coast of India along the Arabian Sea, is one of the most scenic and culturally rich travel destinations in the country. Popularly known as \"God’s Own Country,\" Kerala is famous for its breathtaking landscapes, tranquil backwaters, lush hill stations, diverse wildlife, and vibrant cultural traditions. The state offers a unique combination of serene beaches, mist-covered mountains, peaceful villages, and tropical forests that attract travelers from across the world. One of Kerala’s most iconic experiences is its backwaters, a vast network of interconnected lakes, canals, and lagoons where visitors can cruise in traditional houseboats while enjoying views of coconut groves, paddy fields, and small villages along the water. The hill stations of Kerala, especially Munnar and Wayanad, are known for their rolling tea plantations, cool climate, waterfalls, and scenic viewpoints that provide a refreshing escape from busy city life. Along the Arabian Sea coastline, destinations such as Varkala and Kovalam offer beautiful beaches where visitors can relax, watch sunsets, and enjoy the calm coastal atmosphere. Kerala’s cultural heritage is equally fascinating, featuring classical art forms like Kathakali and Mohiniyattam, traditional martial art Kalaripayattu, and colorful temple festivals that reflect centuries-old traditions. The state is also globally known for Ayurveda, an ancient system of natural healing that attracts wellness travelers seeking relaxation and rejuvenation. Food lovers can enjoy Kerala’s distinctive cuisine, which blends aromatic spices, coconut-based flavors, fresh seafood, and traditional meals served on banana leaves. Festivals such as Onam and Thrissur Pooram bring the state to life with grand celebrations, cultural performances, and vibrant decorations that showcase the strong community spirit of the region. With its warm hospitality, natural beauty, rich traditions, and wide range of travel experiences, Kerala continues to be one of the most memorable and rewarding destinations to explore in India.'),
(3, 'bali', 'Bali', 'Indonesia', 'Apr – Oct', 'Beaches, Temples, Rice Terraces, Volcanoes, Culture, Nightlife', 'Indonesian Rupiah', 'IDR', 'Rp', 'People in Bali are generally warm, spiritual, and respectful, often greeting with a slight bow or hands together gesture. Modest dress is appreciated, especially when visiting temples, and politeness is highly valued in social interactions.', 'island', 'destinations/bali.jpg', 'Bali, located in the Indonesian archipelago, is one of the most scenic and culturally rich travel destinations in Southeast Asia. Popularly known as the \"Island of the Gods,\" Bali is famous for its breathtaking landscapes, serene beaches, lush rice terraces, majestic volcanoes, and deeply rooted spiritual traditions. The island offers a unique combination of tropical coastlines, mist-covered mountains, peaceful villages, and dense forests that attract travelers from across the world. One of Bali’s most iconic experiences is its rice terraces, a stunning network of layered fields in regions like Ubud where visitors can enjoy picturesque views of greenery and traditional farming practices. The island’s mountainous regions, including Mount Batur and Mount Agung, are known for their volcanic landscapes, sunrise treks, and scenic viewpoints that provide a refreshing escape from busy tourist areas. Along the Indian Ocean coastline, destinations such as Kuta, Seminyak, and Nusa Dua offer beautiful beaches where visitors can relax, surf, watch sunsets, and enjoy a vibrant coastal atmosphere. Bali’s cultural heritage is equally fascinating, featuring ancient temples like Uluwatu Temple, Tanah Lot, and Besakih Temple, along with traditional art forms such as Balinese dance and gamelan music that reflect centuries-old traditions. The island is also globally known for its wellness culture, offering yoga retreats, meditation centers, and holistic healing practices that attract travelers seeking relaxation and rejuvenation. Food lovers can enjoy Bali’s distinctive cuisine, which blends aromatic spices, fresh ingredients, and popular dishes like nasi goreng, satay, and babi guling. Festivals such as Nyepi and Galungan bring the island to life with unique rituals, cultural performances, and vibrant decorations that showcase the strong spiritual and community values of the region. With its warm hospitality, natural beauty, rich traditions, and wide range of travel experiences, Bali continues to be one of the most memorable and rewarding destinations to explore in Southeast Asia.');

-- --------------------------------------------------------

--
-- Table structure for table `destination_experiences`
--

CREATE TABLE `destination_experiences` (
  `id` int(11) NOT NULL,
  `destination_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `destination_experiences`
--

INSERT INTO `destination_experiences` (`id`, `destination_id`, `name`, `image`, `description`) VALUES
(1, 1, 'Sunset Cruises', 'sun.jpg', 'Enjoy a relaxing sunset cruise along the Mandovi River while watching the sky change colors over the Arabian Sea. These cruises often include live music, cultural performances, and local snacks. It is a peaceful way to experience Goa’s scenic beauty while enjoying the evening breeze and waterfront views.'),
(2, 1, 'Adventure & Watersports', 'adventure.jpg', 'Goa is a paradise for adventure enthusiasts. From parasailing over turquoise waters to jet skiing, windsurfing, scuba diving, and banana boat rides, you can experience adrenaline-pumping activities at popular beaches like Baga, Calangute, and Anjuna. Adventure isn’t limited to water — try ATV rides, trekking, and cycling through scenic trails for a full dose of excitement.'),
(3, 1, 'Cultural Heritage', 'cultural.jpg', 'Goa has a rich cultural heritage that reflects Portuguese influence and local traditions. Explore historic forts like Aguada and Reis Magos, visit magnificent churches such as Basilica of Bom Jesus, and stroll through colorful colonial streets. Discover spice plantations, traditional villages, and local festivals to fully immerse yourself in Goa\'s history and culture.'),
(4, 1, 'Wildlife & Nature', 'wildlife.jpg', 'Escape the hustle and bustle by visiting Goa\'s serene natural spots. The Salim Ali Bird Sanctuary offers a glimpse of exotic birds and lush mangroves. Explore wildlife sanctuaries, nature trails, and peaceful backwaters. Goa\'s countryside, waterfalls, and forests provide ample opportunities for nature walks, photography, and relaxation amidst greenery.'),
(5, 1, 'Nightlife & Music', 'nightlife.jpg', 'Goa is famous for its lively nightlife. Enjoy beach parties with world-class DJs, experience vibrant nightclubs, and attend live music performances that blend electronic, rock, and traditional sounds. Popular areas like Baga, Anjuna, and Vagator are buzzing with energy after sunset, offering unforgettable nights of fun, dance, and socializing.'),
(6, 1, 'Relaxation & Wellness', 'relaxation.jpg', 'Goa isn’t just about partying and adventure. Find your inner peace with wellness retreats, yoga sessions on the beach, and rejuvenating spa treatments. Relax under the sun on quiet beaches, enjoy Ayurvedic massages, or take leisurely strolls at sunset. Perfect for travelers seeking a blend of serenity, comfort, and natural beauty.'),
(7, 1, 'Unique Local Experiences', 'local.jpg', 'Discover the authentic side of Goa by exploring local markets, attending traditional festivals, and interacting with Goan communities. Taste local cuisine, learn about handicrafts, visit hidden beaches, and experience village life. These unique experiences give travelers a deeper connection to the culture, people, and spirit of Goa.'),
(8, 1, 'Food & Culinary Tours', 'food.jpg', 'Goa offers a culinary journey like no other. From fresh seafood and traditional Goan curries to Portuguese-inspired sweets, the food scene is vibrant and diverse. Join guided food tours, explore street food markets, and taste local delicacies like bebinca, vindaloo, and xacuti. Foodies can enjoy cooking classes and learn authentic Goan recipes.'),
(9, 1, 'Boating & Backwaters', 'boating.jpg', 'Explore Goa\'s scenic backwaters and rivers with boating and river cruises. Enjoy a relaxing sunset cruise along Mandovi River, spot rare birds, and experience the tranquility of rural Goa. Houseboat experiences, kayaking, and paddleboarding are perfect ways to connect with nature while enjoying the peaceful waterways.'),
(10, 1, 'Dolphin Watching', 'dol.jpg', 'Take an exciting early morning boat ride along Goa’s coastline to spot playful dolphins in the Arabian Sea. Local guides take visitors to popular dolphin areas where they often jump through the waves. It is a fun and memorable wildlife experience with beautiful coastal views.'),
(11, 1, 'Spice Plantation Tours', 'spi.jpg', 'Visit Goa’s lush spice plantations to learn about traditional farming and the cultivation of spices like pepper, cardamom, and nutmeg. Guided tours explain how these spices are grown and harvested. Many plantations also offer authentic Goan meals prepared using fresh plantation ingredients.'),
(12, 1, 'Beach Yoga', 'yog.jpg', 'Start your day with a peaceful yoga session on Goa’s beautiful beaches. Practicing yoga beside the sea combines gentle stretches, breathing exercises, and meditation with the calming sound of waves. It is a refreshing way to relax, improve focus, and enjoy Goa’s tranquil coastal environment.'),
(13, 1, 'Fort Exploration', 'for.jpg', 'Explore Goa’s historic forts such as Aguada, Chapora, and Reis Magos, which offer stunning views of the Arabian Sea. These Portuguese-era structures showcase fascinating architecture and history. Walking through the forts allows visitors to learn about Goa’s past while enjoying scenic coastal landscapes.'),
(14, 1, 'Shopping at Flea Markets', 'fle.jpg', 'Experience the vibrant shopping culture of Goa at famous flea markets like Anjuna and Mapusa. These markets offer colorful stalls selling clothes, jewelry, handicrafts, and souvenirs. Visitors can explore unique items, taste local snacks, and enjoy the lively atmosphere filled with music and culture.'),
(15, 1, 'Kayaking', 'kay.jpg', 'Kayaking through Goa’s peaceful rivers and mangrove forests is a relaxing adventure surrounded by nature. Guided tours take visitors through calm waters where they can see birds and beautiful scenery. It is a great way to explore Goa’s hidden waterways away from the busy beaches.'),
(16, 1, 'Scuba Diving', 'scu.jpg', 'Scuba diving in Goa offers an exciting opportunity to explore the underwater world of the Arabian Sea. Divers can see colorful fish, coral formations, and even small shipwrecks. With professional guides and beginner training available, it is a thrilling adventure for both new and experienced divers.'),
(17, 1, 'Beach Camping', 'cam.jpg', 'Beach camping in Goa allows visitors to spend a night beside the ocean under the stars. Campers can enjoy bonfires, music, and the relaxing sound of waves. Waking up to a beautiful sunrise over the sea makes this experience both peaceful and unforgettable.'),
(18, 1, 'Fishing Trips', 'fis.jpg', 'Join local fishermen on traditional fishing trips along Goa’s coast and rivers. Visitors can learn simple fishing techniques while enjoying scenic ocean views. The experience provides insight into Goa’s coastal lifestyle and offers a unique opportunity to connect with the region’s local culture.'),
(19, 1, 'Heritage Walks', 'her.jpg', 'Take a heritage walk through Goa’s charming neighborhoods filled with Portuguese-style houses, churches, and historic streets. Guided tours share stories about the region’s culture and colonial history. It is a wonderful way to explore Goa’s architecture and learn about its rich traditions.'),
(20, 1, 'Island Visits', 'isl.jpg', 'Explore small islands around Goa by taking a short boat ride across scenic waters. These islands offer quiet beaches, natural landscapes, and peaceful surroundings. Visitors can relax, enjoy picnics, and experience a calmer side of Goa away from the crowded tourist areas.'),
(21, 2, 'Snake Boat Rowing Experience', 'boat.jpg', 'Participating in a traditional snake boat rowing experience allows visitors to feel the energy and teamwork behind Kerala’s famous boat races. Travelers can join local rowers on practice sessions and learn how dozens of paddlers move in perfect rhythm. The excitement of rowing through Kerala’s rivers makes this a thrilling cultural activity.'),
(22, 2, 'Coir Making Workshop', 'coir.jpg', 'Kerala is famous for its coir industry made from coconut fibers. In this workshop, visitors can see how coconut husks are processed and spun into strong ropes and mats using traditional techniques. Trying the process themselves offers a fascinating insight into a craft that has supported local communities for generations.'),
(23, 2, 'Toddy Tapping Demonstration', 'toddy.jpg', 'Toddy tapping is a traditional skill where local experts climb tall coconut trees to collect fresh coconut sap. Visitors can watch this impressive technique and learn how the natural drink is collected and prepared. The experience provides a unique glimpse into rural traditions and agricultural practices.'),
(24, 2, 'Traditional Fishing Net Experience', 'nets.jpg', 'Visitors can try operating Kerala’s iconic Chinese fishing nets with the help of local fishermen. The large wooden structures require teamwork to lift and lower the nets into the water. This hands-on activity gives travelers a memorable look into Kerala’s coastal fishing culture.'),
(25, 2, 'Kerala Martial Arts Training', 'kalaripayattu.jpg', 'Kalaripayattu is one of the oldest martial arts traditions in the world and originated in Kerala. Visitors can watch skilled practitioners demonstrate powerful movements, weapon techniques, and acrobatics. Some centers even allow beginners to try basic training and understand the discipline behind this ancient art.'),
(26, 2, 'Handloom Weaving Experience', 'weaving.jpg', 'Kerala’s traditional handloom weaving produces beautiful cotton fabrics and garments. Travelers can visit weaving centers where artisans create textiles on wooden looms using age-old techniques. Observing the process and trying a few weaving steps offers a meaningful cultural experience.'),
(27, 2, 'Coconut Climbing Experience', 'climb.jpg', 'Learning how locals climb tall coconut trees using simple tools is both exciting and educational. Visitors are guided by experienced climbers who demonstrate traditional techniques used in coconut farming. The activity showcases the skill and balance required for this everyday rural task.'),
(28, 2, 'Village Cycling Tour', 'cycle.jpg', 'Cycling through Kerala’s peaceful countryside allows visitors to explore quiet roads, paddy fields, and small villages at a relaxed pace. Along the way travelers can see farmers working in fields and locals going about daily life. The journey offers a refreshing and authentic rural experience.'),
(29, 2, 'Traditional Pottery Making', 'pottery.jpg', 'In pottery workshops, visitors can watch skilled artisans shape clay into beautiful pots using spinning wheels and hand techniques. Travelers may also try creating their own pottery under expert guidance. The activity highlights Kerala’s traditional craftsmanship and artistic heritage.'),
(30, 2, 'Coconut Oil Production Visit', 'oil.jpg', 'Kerala produces high-quality coconut oil using traditional pressing techniques. Visitors can observe how dried coconut is processed to extract oil and learn about its uses in cooking and Ayurveda. The experience offers insight into an important part of Kerala’s local economy.'),
(31, 2, 'Temple Drum Performance', 'drum.jpg', 'Kerala temples often feature powerful drum ensembles known for their rhythmic energy. Watching a live performance allows visitors to experience the intense beats and synchronized movements of the drummers. The vibrant sound and atmosphere create an unforgettable cultural moment.'),
(32, 2, 'Banana Chip Making Experience', 'chips.jpg', 'Kerala is famous for its crispy banana chips made from locally grown bananas. Visitors can see how the bananas are sliced, fried in coconut oil, and seasoned to perfection. Tasting the freshly prepared snack makes the experience both fun and delicious.'),
(33, 2, 'Handicraft Market Exploration', 'market.jpg', 'Exploring Kerala’s handicraft markets allows visitors to discover handmade souvenirs such as wood carvings, coir products, and traditional lamps. Local artisans often demonstrate their craft while selling unique items. The colorful markets provide a lively cultural shopping experience.'),
(34, 2, 'Backwater Village Canoe Ride', 'canoe.jpg', 'A canoe ride through narrow village canals offers a peaceful way to observe daily life along Kerala’s waterways. Travelers glide past small homes, coconut groves, and fishermen working along the banks. The calm environment makes this journey relaxing and immersive.'),
(35, 2, 'Local Farm Visit', 'farm.jpg', 'Visiting a traditional Kerala farm allows travelers to see how crops like rice, spices, and coconuts are cultivated. Farmers often explain the planting and harvesting process while demonstrating traditional tools. The visit provides a deeper understanding of Kerala’s agricultural lifestyle.'),
(36, 2, 'Traditional Boat Building Yard', 'boatbuild.jpg', 'Kerala has a long tradition of wooden boat building for fishing and transport. Visitors can explore boatyards where skilled craftsmen construct large boats using hand tools and ancient techniques. Watching the process highlights the remarkable craftsmanship involved.'),
(37, 2, 'Kerala Tea Tasting Session', 'teataste.jpg', 'Tea tasting sessions introduce visitors to the rich flavors and aromas of Kerala’s tea varieties. Experts explain how tea leaves are processed and guide guests through tasting different blends. The experience is both educational and enjoyable for tea lovers.'),
(38, 2, 'Coconut Leaf Craft Workshop', 'leafcraft.jpg', 'Local artisans use dried coconut leaves to create baskets, mats, and decorative items. In this workshop visitors can learn the weaving techniques and try making simple crafts themselves. The activity demonstrates how natural materials are transformed into useful products.'),
(39, 2, 'Local Street Food Tour', 'streetfood.jpg', 'Exploring Kerala’s street food scene allows travelers to taste a variety of local snacks and flavors. Guided tours introduce dishes such as spicy fritters, sweet treats, and fresh juices from roadside vendors. The lively atmosphere makes it a fun culinary adventure.'),
(40, 2, 'Traditional Lamp Lighting Ceremony', 'lamp.jpg', 'Lamp lighting ceremonies are an important cultural tradition in Kerala and often mark special occasions. Visitors can witness the ritual where rows of brass lamps are lit to create a warm and spiritual atmosphere. The glowing lights and peaceful setting make the experience deeply memorable.'),
(41, 3, 'Balinese Cooking Class', 'cook.jpg', 'Immerse yourself in Bali’s rich culinary traditions by joining a hands-on cooking class guided by local chefs. Visit traditional markets to select fresh ingredients, learn authentic recipes, and prepare classic dishes like nasi goreng and satay. This experience offers a deep connection to Balinese culture through flavors, techniques, and shared meals in a warm, local setting.'),
(42, 3, 'Rice Terrace Farming Experience', 'rice.jpg', 'Experience the traditional farming lifestyle by working alongside local farmers in Bali’s iconic rice terraces. Learn about the ancient subak irrigation system, plant rice seedlings, and understand the daily routines of rural communities. This hands-on activity offers insight into sustainable agriculture while surrounded by breathtaking green landscapes.'),
(43, 3, 'Balinese Temple Offering Making', 'offer.jpg', 'Discover the spiritual essence of Bali by learning how to create traditional offerings known as canang sari. Guided by local women, you will arrange flowers, incense, and symbolic items while understanding their cultural significance. This peaceful experience allows you to connect with Bali’s deeply rooted Hindu traditions and daily rituals.'),
(44, 3, 'Traditional Balinese Dance Workshop', 'dance.jpg', 'Step into the world of Balinese performing arts by learning traditional dance movements from skilled instructors. Understand the expressive hand gestures, eye movements, and storytelling techniques that define these dances. This cultural experience provides a deeper appreciation for Bali’s artistic heritage and vibrant performances.'),
(45, 3, 'Mount Batur Sunrise Trekking', 'batur.jpg', 'Embark on an early morning trek up Mount Batur to witness a stunning sunrise above the clouds. Guided hikes take you through volcanic landscapes, rewarding you with panoramic views at the summit. Enjoy a simple breakfast cooked using volcanic steam while soaking in the beauty of Bali’s natural scenery.'),
(46, 3, 'Balinese Spa and Herbal Treatment', 'spa.jpg', 'Relax your body and mind with traditional Balinese spa therapies that combine herbal treatments, massages, and aromatherapy. Skilled therapists use natural oils and ancient techniques to relieve stress and rejuvenate the body. This wellness experience offers a perfect escape into tranquility and holistic healing.'),
(47, 3, 'Silversmith Jewelry Making', 'silver.jpg', 'Create your own handcrafted jewelry by learning silversmith techniques from local artisans. Shape, carve, and polish silver into unique designs while understanding the craftsmanship behind Bali’s jewelry industry. This creative experience allows you to take home a personalized souvenir with cultural significance.'),
(48, 3, 'Bali Swing Experience', 'swing.jpg', 'Enjoy the thrill of swinging high above lush jungles and rice fields on Bali’s famous swings. Capture breathtaking views and memorable photos while experiencing a mix of adventure and scenic beauty. This activity combines excitement with relaxation in a stunning natural environment.'),
(49, 3, 'Waterfall Cliff Jumping', 'cliff.jpg', 'Experience an adrenaline rush by jumping off cliffs into refreshing natural pools beneath Bali’s hidden waterfalls. Guided tours ensure safety while allowing you to explore untouched natural spots. This adventure blends excitement with the beauty of Bali’s tropical landscapes.'),
(50, 3, 'Snorkeling with Marine Life', 'snorkel.jpg', 'Discover Bali’s vibrant underwater world by snorkeling in crystal-clear waters filled with colorful coral reefs and tropical fish. Guided excursions take you to the best spots where you can swim alongside diverse marine life. This experience is perfect for nature lovers seeking a peaceful aquatic adventure.'),
(51, 3, 'Balinese Coffee Plantation Tour', 'coffee.jpg', 'Explore traditional coffee plantations and learn about the process of growing, roasting, and brewing Balinese coffee. Taste a variety of local blends, including the famous kopi luwak, while enjoying scenic plantation views. This experience combines education with sensory delight.'),
(52, 3, 'Yoga and Meditation Retreat', 'yoga.jpg', 'Reconnect with your inner self through guided yoga and meditation sessions in serene natural surroundings. Professional instructors help improve flexibility, mindfulness, and mental clarity. This peaceful experience offers a holistic approach to wellness in Bali’s calming environment.'),
(53, 3, 'Traditional Batik Painting Workshop', 'batik.jpg', 'Learn the intricate art of batik painting using wax-resist dyeing techniques. Guided by skilled artists, you will create your own fabric designs while understanding the cultural history behind this traditional craft. This artistic experience provides both creativity and cultural insight.'),
(54, 3, 'Balinese Village Homestay Experience', 'homestay.jpg', 'Stay with a local Balinese family and experience authentic village life. Participate in daily activities, enjoy home-cooked meals, and learn about traditions and customs firsthand. This immersive experience offers a genuine connection to Bali’s culture and community.'),
(55, 3, 'Surfing Lessons', 'surf.jpg', 'Ride the waves of Bali with beginner-friendly surfing lessons guided by experienced instructors. Learn essential techniques, balance, and safety measures while enjoying the ocean. This activity is perfect for adventure seekers looking to experience Bali’s famous surf culture.'),
(56, 3, 'Traditional Fishing Experience', 'fish.jpg', 'Join local fishermen on early morning fishing trips using traditional methods passed down through generations. Learn how to cast nets, catch fish, and understand the coastal lifestyle. This experience provides insight into Bali’s maritime traditions and daily life.'),
(57, 3, 'Volcano Hot Spring Bathing', 'hotspring.jpg', 'Relax in natural hot springs heated by volcanic activity while enjoying scenic views of surrounding mountains. The mineral-rich waters help soothe muscles and promote relaxation. This experience combines wellness with the unique geology of Bali.'),
(58, 3, 'Balinese Gamelan Music Workshop', 'music.jpg', 'Explore the rhythmic sounds of traditional Balinese gamelan music by learning to play its unique instruments. Guided sessions introduce you to coordination and musical patterns used in ceremonies and performances. This cultural experience offers a deep appreciation for Bali’s musical heritage.'),
(59, 3, 'Night Jungle Trekking', 'jungle.jpg', 'Venture into Bali’s जंगल landscapes at night to observe nocturnal wildlife and experience the forest in a different atmosphere. Guided treks ensure safety while revealing hidden aspects of nature. This adventure provides a unique and thrilling connection to Bali’s biodiversity.'),
(60, 3, 'Eco-Friendly Bamboo Craft Workshop', 'bamboo.jpg', 'Learn how to create sustainable crafts using bamboo, one of Bali’s most versatile natural materials. Skilled artisans guide you through cutting, shaping, and assembling eco-friendly products. This hands-on experience promotes creativity while supporting sustainable practices.');

-- --------------------------------------------------------

--
-- Table structure for table `destination_gallery`
--

CREATE TABLE `destination_gallery` (
  `id` int(11) NOT NULL,
  `destination_id` int(11) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `destination_gallery`
--

INSERT INTO `destination_gallery` (`id`, `destination_id`, `image`) VALUES
(1, 1, 'destinations/goa.jpg'),
(8, 2, 'destinations/kerala.jpg'),
(9, 3, 'destinations/bali.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `destination_restaurants`
--

CREATE TABLE `destination_restaurants` (
  `id` int(11) NOT NULL,
  `destination_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `cuisine` varchar(100) DEFAULT NULL,
  `rating` float DEFAULT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `destination_restaurants`
--

INSERT INTO `destination_restaurants` (`id`, `destination_id`, `name`, `image`, `cuisine`, `rating`, `description`) VALUES
(1, 1, 'Cavatina', 'cav.jpg', 'European', 5, 'Fine dining restaurant in Benaulim known for modern European cuisine.'),
(2, 1, 'Fisherman\'s Wharf', 'fishermans_wharf.jpg', 'Seafood', 5, 'Popular seafood restaurant by the river with lively ambience.'),
(3, 1, 'Vinayak Restaurant', 'vinayak.jpg', 'Indian', 4, 'Famous for authentic Goan thalis and local dishes.'),
(4, 1, 'Viva Panjim', 'viv.jpg', 'Goan & Portuguese', 5, 'Heritage restaurant in Panaji known for authentic Goan and Portuguese cuisine.'),
(5, 1, 'Thalassa', 'thalassa.jpg', 'Mediterranean', 4, 'Greek-inspired restaurant with sunset views and live performances.'),
(6, 1, 'Suzy\'s Restaurant', 'suzys.jpg', 'Continental', 4, 'Casual dining with international and Goan fusion dishes.'),
(7, 1, 'Martin\'s Corner', 'martins_corner.jpg', 'Seafood & Goan', 5, 'Iconic spot for fresh seafood and Goan cuisine.'),
(8, 1, 'Pousada by the Beach', 'pousada_beach.jpg', 'Continental', 4, 'Beachfront restaurant with relaxed vibes and cocktails.'),
(10, 1, 'The Black Sheep Bistro', 'black_sheep.jpg', 'European & Asian', 5, 'Trendy bistro offering fusion and continental dishes.'),
(11, 1, 'Cafe Chocolatti', 'cafe_chocolatti.jpg', 'Cafe & Desserts', 4, 'Popular cafe for desserts, waffles, and light meals.'),
(12, 1, 'Burger Factory', 'bur.jpg', 'American', 4, 'Famous Goa burger joint serving gourmet burgers.'),
(13, 1, 'La Plage', 'la_plage.jpg', 'French & Seafood', 4, 'Beachside French cuisine with fresh seafood and cocktails.'),
(14, 1, 'Baba Au Rhum', 'baba_au_rhum.jpg', 'French & Bakery', 5, 'Authentic French bakery and bistro experience.'),
(15, 1, 'Bomra\'s', 'bomras.jpg', 'Burmese & Asian', 5, 'Highly rated Burmese dishes with Asian fusion flavors.'),
(16, 1, 'Go With The Flow', 'gwf.jpg', 'Continental', 4, 'Trendy cafe in Assagao serving brunch and fusion dishes.'),
(17, 1, 'La Plage Beach Shack', 'la_plage_shack.jpg', 'Continental & Seafood', 4, 'Relaxed beach shack with drinks and seafood specials.'),
(18, 1, 'Gunpowder', 'gun.jpg', 'South Indian', 4, 'Popular spot serving authentic South Indian coastal dishes.'),
(19, 1, 'Antares', 'ant.jpg', 'Australian & Seafood', 4, 'Beachside restaurant by chef Sarah Todd with seafood dishes.'),
(20, 1, 'Britto\'s', 'bri.jpg', 'Seafood', 4, 'Famous Baga beach shack known for Goan seafood.'),
(21, 1, 'Curlies', 'cur.jpg', 'Seafood & Continental', 4, 'Iconic Anjuna beach shack with music and sunset views.'),
(22, 1, 'Peep Kitchen', 'pee.jpg', 'Goan', 5, 'Modern Goan restaurant known for authentic flavors.'),
(23, 1, 'Fat Fish', 'fat.jpg', 'Seafood', 4, 'Popular for Goan fish curry and seafood platters.'),
(24, 1, 'Mum\'s Kitchen', 'mum.jpg', 'Goan', 5, 'Traditional Goan cuisine served in a heritage setting.'),
(25, 1, 'Ritz Classic', 'rit.jpg', 'Seafood', 4, 'Famous for fish thali and Goan curries.'),
(26, 1, 'Cafe Bodega', 'bod.jpg', 'Cafe', 4, 'Art cafe serving continental breakfast and desserts.'),
(27, 1, 'Artjuna Cafe', 'art.jpg', 'Mediterranean', 4, 'Bohemian cafe with healthy Mediterranean dishes.'),
(28, 1, 'Toro Toro', 'tor.jpg', 'Latin American', 4, 'Stylish grill restaurant known for steaks and cocktails.'),
(29, 1, 'Lila Cafe', 'lil.jpg', 'German & Cafe', 4, 'Charming riverside cafe known for German bakery and breakfast.'),
(30, 1, 'Sublime', 'sub.jpg', 'European', 5, 'Fine dining restaurant with seasonal European menu.'),
(31, 1, 'Tuscany Gardens', 'tus.jpg', 'Italian', 4, 'Authentic Italian restaurant with wood fired pizzas.'),
(32, 2, 'Paragon Restaurant', 'paragon.jpg', 'Malabar Indian', 5, 'Legendary Kozhikode restaurant famous for biryani and Malabar cuisine'),
(33, 2, 'Kashi Art Cafe', 'kashi.jpg', 'Cafe', 5, 'Fort Kochi cafe known for art gallery vibe and continental breakfast'),
(34, 2, 'Grand Pavilion', 'pavilion.jpg', 'Kerala & Indian', 5, 'Popular Kochi restaurant known for authentic Kerala meals'),
(35, 2, 'Dhe Puttu', 'puttu.jpg', 'Kerala', 4, 'Modern restaurant famous for creative puttu varieties'),
(36, 2, 'Fusion Bay', 'fusion.jpg', 'Seafood', 5, 'Highly rated seafood restaurant in Fort Kochi'),
(37, 2, 'Kayees Rahmathullah Cafe', 'kayees.jpg', 'Malabar', 5, 'Historic eatery famous for traditional Malabar biryani'),
(38, 2, 'Rice Boat', 'riceboat.jpg', 'Seafood', 5, 'Luxury waterfront seafood restaurant in Taj Kochi'),
(39, 2, 'Malabar Junction', 'malabar.jpg', 'Kerala Fusion', 5, 'Fine dining restaurant blending Kerala flavors with global cuisine'),
(40, 2, 'Arippa', 'arippa.jpg', 'Kerala', 4, 'Popular Kochi restaurant known for traditional Kerala dishes'),
(41, 2, 'Fort House Restaurant', 'forthouse.jpg', 'Seafood', 4, 'Waterfront restaurant with great seafood and harbor views'),
(42, 2, 'The Rice Bowl', 'ricebowl.jpg', 'Indian', 4, 'Elegant restaurant serving North and South Indian dishes'),
(43, 2, 'Cafe 17', 'cafe17.jpg', 'Cafe', 4, 'Trendy Kochi cafe popular for desserts and coffee'),
(44, 2, 'Dal Roti', 'dalroti.jpg', 'North Indian', 4, 'Famous Kochi restaurant serving authentic North Indian food'),
(45, 2, 'Zam Zam', 'zamzam.jpg', 'Malabar', 5, 'Iconic Kozhikode restaurant known for biryani and Arabian dishes'),
(46, 2, 'Top Form Restaurant', 'topform.jpg', 'Kerala', 4, 'Popular Kozhikode eatery known for local seafood'),
(47, 2, 'Hotel Rahmath', 'rahmath.jpg', 'Malabar', 5, 'Famous spot for Kozhikode biryani'),
(48, 2, 'Ustad Hotel', 'ustad.jpg', 'Malabar', 4, 'Traditional restaurant famous for pathiri and seafood'),
(49, 2, 'Salkara Restaurant', 'salkara.jpg', 'Kerala', 4, 'Authentic Kerala cuisine restaurant with traditional meals'),
(50, 2, 'Tharavadu Restaurant', 'tharavadu.jpg', 'Kerala', 4, 'Traditional restaurant serving Kerala sadya and seafood'),
(51, 2, 'The Yellow Chilli Kochi', 'yellowchilli.jpg', 'Indian Fusion', 4, 'Celebrity chef restaurant offering modern Indian cuisine'),
(52, 2, 'Bait Restaurant', 'bait.jpg', 'Seafood', 5, 'Luxury seafood restaurant overlooking Kochi harbor'),
(53, 2, 'Sky Grill', 'skygrill.jpg', 'Grill', 4, 'Rooftop restaurant with grilled seafood and city views'),
(54, 2, 'Cocoa Tree Cafe', 'cocoa.jpg', 'Cafe', 4, 'Popular cafe known for desserts and coffee'),
(55, 2, 'Indian Coffee House', 'coffeehouse.jpg', 'Cafe', 4, 'Historic cafe chain serving classic Indian snacks'),
(56, 2, 'Cafe Papaya', 'papaya.jpg', 'Cafe', 4, 'Modern cafe serving sandwiches, coffee, and brunch'),
(57, 2, 'Salt Mango Tree', 'saltmango.jpg', 'Kerala Fusion', 5, 'Elegant restaurant offering modern Kerala cuisine'),
(58, 2, 'Platform 65', 'platform.jpg', 'Indian', 4, 'Train-themed restaurant with Indian dishes'),
(59, 2, 'Chef Pillai Restaurant', 'pillai.jpg', 'Kerala Fusion', 5, 'Famous modern Kerala cuisine by celebrity chef Suresh Pillai'),
(60, 2, 'Oceanos Restaurant', 'oceanos.jpg', 'Mediterranean Seafood', 5, 'Popular Fort Kochi restaurant known for seafood platters'),
(61, 2, 'District 7 Encore', 'district7.jpg', 'Multi Cuisine', 4, 'Trendy restaurant serving international dishes'),
(62, 3, 'La Lucciola', 'lucciola.jpg', 'Italian & Seafood', 5, 'Beachside restaurant known for Italian cuisine and sunset views'),
(63, 3, 'Merah Putih', 'merah.jpg', 'Indonesian', 5, 'Fine dining restaurant known for modern Indonesian cuisine'),
(64, 3, 'Sarong', 'sarong.jpg', 'Asian Fusion', 5, 'Upscale restaurant known for Asian fusion dishes'),
(65, 3, 'Locavore', 'locavore.jpg', 'Contemporary', 5, 'Famous Ubud restaurant known for innovative local cuisine'),
(66, 3, 'Ku De Ta', 'kudeta.jpg', 'International', 4, 'Popular beach club restaurant known for sunset dining'),
(67, 3, 'Potato Head Beach Club', 'potato.jpg', 'International', 5, 'Iconic beach club known for food, drinks, and ocean views'),
(68, 3, 'Bebek Bengil', 'bebek.jpg', 'Indonesian', 4, 'Famous restaurant known for crispy duck dishes'),
(69, 3, 'Warung Babi Guling Ibu Oka', 'oka.jpg', 'Balinese', 5, 'Popular Ubud spot known for traditional babi guling'),
(70, 3, 'Mozaic Restaurant', 'mozaic.jpg', 'French & Indonesian', 5, 'Fine dining restaurant known for gourmet tasting menus'),
(71, 3, 'Sardine', 'sardine.jpg', 'Seafood', 4, 'Scenic restaurant known for fresh seafood and rice field views'),
(72, 3, 'Cafe Organic', 'organic.jpg', 'Healthy Cafe', 4, 'Trendy cafe known for healthy brunch and smoothie bowls'),
(73, 3, 'The Lawn Canggu', 'lawn.jpg', 'International', 4, 'Beachfront spot known for casual dining and sunset vibes'),
(74, 3, 'Milk & Madu', 'madu.jpg', 'Cafe', 4, 'Popular cafe known for breakfast and coffee'),
(75, 3, 'Sea Circus', 'circus.jpg', 'Mexican & Cafe', 4, 'Colorful cafe known for tacos and brunch dishes'),
(76, 3, 'Naughty Nuri’s', 'nuri.jpg', 'BBQ & Grill', 5, 'Famous restaurant known for ribs and cocktails'),
(77, 3, 'Jimbaran Bay Seafood', 'jimbaran.jpg', 'Seafood', 5, 'Beachside dining known for fresh grilled seafood'),
(78, 3, 'Bambu Restaurant', 'bambu.jpg', 'Indonesian', 5, 'Elegant restaurant known for authentic Indonesian dishes'),
(79, 3, 'Hujan Locale', 'hujan.jpg', 'Asian', 5, 'Modern restaurant known for Southeast Asian flavors'),
(80, 3, 'Crate Cafe', 'crate.jpg', 'Cafe', 4, 'Popular Canggu cafe known for brunch and coffee'),
(81, 3, 'Finns Beach Club', 'finns.jpg', 'International', 5, 'Famous beach club known for dining and ocean views'),
(82, 3, 'Swept Away', 'swept.jpg', 'International', 5, 'Riverside restaurant known for romantic dining experience'),
(83, 3, 'The Cave Bali', 'cave.jpg', 'Fine Dining', 5, 'Unique cave restaurant known for luxury dining experience'),
(84, 3, 'KYND Community', 'kynd.jpg', 'Vegan', 4, 'Popular vegan cafe known for smoothie bowls and desserts'),
(85, 3, 'Peloton Supershop', 'peloton.jpg', 'Vegan & Cafe', 4, 'Trendy vegan cafe known for healthy comfort food'),
(86, 3, 'Da Maria', 'damaria.jpg', 'Italian', 4, 'Stylish restaurant known for Italian dishes and nightlife'),
(87, 3, 'Motel Mexicola', 'mexicola.jpg', 'Mexican', 4, 'Vibrant restaurant known for Mexican food and party vibe'),
(88, 3, 'Barbacoa Bali', 'barba.jpg', 'Latin American', 5, 'Popular grill restaurant known for smoked meats'),
(89, 3, 'Shady Shack', 'shady.jpg', 'Healthy Cafe', 4, 'Cozy cafe known for vegetarian and healthy dishes'),
(90, 3, 'Clear Cafe', 'clear.jpg', 'Healthy & Asian', 4, 'Wellness cafe known for organic meals and juices'),
(91, 3, 'Cafe Lotus', 'lotus.jpg', 'Indonesian', 4, 'Scenic cafe known for dining beside lotus pond');

-- --------------------------------------------------------

--
-- Table structure for table `destination_reviews`
--

CREATE TABLE `destination_reviews` (
  `id` int(11) NOT NULL,
  `destination_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `review` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `destination_reviews`
--

INSERT INTO `destination_reviews` (`id`, `destination_id`, `user_id`, `review`, `created_at`) VALUES
(5, 1, 15, 'I recently spent a week in Goa, and it was an amazing mix of relaxation and adventure. The beaches are absolutely stunning — soft golden sand, clear waters, and the vibe is just so laid-back. I stayed near Baga and Calangute, which are perfect if you like some nightlife and beach shacks. The sunsets there are magical. The food in Goa is incredible. From local seafood thalis to Goan curries and beachside cocktails, every meal was a treat. I loved trying the Portuguese-influenced dishes like vindaloo and sorpotel. If you like exploring, the heritage spots in Old Goa are worth a visit — churches, forts, and quiet corners full of history. Renting a scooter made getting around super easy, and the roads are scenic too.', '2026-03-10 20:33:58');

-- --------------------------------------------------------

--
-- Table structure for table `dest_reviews`
--

CREATE TABLE `dest_reviews` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `destination_id` int(11) NOT NULL,
  `rating` int(11) NOT NULL CHECK (`rating` between 1 and 5),
  `comment` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `itineraries`
--

CREATE TABLE `itineraries` (
  `id` int(11) NOT NULL,
  `trip_id` int(11) DEFAULT NULL,
  `content` longtext DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `itinerary_items`
--

CREATE TABLE `itinerary_items` (
  `id` int(11) NOT NULL,
  `itinerary_id` int(11) NOT NULL,
  `day_num` int(11) NOT NULL,
  `type` varchar(50) DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL,
  `item_name` varchar(255) DEFAULT NULL,
  `category` varchar(100) DEFAULT NULL,
  `start_time` varchar(20) DEFAULT NULL,
  `duration_min` int(11) DEFAULT 0,
  `order_in_day` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `user_name` varchar(100) NOT NULL,
  `rating` int(11) NOT NULL,
  `review` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`id`, `user_id`, `user_name`, `rating`, `review`, `created_at`) VALUES
(27, 15, '', 5, 'I recently used TripOps to plan my trip, and it honestly made everything so much easier. The dashboard was simple to use, and I loved how it helped organize my trip details in one place. The packing assistant was especially helpful—it suggested useful items based on my trip, which saved me a lot of time and stress while preparing. Overall, the experience felt smooth and well thought out. TripOps definitely made my travel planning more organized and enjoyable, and I’d happily use it again for future trips.\r\n', '2026-03-10 15:12:10');

-- --------------------------------------------------------

--
-- Table structure for table `review_likes`
--

CREATE TABLE `review_likes` (
  `id` int(11) NOT NULL,
  `review_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `type` enum('like','dislike') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `smart_packing_items`
--

CREATE TABLE `smart_packing_items` (
  `id` int(11) NOT NULL,
  `profile_id` int(11) NOT NULL,
  `category` varchar(50) NOT NULL,
  `item_name` varchar(100) NOT NULL,
  `quantity` int(11) NOT NULL,
  `is_packed` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `smart_packing_items`
--

INSERT INTO `smart_packing_items` (`id`, `profile_id`, `category`, `item_name`, `quantity`, `is_packed`) VALUES
(1598, 43, '👕 Clothing', 'Tops/Shirts (8)', 1, 0),
(1599, 43, '👕 Clothing', 'Bottoms/Pants (4)', 1, 0),
(1600, 43, '👕 Clothing', '11 Undergarments', 1, 0),
(1601, 43, '👕 Clothing', 'Socks (7)', 1, 0),
(1602, 43, '👕 Clothing', 'Sleepwear', 1, 0),
(1603, 43, '👕 Clothing', '1-2 Casual Dresses', 1, 0),
(1604, 43, '👕 Clothing', '2-3 Lightweight Shirts', 1, 0),
(1605, 43, '👕 Clothing', 'Shorts', 1, 0),
(1606, 43, '👕 Clothing', 'Sun Hat/Cap', 1, 0),
(1607, 43, '👕 Clothing', '1 Formal Dress/Blazer', 1, 0),
(1608, 43, '👟 Footwear', 'Comfortable Walking Shoes', 1, 0),
(1609, 43, '👟 Footwear', 'Sandals/Flip Flops', 1, 0),
(1610, 43, '👟 Footwear', 'Casual Flats/Sneakers', 1, 0),
(1611, 43, '👟 Footwear', 'Formal Shoes', 1, 0),
(1612, 43, '🧴 Toiletries & Personal Care', 'Toothbrush & Toothpaste', 1, 0),
(1613, 43, '🧴 Toiletries & Personal Care', 'Soap/Body Wash', 1, 0),
(1614, 43, '🧴 Toiletries & Personal Care', 'Shampoo & Conditioner', 1, 0),
(1615, 43, '🧴 Toiletries & Personal Care', 'Deodorant', 1, 0),
(1616, 43, '🧴 Toiletries & Personal Care', 'Hairbrush/Comb', 1, 0),
(1617, 43, '🧴 Toiletries & Personal Care', 'Skincare Products (basic)', 1, 0),
(1618, 43, '🧴 Toiletries & Personal Care', 'Face Wash', 1, 0),
(1619, 43, '🧴 Toiletries & Personal Care', 'Feminine Hygiene Products', 1, 0),
(1620, 43, '🧴 Toiletries & Personal Care', 'Makeup & Remover (small)', 1, 0),
(1621, 43, '🧴 Toiletries & Personal Care', 'Moisturizer', 1, 0),
(1622, 43, '🧴 Toiletries & Personal Care', 'Antiseptic/Disinfectant', 1, 0),
(1623, 43, '📱 Electronics', 'Mobile Phone & Charger', 1, 0),
(1624, 43, '📱 Electronics', 'Power Bank (10000 mAh)', 1, 0),
(1625, 43, '📱 Electronics', 'Portable Fan/Hand Warmer', 1, 0),
(1626, 43, '📄 Documents', 'ID/Passport', 1, 0),
(1627, 43, '📄 Documents', 'Travel Tickets/Bookings', 1, 0),
(1628, 43, '📄 Documents', 'Credit/Debit Cards', 1, 0),
(1629, 43, '📄 Documents', 'Cash (Local Currency)', 1, 0),
(1630, 43, '📄 Documents', 'Travel Insurance Certificate', 1, 0),
(1631, 43, '📄 Documents', 'Emergency Contact List', 1, 0),
(1632, 43, '💊 Health', 'Prescribed Medications', 1, 0),
(1633, 43, '💊 Health', 'Pain Reliever (Paracetamol)', 1, 0),
(1634, 43, '💊 Health', 'Antihistamine', 1, 0),
(1635, 43, '💊 Health', 'Bandages/First Aid Kit', 1, 0),
(1636, 43, '💊 Health', 'Antiseptic Cream', 1, 0),
(1637, 43, '💊 Health', 'Stomach Remedies', 1, 0),
(1638, 43, '💊 Health', 'Period Pain Relief', 1, 0),
(1639, 43, '💊 Health', 'Sunscreen (SPF 30+)', 1, 0),
(1640, 43, '👜 Accessories', 'Sunglasses', 1, 1),
(1641, 43, '👜 Accessories', 'Reusable Water Bottle', 1, 1),
(1642, 43, '👜 Accessories', 'Umbrella/Raincoat', 1, 1),
(1644, 43, '👜 Accessories', 'Small Crossbody Bag', 1, 0),
(1646, 43, '🎒 Miscellaneous', 'Travel Adapter/Converter', 1, 0),
(1647, 43, '🎒 Miscellaneous', 'Earplugs/Eye Mask', 1, 0),
(1648, 43, '🎒 Miscellaneous', 'Travel Pillow', 1, 0),
(1649, 43, '🎒 Miscellaneous', 'Zip Lock Bags', 1, 0),
(1650, 43, '🎒 Miscellaneous', 'Pen & Notebook', 1, 0),
(1651, 43, '🎒 Miscellaneous', 'Tissue Pack', 1, 0),
(1652, 44, '👕 Clothing', 'Tops/Shirts (5)', 1, 0),
(1653, 44, '👕 Clothing', 'Bottoms/Pants (3)', 1, 0),
(1654, 44, '👕 Clothing', '5 Undergarments', 1, 0),
(1655, 44, '👕 Clothing', 'Socks (5)', 1, 0),
(1656, 44, '👕 Clothing', 'Sleepwear', 1, 0),
(1657, 44, '👕 Clothing', 'Vest/Undershirt (2)', 1, 0),
(1658, 44, '👕 Clothing', '2-3 Lightweight Shirts', 1, 0),
(1659, 44, '👕 Clothing', 'Shorts', 1, 0),
(1660, 44, '👕 Clothing', 'Sun Hat/Cap', 1, 0),
(1661, 44, '👕 Clothing', '1-2 Active/Sports Wear', 1, 0),
(1662, 44, '👕 Clothing', 'Hiking Pants', 1, 0),
(1663, 44, '👟 Footwear', 'Comfortable Walking Shoes', 1, 0),
(1664, 44, '👟 Footwear', 'Sandals/Flip Flops', 1, 0),
(1665, 44, '👟 Footwear', 'Casual Sneakers', 1, 0),
(1666, 44, '👟 Footwear', 'Hiking Boots', 1, 0),
(1667, 44, '🧴 Toiletries & Personal Care', 'Toothbrush & Toothpaste', 1, 0),
(1668, 44, '🧴 Toiletries & Personal Care', 'Soap/Body Wash', 1, 0),
(1669, 44, '🧴 Toiletries & Personal Care', 'Shampoo & Conditioner', 1, 0),
(1670, 44, '🧴 Toiletries & Personal Care', 'Deodorant', 1, 0),
(1671, 44, '🧴 Toiletries & Personal Care', 'Hairbrush/Comb', 1, 0),
(1672, 44, '🧴 Toiletries & Personal Care', 'Skincare Products (basic)', 1, 0),
(1673, 44, '🧴 Toiletries & Personal Care', 'Razor & Shaving Cream', 1, 0),
(1674, 44, '🧴 Toiletries & Personal Care', 'Face Wash', 1, 0),
(1675, 44, '🧴 Toiletries & Personal Care', 'Antiseptic/Disinfectant', 1, 0),
(1676, 44, '📱 Electronics', 'Mobile Phone & Charger', 1, 0),
(1677, 44, '📱 Electronics', 'Power Bank (10000 mAh)', 1, 0),
(1678, 44, '📱 Electronics', 'Portable Fan/Hand Warmer', 1, 0),
(1679, 44, '📄 Documents', 'ID/Passport', 1, 0),
(1680, 44, '📄 Documents', 'Travel Tickets/Bookings', 1, 0),
(1681, 44, '📄 Documents', 'Credit/Debit Cards', 1, 0),
(1682, 44, '📄 Documents', 'Cash (Local Currency)', 1, 0),
(1683, 44, '📄 Documents', 'Travel Insurance Certificate', 1, 0),
(1684, 44, '📄 Documents', 'Emergency Contact List', 1, 0),
(1685, 44, '💊 Health', 'Prescribed Medications', 1, 0),
(1686, 44, '💊 Health', 'Pain Reliever (Paracetamol)', 1, 0),
(1687, 44, '💊 Health', 'Antihistamine', 1, 0),
(1688, 44, '💊 Health', 'Bandages/First Aid Kit', 1, 0),
(1689, 44, '💊 Health', 'Antiseptic Cream', 1, 0),
(1690, 44, '💊 Health', 'Stomach Remedies', 1, 0),
(1691, 44, '💊 Health', 'Sunscreen (SPF 30+)', 1, 0),
(1692, 44, '👜 Accessories', 'Sunglasses', 1, 1),
(1693, 44, '👜 Accessories', 'Reusable Water Bottle', 1, 1),
(1694, 44, '👜 Accessories', 'Umbrella/Raincoat', 1, 0),
(1695, 44, '👜 Accessories', 'Watch', 1, 1),
(1696, 44, '👜 Accessories', 'Backpack/Day Bag', 1, 0),
(1697, 44, '🎒 Miscellaneous', 'Travel Adapter/Converter', 1, 0),
(1698, 44, '🎒 Miscellaneous', 'Earplugs/Eye Mask', 1, 0),
(1699, 44, '🎒 Miscellaneous', 'Travel Pillow', 1, 0),
(1700, 44, '🎒 Miscellaneous', 'Zip Lock Bags', 1, 0),
(1701, 44, '🎒 Miscellaneous', 'Pen & Notebook', 1, 0),
(1702, 44, '🎒 Miscellaneous', 'Tissue Pack', 1, 0),
(1703, 44, '🎒 Miscellaneous', 'Rope/Multi-tool', 1, 0),
(1704, 45, '👕 Clothing', 'Tops/Shirts (4)', 1, 0),
(1705, 45, '👕 Clothing', 'Bottoms/Pants (2)', 1, 0),
(1706, 45, '👕 Clothing', '6 Undergarments', 1, 0),
(1707, 45, '👕 Clothing', 'Socks (4)', 1, 0),
(1708, 45, '👕 Clothing', 'Sleepwear', 1, 0),
(1709, 45, '👕 Clothing', '1-2 Casual Dresses', 1, 0),
(1710, 45, '👕 Clothing', '2-3 Lightweight Shirts', 1, 0),
(1711, 45, '👕 Clothing', 'Shorts', 1, 0),
(1712, 45, '👕 Clothing', 'Sun Hat/Cap', 1, 0),
(1713, 45, '👕 Clothing', '1-2 Active/Sports Wear', 1, 0),
(1714, 45, '👕 Clothing', 'Hiking Pants', 1, 0),
(1715, 45, '👟 Footwear', 'Comfortable Walking Shoes', 1, 0),
(1716, 45, '👟 Footwear', 'Sandals/Flip Flops', 1, 0),
(1717, 45, '👟 Footwear', 'Casual Flats/Sneakers', 1, 0),
(1718, 45, '👟 Footwear', 'Hiking Boots', 1, 0),
(1719, 45, '🧴 Toiletries & Personal Care', 'Toothbrush & Toothpaste', 1, 0),
(1720, 45, '🧴 Toiletries & Personal Care', 'Soap/Body Wash', 1, 0),
(1721, 45, '🧴 Toiletries & Personal Care', 'Shampoo & Conditioner', 1, 0),
(1722, 45, '🧴 Toiletries & Personal Care', 'Deodorant', 1, 0),
(1723, 45, '🧴 Toiletries & Personal Care', 'Hairbrush/Comb', 1, 0),
(1724, 45, '🧴 Toiletries & Personal Care', 'Skincare Products (basic)', 1, 0),
(1725, 45, '🧴 Toiletries & Personal Care', 'Face Wash', 1, 0),
(1726, 45, '🧴 Toiletries & Personal Care', 'Feminine Hygiene Products', 1, 0),
(1727, 45, '🧴 Toiletries & Personal Care', 'Makeup & Remover (small)', 1, 0),
(1728, 45, '🧴 Toiletries & Personal Care', 'Moisturizer', 1, 0),
(1729, 45, '🧴 Toiletries & Personal Care', 'Antiseptic/Disinfectant', 1, 0),
(1730, 45, '📱 Electronics', 'Mobile Phone & Charger', 1, 0),
(1731, 45, '📱 Electronics', 'Power Bank (10000 mAh)', 1, 0),
(1732, 45, '📱 Electronics', 'Headphones/Earbuds', 1, 0),
(1733, 45, '📱 Electronics', 'Portable Fan/Hand Warmer', 1, 0),
(1734, 45, '📄 Documents', 'ID/Passport', 1, 0),
(1735, 45, '📄 Documents', 'Travel Tickets/Bookings', 1, 0),
(1736, 45, '📄 Documents', 'Credit/Debit Cards', 1, 0),
(1737, 45, '📄 Documents', 'Cash (Local Currency)', 1, 0),
(1738, 45, '📄 Documents', 'Travel Insurance Certificate', 1, 0),
(1739, 45, '📄 Documents', 'Emergency Contact List', 1, 0),
(1740, 45, '💊 Health', 'Prescribed Medications', 1, 0),
(1741, 45, '💊 Health', 'Pain Reliever (Paracetamol)', 1, 0),
(1742, 45, '💊 Health', 'Antihistamine', 1, 0),
(1743, 45, '💊 Health', 'Bandages/First Aid Kit', 1, 0),
(1744, 45, '💊 Health', 'Antiseptic Cream', 1, 0),
(1745, 45, '💊 Health', 'Stomach Remedies', 1, 0),
(1746, 45, '💊 Health', 'Period Pain Relief', 1, 0),
(1747, 45, '💊 Health', 'Sunscreen (SPF 30+)', 1, 0),
(1748, 45, '👜 Accessories', 'Sunglasses', 1, 0),
(1749, 45, '👜 Accessories', 'Reusable Water Bottle', 1, 0),
(1750, 45, '👜 Accessories', 'Umbrella/Raincoat', 1, 0),
(1751, 45, '👜 Accessories', 'Watch', 1, 0),
(1752, 45, '👜 Accessories', 'Small Crossbody Bag', 1, 0),
(1753, 45, '👜 Accessories', 'Jewelry (minimal)', 1, 0),
(1754, 45, '👜 Accessories', 'Day Bag / Small Backpack', 1, 0),
(1755, 45, '🎒 Miscellaneous', 'Travel Adapter/Converter', 1, 0),
(1756, 45, '🎒 Miscellaneous', 'Earplugs/Eye Mask', 1, 0),
(1757, 45, '🎒 Miscellaneous', 'Travel Pillow', 1, 0),
(1758, 45, '🎒 Miscellaneous', 'Zip Lock Bags', 1, 0),
(1759, 45, '🎒 Miscellaneous', 'Pen & Notebook', 1, 0),
(1760, 45, '🎒 Miscellaneous', 'Tissue Pack', 1, 0),
(1761, 45, '🎒 Miscellaneous', 'Rope/Multi-tool', 1, 0),
(1762, 45, '🎒 Miscellaneous', 'Perfume (small bottle)', 1, 0),
(1763, 46, '👕 Clothing', 'Tops/Shirts (5)', 1, 0),
(1764, 46, '👕 Clothing', 'Bottoms/Pants (3)', 1, 0),
(1765, 46, '👕 Clothing', '7 Undergarments', 1, 0),
(1766, 46, '👕 Clothing', 'Socks (5)', 1, 0),
(1767, 46, '👕 Clothing', 'Sleepwear', 1, 0),
(1768, 46, '👕 Clothing', '1-2 Casual Dresses', 1, 0),
(1769, 46, '👕 Clothing', '2-3 Lightweight Shirts', 1, 0),
(1770, 46, '👕 Clothing', 'Shorts', 1, 0),
(1771, 46, '👕 Clothing', 'Sun Hat/Cap', 1, 0),
(1772, 46, '👟 Footwear', 'Comfortable Walking Shoes', 1, 0),
(1773, 46, '👟 Footwear', 'Sandals/Flip Flops', 1, 0),
(1774, 46, '👟 Footwear', 'Casual Flats/Sneakers', 1, 0),
(1775, 46, '🧴 Toiletries & Personal Care', 'Toothbrush & Toothpaste', 1, 0),
(1776, 46, '🧴 Toiletries & Personal Care', 'Soap/Body Wash', 1, 0),
(1777, 46, '🧴 Toiletries & Personal Care', 'Shampoo & Conditioner', 1, 0),
(1778, 46, '🧴 Toiletries & Personal Care', 'Deodorant', 1, 0),
(1779, 46, '🧴 Toiletries & Personal Care', 'Hairbrush/Comb', 1, 0),
(1780, 46, '🧴 Toiletries & Personal Care', 'Skincare Products (basic)', 1, 0),
(1781, 46, '🧴 Toiletries & Personal Care', 'Face Wash', 1, 0),
(1782, 46, '🧴 Toiletries & Personal Care', 'Feminine Hygiene Products', 1, 0),
(1783, 46, '🧴 Toiletries & Personal Care', 'Makeup & Remover (small)', 1, 0),
(1784, 46, '🧴 Toiletries & Personal Care', 'Moisturizer', 1, 0),
(1785, 46, '🧴 Toiletries & Personal Care', 'Antiseptic/Disinfectant', 1, 0),
(1786, 46, '📱 Electronics', 'Mobile Phone & Charger', 1, 0),
(1787, 46, '📱 Electronics', 'Power Bank (10000 mAh)', 1, 0),
(1788, 46, '📱 Electronics', 'Headphones/Earbuds', 1, 0),
(1789, 46, '📱 Electronics', 'Portable Fan/Hand Warmer', 1, 0),
(1790, 46, '📄 Documents', 'ID/Passport', 1, 0),
(1791, 46, '📄 Documents', 'Travel Tickets/Bookings', 1, 0),
(1792, 46, '📄 Documents', 'Credit/Debit Cards', 1, 0),
(1793, 46, '📄 Documents', 'Cash (Local Currency)', 1, 0),
(1794, 46, '📄 Documents', 'Travel Insurance Certificate', 1, 0),
(1795, 46, '📄 Documents', 'Emergency Contact List', 1, 0),
(1796, 46, '💊 Health', 'Prescribed Medications', 1, 0),
(1797, 46, '💊 Health', 'Pain Reliever (Paracetamol)', 1, 0),
(1798, 46, '💊 Health', 'Antihistamine', 1, 0),
(1799, 46, '💊 Health', 'Bandages/First Aid Kit', 1, 0),
(1800, 46, '💊 Health', 'Antiseptic Cream', 1, 0),
(1801, 46, '💊 Health', 'Stomach Remedies', 1, 0),
(1802, 46, '💊 Health', 'Period Pain Relief', 1, 0),
(1803, 46, '💊 Health', 'Sunscreen (SPF 30+)', 1, 0),
(1804, 46, '👜 Accessories', 'Sunglasses', 1, 0),
(1805, 46, '👜 Accessories', 'Reusable Water Bottle', 1, 0),
(1806, 46, '👜 Accessories', 'Umbrella/Raincoat', 1, 0),
(1807, 46, '👜 Accessories', 'Watch', 1, 0),
(1808, 46, '👜 Accessories', 'Small Crossbody Bag', 1, 0),
(1809, 46, '👜 Accessories', 'Jewelry (minimal)', 1, 0),
(1810, 46, '👜 Accessories', 'Day Bag / Small Backpack', 1, 0),
(1811, 46, '🎒 Miscellaneous', 'Travel Adapter/Converter', 1, 0),
(1812, 46, '🎒 Miscellaneous', 'Earplugs/Eye Mask', 1, 0),
(1813, 46, '🎒 Miscellaneous', 'Travel Pillow', 1, 0),
(1814, 46, '🎒 Miscellaneous', 'Zip Lock Bags', 1, 0),
(1815, 46, '🎒 Miscellaneous', 'Pen & Notebook', 1, 0),
(1816, 46, '🎒 Miscellaneous', 'Tissue Pack', 1, 0),
(1817, 46, '🎒 Miscellaneous', 'Map/Guide Book', 1, 0),
(1818, 46, '🎒 Miscellaneous', 'Perfume (small bottle)', 1, 0),
(1819, 47, '👕 Clothing', 'Tops/Shirts (8)', 1, 0),
(1820, 47, '👕 Clothing', 'Bottoms/Pants (4)', 1, 0),
(1821, 47, '👕 Clothing', '11 Undergarments', 1, 0),
(1822, 47, '👕 Clothing', 'Socks (7)', 1, 0),
(1823, 47, '👕 Clothing', 'Sleepwear', 1, 0),
(1824, 47, '👕 Clothing', '1-2 Casual Dresses', 1, 0),
(1825, 47, '👕 Clothing', 'Light Jacket', 1, 0),
(1826, 47, '👕 Clothing', '1 Formal Dress/Blazer', 1, 0),
(1827, 47, '👟 Footwear', 'Comfortable Walking Shoes', 1, 0),
(1828, 47, '👟 Footwear', 'Sandals/Flip Flops', 1, 0),
(1829, 47, '👟 Footwear', 'Casual Flats/Sneakers', 1, 0),
(1830, 47, '👟 Footwear', 'Formal Shoes', 1, 0),
(1831, 47, '🧴 Toiletries & Personal Care', 'Toothbrush & Toothpaste', 1, 0),
(1832, 47, '🧴 Toiletries & Personal Care', 'Soap/Body Wash', 1, 0),
(1833, 47, '🧴 Toiletries & Personal Care', 'Shampoo & Conditioner', 1, 0),
(1834, 47, '🧴 Toiletries & Personal Care', 'Deodorant', 1, 0),
(1835, 47, '🧴 Toiletries & Personal Care', 'Hairbrush/Comb', 1, 0),
(1836, 47, '🧴 Toiletries & Personal Care', 'Skincare Products (basic)', 1, 0),
(1837, 47, '🧴 Toiletries & Personal Care', 'Face Wash', 1, 0),
(1838, 47, '🧴 Toiletries & Personal Care', 'Feminine Hygiene Products', 1, 0),
(1839, 47, '🧴 Toiletries & Personal Care', 'Makeup & Remover (small)', 1, 0),
(1840, 47, '🧴 Toiletries & Personal Care', 'Moisturizer', 1, 0),
(1841, 47, '🧴 Toiletries & Personal Care', 'Antiseptic/Disinfectant', 1, 0),
(1842, 47, '📱 Electronics', 'Mobile Phone & Charger', 1, 0),
(1843, 47, '📱 Electronics', 'Power Bank (10000 mAh)', 1, 0),
(1844, 47, '📱 Electronics', 'Headphones/Earbuds', 1, 0),
(1845, 47, '📄 Documents', 'ID/Passport', 1, 0),
(1846, 47, '📄 Documents', 'Travel Tickets/Bookings', 1, 0),
(1847, 47, '📄 Documents', 'Credit/Debit Cards', 1, 0),
(1848, 47, '📄 Documents', 'Cash (Local Currency)', 1, 0),
(1849, 47, '📄 Documents', 'Travel Insurance Certificate', 1, 0),
(1850, 47, '📄 Documents', 'Emergency Contact List', 1, 0),
(1851, 47, '💊 Health', 'Prescribed Medications', 1, 0),
(1852, 47, '💊 Health', 'Pain Reliever (Paracetamol)', 1, 0),
(1853, 47, '💊 Health', 'Antihistamine', 1, 0),
(1854, 47, '💊 Health', 'Bandages/First Aid Kit', 1, 0),
(1855, 47, '💊 Health', 'Antiseptic Cream', 1, 0),
(1856, 47, '💊 Health', 'Stomach Remedies', 1, 0),
(1857, 47, '💊 Health', 'Period Pain Relief', 1, 0),
(1859, 47, '👜 Accessories', 'Reusable Water Bottle', 1, 0),
(1860, 47, '👜 Accessories', 'Umbrella/Raincoat', 1, 1),
(1861, 47, '👜 Accessories', 'Watch', 1, 0),
(1862, 47, '👜 Accessories', 'Small Crossbody Bag', 1, 0),
(1863, 47, '👜 Accessories', 'Jewelry (minimal)', 1, 0),
(1864, 47, '👜 Accessories', 'Day Bag / Small Backpack', 1, 0),
(1865, 47, '🎒 Miscellaneous', 'Travel Adapter/Converter', 1, 0),
(1866, 47, '🎒 Miscellaneous', 'Earplugs/Eye Mask', 1, 0),
(1867, 47, '🎒 Miscellaneous', 'Travel Pillow', 1, 0),
(1868, 47, '🎒 Miscellaneous', 'Zip Lock Bags', 1, 0),
(1869, 47, '🎒 Miscellaneous', 'Pen & Notebook', 1, 0),
(1870, 47, '🎒 Miscellaneous', 'Tissue Pack', 1, 0),
(1871, 47, '🎒 Miscellaneous', 'Perfume (small bottle)', 1, 0),
(1872, 47, 'Camping', 'MatchStick', 4, 0),
(1873, 48, '👕 Clothing', 'Tops/Shirts (2)', 1, 0),
(1874, 48, '👕 Clothing', 'Bottoms/Pants (1)', 1, 0),
(1875, 48, '👕 Clothing', '2 Undergarments', 1, 0),
(1876, 48, '👕 Clothing', 'Socks (2)', 1, 0),
(1877, 48, '👕 Clothing', 'Sleepwear', 1, 0),
(1878, 48, '👕 Clothing', '2-3 Lightweight Shirts', 1, 0),
(1879, 48, '👕 Clothing', 'Sun Hat/Cap', 1, 0),
(1880, 48, '👟 Footwear', 'Comfortable Walking Shoes', 1, 0),
(1881, 48, '👟 Footwear', 'Sandals/Flip Flops', 1, 0),
(1882, 48, '🧴 Toiletries & Personal Care', 'Toothbrush & Toothpaste', 1, 0),
(1883, 48, '🧴 Toiletries & Personal Care', 'Soap/Body Wash', 1, 0),
(1884, 48, '🧴 Toiletries & Personal Care', 'Shampoo & Conditioner', 1, 0),
(1885, 48, '🧴 Toiletries & Personal Care', 'Deodorant', 1, 0),
(1886, 48, '🧴 Toiletries & Personal Care', 'Hairbrush/Comb', 1, 0),
(1887, 48, '🧴 Toiletries & Personal Care', 'Skincare Products (basic)', 1, 0),
(1888, 48, '🧴 Toiletries & Personal Care', 'Razor & Shaving Cream', 1, 0),
(1889, 48, '🧴 Toiletries & Personal Care', 'Laundry Detergent (small)', 1, 0),
(1890, 48, '🧴 Toiletries & Personal Care', 'Antiseptic/Disinfectant', 1, 0),
(1891, 48, '📱 Electronics', 'Mobile Phone & Charger', 1, 0),
(1892, 48, '📱 Electronics', 'Power Bank (10000 mAh)', 1, 0),
(1893, 48, '📄 Documents', 'ID/Passport', 1, 0),
(1894, 48, '📄 Documents', 'Travel Tickets/Bookings', 1, 0),
(1895, 48, '📄 Documents', 'Credit/Debit Cards', 1, 0),
(1896, 48, '📄 Documents', 'Cash (Local Currency)', 1, 0),
(1897, 48, '💊 Health', 'Prescribed Medications', 1, 0),
(1898, 48, '💊 Health', 'Pain Reliever (Paracetamol)', 1, 0),
(1899, 48, '💊 Health', 'Antihistamine', 1, 0),
(1900, 48, '💊 Health', 'Bandages/First Aid Kit', 1, 0),
(1901, 48, '💊 Health', 'Sunscreen (SPF 30+)', 1, 0),
(1902, 48, '👜 Accessories', 'Sunglasses', 1, 1),
(1903, 48, '👜 Accessories', 'Reusable Water Bottle', 1, 1),
(1904, 48, '👜 Accessories', 'Umbrella/Raincoat', 1, 1),
(1905, 48, '👜 Accessories', 'Day Bag / Small Backpack', 1, 1),
(1906, 48, '🎒 Miscellaneous', 'Travel Adapter/Converter', 1, 0),
(1907, 48, '🎒 Miscellaneous', 'Earplugs/Eye Mask', 1, 0),
(1908, 48, '🎒 Miscellaneous', 'Travel Pillow', 1, 0),
(1909, 48, '🎒 Miscellaneous', 'Zip Lock Bags', 1, 0),
(1910, 49, '👕 Clothing', 'Tops/Shirts (3)', 1, 0),
(1911, 49, '👕 Clothing', 'Bottoms/Pants (2)', 1, 0),
(1912, 49, '👕 Clothing', '5 Undergarments', 1, 0),
(1913, 49, '👕 Clothing', 'Socks (3)', 1, 0),
(1914, 49, '👕 Clothing', 'Sleepwear', 1, 0),
(1915, 49, '👕 Clothing', '1-2 Casual Dresses', 1, 0),
(1916, 49, '👕 Clothing', '2-3 Lightweight Shirts', 1, 0),
(1917, 49, '👕 Clothing', 'Shorts', 1, 0),
(1918, 49, '👕 Clothing', 'Sun Hat/Cap', 1, 0),
(1919, 49, '👕 Clothing', '1-2 Active/Sports Wear', 1, 0),
(1920, 49, '👕 Clothing', 'Hiking Pants', 1, 0),
(1921, 49, '👟 Footwear', 'Comfortable Walking Shoes', 1, 0),
(1922, 49, '👟 Footwear', 'Sandals/Flip Flops', 1, 0),
(1923, 49, '👟 Footwear', 'Casual Flats/Sneakers', 1, 0),
(1924, 49, '👟 Footwear', 'Hiking Boots', 1, 0),
(1925, 49, '🧴 Toiletries & Personal Care', 'Toothbrush & Toothpaste', 1, 0),
(1926, 49, '🧴 Toiletries & Personal Care', 'Soap/Body Wash', 1, 0),
(1927, 49, '🧴 Toiletries & Personal Care', 'Shampoo & Conditioner', 1, 0),
(1928, 49, '🧴 Toiletries & Personal Care', 'Deodorant', 1, 0),
(1929, 49, '🧴 Toiletries & Personal Care', 'Hairbrush/Comb', 1, 0),
(1930, 49, '🧴 Toiletries & Personal Care', 'Skincare Products (basic)', 1, 0),
(1931, 49, '🧴 Toiletries & Personal Care', 'Face Wash', 1, 0),
(1932, 49, '🧴 Toiletries & Personal Care', 'Feminine Hygiene Products', 1, 0),
(1933, 49, '🧴 Toiletries & Personal Care', 'Makeup & Remover (small)', 1, 0),
(1934, 49, '🧴 Toiletries & Personal Care', 'Moisturizer', 1, 0),
(1935, 49, '🧴 Toiletries & Personal Care', 'Laundry Detergent (small)', 1, 0),
(1936, 49, '🧴 Toiletries & Personal Care', 'Antiseptic/Disinfectant', 1, 0),
(1937, 49, '📱 Electronics', 'Mobile Phone & Charger', 1, 0),
(1938, 49, '📱 Electronics', 'Power Bank (10000 mAh)', 1, 0),
(1939, 49, '📱 Electronics', 'Portable Fan/Hand Warmer', 1, 0),
(1940, 49, '📄 Documents', 'ID/Passport', 1, 0),
(1941, 49, '📄 Documents', 'Travel Tickets/Bookings', 1, 0),
(1942, 49, '📄 Documents', 'Credit/Debit Cards', 1, 0),
(1943, 49, '📄 Documents', 'Cash (Local Currency)', 1, 0),
(1944, 49, '📄 Documents', 'Travel Insurance Certificate', 1, 0),
(1945, 49, '📄 Documents', 'Emergency Contact List', 1, 0),
(1946, 49, '💊 Health', 'Prescribed Medications', 1, 0),
(1947, 49, '💊 Health', 'Pain Reliever (Paracetamol)', 1, 0),
(1948, 49, '💊 Health', 'Antihistamine', 1, 0),
(1949, 49, '💊 Health', 'Bandages/First Aid Kit', 1, 0),
(1950, 49, '💊 Health', 'Antiseptic Cream', 1, 0),
(1951, 49, '💊 Health', 'Stomach Remedies', 1, 0),
(1952, 49, '💊 Health', 'Period Pain Relief', 1, 0),
(1953, 49, '💊 Health', 'Sunscreen (SPF 30+)', 1, 0),
(1954, 49, '👜 Accessories', 'Sunglasses', 1, 0),
(1955, 49, '👜 Accessories', 'Reusable Water Bottle', 1, 0),
(1956, 49, '👜 Accessories', 'Umbrella/Raincoat', 1, 1),
(1957, 49, '👜 Accessories', 'Watch', 1, 0),
(1958, 49, '👜 Accessories', 'Small Crossbody Bag', 1, 0),
(1959, 49, '👜 Accessories', 'Day Bag / Small Backpack', 1, 0),
(1960, 49, '🎒 Miscellaneous', 'Travel Adapter/Converter', 1, 0),
(1961, 49, '🎒 Miscellaneous', 'Earplugs/Eye Mask', 1, 0),
(1962, 49, '🎒 Miscellaneous', 'Travel Pillow', 1, 0),
(1963, 49, '🎒 Miscellaneous', 'Zip Lock Bags', 1, 0),
(1964, 49, '🎒 Miscellaneous', 'Pen & Notebook', 1, 0),
(1965, 49, '🎒 Miscellaneous', 'Tissue Pack', 1, 0),
(1966, 49, '🎒 Miscellaneous', 'Rope/Multi-tool', 1, 0),
(1967, 50, '👕 Clothing', 'Tops/Shirts (5)', 1, 1),
(1968, 50, '👕 Clothing', 'Bottoms/Pants (3)', 1, 0),
(1969, 50, '👕 Clothing', '7 Undergarments', 1, 0),
(1970, 50, '👕 Clothing', 'Socks (5)', 1, 0),
(1971, 50, '👕 Clothing', 'Sleepwear', 1, 0),
(1972, 50, '👕 Clothing', '1-2 Casual Dresses', 1, 0),
(1973, 50, '👕 Clothing', '2-3 Lightweight Shirts', 1, 0),
(1974, 50, '👕 Clothing', 'Shorts', 1, 0),
(1975, 50, '👕 Clothing', 'Sun Hat/Cap', 1, 0),
(1976, 50, '👕 Clothing', '1-2 Active/Sports Wear', 1, 0),
(1977, 50, '👕 Clothing', 'Hiking Pants', 1, 0),
(1978, 50, '👟 Footwear', 'Comfortable Walking Shoes', 1, 0),
(1979, 50, '👟 Footwear', 'Sandals/Flip Flops', 1, 0),
(1980, 50, '👟 Footwear', 'Casual Flats/Sneakers', 1, 0),
(1981, 50, '👟 Footwear', 'Hiking Boots', 1, 0),
(1982, 50, '🧴 Toiletries & Personal Care', 'Toothbrush & Toothpaste', 1, 0),
(1983, 50, '🧴 Toiletries & Personal Care', 'Soap/Body Wash', 1, 0),
(1984, 50, '🧴 Toiletries & Personal Care', 'Shampoo & Conditioner', 1, 0),
(1985, 50, '🧴 Toiletries & Personal Care', 'Deodorant', 1, 0),
(1986, 50, '🧴 Toiletries & Personal Care', 'Hairbrush/Comb', 1, 0),
(1987, 50, '🧴 Toiletries & Personal Care', 'Skincare Products (basic)', 1, 0),
(1988, 50, '🧴 Toiletries & Personal Care', 'Face Wash', 1, 0),
(1989, 50, '🧴 Toiletries & Personal Care', 'Feminine Hygiene Products', 1, 0),
(1990, 50, '🧴 Toiletries & Personal Care', 'Makeup & Remover (small)', 1, 0),
(1991, 50, '🧴 Toiletries & Personal Care', 'Moisturizer', 1, 0),
(1992, 50, '🧴 Toiletries & Personal Care', 'Antiseptic/Disinfectant', 1, 0),
(1993, 50, '📱 Electronics', 'Mobile Phone & Charger', 1, 0),
(1994, 50, '📱 Electronics', 'Power Bank (10000 mAh)', 1, 0),
(1995, 50, '📱 Electronics', 'Headphones/Earbuds', 1, 0),
(1996, 50, '📱 Electronics', 'Portable Fan/Hand Warmer', 1, 0),
(1997, 50, '📄 Documents', 'ID/Passport', 1, 0),
(1998, 50, '📄 Documents', 'Travel Tickets/Bookings', 1, 0),
(1999, 50, '📄 Documents', 'Credit/Debit Cards', 1, 0),
(2000, 50, '📄 Documents', 'Cash (Local Currency)', 1, 0),
(2001, 50, '📄 Documents', 'Travel Insurance Certificate', 1, 0),
(2002, 50, '📄 Documents', 'Emergency Contact List', 1, 0),
(2003, 50, '💊 Health', 'Prescribed Medications', 1, 0),
(2004, 50, '💊 Health', 'Pain Reliever (Paracetamol)', 1, 0),
(2005, 50, '💊 Health', 'Antihistamine', 1, 0),
(2006, 50, '💊 Health', 'Bandages/First Aid Kit', 1, 0),
(2007, 50, '💊 Health', 'Antiseptic Cream', 1, 0),
(2008, 50, '💊 Health', 'Stomach Remedies', 1, 0),
(2009, 50, '💊 Health', 'Period Pain Relief', 1, 0),
(2010, 50, '💊 Health', 'Sunscreen (SPF 30+)', 1, 0),
(2011, 50, '👜 Accessories', 'Sunglasses', 1, 1),
(2012, 50, '👜 Accessories', 'Reusable Water Bottle', 1, 0),
(2013, 50, '👜 Accessories', 'Umbrella/Raincoat', 1, 1),
(2014, 50, '👜 Accessories', 'Watch', 1, 1),
(2015, 50, '👜 Accessories', 'Small Crossbody Bag', 1, 0),
(2016, 50, '👜 Accessories', 'Jewelry (minimal)', 1, 0),
(2017, 50, '👜 Accessories', 'Day Bag / Small Backpack', 1, 0),
(2018, 50, '🎒 Miscellaneous', 'Travel Adapter/Converter', 1, 0),
(2019, 50, '🎒 Miscellaneous', 'Earplugs/Eye Mask', 1, 0),
(2020, 50, '🎒 Miscellaneous', 'Travel Pillow', 1, 0),
(2021, 50, '🎒 Miscellaneous', 'Zip Lock Bags', 1, 0),
(2022, 50, '🎒 Miscellaneous', 'Pen & Notebook', 1, 0),
(2023, 50, '🎒 Miscellaneous', 'Tissue Pack', 1, 0),
(2024, 50, '🎒 Miscellaneous', 'Rope/Multi-tool', 1, 0),
(2025, 50, '🎒 Miscellaneous', 'Perfume (small bottle)', 1, 0),
(2082, 52, '👕 Clothing', 'Tops/Shirts (2)', 1, 0),
(2083, 52, '👕 Clothing', 'Bottoms/Pants (1)', 1, 0),
(2084, 52, '👕 Clothing', '2 Undergarments', 1, 0),
(2085, 52, '👕 Clothing', 'Socks (2)', 1, 0),
(2086, 52, '👕 Clothing', 'Sleepwear', 1, 0),
(2087, 52, '👕 Clothing', '2-3 Lightweight Shirts', 1, 0),
(2088, 52, '👕 Clothing', 'Sun Hat/Cap', 1, 0),
(2089, 52, '👟 Footwear', 'Comfortable Walking Shoes', 1, 0),
(2090, 52, '👟 Footwear', 'Sandals/Flip Flops', 1, 0),
(2091, 52, '🧴 Toiletries & Personal Care', 'Toothbrush & Toothpaste', 1, 0),
(2092, 52, '🧴 Toiletries & Personal Care', 'Soap/Body Wash', 1, 0),
(2093, 52, '🧴 Toiletries & Personal Care', 'Shampoo & Conditioner', 1, 0),
(2094, 52, '🧴 Toiletries & Personal Care', 'Deodorant', 1, 0),
(2095, 52, '🧴 Toiletries & Personal Care', 'Hairbrush/Comb', 1, 0),
(2096, 52, '🧴 Toiletries & Personal Care', 'Skincare Products (basic)', 1, 0),
(2097, 52, '🧴 Toiletries & Personal Care', 'Razor & Shaving Cream', 1, 0),
(2098, 52, '🧴 Toiletries & Personal Care', 'Laundry Detergent (small)', 1, 0),
(2099, 52, '🧴 Toiletries & Personal Care', 'Antiseptic/Disinfectant', 1, 0),
(2100, 52, '📱 Electronics', 'Mobile Phone & Charger', 1, 0),
(2101, 52, '📱 Electronics', 'Power Bank (10000 mAh)', 1, 0),
(2102, 52, '📄 Documents', 'ID/Passport', 1, 0),
(2103, 52, '📄 Documents', 'Travel Tickets/Bookings', 1, 0),
(2104, 52, '📄 Documents', 'Credit/Debit Cards', 1, 0),
(2105, 52, '📄 Documents', 'Cash (Local Currency)', 1, 0),
(2106, 52, '💊 Health', 'Prescribed Medications', 1, 0),
(2107, 52, '💊 Health', 'Pain Reliever (Paracetamol)', 1, 0),
(2108, 52, '💊 Health', 'Antihistamine', 1, 0),
(2109, 52, '💊 Health', 'Bandages/First Aid Kit', 1, 0),
(2110, 52, '💊 Health', 'Sunscreen (SPF 30+)', 1, 0),
(2111, 52, '👜 Accessories', 'Sunglasses', 1, 1),
(2112, 52, '👜 Accessories', 'Reusable Water Bottle', 1, 0),
(2113, 52, '👜 Accessories', 'Umbrella/Raincoat', 1, 1),
(2114, 52, '👜 Accessories', 'Day Bag / Small Backpack', 1, 0),
(2115, 52, '🎒 Miscellaneous', 'Travel Adapter/Converter', 1, 0),
(2116, 52, '🎒 Miscellaneous', 'Earplugs/Eye Mask', 1, 0),
(2117, 52, '🎒 Miscellaneous', 'Travel Pillow', 1, 0),
(2118, 52, '🎒 Miscellaneous', 'Zip Lock Bags', 1, 0),
(2119, 53, '👕 Clothing', 'Tops/Shirts (10)', 1, 0),
(2120, 53, '👕 Clothing', 'Bottoms/Pants (5)', 1, 0),
(2121, 53, '👕 Clothing', '11 Undergarments', 1, 0),
(2122, 53, '👕 Clothing', 'Socks (7)', 1, 0),
(2123, 53, '👕 Clothing', 'Sleepwear', 1, 0),
(2124, 53, '👕 Clothing', '1-2 Casual Dresses', 1, 0),
(2125, 53, '👕 Clothing', '2-3 Lightweight Shirts', 1, 0),
(2126, 53, '👕 Clothing', 'Shorts', 1, 0),
(2127, 53, '👕 Clothing', 'Sun Hat/Cap', 1, 0),
(2128, 53, '👕 Clothing', '1-2 Active/Sports Wear', 1, 0),
(2129, 53, '👕 Clothing', 'Hiking Pants', 1, 0),
(2130, 53, '👟 Footwear', 'Comfortable Walking Shoes', 1, 0),
(2131, 53, '👟 Footwear', 'Sandals/Flip Flops', 1, 0),
(2132, 53, '👟 Footwear', 'Casual Flats/Sneakers', 1, 0),
(2133, 53, '👟 Footwear', 'Hiking Boots', 1, 0),
(2134, 53, '🧴 Toiletries & Personal Care', 'Toothbrush & Toothpaste', 1, 0),
(2135, 53, '🧴 Toiletries & Personal Care', 'Soap/Body Wash', 1, 0),
(2136, 53, '🧴 Toiletries & Personal Care', 'Shampoo & Conditioner', 1, 0),
(2137, 53, '🧴 Toiletries & Personal Care', 'Deodorant', 1, 0),
(2138, 53, '🧴 Toiletries & Personal Care', 'Hairbrush/Comb', 1, 0),
(2139, 53, '🧴 Toiletries & Personal Care', 'Skincare Products (basic)', 1, 0),
(2140, 53, '🧴 Toiletries & Personal Care', 'Face Wash', 1, 0),
(2141, 53, '🧴 Toiletries & Personal Care', 'Feminine Hygiene Products', 1, 0),
(2142, 53, '🧴 Toiletries & Personal Care', 'Makeup & Remover (small)', 1, 0),
(2143, 53, '🧴 Toiletries & Personal Care', 'Moisturizer', 1, 0),
(2144, 53, '🧴 Toiletries & Personal Care', 'Antiseptic/Disinfectant', 1, 0),
(2145, 53, '📱 Electronics', 'Mobile Phone & Charger', 1, 0),
(2146, 53, '📱 Electronics', 'Power Bank (10000 mAh)', 1, 0),
(2147, 53, '📱 Electronics', 'Portable Fan/Hand Warmer', 1, 0),
(2148, 53, '📄 Documents', 'ID/Passport', 1, 0),
(2149, 53, '📄 Documents', 'Travel Tickets/Bookings', 1, 0),
(2150, 53, '📄 Documents', 'Credit/Debit Cards', 1, 0),
(2151, 53, '📄 Documents', 'Cash (Local Currency)', 1, 0),
(2152, 53, '📄 Documents', 'Travel Insurance Certificate', 1, 0),
(2153, 53, '📄 Documents', 'Emergency Contact List', 1, 0),
(2154, 53, '💊 Health', 'Prescribed Medications', 1, 0),
(2155, 53, '💊 Health', 'Pain Reliever (Paracetamol)', 1, 0),
(2156, 53, '💊 Health', 'Antihistamine', 1, 0),
(2157, 53, '💊 Health', 'Bandages/First Aid Kit', 1, 0),
(2158, 53, '💊 Health', 'Antiseptic Cream', 1, 0),
(2159, 53, '💊 Health', 'Stomach Remedies', 1, 0),
(2160, 53, '💊 Health', 'Period Pain Relief', 1, 0),
(2161, 53, '💊 Health', 'Sunscreen (SPF 30+)', 1, 0),
(2162, 53, '👜 Accessories', 'Sunglasses', 1, 1),
(2163, 53, '👜 Accessories', 'Reusable Water Bottle', 1, 1),
(2165, 53, '👜 Accessories', 'Watch', 1, 1),
(2167, 53, '👜 Accessories', 'Day Bag / Small Backpack', 1, 1),
(2168, 53, '🎒 Miscellaneous', 'Travel Adapter/Converter', 1, 0),
(2169, 53, '🎒 Miscellaneous', 'Earplugs/Eye Mask', 1, 0),
(2170, 53, '🎒 Miscellaneous', 'Travel Pillow', 1, 0),
(2171, 53, '🎒 Miscellaneous', 'Zip Lock Bags', 1, 0),
(2172, 53, '🎒 Miscellaneous', 'Pen & Notebook', 1, 0),
(2173, 53, '🎒 Miscellaneous', 'Tissue Pack', 1, 0),
(2174, 53, '🎒 Miscellaneous', 'Rope/Multi-tool', 1, 0),
(2175, 53, 'Camping', 'Tent', 2, 1),
(2176, 54, '👕 Clothing', 'Tops/Shirts (10)', 1, 0),
(2177, 54, '👕 Clothing', 'Bottoms/Pants (5)', 1, 0),
(2178, 54, '👕 Clothing', '11 Undergarments', 1, 0),
(2179, 54, '👕 Clothing', 'Socks (7)', 1, 0),
(2180, 54, '👕 Clothing', 'Sleepwear', 1, 0),
(2181, 54, '👕 Clothing', '1-2 Casual Dresses', 1, 0),
(2182, 54, '👕 Clothing', '2-3 Lightweight Shirts', 1, 0),
(2183, 54, '👕 Clothing', 'Shorts', 1, 0),
(2184, 54, '👕 Clothing', 'Sun Hat/Cap', 1, 0),
(2185, 54, '👕 Clothing', '1 Modest Dress/Saree', 1, 0),
(2186, 54, '👟 Footwear', 'Comfortable Walking Shoes', 1, 0),
(2187, 54, '👟 Footwear', 'Sandals/Flip Flops', 1, 0),
(2188, 54, '👟 Footwear', 'Casual Flats/Sneakers', 1, 0),
(2189, 54, '🧴 Toiletries & Personal Care', 'Toothbrush & Toothpaste', 1, 0),
(2190, 54, '🧴 Toiletries & Personal Care', 'Soap/Body Wash', 1, 0),
(2191, 54, '🧴 Toiletries & Personal Care', 'Shampoo & Conditioner', 1, 0),
(2192, 54, '🧴 Toiletries & Personal Care', 'Deodorant', 1, 0),
(2193, 54, '🧴 Toiletries & Personal Care', 'Hairbrush/Comb', 1, 0),
(2194, 54, '🧴 Toiletries & Personal Care', 'Skincare Products (basic)', 1, 0),
(2195, 54, '🧴 Toiletries & Personal Care', 'Face Wash', 1, 0),
(2196, 54, '🧴 Toiletries & Personal Care', 'Feminine Hygiene Products', 1, 0),
(2197, 54, '🧴 Toiletries & Personal Care', 'Makeup & Remover (small)', 1, 0),
(2198, 54, '🧴 Toiletries & Personal Care', 'Moisturizer', 1, 0),
(2199, 54, '🧴 Toiletries & Personal Care', 'Antiseptic/Disinfectant', 1, 0),
(2200, 54, '📱 Electronics', 'Mobile Phone & Charger', 1, 0),
(2201, 54, '📱 Electronics', 'Power Bank (10000 mAh)', 1, 0),
(2202, 54, '📱 Electronics', 'Headphones/Earbuds', 1, 0),
(2203, 54, '📱 Electronics', 'Portable Fan/Hand Warmer', 1, 0),
(2204, 54, '📄 Documents', 'ID/Passport', 1, 0),
(2205, 54, '📄 Documents', 'Travel Tickets/Bookings', 1, 0),
(2206, 54, '📄 Documents', 'Credit/Debit Cards', 1, 0),
(2207, 54, '📄 Documents', 'Cash (Local Currency)', 1, 0),
(2208, 54, '📄 Documents', 'Travel Insurance Certificate', 1, 0),
(2209, 54, '📄 Documents', 'Emergency Contact List', 1, 0),
(2210, 54, '💊 Health', 'Prescribed Medications', 1, 0),
(2211, 54, '💊 Health', 'Pain Reliever (Paracetamol)', 1, 0),
(2212, 54, '💊 Health', 'Antihistamine', 1, 0),
(2213, 54, '💊 Health', 'Bandages/First Aid Kit', 1, 1),
(2214, 54, '💊 Health', 'Antiseptic Cream', 1, 0),
(2215, 54, '💊 Health', 'Stomach Remedies', 1, 0),
(2216, 54, '💊 Health', 'Period Pain Relief', 1, 0),
(2217, 54, '💊 Health', 'Sunscreen (SPF 30+)', 1, 0),
(2218, 54, '👜 Accessories', 'Sunglasses', 1, 0),
(2219, 54, '👜 Accessories', 'Reusable Water Bottle', 1, 1),
(2220, 54, '👜 Accessories', 'Umbrella/Raincoat', 1, 0),
(2221, 54, '👜 Accessories', 'Watch', 1, 0),
(2222, 54, '👜 Accessories', 'Small Crossbody Bag', 1, 0),
(2223, 54, '👜 Accessories', 'Jewelry (minimal)', 1, 0),
(2224, 54, '👜 Accessories', 'Day Bag / Small Backpack', 1, 1),
(2225, 54, '🎒 Miscellaneous', 'Travel Adapter/Converter', 1, 0),
(2226, 54, '🎒 Miscellaneous', 'Earplugs/Eye Mask', 1, 0),
(2227, 54, '🎒 Miscellaneous', 'Travel Pillow', 1, 0),
(2228, 54, '🎒 Miscellaneous', 'Zip Lock Bags', 1, 0),
(2229, 54, '🎒 Miscellaneous', 'Pen & Notebook', 1, 0),
(2230, 54, '🎒 Miscellaneous', 'Tissue Pack', 1, 0),
(2231, 54, '🎒 Miscellaneous', 'Perfume (small bottle)', 1, 0),
(2232, 55, '👕 Clothing', 'Tops/Shirts (5)', 1, 0),
(2233, 55, '👕 Clothing', 'Bottoms/Pants (3)', 1, 0),
(2234, 55, '👕 Clothing', '7 Undergarments', 1, 0),
(2235, 55, '👕 Clothing', 'Socks (5)', 1, 0),
(2236, 55, '👕 Clothing', 'Sleepwear', 1, 0),
(2237, 55, '👕 Clothing', '1-2 Casual Dresses', 1, 0),
(2238, 55, '👕 Clothing', '2-3 Lightweight Shirts', 1, 0),
(2239, 55, '👕 Clothing', 'Shorts', 1, 0),
(2240, 55, '👕 Clothing', 'Sun Hat/Cap', 1, 0),
(2241, 55, '👕 Clothing', '1 Formal Dress/Blazer', 1, 0),
(2242, 55, '👟 Footwear', 'Comfortable Walking Shoes', 1, 0),
(2243, 55, '👟 Footwear', 'Sandals/Flip Flops', 1, 0),
(2244, 55, '👟 Footwear', 'Casual Flats/Sneakers', 1, 0),
(2245, 55, '👟 Footwear', 'Formal Shoes', 1, 0),
(2246, 55, '🧴 Toiletries & Personal Care', 'Toothbrush & Toothpaste', 1, 0),
(2247, 55, '🧴 Toiletries & Personal Care', 'Soap/Body Wash', 1, 0),
(2248, 55, '🧴 Toiletries & Personal Care', 'Shampoo & Conditioner', 1, 0),
(2249, 55, '🧴 Toiletries & Personal Care', 'Deodorant', 1, 0),
(2250, 55, '🧴 Toiletries & Personal Care', 'Hairbrush/Comb', 1, 1),
(2251, 55, '🧴 Toiletries & Personal Care', 'Skincare Products (basic)', 1, 0),
(2252, 55, '🧴 Toiletries & Personal Care', 'Face Wash', 1, 0),
(2253, 55, '🧴 Toiletries & Personal Care', 'Feminine Hygiene Products', 1, 0),
(2254, 55, '🧴 Toiletries & Personal Care', 'Makeup & Remover (small)', 1, 0),
(2255, 55, '🧴 Toiletries & Personal Care', 'Moisturizer', 1, 1),
(2256, 55, '🧴 Toiletries & Personal Care', 'Laundry Detergent (small)', 1, 0),
(2257, 55, '🧴 Toiletries & Personal Care', 'Antiseptic/Disinfectant', 1, 0),
(2258, 55, '📱 Electronics', 'Mobile Phone & Charger', 1, 0),
(2259, 55, '📱 Electronics', 'Power Bank (10000 mAh)', 1, 0),
(2260, 55, '📱 Electronics', 'Portable Fan/Hand Warmer', 1, 0),
(2261, 55, '📄 Documents', 'ID/Passport', 1, 0),
(2262, 55, '📄 Documents', 'Travel Tickets/Bookings', 1, 0),
(2263, 55, '📄 Documents', 'Credit/Debit Cards', 1, 0),
(2264, 55, '📄 Documents', 'Cash (Local Currency)', 1, 0),
(2265, 55, '📄 Documents', 'Travel Insurance Certificate', 1, 0),
(2266, 55, '📄 Documents', 'Emergency Contact List', 1, 0),
(2267, 55, '💊 Health', 'Prescribed Medications', 1, 0),
(2268, 55, '💊 Health', 'Pain Reliever (Paracetamol)', 1, 0),
(2269, 55, '💊 Health', 'Antihistamine', 1, 1),
(2270, 55, '💊 Health', 'Bandages/First Aid Kit', 1, 0),
(2271, 55, '💊 Health', 'Antiseptic Cream', 1, 0),
(2272, 55, '💊 Health', 'Stomach Remedies', 1, 0),
(2273, 55, '💊 Health', 'Period Pain Relief', 1, 1),
(2274, 55, '💊 Health', 'Sunscreen (SPF 30+)', 1, 0),
(2275, 55, '👜 Accessories', 'Sunglasses', 1, 1),
(2276, 55, '👜 Accessories', 'Reusable Water Bottle', 1, 0),
(2277, 55, '👜 Accessories', 'Umbrella/Raincoat', 1, 1),
(2278, 55, '👜 Accessories', 'Watch', 1, 0),
(2279, 55, '👜 Accessories', 'Small Crossbody Bag', 1, 0),
(2280, 55, '👜 Accessories', 'Day Bag / Small Backpack', 1, 0),
(2281, 55, '🎒 Miscellaneous', 'Travel Adapter/Converter', 1, 0),
(2282, 55, '🎒 Miscellaneous', 'Earplugs/Eye Mask', 1, 0),
(2283, 55, '🎒 Miscellaneous', 'Travel Pillow', 1, 0),
(2284, 55, '🎒 Miscellaneous', 'Zip Lock Bags', 1, 1),
(2285, 55, '🎒 Miscellaneous', 'Pen & Notebook', 1, 0),
(2286, 55, '🎒 Miscellaneous', 'Tissue Pack', 1, 0),
(2287, 55, 'Camping', 'Tent', 3, 1),
(2288, 56, '👕 Clothing', 'Tops/Shirts (5)', 1, 0),
(2289, 56, '👕 Clothing', 'Bottoms/Pants (3)', 1, 0),
(2290, 56, '👕 Clothing', '7 Undergarments', 1, 0),
(2291, 56, '👕 Clothing', 'Socks (5)', 1, 0),
(2292, 56, '👕 Clothing', 'Sleepwear', 1, 0),
(2293, 56, '👕 Clothing', '1-2 Casual Dresses', 1, 0),
(2294, 56, '👕 Clothing', '2-3 Lightweight Shirts', 1, 0),
(2295, 56, '👕 Clothing', 'Shorts', 1, 0),
(2296, 56, '👕 Clothing', 'Sun Hat/Cap', 1, 0),
(2297, 56, '👕 Clothing', '1-2 Active/Sports Wear', 1, 0),
(2298, 56, '👕 Clothing', 'Hiking Pants', 1, 0),
(2299, 56, '👟 Footwear', 'Comfortable Walking Shoes', 1, 0),
(2300, 56, '👟 Footwear', 'Sandals/Flip Flops', 1, 0),
(2301, 56, '👟 Footwear', 'Casual Flats/Sneakers', 1, 0),
(2302, 56, '👟 Footwear', 'Hiking Boots', 1, 0),
(2303, 56, '🧴 Toiletries & Personal Care', 'Toothbrush & Toothpaste', 1, 0),
(2304, 56, '🧴 Toiletries & Personal Care', 'Soap/Body Wash', 1, 0),
(2305, 56, '🧴 Toiletries & Personal Care', 'Shampoo & Conditioner', 1, 0),
(2306, 56, '🧴 Toiletries & Personal Care', 'Deodorant', 1, 0),
(2307, 56, '🧴 Toiletries & Personal Care', 'Hairbrush/Comb', 1, 0),
(2308, 56, '🧴 Toiletries & Personal Care', 'Skincare Products (basic)', 1, 0),
(2309, 56, '🧴 Toiletries & Personal Care', 'Face Wash', 1, 0),
(2310, 56, '🧴 Toiletries & Personal Care', 'Feminine Hygiene Products', 1, 0),
(2311, 56, '🧴 Toiletries & Personal Care', 'Makeup & Remover (small)', 1, 0),
(2312, 56, '🧴 Toiletries & Personal Care', 'Moisturizer', 1, 0),
(2313, 56, '🧴 Toiletries & Personal Care', 'Laundry Detergent (small)', 1, 0),
(2314, 56, '🧴 Toiletries & Personal Care', 'Antiseptic/Disinfectant', 1, 0),
(2315, 56, '📱 Electronics', 'Mobile Phone & Charger', 1, 0),
(2316, 56, '📱 Electronics', 'Power Bank (10000 mAh)', 1, 0),
(2317, 56, '📱 Electronics', 'Headphones/Earbuds', 1, 0),
(2318, 56, '📱 Electronics', 'Portable Fan/Hand Warmer', 1, 0),
(2319, 56, '📄 Documents', 'ID/Passport', 1, 0),
(2320, 56, '📄 Documents', 'Travel Tickets/Bookings', 1, 0),
(2321, 56, '📄 Documents', 'Credit/Debit Cards', 1, 0),
(2322, 56, '📄 Documents', 'Cash (Local Currency)', 1, 0),
(2323, 56, '📄 Documents', 'Travel Insurance Certificate', 1, 0),
(2324, 56, '📄 Documents', 'Emergency Contact List', 1, 0),
(2325, 56, '💊 Health', 'Prescribed Medications', 1, 0),
(2326, 56, '💊 Health', 'Pain Reliever (Paracetamol)', 1, 0),
(2327, 56, '💊 Health', 'Antihistamine', 1, 0),
(2328, 56, '💊 Health', 'Bandages/First Aid Kit', 1, 0),
(2329, 56, '💊 Health', 'Antiseptic Cream', 1, 0),
(2330, 56, '💊 Health', 'Stomach Remedies', 1, 0),
(2331, 56, '💊 Health', 'Period Pain Relief', 1, 0),
(2332, 56, '💊 Health', 'Sunscreen (SPF 30+)', 1, 0),
(2333, 56, '👜 Accessories', 'Sunglasses', 1, 1),
(2335, 56, '👜 Accessories', 'Umbrella/Raincoat', 1, 1),
(2336, 56, '👜 Accessories', 'Watch', 1, 0),
(2337, 56, '👜 Accessories', 'Small Crossbody Bag', 1, 0),
(2338, 56, '👜 Accessories', 'Jewelry (minimal)', 1, 0),
(2339, 56, '👜 Accessories', 'Day Bag / Small Backpack', 1, 0),
(2340, 56, '🎒 Miscellaneous', 'Travel Adapter/Converter', 1, 0),
(2341, 56, '🎒 Miscellaneous', 'Earplugs/Eye Mask', 1, 0),
(2342, 56, '🎒 Miscellaneous', 'Travel Pillow', 1, 0),
(2343, 56, '🎒 Miscellaneous', 'Zip Lock Bags', 1, 0),
(2344, 56, '🎒 Miscellaneous', 'Pen & Notebook', 1, 0),
(2345, 56, '🎒 Miscellaneous', 'Tissue Pack', 1, 0),
(2346, 56, '🎒 Miscellaneous', 'Rope/Multi-tool', 1, 0),
(2347, 56, '🎒 Miscellaneous', 'Perfume (small bottle)', 1, 0),
(2349, 57, '👕 Clothing', 'Tops/Shirts (7)', 1, 0),
(2350, 57, '👕 Clothing', 'Bottoms/Pants (4)', 1, 0),
(2351, 57, '👕 Clothing', '10 Undergarments', 1, 0),
(2352, 57, '👕 Clothing', 'Socks (7)', 1, 0),
(2353, 57, '👕 Clothing', 'Sleepwear', 1, 0),
(2354, 57, '👕 Clothing', '1-2 Casual Dresses', 1, 0),
(2355, 57, '👕 Clothing', '2-3 Lightweight Shirts', 1, 0),
(2356, 57, '👕 Clothing', 'Shorts', 1, 0),
(2357, 57, '👕 Clothing', 'Sun Hat/Cap', 1, 0),
(2358, 57, '👕 Clothing', '1 Modest Dress/Saree', 1, 0),
(2359, 57, '👟 Footwear', 'Comfortable Walking Shoes', 1, 0),
(2360, 57, '👟 Footwear', 'Sandals/Flip Flops', 1, 0),
(2361, 57, '👟 Footwear', 'Casual Flats/Sneakers', 1, 0),
(2362, 57, '🧴 Toiletries & Personal Care', 'Toothbrush & Toothpaste', 1, 0),
(2363, 57, '🧴 Toiletries & Personal Care', 'Soap/Body Wash', 1, 0),
(2364, 57, '🧴 Toiletries & Personal Care', 'Shampoo & Conditioner', 1, 0),
(2365, 57, '🧴 Toiletries & Personal Care', 'Deodorant', 1, 0),
(2366, 57, '🧴 Toiletries & Personal Care', 'Hairbrush/Comb', 1, 0),
(2367, 57, '🧴 Toiletries & Personal Care', 'Skincare Products (basic)', 1, 0),
(2368, 57, '🧴 Toiletries & Personal Care', 'Face Wash', 1, 0),
(2369, 57, '🧴 Toiletries & Personal Care', 'Feminine Hygiene Products', 1, 0),
(2370, 57, '🧴 Toiletries & Personal Care', 'Makeup & Remover (small)', 1, 0),
(2371, 57, '🧴 Toiletries & Personal Care', 'Moisturizer', 1, 0),
(2372, 57, '🧴 Toiletries & Personal Care', 'Antiseptic/Disinfectant', 1, 0),
(2373, 57, '📱 Electronics', 'Mobile Phone & Charger', 1, 0),
(2374, 57, '📱 Electronics', 'Power Bank (10000 mAh)', 1, 0),
(2375, 57, '📱 Electronics', 'Headphones/Earbuds', 1, 0),
(2376, 57, '📱 Electronics', 'Portable Fan/Hand Warmer', 1, 0),
(2377, 57, '📄 Documents', 'ID/Passport', 1, 0),
(2378, 57, '📄 Documents', 'Travel Tickets/Bookings', 1, 0),
(2379, 57, '📄 Documents', 'Credit/Debit Cards', 1, 0),
(2380, 57, '📄 Documents', 'Cash (Local Currency)', 1, 0),
(2381, 57, '📄 Documents', 'Travel Insurance Certificate', 1, 0),
(2382, 57, '📄 Documents', 'Emergency Contact List', 1, 0),
(2383, 57, '💊 Health', 'Prescribed Medications', 1, 0),
(2384, 57, '💊 Health', 'Pain Reliever (Paracetamol)', 1, 0),
(2385, 57, '💊 Health', 'Antihistamine', 1, 0),
(2386, 57, '💊 Health', 'Bandages/First Aid Kit', 1, 0),
(2387, 57, '💊 Health', 'Antiseptic Cream', 1, 0),
(2388, 57, '💊 Health', 'Stomach Remedies', 1, 0),
(2389, 57, '💊 Health', 'Period Pain Relief', 1, 0),
(2390, 57, '💊 Health', 'Sunscreen (SPF 30+)', 1, 0),
(2391, 57, '👜 Accessories', 'Sunglasses', 1, 0),
(2392, 57, '👜 Accessories', 'Reusable Water Bottle', 1, 0),
(2393, 57, '👜 Accessories', 'Umbrella/Raincoat', 1, 1),
(2394, 57, '👜 Accessories', 'Watch', 1, 0),
(2395, 57, '👜 Accessories', 'Small Crossbody Bag', 1, 1),
(2396, 57, '👜 Accessories', 'Jewelry (minimal)', 1, 0),
(2398, 57, '🎒 Miscellaneous', 'Travel Adapter/Converter', 1, 0),
(2399, 57, '🎒 Miscellaneous', 'Earplugs/Eye Mask', 1, 0),
(2400, 57, '🎒 Miscellaneous', 'Travel Pillow', 1, 0),
(2401, 57, '🎒 Miscellaneous', 'Zip Lock Bags', 1, 0),
(2402, 57, '🎒 Miscellaneous', 'Pen & Notebook', 1, 0),
(2403, 57, '🎒 Miscellaneous', 'Tissue Pack', 1, 0),
(2404, 57, '🎒 Miscellaneous', 'Perfume (small bottle)', 1, 0),
(2405, 58, '👕 Clothing', 'Tops/Shirts (5)', 1, 0),
(2406, 58, '👕 Clothing', 'Bottoms/Pants (3)', 1, 0),
(2407, 58, '👕 Clothing', '5 Undergarments', 1, 0),
(2408, 58, '👕 Clothing', 'Socks (5)', 1, 0),
(2409, 58, '👕 Clothing', 'Sleepwear', 1, 0),
(2410, 58, '👕 Clothing', 'Vest/Undershirt (2)', 1, 0),
(2411, 58, '👕 Clothing', '2-3 Lightweight Shirts', 1, 0),
(2412, 58, '👕 Clothing', 'Shorts', 1, 0),
(2413, 58, '👕 Clothing', 'Sun Hat/Cap', 1, 0),
(2414, 58, '👟 Footwear', 'Comfortable Walking Shoes', 1, 0),
(2415, 58, '👟 Footwear', 'Sandals/Flip Flops', 1, 0),
(2416, 58, '👟 Footwear', 'Casual Sneakers', 1, 0),
(2417, 58, '🧴 Toiletries & Personal Care', 'Toothbrush & Toothpaste', 1, 0),
(2418, 58, '🧴 Toiletries & Personal Care', 'Soap/Body Wash', 1, 0),
(2419, 58, '🧴 Toiletries & Personal Care', 'Shampoo & Conditioner', 1, 0),
(2420, 58, '🧴 Toiletries & Personal Care', 'Deodorant', 1, 0),
(2421, 58, '🧴 Toiletries & Personal Care', 'Hairbrush/Comb', 1, 0),
(2422, 58, '🧴 Toiletries & Personal Care', 'Skincare Products (basic)', 1, 0),
(2423, 58, '🧴 Toiletries & Personal Care', 'Razor & Shaving Cream', 1, 0),
(2424, 58, '🧴 Toiletries & Personal Care', 'Face Wash', 1, 0),
(2425, 58, '🧴 Toiletries & Personal Care', 'Laundry Detergent (small)', 1, 0),
(2426, 58, '🧴 Toiletries & Personal Care', 'Antiseptic/Disinfectant', 1, 0),
(2427, 58, '📱 Electronics', 'Mobile Phone & Charger', 1, 0),
(2428, 58, '📱 Electronics', 'Power Bank (10000 mAh)', 1, 0),
(2429, 58, '📱 Electronics', 'Headphones/Earbuds', 1, 0),
(2430, 58, '📱 Electronics', 'Portable Fan/Hand Warmer', 1, 0),
(2431, 58, '📄 Documents', 'ID/Passport', 1, 0),
(2432, 58, '📄 Documents', 'Travel Tickets/Bookings', 1, 0),
(2433, 58, '📄 Documents', 'Credit/Debit Cards', 1, 0),
(2434, 58, '📄 Documents', 'Cash (Local Currency)', 1, 0),
(2435, 58, '📄 Documents', 'Travel Insurance Certificate', 1, 0),
(2436, 58, '📄 Documents', 'Emergency Contact List', 1, 0),
(2437, 58, '💊 Health', 'Prescribed Medications', 1, 0),
(2438, 58, '💊 Health', 'Pain Reliever (Paracetamol)', 1, 0),
(2439, 58, '💊 Health', 'Antihistamine', 1, 0),
(2440, 58, '💊 Health', 'Bandages/First Aid Kit', 1, 0),
(2441, 58, '💊 Health', 'Antiseptic Cream', 1, 0),
(2442, 58, '💊 Health', 'Stomach Remedies', 1, 0),
(2443, 58, '💊 Health', 'Sunscreen (SPF 30+)', 1, 0),
(2444, 58, '👜 Accessories', 'Sunglasses', 1, 0),
(2445, 58, '👜 Accessories', 'Reusable Water Bottle', 1, 0),
(2446, 58, '👜 Accessories', 'Umbrella/Raincoat', 1, 0),
(2447, 58, '👜 Accessories', 'Watch', 1, 0),
(2448, 58, '👜 Accessories', 'Day Bag / Small Backpack', 1, 0),
(2449, 58, '🎒 Miscellaneous', 'Travel Adapter/Converter', 1, 0),
(2450, 58, '🎒 Miscellaneous', 'Earplugs/Eye Mask', 1, 0),
(2451, 58, '🎒 Miscellaneous', 'Travel Pillow', 1, 0),
(2452, 58, '🎒 Miscellaneous', 'Zip Lock Bags', 1, 0),
(2453, 58, '🎒 Miscellaneous', 'Pen & Notebook', 1, 0),
(2454, 58, '🎒 Miscellaneous', 'Tissue Pack', 1, 0),
(2455, 58, '🎒 Miscellaneous', 'Map/Guide Book', 1, 0),
(2456, 59, '👕 Clothing', 'Tops/Shirts (8)', 1, 0),
(2457, 59, '👕 Clothing', 'Bottoms/Pants (4)', 1, 0),
(2458, 59, '👕 Clothing', '11 Undergarments', 1, 0),
(2459, 59, '👕 Clothing', 'Socks (7)', 1, 0),
(2460, 59, '👕 Clothing', 'Sleepwear', 1, 0),
(2461, 59, '👕 Clothing', '1-2 Casual Dresses', 1, 0),
(2462, 59, '👕 Clothing', 'Light Jacket', 1, 0),
(2463, 59, '👕 Clothing', '1 Modest Dress/Saree', 1, 0),
(2464, 59, '👟 Footwear', 'Comfortable Walking Shoes', 1, 0),
(2465, 59, '👟 Footwear', 'Sandals/Flip Flops', 1, 0),
(2466, 59, '👟 Footwear', 'Casual Flats/Sneakers', 1, 0),
(2467, 59, '🧴 Toiletries & Personal Care', 'Toothbrush & Toothpaste', 1, 0),
(2468, 59, '🧴 Toiletries & Personal Care', 'Soap/Body Wash', 1, 0),
(2469, 59, '🧴 Toiletries & Personal Care', 'Shampoo & Conditioner', 1, 0),
(2470, 59, '🧴 Toiletries & Personal Care', 'Deodorant', 1, 0),
(2471, 59, '🧴 Toiletries & Personal Care', 'Hairbrush/Comb', 1, 0),
(2472, 59, '🧴 Toiletries & Personal Care', 'Skincare Products (basic)', 1, 0),
(2473, 59, '🧴 Toiletries & Personal Care', 'Face Wash', 1, 0),
(2474, 59, '🧴 Toiletries & Personal Care', 'Feminine Hygiene Products', 1, 0),
(2475, 59, '🧴 Toiletries & Personal Care', 'Makeup & Remover (small)', 1, 0),
(2476, 59, '🧴 Toiletries & Personal Care', 'Moisturizer', 1, 0),
(2477, 59, '🧴 Toiletries & Personal Care', 'Antiseptic/Disinfectant', 1, 0),
(2478, 59, '📱 Electronics', 'Mobile Phone & Charger', 1, 0),
(2479, 59, '📱 Electronics', 'Power Bank (10000 mAh)', 1, 0),
(2480, 59, '📱 Electronics', 'Headphones/Earbuds', 1, 0),
(2481, 59, '📄 Documents', 'ID/Passport', 1, 0),
(2482, 59, '📄 Documents', 'Travel Tickets/Bookings', 1, 0),
(2483, 59, '📄 Documents', 'Credit/Debit Cards', 1, 0),
(2484, 59, '📄 Documents', 'Cash (Local Currency)', 1, 0),
(2485, 59, '📄 Documents', 'Travel Insurance Certificate', 1, 0),
(2486, 59, '📄 Documents', 'Emergency Contact List', 1, 0),
(2487, 59, '💊 Health', 'Prescribed Medications', 1, 0),
(2488, 59, '💊 Health', 'Pain Reliever (Paracetamol)', 1, 0),
(2489, 59, '💊 Health', 'Antihistamine', 1, 0),
(2490, 59, '💊 Health', 'Bandages/First Aid Kit', 1, 0),
(2491, 59, '💊 Health', 'Antiseptic Cream', 1, 0),
(2492, 59, '💊 Health', 'Stomach Remedies', 1, 0),
(2493, 59, '💊 Health', 'Period Pain Relief', 1, 0),
(2494, 59, '👜 Accessories', 'Sunglasses', 1, 0),
(2495, 59, '👜 Accessories', 'Reusable Water Bottle', 1, 0),
(2496, 59, '👜 Accessories', 'Umbrella/Raincoat', 1, 0),
(2497, 59, '👜 Accessories', 'Watch', 1, 0),
(2498, 59, '👜 Accessories', 'Small Crossbody Bag', 1, 0),
(2499, 59, '👜 Accessories', 'Jewelry (minimal)', 1, 0),
(2500, 59, '👜 Accessories', 'Day Bag / Small Backpack', 1, 0),
(2501, 59, '🎒 Miscellaneous', 'Travel Adapter/Converter', 1, 0),
(2502, 59, '🎒 Miscellaneous', 'Earplugs/Eye Mask', 1, 0),
(2503, 59, '🎒 Miscellaneous', 'Travel Pillow', 1, 0),
(2504, 59, '🎒 Miscellaneous', 'Zip Lock Bags', 1, 0),
(2505, 59, '🎒 Miscellaneous', 'Pen & Notebook', 1, 0),
(2506, 59, '🎒 Miscellaneous', 'Tissue Pack', 1, 0),
(2507, 59, '🎒 Miscellaneous', 'Perfume (small bottle)', 1, 0),
(2508, 60, '👕 Clothing', 'Tops/Shirts (7)', 1, 0),
(2509, 60, '👕 Clothing', 'Bottoms/Pants (4)', 1, 0),
(2510, 60, '👕 Clothing', '10 Undergarments', 1, 0),
(2511, 60, '👕 Clothing', 'Socks (7)', 1, 0),
(2512, 60, '👕 Clothing', 'Sleepwear', 1, 0),
(2513, 60, '👕 Clothing', '1-2 Casual Dresses', 1, 0),
(2514, 60, '👕 Clothing', '2-3 Lightweight Shirts', 1, 0),
(2515, 60, '👕 Clothing', 'Shorts', 1, 0),
(2516, 60, '👕 Clothing', 'Sun Hat/Cap', 1, 0),
(2517, 60, '👕 Clothing', '1 Modest Dress/Saree', 1, 0),
(2518, 60, '👟 Footwear', 'Comfortable Walking Shoes', 1, 0),
(2519, 60, '👟 Footwear', 'Sandals/Flip Flops', 1, 0),
(2520, 60, '👟 Footwear', 'Casual Flats/Sneakers', 1, 0),
(2521, 60, '🧴 Toiletries & Personal Care', 'Toothbrush & Toothpaste', 1, 0),
(2522, 60, '🧴 Toiletries & Personal Care', 'Soap/Body Wash', 1, 0),
(2523, 60, '🧴 Toiletries & Personal Care', 'Shampoo & Conditioner', 1, 0),
(2524, 60, '🧴 Toiletries & Personal Care', 'Deodorant', 1, 0),
(2525, 60, '🧴 Toiletries & Personal Care', 'Hairbrush/Comb', 1, 0),
(2526, 60, '🧴 Toiletries & Personal Care', 'Skincare Products (basic)', 1, 0),
(2527, 60, '🧴 Toiletries & Personal Care', 'Face Wash', 1, 0),
(2528, 60, '🧴 Toiletries & Personal Care', 'Feminine Hygiene Products', 1, 0),
(2529, 60, '🧴 Toiletries & Personal Care', 'Makeup & Remover (small)', 1, 0),
(2530, 60, '🧴 Toiletries & Personal Care', 'Moisturizer', 1, 0),
(2531, 60, '🧴 Toiletries & Personal Care', 'Antiseptic/Disinfectant', 1, 0),
(2532, 60, '📱 Electronics', 'Mobile Phone & Charger', 1, 0),
(2533, 60, '📱 Electronics', 'Power Bank (10000 mAh)', 1, 0),
(2534, 60, '📱 Electronics', 'Headphones/Earbuds', 1, 0),
(2535, 60, '📱 Electronics', 'Portable Fan/Hand Warmer', 1, 0),
(2536, 60, '📄 Documents', 'ID/Passport', 1, 0),
(2537, 60, '📄 Documents', 'Travel Tickets/Bookings', 1, 0),
(2538, 60, '📄 Documents', 'Credit/Debit Cards', 1, 0),
(2539, 60, '📄 Documents', 'Cash (Local Currency)', 1, 0),
(2540, 60, '📄 Documents', 'Travel Insurance Certificate', 1, 0),
(2541, 60, '📄 Documents', 'Emergency Contact List', 1, 0),
(2542, 60, '💊 Health', 'Prescribed Medications', 1, 0),
(2543, 60, '💊 Health', 'Pain Reliever (Paracetamol)', 1, 0),
(2544, 60, '💊 Health', 'Antihistamine', 1, 0),
(2545, 60, '💊 Health', 'Bandages/First Aid Kit', 1, 0),
(2546, 60, '💊 Health', 'Antiseptic Cream', 1, 0),
(2547, 60, '💊 Health', 'Stomach Remedies', 1, 0);
INSERT INTO `smart_packing_items` (`id`, `profile_id`, `category`, `item_name`, `quantity`, `is_packed`) VALUES
(2548, 60, '💊 Health', 'Period Pain Relief', 1, 0),
(2549, 60, '💊 Health', 'Sunscreen (SPF 30+)', 1, 0),
(2550, 60, '👜 Accessories', 'Sunglasses', 1, 0),
(2551, 60, '👜 Accessories', 'Reusable Water Bottle', 1, 0),
(2552, 60, '👜 Accessories', 'Umbrella/Raincoat', 1, 0),
(2553, 60, '👜 Accessories', 'Watch', 1, 0),
(2554, 60, '👜 Accessories', 'Small Crossbody Bag', 1, 0),
(2555, 60, '👜 Accessories', 'Jewelry (minimal)', 1, 0),
(2556, 60, '👜 Accessories', 'Day Bag / Small Backpack', 1, 0),
(2557, 60, '🎒 Miscellaneous', 'Travel Adapter/Converter', 1, 0),
(2558, 60, '🎒 Miscellaneous', 'Earplugs/Eye Mask', 1, 0),
(2559, 60, '🎒 Miscellaneous', 'Travel Pillow', 1, 0),
(2560, 60, '🎒 Miscellaneous', 'Zip Lock Bags', 1, 0),
(2561, 60, '🎒 Miscellaneous', 'Pen & Notebook', 1, 0),
(2562, 60, '🎒 Miscellaneous', 'Tissue Pack', 1, 0),
(2563, 60, '🎒 Miscellaneous', 'Perfume (small bottle)', 1, 0),
(2564, 61, '👕 Clothing', 'Tops/Shirts (7)', 1, 0),
(2565, 61, '👕 Clothing', 'Bottoms/Pants (4)', 1, 0),
(2566, 61, '👕 Clothing', '10 Undergarments', 1, 0),
(2567, 61, '👕 Clothing', 'Socks (7)', 1, 0),
(2568, 61, '👕 Clothing', 'Sleepwear', 1, 0),
(2569, 61, '👕 Clothing', '1-2 Casual Dresses', 1, 0),
(2570, 61, '👕 Clothing', '2-3 Lightweight Shirts', 1, 0),
(2571, 61, '👕 Clothing', 'Shorts', 1, 0),
(2572, 61, '👕 Clothing', 'Sun Hat/Cap', 1, 0),
(2573, 61, '👕 Clothing', '1-2 Active/Sports Wear', 1, 0),
(2574, 61, '👕 Clothing', 'Hiking Pants', 1, 0),
(2575, 61, '👟 Footwear', 'Comfortable Walking Shoes', 1, 0),
(2576, 61, '👟 Footwear', 'Sandals/Flip Flops', 1, 0),
(2577, 61, '👟 Footwear', 'Casual Flats/Sneakers', 1, 0),
(2578, 61, '👟 Footwear', 'Hiking Boots', 1, 0),
(2579, 61, '🧴 Toiletries & Personal Care', 'Toothbrush & Toothpaste', 1, 0),
(2580, 61, '🧴 Toiletries & Personal Care', 'Soap/Body Wash', 1, 0),
(2581, 61, '🧴 Toiletries & Personal Care', 'Shampoo & Conditioner', 1, 0),
(2582, 61, '🧴 Toiletries & Personal Care', 'Deodorant', 1, 0),
(2583, 61, '🧴 Toiletries & Personal Care', 'Hairbrush/Comb', 1, 0),
(2584, 61, '🧴 Toiletries & Personal Care', 'Skincare Products (basic)', 1, 0),
(2585, 61, '🧴 Toiletries & Personal Care', 'Face Wash', 1, 0),
(2586, 61, '🧴 Toiletries & Personal Care', 'Feminine Hygiene Products', 1, 0),
(2587, 61, '🧴 Toiletries & Personal Care', 'Makeup & Remover (small)', 1, 0),
(2588, 61, '🧴 Toiletries & Personal Care', 'Moisturizer', 1, 0),
(2589, 61, '🧴 Toiletries & Personal Care', 'Antiseptic/Disinfectant', 1, 0),
(2590, 61, '📱 Electronics', 'Mobile Phone & Charger', 1, 0),
(2591, 61, '📱 Electronics', 'Power Bank (10000 mAh)', 1, 0),
(2592, 61, '📱 Electronics', 'Headphones/Earbuds', 1, 0),
(2593, 61, '📱 Electronics', 'Portable Fan/Hand Warmer', 1, 0),
(2594, 61, '📄 Documents', 'ID/Passport', 1, 0),
(2595, 61, '📄 Documents', 'Travel Tickets/Bookings', 1, 0),
(2596, 61, '📄 Documents', 'Credit/Debit Cards', 1, 0),
(2597, 61, '📄 Documents', 'Cash (Local Currency)', 1, 0),
(2598, 61, '📄 Documents', 'Travel Insurance Certificate', 1, 0),
(2599, 61, '📄 Documents', 'Emergency Contact List', 1, 0),
(2600, 61, '💊 Health', 'Prescribed Medications', 1, 0),
(2601, 61, '💊 Health', 'Pain Reliever (Paracetamol)', 1, 0),
(2602, 61, '💊 Health', 'Antihistamine', 1, 0),
(2603, 61, '💊 Health', 'Bandages/First Aid Kit', 1, 0),
(2604, 61, '💊 Health', 'Antiseptic Cream', 1, 0),
(2605, 61, '💊 Health', 'Stomach Remedies', 1, 0),
(2606, 61, '💊 Health', 'Period Pain Relief', 1, 0),
(2607, 61, '💊 Health', 'Sunscreen (SPF 30+)', 1, 0),
(2608, 61, '👜 Accessories', 'Sunglasses', 1, 0),
(2609, 61, '👜 Accessories', 'Reusable Water Bottle', 1, 0),
(2611, 61, '👜 Accessories', 'Watch', 1, 0),
(2612, 61, '👜 Accessories', 'Small Crossbody Bag', 1, 0),
(2613, 61, '👜 Accessories', 'Jewelry (minimal)', 1, 0),
(2614, 61, '👜 Accessories', 'Day Bag / Small Backpack', 1, 0),
(2615, 61, '🎒 Miscellaneous', 'Travel Adapter/Converter', 1, 0),
(2616, 61, '🎒 Miscellaneous', 'Earplugs/Eye Mask', 1, 0),
(2617, 61, '🎒 Miscellaneous', 'Travel Pillow', 1, 0),
(2618, 61, '🎒 Miscellaneous', 'Zip Lock Bags', 1, 0),
(2619, 61, '🎒 Miscellaneous', 'Pen & Notebook', 1, 0),
(2620, 61, '🎒 Miscellaneous', 'Tissue Pack', 1, 0),
(2621, 61, '🎒 Miscellaneous', 'Rope/Multi-tool', 1, 0),
(2622, 61, '🎒 Miscellaneous', 'Perfume (small bottle)', 1, 0),
(2623, 62, '👕 Clothing', 'Tops/Shirts (10)', 1, 0),
(2624, 62, '👕 Clothing', 'Bottoms/Pants (5)', 1, 0),
(2625, 62, '👕 Clothing', '8 Undergarments', 1, 0),
(2626, 62, '👕 Clothing', 'Socks (7)', 1, 0),
(2627, 62, '👕 Clothing', 'Sleepwear', 1, 0),
(2628, 62, '👕 Clothing', 'Vest/Undershirt (2)', 1, 0),
(2629, 62, '👕 Clothing', 'Light Jacket', 1, 0),
(2630, 62, '👕 Clothing', '1-2 Active/Sports Wear', 1, 0),
(2631, 62, '👕 Clothing', 'Hiking Pants', 1, 0),
(2632, 62, '👟 Footwear', 'Comfortable Walking Shoes', 1, 0),
(2633, 62, '👟 Footwear', 'Sandals/Flip Flops', 1, 0),
(2634, 62, '👟 Footwear', 'Casual Sneakers', 1, 0),
(2635, 62, '👟 Footwear', 'Hiking Boots', 1, 0),
(2636, 62, '🧴 Toiletries & Personal Care', 'Toothbrush & Toothpaste', 1, 0),
(2637, 62, '🧴 Toiletries & Personal Care', 'Soap/Body Wash', 1, 0),
(2638, 62, '🧴 Toiletries & Personal Care', 'Shampoo & Conditioner', 1, 0),
(2639, 62, '🧴 Toiletries & Personal Care', 'Deodorant', 1, 0),
(2640, 62, '🧴 Toiletries & Personal Care', 'Hairbrush/Comb', 1, 0),
(2641, 62, '🧴 Toiletries & Personal Care', 'Skincare Products (basic)', 1, 0),
(2642, 62, '🧴 Toiletries & Personal Care', 'Razor & Shaving Cream', 1, 0),
(2643, 62, '🧴 Toiletries & Personal Care', 'Face Wash', 1, 0),
(2644, 62, '🧴 Toiletries & Personal Care', 'Antiseptic/Disinfectant', 1, 0),
(2645, 62, '📱 Electronics', 'Mobile Phone & Charger', 1, 0),
(2646, 62, '📱 Electronics', 'Power Bank (10000 mAh)', 1, 0),
(2647, 62, '📄 Documents', 'ID/Passport', 1, 0),
(2648, 62, '📄 Documents', 'Travel Tickets/Bookings', 1, 0),
(2649, 62, '📄 Documents', 'Credit/Debit Cards', 1, 0),
(2650, 62, '📄 Documents', 'Cash (Local Currency)', 1, 0),
(2651, 62, '📄 Documents', 'Travel Insurance Certificate', 1, 0),
(2652, 62, '📄 Documents', 'Emergency Contact List', 1, 0),
(2653, 62, '💊 Health', 'Prescribed Medications', 1, 0),
(2654, 62, '💊 Health', 'Pain Reliever (Paracetamol)', 1, 0),
(2655, 62, '💊 Health', 'Antihistamine', 1, 0),
(2656, 62, '💊 Health', 'Bandages/First Aid Kit', 1, 0),
(2657, 62, '💊 Health', 'Antiseptic Cream', 1, 0),
(2658, 62, '💊 Health', 'Stomach Remedies', 1, 0),
(2659, 62, '👜 Accessories', 'Sunglasses', 1, 0),
(2660, 62, '👜 Accessories', 'Reusable Water Bottle', 1, 0),
(2661, 62, '👜 Accessories', 'Umbrella/Raincoat', 1, 0),
(2662, 62, '👜 Accessories', 'Watch', 1, 0),
(2663, 62, '👜 Accessories', 'Day Bag / Small Backpack', 1, 0),
(2664, 62, '🎒 Miscellaneous', 'Travel Adapter/Converter', 1, 0),
(2665, 62, '🎒 Miscellaneous', 'Earplugs/Eye Mask', 1, 0),
(2666, 62, '🎒 Miscellaneous', 'Travel Pillow', 1, 0),
(2667, 62, '🎒 Miscellaneous', 'Zip Lock Bags', 1, 0),
(2668, 62, '🎒 Miscellaneous', 'Pen & Notebook', 1, 0),
(2669, 62, '🎒 Miscellaneous', 'Tissue Pack', 1, 0),
(2670, 62, '🎒 Miscellaneous', 'Rope/Multi-tool', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `smart_packing_profiles`
--

CREATE TABLE `smart_packing_profiles` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `trip_id` int(11) NOT NULL,
  `total_days` int(11) NOT NULL,
  `climate_type` enum('hot','moderate','cold','mixed') NOT NULL,
  `rain_level` enum('low','medium','high') NOT NULL,
  `gender` enum('male','female','other') NOT NULL,
  `laundry` enum('yes','no') NOT NULL,
  `dress_style` enum('minimalist','casual','trendy','traditional') NOT NULL,
  `trip_purpose` enum('leisure','business','adventure','religious','family') NOT NULL,
  `luggage_type` enum('backpack','cabin','suitcase') NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `budget_type` varchar(20) DEFAULT 'standard'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `smart_packing_profiles`
--

INSERT INTO `smart_packing_profiles` (`id`, `user_id`, `trip_id`, `total_days`, `climate_type`, `rain_level`, `gender`, `laundry`, `dress_style`, `trip_purpose`, `luggage_type`, `created_at`, `budget_type`) VALUES
(43, 16, 203, 8, 'hot', 'medium', 'female', 'no', '', 'business', '', '2026-03-09 15:42:42', 'Mid Range'),
(44, 16, 204, 5, 'hot', 'medium', 'male', 'no', '', 'adventure', '', '2026-03-09 16:41:02', 'Mid Range'),
(45, 16, 205, 4, 'hot', 'medium', 'female', 'no', 'minimalist', 'adventure', 'backpack', '2026-03-09 17:01:59', 'Luxury'),
(46, 16, 206, 5, 'hot', 'medium', 'female', 'no', 'minimalist', 'leisure', 'backpack', '2026-03-09 17:02:44', 'Luxury'),
(47, 15, 208, 8, 'moderate', 'medium', 'female', 'no', 'minimalist', 'business', 'backpack', '2026-03-09 17:15:29', 'Luxury'),
(48, 15, 209, 3, 'hot', 'medium', 'male', 'yes', 'minimalist', 'leisure', 'backpack', '2026-03-09 17:22:24', 'Low Budget'),
(49, 15, 210, 5, 'hot', 'medium', 'female', 'yes', 'minimalist', 'adventure', 'backpack', '2026-03-09 17:41:30', 'Mid Range'),
(50, 15, 212, 5, 'hot', 'medium', 'female', 'no', 'minimalist', 'adventure', 'backpack', '2026-03-09 18:04:23', 'Luxury'),
(52, 15, 219, 3, 'hot', 'medium', 'male', 'yes', 'minimalist', 'leisure', 'backpack', '2026-03-10 19:43:51', 'Low Budget'),
(53, 15, 222, 10, 'hot', 'medium', 'female', 'no', 'minimalist', 'adventure', 'backpack', '2026-03-10 20:21:46', 'Mid Range'),
(54, 15, 223, 10, 'hot', 'medium', 'female', 'no', 'minimalist', 'religious', 'backpack', '2026-03-10 21:26:13', 'Luxury'),
(55, 15, 226, 10, 'hot', 'medium', 'female', 'yes', 'minimalist', 'business', 'backpack', '2026-03-11 03:29:25', 'Mid Range'),
(56, 15, 227, 10, 'hot', 'medium', 'female', 'yes', 'minimalist', 'adventure', 'backpack', '2026-03-11 05:02:20', 'Luxury'),
(57, 15, 228, 7, 'hot', 'medium', 'female', 'no', 'minimalist', 'religious', 'backpack', '2026-03-24 15:19:29', 'Luxury'),
(58, 15, 229, 10, 'hot', 'medium', 'male', 'yes', 'minimalist', 'leisure', 'backpack', '2026-03-24 15:21:36', 'Luxury'),
(59, 15, 237, 8, 'moderate', 'medium', 'female', 'no', 'minimalist', 'religious', 'backpack', '2026-04-01 04:36:10', 'Luxury'),
(60, 15, 240, 7, 'hot', 'medium', 'female', 'no', 'minimalist', 'religious', 'backpack', '2026-04-04 05:34:19', 'Luxury'),
(61, 15, 241, 7, 'hot', 'medium', 'female', 'no', 'minimalist', 'adventure', 'backpack', '2026-04-04 05:48:42', 'Luxury'),
(62, 15, 242, 10, 'moderate', 'medium', 'male', 'no', 'minimalist', 'adventure', 'backpack', '2026-04-04 05:50:21', 'Mid Range');

-- --------------------------------------------------------

--
-- Table structure for table `trips`
--

CREATE TABLE `trips` (
  `id` int(11) NOT NULL,
  `host_id` int(11) NOT NULL,
  `destination_slug` varchar(255) DEFAULT NULL,
  `title` varchar(150) DEFAULT NULL,
  `traveller_type` varchar(50) DEFAULT NULL,
  `trip_type` enum('solo','group') DEFAULT NULL,
  `invite_code` varchar(20) DEFAULT NULL,
  `travel_month` varchar(50) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` varchar(20) NOT NULL DEFAULT 'active',
  `start_date` date NOT NULL,
  `end_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `trips`
--

INSERT INTO `trips` (`id`, `host_id`, `destination_slug`, `title`, `traveller_type`, `trip_type`, `invite_code`, `travel_month`, `created_at`, `status`, `start_date`, `end_date`) VALUES
(203, 16, 'goa', 'Industrial Visit To Goa', 'Calm Explorer', 'solo', NULL, NULL, '2026-03-09 15:34:30', 'finished', '2026-03-10', '2026-03-17'),
(204, 16, 'goa', 'trip', 'Calm Explorer', 'solo', NULL, NULL, '2026-03-09 16:39:57', 'finished', '2026-03-10', '2026-03-14'),
(205, 16, 'goa', 'HAWAIIIII', 'Calm Explorer', 'solo', NULL, NULL, '2026-03-09 17:00:13', 'finished', '2026-03-10', '2026-03-13'),
(206, 16, 'goa', 'NO HAWAI', 'Calm Explorer', 'solo', NULL, NULL, '2026-03-09 17:02:33', 'finished', '2026-03-10', '2026-03-14'),
(207, 16, 'goa', 'rfrgf', 'Adventurer', 'solo', NULL, 'March', '2026-03-09 17:10:47', 'finished', '2026-03-10', '2026-03-14'),
(208, 15, '', 'hi', 'Calm Explorer', 'solo', NULL, NULL, '2026-03-09 17:15:19', 'finished', '2026-03-11', '2026-03-18'),
(209, 15, 'goa', 'goa', 'Adventurer', 'solo', NULL, NULL, '2026-03-09 17:18:53', 'finished', '2026-03-10', '2026-03-12'),
(210, 15, 'goa', 'GOAA TRIPPP', 'Adventurer', 'solo', NULL, NULL, '2026-03-09 17:41:08', 'finished', '2026-03-12', '2026-03-16'),
(211, 15, 'goa', 'GOAAA', 'Adventurer', 'group', 'B53E84', NULL, '2026-03-09 17:42:17', 'finished', '2026-03-10', '2026-03-12'),
(212, 15, 'goa', 'a', 'Adventurer', 'solo', NULL, NULL, '2026-03-09 18:04:08', 'finished', '2026-03-10', '2026-03-14'),
(213, 20, 'goa', 'Trip', 'Calm Explorer', 'group', '32954D', NULL, '2026-03-10 06:37:00', 'finished', '2026-03-11', '2026-03-18'),
(214, 15, 'goa', 'hi', 'Calm Explorer', 'solo', NULL, NULL, '2026-03-10 16:21:42', 'finished', '2026-03-11', '2026-03-19'),
(215, 15, 'goa', 'hi', 'Calm Explorer', 'solo', NULL, NULL, '2026-03-10 16:43:53', 'finished', '2026-03-11', '2026-03-21'),
(216, 15, 'goa', 'grtg', 'Adventurer', 'solo', NULL, NULL, '2026-03-10 16:44:49', 'finished', '2026-03-03', '2026-03-18'),
(217, 15, 'goa', 'GOAA', 'Adventurer', 'group', '2C0F95', NULL, '2026-03-10 19:24:39', 'finished', '2026-03-04', '2026-03-12'),
(218, 15, 'goa', 'rfrgf', 'Adventurer', 'group', '9C73FF', NULL, '2026-03-10 19:39:29', 'finished', '2026-03-11', '2026-03-14'),
(219, 15, 'goa', 'tfgtg', 'Adventurer', 'solo', NULL, NULL, '2026-03-10 19:43:47', 'finished', '2026-03-12', '2026-03-14'),
(220, 15, 'goa', '5r', 'Adventurer', 'solo', NULL, NULL, '2026-03-10 19:54:19', 'finished', '2026-03-10', '2026-03-14'),
(221, 15, 'goa', 'yhh', 'Adventurer', 'solo', NULL, NULL, '2026-03-10 20:10:48', 'finished', '2026-03-11', '2026-03-20'),
(222, 15, 'goa', 'JAJAHJS', NULL, 'solo', NULL, NULL, '2026-03-10 20:21:37', 'finished', '2026-03-11', '2026-03-20'),
(223, 15, 'goa', 't65ty', NULL, 'solo', NULL, NULL, '2026-03-10 21:24:27', 'finished', '2026-03-11', '2026-03-20'),
(224, 15, 'goa', 'uyjj', NULL, 'solo', NULL, NULL, '2026-03-10 22:17:27', 'finished', '2026-03-20', '2026-03-29'),
(225, 15, 'goa', 'tt', NULL, 'group', 'F50964', NULL, '2026-03-10 22:20:59', 'finished', '2026-03-11', '2026-03-20'),
(226, 15, 'goa', 'HI', NULL, 'group', 'C567C7', NULL, '2026-03-11 03:27:48', 'finished', '2026-03-11', '2026-03-20'),
(227, 15, 'goa', 'GOAA', NULL, 'group', 'F09CA2', NULL, '2026-03-11 04:59:29', 'finished', '2026-03-11', '2026-03-20'),
(228, 15, 'kerala', 'bgthbth', NULL, 'group', '51D789', NULL, '2026-03-24 15:11:43', 'finished', '2026-03-24', '2026-03-30'),
(229, 15, 'kerala', 'frfg', NULL, 'solo', NULL, NULL, '2026-03-24 15:21:25', 'finished', '2026-03-26', '2026-04-04'),
(230, 15, 'kerala', 'ffefr', NULL, 'solo', NULL, NULL, '2026-03-24 15:45:57', 'finished', '2026-04-11', '2026-04-16'),
(231, 15, 'kerala', 'r44r', NULL, 'solo', NULL, NULL, '2026-03-24 15:46:29', 'finished', '2026-03-24', '2026-03-26'),
(232, 15, 'kerala', 'de', NULL, 'solo', NULL, NULL, '2026-03-24 15:47:02', 'finished', '2026-03-24', '2026-03-27'),
(233, 15, 'kerala', 'ff', NULL, 'solo', NULL, NULL, '2026-03-24 15:47:28', 'finished', '2026-03-24', '2026-03-27'),
(234, 15, 'kerala', 'gg', NULL, 'solo', NULL, NULL, '2026-03-24 15:49:21', 'finished', '2026-03-25', '2026-03-31'),
(235, 15, 'kerala', 'hh', NULL, 'solo', NULL, NULL, '2026-03-24 15:51:03', 'finished', '2026-03-24', '2026-03-27'),
(236, 15, 'goa', 'HAYYS', NULL, 'solo', NULL, NULL, '2026-03-25 17:13:12', 'finished', '2026-03-26', '2026-04-02'),
(237, 15, 'bali', 'bali', NULL, 'group', '23972C', NULL, '2026-04-01 04:34:00', 'finished', '2026-04-02', '2026-04-09'),
(238, 15, 'kerala', 'kiki', NULL, 'solo', NULL, NULL, '2026-04-04 05:11:35', 'finished', '2026-04-10', '2026-04-17'),
(239, 15, 'kerala', 'yjj', NULL, 'solo', NULL, NULL, '2026-04-04 05:32:02', 'finished', '2026-04-04', '2026-04-08'),
(240, 15, 'kerala', 'hujm', NULL, 'solo', NULL, NULL, '2026-04-04 05:33:29', 'finished', '2026-04-21', '2026-04-27'),
(241, 15, 'goa', 'vcv', NULL, 'solo', NULL, NULL, '2026-04-04 05:43:15', 'finished', '2026-04-16', '2026-04-22'),
(242, 15, 'bali', 'dfe', NULL, 'group', 'B2DAFA', NULL, '2026-04-04 05:50:04', 'finished', '2026-04-04', '2026-04-13');

-- --------------------------------------------------------

--
-- Table structure for table `trip_budget`
--

CREATE TABLE `trip_budget` (
  `id` int(11) NOT NULL,
  `trip_id` int(11) NOT NULL,
  `total_cost` decimal(10,2) DEFAULT 0.00,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `trip_budget`
--

INSERT INTO `trip_budget` (`id`, `trip_id`, `total_cost`, `created_at`) VALUES
(24, 217, 204.00, '2026-03-10 19:29:57'),
(25, 218, 1200.00, '2026-03-10 19:39:31'),
(26, 225, 5.00, '2026-03-10 22:21:06'),
(27, 226, 200.00, '2026-03-11 03:27:56'),
(28, 227, 120.00, '2026-03-11 05:00:04'),
(29, 228, 24.00, '2026-03-24 15:11:54'),
(30, 237, 1500.00, '2026-04-01 04:34:07'),
(31, 242, 10.00, '2026-04-04 05:50:49');

-- --------------------------------------------------------

--
-- Table structure for table `trip_members`
--

CREATE TABLE `trip_members` (
  `id` int(11) NOT NULL,
  `trip_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `role` enum('host','member') DEFAULT 'member'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `trip_members`
--

INSERT INTO `trip_members` (`id`, `trip_id`, `user_id`, `role`) VALUES
(30, 54, 15, 'host'),
(31, 55, 15, 'host'),
(32, 57, 15, 'host'),
(33, 59, 15, 'host'),
(34, 60, 15, 'host'),
(35, 62, 15, 'host'),
(36, 63, 15, 'host'),
(37, 64, 15, 'host'),
(38, 65, 1, 'host'),
(39, 66, 1, 'host'),
(40, 67, 1, 'host'),
(41, 68, 1, 'host'),
(42, 69, 1, 'host'),
(43, 70, 1, 'host'),
(44, 71, 1, 'host'),
(45, 72, 1, 'host'),
(46, 73, 1, 'host'),
(47, 74, 1, 'host'),
(48, 76, 15, 'host'),
(49, 78, 15, 'host'),
(50, 79, 15, 'host'),
(51, 80, 15, 'host'),
(52, 81, 15, 'host'),
(53, 83, 15, 'host'),
(54, 84, 15, 'host'),
(55, 88, 15, 'host'),
(56, 89, 15, 'host'),
(57, 90, 15, 'host'),
(58, 91, 15, 'host'),
(59, 92, 15, 'host'),
(60, 93, 15, 'host'),
(61, 94, 15, 'host'),
(62, 97, 15, 'host'),
(63, 97, 16, 'member'),
(64, 100, 15, 'host'),
(65, 101, 15, 'host'),
(66, 101, 16, 'member'),
(67, 103, 15, 'host'),
(68, 105, 15, 'host'),
(69, 106, 15, 'host'),
(70, 108, 19, 'host'),
(71, 108, 15, 'member'),
(72, 119, 15, 'host'),
(73, 131, 15, 'host'),
(74, 136, 15, 'host'),
(75, 150, 1, 'host'),
(76, 151, 15, 'host'),
(77, 152, 15, 'host'),
(78, 154, 15, 'host'),
(79, 156, 15, 'host'),
(80, 157, 15, 'host'),
(81, 158, 15, 'host'),
(82, 159, 15, 'host'),
(83, 160, 15, 'host'),
(84, 161, 15, 'host'),
(85, 162, 15, 'host'),
(86, 163, 15, 'host'),
(87, 163, 16, 'member'),
(88, 164, 15, 'host'),
(89, 169, 15, 'host'),
(90, 172, 16, 'host'),
(91, 173, 16, 'host'),
(92, 181, 16, 'host'),
(93, 191, 17, 'host'),
(94, 195, 16, 'host'),
(95, 211, 15, 'host'),
(96, 213, 20, 'host'),
(97, 217, 15, 'host'),
(98, 218, 15, 'host'),
(99, 218, 16, 'member'),
(100, 225, 15, 'host'),
(101, 226, 15, 'host'),
(102, 227, 15, 'host'),
(103, 228, 15, 'host'),
(104, 237, 15, 'host'),
(105, 242, 15, 'host');

-- --------------------------------------------------------

--
-- Table structure for table `trip_messages`
--

CREATE TABLE `trip_messages` (
  `id` int(11) NOT NULL,
  `trip_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `trip_messages`
--

INSERT INTO `trip_messages` (`id`, `trip_id`, `user_id`, `message`, `created_at`) VALUES
(18, 97, 15, 'welcome', '2026-02-14 11:22:37'),
(19, 97, 16, 'hello', '2026-02-14 11:23:06'),
(20, 101, 15, 'hi', '2026-02-14 14:09:42'),
(21, 101, 15, 'welcome', '2026-02-14 14:09:46'),
(22, 105, 15, 'hi', '2026-02-14 15:13:08'),
(23, 106, 15, 'welcome', '2026-02-14 15:31:45'),
(24, 106, 15, 'hi', '2026-02-14 15:52:37'),
(25, 108, 19, 'hi', '2026-02-16 09:23:06'),
(26, 108, 15, 'hi', '2026-02-16 09:26:47'),
(27, 150, 1, 'hello', '2026-03-07 11:51:32'),
(28, 150, 1, 'welcome', '2026-03-07 11:51:36'),
(29, 150, 1, 'welcome', '2026-03-07 11:53:15'),
(30, 150, 1, 'welcome', '2026-03-07 11:53:24'),
(31, 151, 15, 'welcome', '2026-03-07 11:56:37'),
(32, 152, 15, 'hello', '2026-03-07 12:01:59'),
(33, 154, 15, 'hello', '2026-03-07 12:04:46'),
(34, 154, 15, 'welcome', '2026-03-07 12:16:24'),
(35, 154, 15, 'hello', '2026-03-07 12:26:01'),
(36, 154, 15, 'hello', '2026-03-07 12:26:03'),
(37, 154, 15, 'hello', '2026-03-07 12:26:06'),
(38, 154, 15, 'welcome', '2026-03-07 12:26:09'),
(39, 154, 15, 'welcome', '2026-03-07 12:26:11'),
(40, 154, 15, 'hello', '2026-03-07 12:26:14'),
(41, 161, 15, 'welcome', '2026-03-07 13:25:11'),
(42, 163, 15, 'welcome', '2026-03-07 13:31:38'),
(43, 163, 15, 'hi', '2026-03-07 13:35:22'),
(44, 163, 16, 'hii', '2026-03-07 13:42:40'),
(45, 181, 16, 'hi', '2026-03-07 15:21:37'),
(46, 191, 17, 'hi', '2026-03-09 09:58:42'),
(47, 211, 15, 'HI', '2026-03-09 17:42:25'),
(48, 211, 15, 'WELCOME TO THE GC', '2026-03-09 17:42:34'),
(49, 213, 20, 'hi', '2026-03-10 06:37:10'),
(50, 218, 16, 'hi', '2026-03-10 19:41:21'),
(51, 218, 16, 'ill pay soon', '2026-03-10 19:41:26'),
(52, 218, 15, 'i got your cash!', '2026-03-10 19:43:14'),
(53, 226, 15, 'hi', '2026-03-11 03:28:28'),
(54, 226, 15, 'welcome', '2026-03-11 03:28:35'),
(55, 227, 15, 'hi', '2026-03-11 04:59:51'),
(56, 237, 15, 'hi', '2026-04-01 04:34:30'),
(57, 242, 15, 'hii', '2026-04-04 05:50:08');

-- --------------------------------------------------------

--
-- Table structure for table `trip_payments`
--

CREATE TABLE `trip_payments` (
  `id` int(11) NOT NULL,
  `trip_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `status` enum('unpaid','verified') DEFAULT 'unpaid',
  `paid_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `trip_payments`
--

INSERT INTO `trip_payments` (`id`, `trip_id`, `user_id`, `status`, `paid_at`) VALUES
(18, 217, 15, 'verified', '2026-03-10 19:34:33'),
(19, 218, 15, 'verified', '2026-03-10 19:39:55'),
(20, 218, 16, 'verified', '2026-03-10 19:42:13'),
(21, 225, 15, 'verified', '2026-03-10 22:21:21'),
(22, 226, 15, 'verified', '2026-03-11 03:28:15'),
(23, 227, 15, 'verified', '2026-03-11 05:00:22'),
(24, 228, 15, 'verified', '2026-03-24 15:12:11'),
(25, 237, 15, 'verified', '2026-04-01 04:34:23');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `profile_pic` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `profile_pic`) VALUES
(15, 'harsha', 'harshasujays@gmail.com', '$2y$10$BNi8f6UWaYfgERu31DoaKO3QsAy7pVYLWcwbn7aa4zC0OZc8nfdsO', 'uploads/profile_15.jpg'),
(16, 'Niveditha', 'nivedithaoffi@gmail.com', '$2y$10$2vRDlBLuOchjGNUA0G2ad.DySpU.UaBy0FMWYjoLeLM7zgyHRfA.O', ''),
(17, 'Mehida', 'mehidabijoy@gmail.com', '$2y$10$ymXuGdoWWERh.oGXnTju7u/qdaouphYkRq48wNBh/KjrPFXcH5AKe', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `destinations`
--
ALTER TABLE `destinations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`);

--
-- Indexes for table `destination_attractions`
--
ALTER TABLE `destination_attractions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `destination_id` (`destination_id`);

--
-- Indexes for table `destination_details`
--
ALTER TABLE `destination_details`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`);

--
-- Indexes for table `destination_experiences`
--
ALTER TABLE `destination_experiences`
  ADD PRIMARY KEY (`id`),
  ADD KEY `destination_id` (`destination_id`);

--
-- Indexes for table `destination_gallery`
--
ALTER TABLE `destination_gallery`
  ADD PRIMARY KEY (`id`),
  ADD KEY `destination_id` (`destination_id`);

--
-- Indexes for table `destination_restaurants`
--
ALTER TABLE `destination_restaurants`
  ADD PRIMARY KEY (`id`),
  ADD KEY `destination_id` (`destination_id`);

--
-- Indexes for table `destination_reviews`
--
ALTER TABLE `destination_reviews`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dest_reviews`
--
ALTER TABLE `dest_reviews`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_review` (`user_id`,`destination_id`),
  ADD KEY `destination_id` (`destination_id`);

--
-- Indexes for table `itineraries`
--
ALTER TABLE `itineraries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `itinerary_items`
--
ALTER TABLE `itinerary_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `review_likes`
--
ALTER TABLE `review_likes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_reaction` (`review_id`,`user_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `smart_packing_items`
--
ALTER TABLE `smart_packing_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `profile_id` (`profile_id`);

--
-- Indexes for table `smart_packing_profiles`
--
ALTER TABLE `smart_packing_profiles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `trip_id` (`trip_id`);

--
-- Indexes for table `trips`
--
ALTER TABLE `trips`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `trip_budget`
--
ALTER TABLE `trip_budget`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `trip_id` (`trip_id`);

--
-- Indexes for table `trip_members`
--
ALTER TABLE `trip_members`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `trip_messages`
--
ALTER TABLE `trip_messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `trip_payments`
--
ALTER TABLE `trip_payments`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `trip_id` (`trip_id`,`user_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `destinations`
--
ALTER TABLE `destinations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `destination_attractions`
--
ALTER TABLE `destination_attractions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT for table `destination_details`
--
ALTER TABLE `destination_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `destination_experiences`
--
ALTER TABLE `destination_experiences`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT for table `destination_gallery`
--
ALTER TABLE `destination_gallery`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `destination_restaurants`
--
ALTER TABLE `destination_restaurants`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=92;

--
-- AUTO_INCREMENT for table `destination_reviews`
--
ALTER TABLE `destination_reviews`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `dest_reviews`
--
ALTER TABLE `dest_reviews`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `itineraries`
--
ALTER TABLE `itineraries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `itinerary_items`
--
ALTER TABLE `itinerary_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `review_likes`
--
ALTER TABLE `review_likes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `smart_packing_items`
--
ALTER TABLE `smart_packing_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2671;

--
-- AUTO_INCREMENT for table `smart_packing_profiles`
--
ALTER TABLE `smart_packing_profiles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT for table `trips`
--
ALTER TABLE `trips`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=243;

--
-- AUTO_INCREMENT for table `trip_budget`
--
ALTER TABLE `trip_budget`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `trip_members`
--
ALTER TABLE `trip_members`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=106;

--
-- AUTO_INCREMENT for table `trip_messages`
--
ALTER TABLE `trip_messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT for table `trip_payments`
--
ALTER TABLE `trip_payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `destination_attractions`
--
ALTER TABLE `destination_attractions`
  ADD CONSTRAINT `destination_attractions_ibfk_1` FOREIGN KEY (`destination_id`) REFERENCES `destination_details` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `destination_experiences`
--
ALTER TABLE `destination_experiences`
  ADD CONSTRAINT `destination_experiences_ibfk_1` FOREIGN KEY (`destination_id`) REFERENCES `destination_details` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `destination_gallery`
--
ALTER TABLE `destination_gallery`
  ADD CONSTRAINT `destination_gallery_ibfk_1` FOREIGN KEY (`destination_id`) REFERENCES `destination_details` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `destination_restaurants`
--
ALTER TABLE `destination_restaurants`
  ADD CONSTRAINT `destination_restaurants_ibfk_1` FOREIGN KEY (`destination_id`) REFERENCES `destination_details` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `dest_reviews`
--
ALTER TABLE `dest_reviews`
  ADD CONSTRAINT `dest_reviews_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `dest_reviews_ibfk_2` FOREIGN KEY (`destination_id`) REFERENCES `destination_details` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `review_likes`
--
ALTER TABLE `review_likes`
  ADD CONSTRAINT `review_likes_ibfk_1` FOREIGN KEY (`review_id`) REFERENCES `dest_reviews` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `review_likes_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `smart_packing_items`
--
ALTER TABLE `smart_packing_items`
  ADD CONSTRAINT `smart_packing_items_ibfk_1` FOREIGN KEY (`profile_id`) REFERENCES `smart_packing_profiles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `smart_packing_profiles`
--
ALTER TABLE `smart_packing_profiles`
  ADD CONSTRAINT `smart_packing_profiles_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `smart_packing_profiles_ibfk_2` FOREIGN KEY (`trip_id`) REFERENCES `trips` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `trip_budget`
--
ALTER TABLE `trip_budget`
  ADD CONSTRAINT `trip_budget_ibfk_1` FOREIGN KEY (`trip_id`) REFERENCES `trips` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `trip_payments`
--
ALTER TABLE `trip_payments`
  ADD CONSTRAINT `trip_payments_ibfk_1` FOREIGN KEY (`trip_id`) REFERENCES `trips` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `trip_payments_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
