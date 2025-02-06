CREATE DATABASE  IF NOT EXISTS `nutrifood` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `nutrifood`;
-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: localhost    Database: nutrifood
-- ------------------------------------------------------
-- Server version	8.0.40

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `ingredients`
--

DROP TABLE IF EXISTS `ingredients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ingredients` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingredients`
--

LOCK TABLES `ingredients` WRITE;
/*!40000 ALTER TABLE `ingredients` DISABLE KEYS */;
INSERT INTO `ingredients` VALUES (1,'Мука'),(2,'Молоко'),(3,'Яйцо'),(4,'Сыр'),(5,'Томат'),(6,'Курица'),(7,'Салат'),(8,'Соус Цезарь'),(9,'olive oil'),(10,'soup'),(11,'carrot'),(12,'celery'),(13,'onion'),(14,'salt and pepper'),(15,'vegetable stock'),(16,'red lentils'),(17,'tomato'),(18,'lentils'),(19,'turnip'),(20,'garlic'),(21,'chicken breast'),(22,'seasoning'),(23,'parsley'),(24,'fresh parsley'),(25,'extra virgin olive oil'),(26,'red pepper flakes'),(27,'asparagus'),(28,'broth'),(29,'creme fraiche'),(30,'greek yogurt'),(31,'sour cream'),(32,'chives'),(33,'peas'),(34,'kale'),(35,'vinegar'),(36,'cream of mushroom soup'),(37,'beef broth'),(38,'water'),(39,'green onions'),(40,'beef stew meat'),(41,'potato'),(42,'kidney beans'),(43,'brown rice'),(44,'celery seed'),(45,'green beans'),(46,'red pepper'),(47,'eggplant'),(48,'marjoram'),(49,'thyme'),(50,'sage'),(51,'cooking oil'),(52,'liquid smoke'),(53,'rice'),(54,'sriracha'),(55,'pepper'),(56,'herbs'),(57,'salt'),(58,'stew'),(59,'cauliflower florets'),(60,'cauliflower rice'),(61,'cauliflower'),(62,'couscous'),(63,'butter'),(64,'spread'),(65,'coconut oil'),(66,'broccoli'),(67,'sesame oil'),(68,'soy sauce'),(69,'sesame seeds'),(70,'chicken'),(71,'sandwich bread'),(72,'sun dried tomatoes'),(73,'chickpeas'),(74,'quinoa'),(75,'cashews'),(76,'dried cherries'),(77,'cheese'),(78,'salsa'),(79,'bay leaves'),(80,'beans'),(81,'rosemary'),(82,'brussels sprouts'),(83,'mustard'),(84,'honey'),(85,'sprouts'),(86,'walnuts'),(87,'яйца'),(88,'сахар');
/*!40000 ALTER TABLE `ingredients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recipeingredients`
--

DROP TABLE IF EXISTS `recipeingredients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recipeingredients` (
  `id` int NOT NULL AUTO_INCREMENT,
  `recipe_id` int DEFAULT NULL,
  `ingredient_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `recipe_id` (`recipe_id`),
  KEY `ingredient_id` (`ingredient_id`),
  CONSTRAINT `recipeingredients_ibfk_1` FOREIGN KEY (`recipe_id`) REFERENCES `recipes` (`id`),
  CONSTRAINT `recipeingredients_ibfk_2` FOREIGN KEY (`ingredient_id`) REFERENCES `ingredients` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=163 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recipeingredients`
--

LOCK TABLES `recipeingredients` WRITE;
/*!40000 ALTER TABLE `recipeingredients` DISABLE KEYS */;
INSERT INTO `recipeingredients` VALUES (1,1,1),(2,1,2),(3,1,3),(4,2,1),(5,2,4),(6,2,5),(7,3,6),(8,3,7),(9,3,8),(10,4,9),(11,4,10),(12,4,11),(13,4,12),(14,4,13),(15,4,14),(16,4,15),(17,4,16),(18,4,17),(19,4,18),(20,4,19),(21,4,20),(22,4,10),(23,4,21),(24,4,22),(25,4,23),(26,4,24),(27,4,10),(28,5,20),(29,5,13),(30,5,20),(31,5,13),(32,5,25),(33,5,26),(34,5,14),(35,5,27),(36,5,28),(37,5,29),(38,5,30),(39,5,31),(40,5,32),(41,5,33),(42,5,10),(43,6,9),(44,6,34),(45,6,35),(46,6,20),(47,7,36),(48,7,37),(49,7,22),(50,7,38),(51,7,14),(52,7,39),(53,7,40),(54,7,41),(55,7,11),(56,7,12),(57,7,13),(58,8,42),(59,8,43),(60,8,38),(61,8,42),(62,8,38),(63,8,44),(64,8,45),(65,8,46),(66,8,47),(67,8,48),(68,8,17),(69,8,11),(70,8,12),(71,8,20),(72,8,13),(73,8,49),(74,8,50),(75,8,51),(76,8,15),(77,8,42),(78,8,52),(79,8,53),(80,8,14),(81,8,52),(82,8,22),(83,8,54),(84,8,55),(85,8,56),(86,8,38),(87,8,57),(88,8,58),(89,9,59),(90,9,60),(91,9,61),(92,9,62),(93,9,53),(94,9,63),(95,9,51),(96,9,39),(97,9,20),(98,9,61),(99,9,64),(100,9,51),(101,9,65),(102,9,63),(103,9,64),(104,9,53),(105,9,53),(106,9,66),(107,9,33),(108,9,67),(109,9,68),(110,9,53),(111,9,69),(112,9,68),(113,9,39),(114,9,70),(115,9,71),(116,9,53),(117,9,57),(118,10,72),(119,10,73),(120,10,74),(121,10,38),(122,10,75),(123,10,71),(124,10,72),(125,10,76),(126,10,73),(127,10,75),(128,10,74),(129,11,9),(130,11,13),(131,11,53),(132,11,31),(133,11,77),(134,11,78),(135,12,79),(136,12,20),(137,12,80),(138,12,13),(139,12,38),(140,12,79),(141,12,57),(142,12,10),(143,12,9),(144,12,81),(145,13,82),(146,13,38),(147,13,82),(148,13,9),(149,13,83),(150,13,35),(151,13,84),(152,13,85),(153,13,86),(154,13,85),(155,13,35),(156,13,55),(157,14,1),(158,14,87),(159,14,88),(160,15,1),(161,15,87),(162,15,88);
/*!40000 ALTER TABLE `recipeingredients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recipes`
--

DROP TABLE IF EXISTS `recipes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recipes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(80) NOT NULL,
  `description` varchar(120) NOT NULL,
  `time` int DEFAULT NULL,
  `kcal` int DEFAULT NULL,
  `likes` int DEFAULT NULL,
  `image` text,
  `instructions` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recipes`
--

LOCK TABLES `recipes` WRITE;
/*!40000 ALTER TABLE `recipes` DISABLE KEYS */;
INSERT INTO `recipes` VALUES (1,'Блины','Традиционные русские блины',30,200,100,'static/images/101.png','123'),(2,'Пицца','Итальянская пицца с сыром и томатами',60,800,200,'static/images/102.png','456'),(3,'Салат Цезарь','Классический салат Цезарь с курицей',15,350,150,'static/images/test.png','678'),(4,'Red Lentil Soup with Chicken and Turnips','Red Lentil Soup with Chicken and Turnips might be a good recipe to expand your main course repertoire. This recipe serve',55,0,0,'https://img.spoonacular.com/recipes/715415-312x231.jpg','To a large dutch oven or soup pot, heat the olive oil over medium heat.\nAdd the onion, carrots and celery and cook for 8-10 minutes or until tender, stirring occasionally.\nAdd the garlic and cook for an additional 2 minutes, or until fragrant. Season conservatively with a pinch of salt and black pepper.To the pot, add the tomatoes, turnip and red lentils. Stir to combine. Stir in the vegetable stock and increase the heat on the stove to high. Bring the soup to a boil and then reduce to a simmer. Simmer for 20 minutes or until the turnips are tender and the lentils are cooked through.\nAdd the chicken breast and parsley. Cook for an additional 5 minutes. Adjust seasoning to taste.\nServe the soup immediately garnished with fresh parsley and any additional toppings. Enjoy!'),(5,'Asparagus and Pea Soup: Real Convenience Food','Asparagus and Pea Soup: Real Convenience Food requires approximately <b>20 minutes</b> from start to finish. Watching yo',0,0,0,'https://img.spoonacular.com/recipes/716406-312x231.jpg','Chop the garlic and onions.\nSaute the onions in the EVOO, adding the garlic after a couple of minutes; cook until the onions are translucent.\nAdd the whole bag of asparagus and cover everything with the broth. Season with salt and pepper and a pinch of red pepper flakes, if using.Simmer until the asparagus is bright green and tender (if you\'ve thawed the asparagus it will only take a couple of minutes). Turn off the heat and puree using an immersion blender.\nAdd peas (the heat of the soup will quickly thaw them) and puree until smooth; add more until it reaches the thickness you like.Top with chives and a small dollop of creme fraiche or sour cream or greek yogurt.'),(6,'Garlicky Kale','Garlicky Kale requires approximately <b>45 minutes</b> from start to finish. This side dish has <b>170 calories</b>, <b>',0,0,0,'https://img.spoonacular.com/recipes/644387-312x231.jpg','Heat the olive oil in a large pot over medium heat.\nAdd the kale and cover.Stir occasionally until the volume of the kale is reduced by half. Uncover.\nAdd garlic and basalmic.Allow to cook for about another 30 seconds or so, mixing well so that the garlic and vinegar are well distributed.\nServe hot.'),(7,'Slow Cooker Beef Stew','If you want to add more <b>gluten free and dairy free</b> recipes to your recipe box, Slow Cooker Beef Stew might be a r',490,0,0,'https://img.spoonacular.com/recipes/715446-312x231.jpg','To get started, heat your slow cooker to low.\nPour in the cream of mushroom soup, Dale\'s seasoning, water, and beef broth and stir until mixed well.\nAdd in your stew meat, potatoes, onions, carrots, celery, and green onions. Stir well until covered and cook on low for 8 hours. You can add salt and pepper as desired, but the flavors and the Dale\'s marry together so well that you probably won’t need them.'),(8,'Red Kidney Bean Jambalaya','Red Kidney Bean Jambalayan is a main course that serves 6. One portion of this dish contains approximately <b>18g of pro',0,0,0,'https://img.spoonacular.com/recipes/782601-312x231.jpg','Rinse the kidney beans and brown rice separately. Cover the kidney beans with water and soak for 8 hours or overnight. In a separate bowl, cover the brown rice with water and soak for 8 hours or overnight.\nDrain and rinse the kidney beans, then transfer to a medium saucepan and cover with fresh water. Bring to a boil, reduce heat to medium-low, cover, and simmer for 1 hour or until just tender but not falling apart.\nDrain and set aside.\nHeat the oil in a large saucepan over medium heat. When hot, add the onion and saut for 5 minutes. Now add the garlic, carrots, celery and green beans, and stir for another 5 minutes. Next add the tomatoes, red pepper, eggplant, sage, thyme, marjoram and celery seed, and continue to stir for another few minutes.\nPour in the vegetable stock, liquid smoke, rice and the cooked kidney beans. Bring to a boil, reduce heat to medium low, cover, and cook, stirring occasionally, for 45 minutes or until the rice is tender.\nAdd water as necessary if the stew becomes too dry.Season with sriracha, salt and pepper, and taste for seasoning  add more liquid smoke, sriracha, salt, pepper or herbs as desired.'),(9,'Cauliflower, Brown Rice, and Vegetable Fried Rice','The recipe Cauliflower, Brown Rice, and Vegetable Fried Rice is ready <b>in around 30 minutes</b> and is definitely a gr',30,0,0,'https://img.spoonacular.com/recipes/716426-312x231.jpg','Remove the cauliflower\'s tough stem and reserve for another use. Using a food processor, pulse cauliflower florets until they resemble rice or couscous. You should end up with around four cups of \"cauliflower rice.\"\nHeat 1T butter and 1T oil in a large skillet over medium heat.\nAdd garlic and the white and light green pieces of scallion. Sauté about a minute.\nAdd the cauliflower to the pan. Stir to coat with oil, then spread out in pan and let sit; you want it cook a bit and to caramelize (get a bit brown), which will bring out the sweetness. After a couple of minutes, stir and spread out again.\nAdd cold rice (it separates easily, so it won\'t clump up during cooking), plus the additional grapeseed and coconut oil or butter. Raise heat to medium-high. Toss everything together and, again, spread the mixture out over the whole pan and press a bit into the bottom.\nLet it sit for about two minutes—so the rice can get toasted and a little crispy.\nAdd the peas and broccoli and stir again.\nDrizzle soy sauce and toasted sesame oil over rice.Cook for another minute or so and turn off heat.\nAdd chopped scallion tops and toss.I like to toast some sesame seeds in a dry pan; I sprinkle these and some more raw, chopped scallion over the top of the rice for added flavor and crunch.Season to taste with salt and, if you\'d like, more soy sauce. Keep in mind that if you\'re serving this with something salty and saucy (ie. teriyaki chicken) you may want to hold off on adding too much salt to the fried rice.'),(10,'Quinoa and Chickpea Salad with Sun-Dried Tomatoes and Dried Cherries','Need a <b>gluten free, dairy free, and vegetarian side dish</b>? Quinoan and Chickpea Salad with Sun-Dried Tomatoes and ',0,0,0,'https://img.spoonacular.com/recipes/716004-312x231.jpg','Rinse the quinoa and soak for 8 hours or overnight in 2 cups of water. Rinse the chickpeas and soak for 8 hours or overnight in several inches of water.Rinse the chickpeas and transfer to a small saucepan. Cover with fresh water and bring to a boil. Reduce heat to medium-low, cover, and simmer for 1 hour or until buttery soft.While the chickpeas are cooking, soak the sun-dried tomatoes in hot water for 30 minutes, then drain and chop. Meanwhile, bring the quinoa to a boil in a medium saucepan. Reduce heat to the lowest setting, cover, and simmer for 15 minutes or until the water is absorbed.\nRemove from heat and wait 5 minutes before fluffing with a fork.Meanwhile, toast the cashews in a dry unoiled skillet or saucepan over medium-low heat, tossing or stirring frequently, for 10 minutes until browned.\nTransfer the chickpeas, quinoa, sun-dried tomatoes, cashews and dried cherries to a large mixing bowl.\nWhisk the dressing ingredients together and pour over the salad. Stir to combine and serve at room temperature or chilled.'),(11,'Easy Homemade Rice and Beans','Easy Homemade Rice and Beans is a main course that serves 2. One serving contains <b>446 calories</b>, <b>19g of protein',0,0,0,'https://img.spoonacular.com/recipes/716627-312x231.jpg','Heat the olive oil in a large pot over medium heat.\nAdd onions and saute until soft, or for about 5 minutes.\nAdd all other remaining ingredients and stir together. Increase the heat to medium high and bring to a boil. Cover and reduce heat to medium low so that the mixture simmers. Cook for 15-20 minutes, or until rice is fluffy and liquid is absorbed.*\nServe with salsa, cheese, and sour cream.'),(12,'Tuscan White Bean Soup with Olive Oil and Rosemary','Tuscan White Bean Soup with Olive Oil and Rosemary is a <b>gluten free, dairy free, lacto ovo vegetarian, and vegan</b> ',0,0,0,'https://img.spoonacular.com/recipes/664147-312x231.jpg','Rinse the beans thoroughly and place them in a 7-quart slow cooker along with the water, onion, garlic, and bay leaf. Cover and cook on LOW for about 8 hours, or until the beans are nice and tender.\nRemove the bay leaf. Using a handheld immersion blender, puree the remaining ingredients to the desired texture.\nAdd the salt to taste.Ladle the soup into bowls.\nDrizzle with the olive oil, sprinkle with rosemary, and serve.'),(13,'Crunchy Brussels Sprouts Side Dish','The recipe Crunchy Brussels Sprouts Side Dish can be made <b>in about 30 minutes</b>. For <b>$1.69 per serving</b>, you ',0,0,0,'https://img.spoonacular.com/recipes/640941-312x231.jpg','Blanch the Brussels sprouts in boiling water for 6-8 minutes or in a microwave oven in a little water for about 4 minutes.\nDrain.\nSaute the Brussels sprouts, stirring constantly, until they become golden-brown in color.Meanwhile mix the vinegar, mustard, honey and olive oil.\nAdd walnuts to the sprouts, stir and combine.\nPour the vinegar dressing over the sprouts, season with pepper.\nMix and combine so that each sprout is covered with the dressing.\nServe warm or cold as a side dish.'),(14,'test','крутой тест',30,200,0,'C:\\Users\\rober\\OneDrive\\Documents\\python\\web_project\\static\\images\\1738824324_test.png','лох'),(15,'test','lox',30,200,0,'C:\\Users\\rober\\OneDrive\\Documents\\python\\web_project\\static\\images\\1738824338_test.png','lox');
/*!40000 ALTER TABLE `recipes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userrecipes`
--

DROP TABLE IF EXISTS `userrecipes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userrecipes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `recipe_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `recipe_id` (`recipe_id`),
  CONSTRAINT `userrecipes_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `userrecipes_ibfk_2` FOREIGN KEY (`recipe_id`) REFERENCES `recipes` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userrecipes`
--

LOCK TABLES `userrecipes` WRITE;
/*!40000 ALTER TABLE `userrecipes` DISABLE KEYS */;
INSERT INTO `userrecipes` VALUES (1,1,1),(2,1,2),(3,2,3),(4,5,14),(5,5,15);
/*!40000 ALTER TABLE `userrecipes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(80) NOT NULL,
  `email` varchar(120) DEFAULT NULL,
  `password_hash` varchar(255) NOT NULL,
  `is_moderator` tinyint DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'CookMaster','cookmaster@example.com','password123',0),(2,'ChefGourmet','chefgourmet@example.com','password456',0),(5,'123',NULL,'scrypt:32768:8:1$iEoXe2T2rVtYnzwN$5b838bf04bab75f340557e89847e7f01c377b1016603a51515db2d4f27f403063a2f5be7e5a98c8decfda0a576545bac2c8cab8cd846ccbd38599b79ee8ade56',1),(6,'12',NULL,'scrypt:32768:8:1$h45cLdfgpu6NplqH$860fd7338c38736b793f77185cd8d9d93e47106b5c211f2245bb50b1f76b85c21c7fe8fe1894d8181dc78d306425c980de5356d78f142b2eaa3819c2f0147ec1',0);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'nutrifood'
--

--
-- Dumping routines for database 'nutrifood'
--
/*!50003 DROP PROCEDURE IF EXISTS `exclude_ingr` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `exclude_ingr`(IN ingr TEXT)
BEGIN

    SELECT DISTINCT recipes.*
    FROM recipes
    WHERE NOT EXISTS (
        SELECT 1
        FROM recipeingredients
        JOIN ingredients ON recipeingredients.ingredient_id = ingredients.id
        WHERE recipeingredients.recipe_id = recipes.id
          AND FIND_IN_SET(ingredients.name, ingr) > 0
    ) limit 3;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-02-06  9:52:15
