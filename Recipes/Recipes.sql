
DROP DATABASE IF EXISTS `Recipes`;
CREATE DATABASE  IF NOT EXISTS `Recipes`;
USE `Recipes`;


--
-- Table structure for table `Recipe_Main`
--

DROP TABLE IF EXISTS `Recipe_Main`;

CREATE TABLE `Recipe_Main` (
  `recipe_id` int(11) NOT NULL AUTO_INCREMENT,
  `rec_title` varchar(255) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `recipe_desc` varchar(1024) DEFAULT NULL,
  `prep_time` int(11) DEFAULT NULL,
  `cook_time` int(11) DEFAULT NULL,
  `servings` int(11) DEFAULT NULL,
  `difficulty` int(11) DEFAULT NULL,
  `directions` varchar(4096) DEFAULT NULL,
  PRIMARY KEY (`recipe_id`),
  KEY `recipe_title_idx` (`rec_title`),
  KEY `prep_time_idx` (`prep_time`),
  KEY `cook_time_idx` (`cook_time`),
  KEY `difficulty_idx` (`difficulty`),
  KEY `FK_category_id_idx` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Recipe_Main`
--

LOCK TABLES `Recipe_Main` WRITE;

INSERT INTO `Recipe_Main` VALUES (1,'Chicken Marsala',1,'Chicken and mushrooms',20,20,4,2,'Flatten chicken breats to 1/4 inch. Place flour in a resealable plastic bag with two pieces of chicken at a time and shake to coat.Cook chicken in olive oil in a large skillet over medium heat for 3-5 minutes on each side or until the meat reaches a temparature of 170°. Remove chicken from skillet and keep warm.Use the same skillet to saute the mushrooms in butter until tender. Add the wine, parsley and rosemary. Bring mixture to a boil and cook until liquid is reduced by half. Serve chicken with mushroom sauce; sprinkle with cheese if desired.'),(2,'Absolute Brownies',2,'Rich, chcolate brownies',25,35,16,2,'Preheat oven to 350 degrees F (175 degrees C). Grease and flour an 8 inch square pan.In a large saucepan, melt 1/2 cup butter. Remove from heat, and stir in sugar, eggs, and 1 teaspoon vanilla. Beat in 1/3 cup cocoa, 1/2 cup flour, salt, and baking powder. Spread batter into prepared pan.Bake in preheated oven for 25 to 30 minutes. Do not overcook.To Make Frosting: Combine 3 tablespoons butter, 3 tablespoons cocoa, 1 tablespoon honey, 1 teaspoon vanilla, and 1 cup confectioners sugar. Frost brownies while they are still warm.');

UNLOCK TABLES;

--
-- Table structure for table `Rec_Ingredients`
--

DROP TABLE IF EXISTS `Rec_Ingredients`;

CREATE TABLE `Rec_Ingredients` (
  `rec_ingredient_id` int(11) NOT NULL AUTO_INCREMENT,
  `recipe_id` int(11) NOT NULL,
  `amount` decimal(6,2) NOT NULL,
  `ingredient_id` int(11) NOT NULL,
  PRIMARY KEY (`rec_ingredient_id`),
  KEY `FK_ingredient_recipe_id_idx` (`recipe_id`),
  KEY `FK_recipe_ingredient_id_idx` (`ingredient_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;


LOCK TABLES `Rec_Ingredients` WRITE;

INSERT INTO `Rec_Ingredients` VALUES (1,1,4.00,1),(2,1,2.00,2),(3,1,2.00,3),(4,1,2.00,4),(5,1,2.00,5),(6,1,0.75,6),(7,1,0.25,8),(8,1,2.00,9),(9,1,2.00,10),(10,2,0.50,3),(11,2,1.00,11),(12,2,2.00,12),(13,2,1.00,13),(14,2,0.33,14),(15,2,0.50,2),(16,2,0.25,15);

UNLOCK TABLES;

--
-- Table structure for table `Ingredients`
--

DROP TABLE IF EXISTS `Ingredients`;

CREATE TABLE `Ingredients` (
  `ingredient_id` int(11) NOT NULL AUTO_INCREMENT,
  `ingred_name` varchar(75) NOT NULL,
  PRIMARY KEY (`ingredient_id`),
  KEY `ingredient_name_idx` (`ingred_name`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Ingredients`
--

LOCK TABLES `Ingredients` WRITE;

INSERT INTO `Ingredients` VALUES (1,'Chicken breast halves, boneless'),(2,'Flour'),(3,'Olive oil'),(4,'Sliced mushrooms'),(5,'Butter'),(6,'Marsala wine'),(7,'Chicken broth'),(8,'Rosemary, dried and crushed'),(9,'Parsley, minced'),(10,'Parmesan cheese, grated'),(11,'White sugar'),(12,'Egg(s)'),(13,'Vanilla extract'),(14,'Unsweetened cocoa powder'),(15,'Salt'),(16,'Baking powder'),(17,'Butter, softened'),(18,'Honey'),(19,'Sugar, confectioners');

UNLOCK TABLES;

--
-- Table structure for table `Categories`
--

DROP TABLE IF EXISTS `Categories`;

CREATE TABLE `Categories` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`category_id`),
  KEY `category_name_idx` (`category_name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `categories`
--

LOCK TABLES `Categories` WRITE;

INSERT INTO `Categories` VALUES (1,'Entree'),(2,'Desserts');

UNLOCK TABLES;

--
--
--

LOCK TABLES `Recipe_Main` WRITE;

INSERT INTO `Recipe_Main` VALUES (3,'Hot Chocolate',3,'Hot chocolate milk with cookie chips',2,10,1,1,'Mix 2 tablespoons unsweetened cocoa powder, 2 tablespoons sugar, a pinch of salt, and 2 tablespoons of milk in a small saucepan. Keep it on low heat until the cocoa and sugar are dissolved. Add 1 cup of milk and keep it on medium heat. When its hot, add 1/4 tablespoon of vanilla extract. garnish it with cookie chips and serve.'),(4,'Jalapeno Popper Crisps',4,'Fried crispy jalapeno chips with bacon and cheese',15,10,2,2,'Preheat oven to 375 degrees, cook 4 slices of bacon until crisp, and chop it when done. Add 1 tablespoon of Parmesan cheese on a baking sheet and top with 1 tablespoon of Cheddar cheese. Add jalapeno slices and sprinkle with chopped bacon and black pepper. Bake until crispy. Let cool and serve.');

UNLOCK TABLES;

LOCK TABLES `Rec_Ingredients` WRITE;

INSERT INTO `Rec_Ingredients` VALUES (17,3,2.00,14),(18,3,2.00,11),(19,3,1.00,15),(20,3,1.00,20),(21,3,0.25,13),(22,4,4.00,21),(23,4,1.00,10),(24,4,0.50,22),(25,4,1.00,23);

UNLOCK TABLES;

LOCK TABLES `Ingredients` WRITE;

INSERT INTO `Ingredients` VALUES (20,'Whole milk'),(21,'Bacon, sliced'),(22,'Cheddar cheese, shredded'),(23,'Jalapeno,sliced thinly');

UNLOCK TABLES;

LOCK TABLES `Categories` WRITE;

INSERT INTO `Categories` VALUES (3,'Beverages'),(4,'Appetizers');

UNLOCK TABLES;

--
--
--

SELECT a.*,b.*,d.*,c.*
From Recipe_Main a 
left join Rec_Ingredients b on b.recipe_id = a.recipe_id
left join Ingredients c on c.ingredient_id = b.ingredient_id
left join Categories d on d.category_id = a.category_id
where a.recipe_id >= 3;

--
--
--

SELECT a.rec_title,c.ingred_name,d.category_name
From Recipe_Main a 
left join Rec_Ingredients b on b.recipe_id = a.recipe_id
left join Ingredients c on c.ingredient_id = b.ingredient_id
left join Categories d on d.category_id = a.category_id
order by category_name DESC, rec_title ASC, ingred_name DESC;

--
--
--
