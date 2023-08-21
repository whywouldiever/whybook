/*
 Navicat Premium Data Transfer

 Source Server         : HQS
 Source Server Type    : MySQL
 Source Server Version : 80031 (8.0.31)
 Source Host           : localhost:3306
 Source Schema         : books

 Target Server Type    : MySQL
 Target Server Version : 80031 (8.0.31)
 File Encoding         : 65001

 Date: 29/05/2023 16:24:00
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for commodity
-- ----------------------------
DROP TABLE IF EXISTS `commodity`;
CREATE TABLE `commodity`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_czech_ci NOT NULL,
  `photo` mediumblob NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_czech_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of commodity
-- ----------------------------

-- ----------------------------
-- Table structure for image
-- ----------------------------
DROP TABLE IF EXISTS `image`;
CREATE TABLE `image`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `bookname` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_czech_ci NOT NULL,
  `url` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_czech_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 39 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_czech_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of image
-- ----------------------------
INSERT INTO `image` VALUES (27, '三国演义', 'img/1683693802262see.png');
INSERT INTO `image` VALUES (28, '三国演义', 'img/1683694077395see.png');
INSERT INTO `image` VALUES (29, '三国演义', 'img/16836943329222.png');
INSERT INTO `image` VALUES (30, '三国', 'img/1683694659248see.png');
INSERT INTO `image` VALUES (31, '三国', 'img/1683698583065see.png');
INSERT INTO `image` VALUES (32, '三国演义', 'D:\\img16836987201202.png');
INSERT INTO `image` VALUES (33, '三国演义', 'img16836989991973.png');
INSERT INTO `image` VALUES (34, '三', 'img/16836993012083.png');
INSERT INTO `image` VALUES (35, '可以', 'img/16836994987394.png');
INSERT INTO `image` VALUES (36, '可以的', 'img/1683699829628see.png');
INSERT INTO `image` VALUES (37, '三国演义', 'img/1683700234413see.png');
INSERT INTO `image` VALUES (38, '水浒传', 'img/16842156489293.png');

-- ----------------------------
-- Table structure for images
-- ----------------------------
DROP TABLE IF EXISTS `images`;
CREATE TABLE `images`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_czech_ci NULL DEFAULT NULL,
  `bookname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_czech_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 133 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_czech_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of images
-- ----------------------------
INSERT INTO `images` VALUES (121, 'd57a9cab-0994-4dab-b66f-39222b186221book02.jpg', '水浒传');
INSERT INTO `images` VALUES (122, 'ea4b4e84-7c70-4610-9de6-b350bb1ced0d2.png', '三国演义');
INSERT INTO `images` VALUES (123, '28d5cfd0-994f-4ce8-926b-0bbd9a3be5f72.png', '三国演义');
INSERT INTO `images` VALUES (124, '8874a187-96b8-49ea-a52e-a75565ece3c42.png', '三国演义');
INSERT INTO `images` VALUES (125, 'df02f01c-88b9-4d61-a0ce-18c63fd80adb2.png', '三国演义');
INSERT INTO `images` VALUES (126, '8db795a2-29a6-4fb0-a94d-8f666269cae42.png', '三国演义');
INSERT INTO `images` VALUES (127, '5979cb9f-9eab-4ff7-9d4c-ebe6fef282182.png', '三国演义');
INSERT INTO `images` VALUES (128, '858771bb-107e-405f-9b61-f60723e03d522.png', '红楼梦');
INSERT INTO `images` VALUES (129, '468924dd-0442-4e91-8156-1e675b91bc9b2.png', '三国演义');
INSERT INTO `images` VALUES (130, 'e15b9518-4b2b-40c8-99ce-7aaabcc1d9242.png', '三国演义');
INSERT INTO `images` VALUES (131, '1ddc1009-ec9c-4d34-98bc-1718688346e43.png', '三国演义');
INSERT INTO `images` VALUES (132, '633a980a-cda1-434c-93b8-efda2a7ec0e32.png', '红楼梦');

-- ----------------------------
-- Table structure for t_book
-- ----------------------------
DROP TABLE IF EXISTS `t_book`;
CREATE TABLE `t_book`  (
  `bid` int NOT NULL AUTO_INCREMENT COMMENT '图书信息的ID',
  `bookName` varchar(55) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '图书名称',
  `author` varchar(55) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '作者',
  `image` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '图片',
  `press` varchar(55) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '出版社',
  `introduction` varchar(655) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '图书简介',
  `tid` int NULL DEFAULT NULL COMMENT '类型ID',
  `times` int NULL DEFAULT NULL COMMENT '被借阅次数',
  `rest` int NULL DEFAULT NULL COMMENT '剩余',
  `borrowed` int NULL DEFAULT NULL COMMENT '被借',
  PRIMARY KEY (`bid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_book
-- ----------------------------
INSERT INTO `t_book` VALUES (1, '《C++程序设计》', '谭浩强', 'https://m.qpic.cn/psc?/V54HJSIm40p3K72sIUEw4GAfWS0D9t4S/ruAMsa53pVQWN7FLK88i5vYYx93WvfhNiKZxOOKrTo7GTrBJHYRDbPd0U0laOmHQ5IA*lIGFpAl900Dm9qb0IXZ1In8p*b3j045ppypPt2s!/mnull&bo=DgGBAQ4BgQEBByA!&rf=photolist&t=5', '清华大学出版社', '《中国高等院校计算机基础教育课程体系规划教材：C++程序设计（第2版）》作者谭浩强深入调查了大学的程序设计课程的现状和发展趋势，参阅了国内外数十种有关C++的教材，认真分析了读者在学习中的困难和认识规律，设计了读者易于学习的教材体系，于2004年出版了《C++程序设计》一书。该书降低入门起点，不需要C语言的基础，从零起点介绍程序设计和C++。广大师生用后反映非常好，认为该书定位准确，概念清晰，深入浅出，取舍合理，以通俗易懂的语言对C++的许多难懂的概念作了透彻而通俗的说明，大大降低了初学者学习的困难，是一本初学者学习C++的好教材。 根据教学实践的需要，作者对该书进行了修订，出版了本书，与第1版相比，内容更加丰富，讲解更加清晰，学习更加容易，依据ANSIC++标准进行介绍，引导读者从一开始就按C++的要求编程，而不是过多地迁就C语言的习惯。', 3, 12, 30, 25);
INSERT INTO `t_book` VALUES (2, '《盗墓笔记》', '南派三叔', 'https://m.qpic.cn/psc?/V54HJSIm40p3K72sIUEw4GAfWS0D9t4S/ruAMsa53pVQWN7FLK88i5irl6bKyRtcd0KZnE3*PEF*f3VbuZSSEDzg9.J60bdNXZErh1AmKCeJcHqcpsELSPUuV3wznas2wd8sGcIELR5I!/mnull&bo=OASgBTgEoAUBByA!&rf=photolist&t=5', '上海文化出版社', '故事起源於1952年，主角吴邪的祖父吴老狗在长沙的血屍墓里发现战国帛书，而引发后来吴邪从帛书解谜途中的一段段冒险。五十年後，吴邪一个看似单纯的吴家富二代，大学毕业後便经营著古董店，日子过一天是一天，殊不知其身世冒险之离奇，因为发现先人笔记中一个秘密就此展开。抱著好奇和一颗想见世面的心，他硬是跟上他三叔及一群盗墓高手的鲁王宫之旅，欲解开帛书之谜。在这个过程中他遇见了闷油瓶和胖子。在途中，很多他一辈子都没见过的东西，或是连想都没想过的东西，一个接著一个出现。遭遇的每件事，越来越离奇。就在他发现自己的生活满是谜题，并欲寻求解答时，唯一的线索──「三叔」却消失了。不甘放弃的吴邪，决定追根究柢，也决定今後不凡但却不为人知的冒险旅程。故事起源於1952年，主角吴邪的祖父吴老狗在长沙的血屍墓里发现战国帛书，而引发后来吴邪从帛书解谜途中的一段段冒险。五十年後，吴邪一个看似单纯的吴家富二代，大学毕业後便经营著古董店，日子过一天是一天，殊不知其身世冒险之离奇，因为发现先人笔记中一个秘密就此展开。抱著好奇和一颗想见世面的心，他硬是跟上他三叔及一群盗墓高手的鲁王宫之旅，欲解开帛书之谜。在这个过程中他遇见了闷油瓶和胖子。在途中，很多他一辈子都没见过的东西，或是连想都没想过的东西，一个接著一个出现。遭遇的每件事，越来越离奇。就在他发现自己的生活满是谜题，并欲寻求解答时，唯一的线索──「三叔」却消失了。不甘放弃的吴邪，决定追根究柢，也决定今後不凡但却不为人知的冒险旅程。', 4, 6, 30, 18);
INSERT INTO `t_book` VALUES (3, '《红楼梦》', '曹雪芹', 'https://m.qpic.cn/psc?/V54HJSIm40p3K72sIUEw4GAfWS0D9t4S/ruAMsa53pVQWN7FLK88i5k6jWxK.zFiFBkACGoZO140xZTsJFFW.pLFEzF*RZ7BrK95xh.3VRBgTqJXF1USGu.HSTJPvdyizMiV8HBb*UU4!/mnull&bo=2AA7AdgAOwEDByI!&rf=photolist&t=5', '人民文学出版社', '《红楼梦》，原名《石头记》，中国古代章回体长篇小说，中国古典四大名著之一。其通行本共120回，一般认为前80回是清代作家曹雪芹所著，后40回作者为无名氏，由高鹗，程伟元整理。小说以贾、史、王、薛四大家族的兴衰为背景，以富贵公子贾宝玉为视角，以贾宝玉与林黛玉、薛宝钗的爱情婚姻悲剧为主线，描绘了一些闺阁佳人的人生百态，展现了真正的人性美和悲剧美，是一部从各个角度展现女性美以及中国古代社会百态的史诗性著作。', 1, 4, 20, 8);
INSERT INTO `t_book` VALUES (4, '《三国演义》', '罗贯中', 'https://m.qpic.cn/psc?/V54HJSIm40p3K72sIUEw4GAfWS0D9t4S/ruAMsa53pVQWN7FLK88i5vYYx93WvfhNiKZxOOKrTo7muNitXn3p5dpJ9tNnaXjHtCf.tS3PtP5EZm1HCzC4kKJQG.9Q0wGoU82.e140kDU!/mnull&bo=WAJPA1gCTwMBByA!&rf=photolist&t=5', '人民文学出版社', '《三国演义》又名《三国志演义》、《三国志通俗演义》，是我国小说史上最著名最杰出的长篇章回体历史小说。《三国演义》的作者是元末明初人罗贯中，在其成书前，“三国故事”已经历了数年的历史发展过程。在唐代，三国故事已广为流传，连儿童都很熟悉。随着市民文艺的发展，宋代的“说话”艺人，已有专门说三国故事的，当时称为“说三分”。元代出现的《三国志平话》，实际上是从说书人使用的本子，虽较简略粗糙，但已初肯《三国演义》的规模。罗贯中在群众传说和民间艺人创作的基础上，又依据陈寿《三国志》及裴松之注中所征引的资料（还包括《世说新语》及注中的资料），经过巨大的创作劳动，写在了规模宏伟的巨著——《三国演义》。', 1, 5, 25, 13);
INSERT INTO `t_book` VALUES (5, '《活着》', '余华', 'https://m.qpic.cn/psc?/V54HJSIm40p3K72sIUEw4GAfWS0D9t4S/ruAMsa53pVQWN7FLK88i5irl6bKyRtcd0KZnE3*PEF9nXjLaec71eO0qvb9FkxpxtLKlXpHecplVHfmvSPg8l96bNb4PueslS4yiIx8F324!/mnull&bo=0AK*A9ACvwMBByA!&rf=photolist&t=5', '北京十月文艺出版社', '《活着》讲述了在大时代背景下，随着内战、三反五反、大跃进、“文化大革命”等社会变革，徐福贵的人生和家庭不断经受着苦难，到了最后所有亲人都先后离他而去，仅剩下年老的他和一头老牛相依为命。小说以普通、平实的故事情节讲述了在急剧变革的时代中福贵的不幸遭遇和坎坷命运，在冷静的笔触中展现了生命的意义和存在的价值，揭示了命运的无奈，与生活的不可捉摸。', 2, 0, 20, 10);
INSERT INTO `t_book` VALUES (6, '《Java程序设计》', '李莉', 'https://m.qpic.cn/psc?/V54HJSIm40p3K72sIUEw4GAfWS0D9t4S/ruAMsa53pVQWN7FLK88i5vYYx93WvfhNiKZxOOKrTo4fyKDfcww0G66WDwwbBuFwaqYJ9EgSPg5aPPMJUaZXy17SYeqs47CpgoeXD2.lPz8!/mnull&bo=9AH0AfQB9AEBByA!&rf=photolist&t=5', '清华大学出版社', '本书以Java SE 7为基础，从程序设计基础知识入手，由浅入深、循序渐进地介绍Java语言的基本概念、理论知识、程序设计方法及部分企业级应用技术。 全书共11章，第1章为预备知识，简要介绍程序设计、算法、软件工程的基础知识；第2章介绍Java语言的概况、程序结构和程序开发过程；第3、4章介绍Java的数据表示、运算和处理，包括数据类型、数据表示形式（常量、变量和字面量）、运算符及表达式、流程控制等内容；', 3, 0, 40, 20);
INSERT INTO `t_book` VALUES (7, '《计算机网络》', '李源', 'https://m.qpic.cn/psc?/V54HJSIm40p3K72sIUEw4GAfWS0D9t4S/ruAMsa53pVQWN7FLK88i5irl6bKyRtcd0KZnE3*PEF8xAJq0YJuKSLaXvwgz*v4On2C8XHmSjN.fa3PmVqjI05.yybdHcRsEex*emDOBzbo!/mnull&bo=jwDJAI8AyQABByA!&rf=photolist&t=5', '人民邮电出版社', 'JavaScript是目前*流行的网页前端开发技术之一。本书由浅入深、循序渐进地介绍了使用JavaScript开发网页前端应用的基础知识和技术技能。全书分为3篇。第1篇是JavaScript语法基础，包括JavaScript简介、基本语法、数据类型、控制语句、函数与数组等。第2篇是JavaScript面向对象基础，包括JavaScript面向对象编程、屏幕和浏览器对象、文档对象、窗口对象、历史地址与cookie对象以及表单和DOM对象。第3篇是JavaScript进阶与实战，包括JavaScript中正则表达式的使用、jQuery框架的使用以及一个接元宝游戏实例。通过进阶技术的学习与综合实例，读者能真正感受到JavaScript的魅力。本书语言通俗，内容精练，重点突出，实例丰富，是广大Web开发人员、计算机编程爱好者、网站管理维护人员必备的参考书，也非常适合大中专院校师生学习阅读，并可作为高等院校计算机及相关专业教材使用。', 3, 1, 30, 18);
INSERT INTO `t_book` VALUES (8, '《python从入门到精通》', '明日科技', 'https://m.qpic.cn/psc?/V54HJSIm40p3K72sIUEw4GAfWS0D9t4S/ruAMsa53pVQWN7FLK88i5n9TbY4XnhVUroIO4SBsWyKcb.n641RaBQ0IclfXJHArj6qg7WvJgpKjBPCCq3ieiN0ohO2HNEz52*ZfnXCJ3cQ!/mnull&bo=0QF3AtEBdwIDByI!&rf=photolist&t=5', '清华大学出版社', '《Python从入门到精通》从初学者角度出发，通过通俗易懂的语言、丰富多彩的实例，详细介绍了使用Python进行程序开发应该掌握的各方面技术。全书共分22章，包括初识Python、Python语言基础、运算符与表达式、流程控制语句、列表与元组、字典与集合、字符串、Python中使用正则表达式、函数、面向对象程序设计、模块、异常处理及程序调试、文件及目录操作、操作数据库、GUI界面编程、Pygame游戏编程、网络爬虫开发、使用进程和线程、网络编程、Web编程、Flask框架、e起去旅行网站等。所有知识都结合具体实例进行介绍，涉及的程序代码都给出了详细的注释，读者可轻松领会Python程序开发的精髓，快速提升开发技能。除此之外，本书还附配了235集高清教学微视频及PPT电子教案。', 3, 5, 20, 15);

-- ----------------------------
-- Table structure for t_history
-- ----------------------------
DROP TABLE IF EXISTS `t_history`;
CREATE TABLE `t_history`  (
  `hid` int NOT NULL AUTO_INCREMENT COMMENT '记录表ID',
  `uid` int NULL DEFAULT NULL COMMENT '用户ID',
  `name` varchar(55) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '用户姓名',
  `account` varchar(55) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '用户账号',
  `bid` int NULL DEFAULT NULL COMMENT '图书ID',
  `bookName` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '图书名称',
  `image` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '图片',
  `begin_time` datetime NULL DEFAULT NULL COMMENT '借书时间',
  `end_time` datetime NULL DEFAULT NULL COMMENT '还书时间',
  `day` int NULL DEFAULT NULL COMMENT '借阅天数',
  `status` int NULL DEFAULT NULL COMMENT '借阅状态，1为正在借阅，2 已经还书',
  PRIMARY KEY (`hid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 61 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_history
-- ----------------------------
INSERT INTO `t_history` VALUES (2, 2, '张三', 'zhangsan', 3, '《C++程序设计》', 'http://m.qpic.cn/psc?/V54HJSIm40p3K72sIUEw4GAfWS0D9t4S/ruAMsa53pVQWN7FLK88i5vYYx93WvfhNiKZxOOKrTo7GTrBJHYRDbPd0U0laOmHQ5IA*lIGFpAl900Dm9qb0IXZ1In8p*b3j045ppypPt2s!/mnull&bo=DgGBAQ4BgQEBByA!&rf=photolist&t=5', '2022-08-23 10:04:36', '2022-10-12 10:04:36', 10, 1);
INSERT INTO `t_history` VALUES (4, 3, '李四', 'lisi', 3, '《C++程序设计》', 'http://m.qpic.cn/psc?/V54HJSIm40p3K72sIUEw4GAfWS0D9t4S/ruAMsa53pVQWN7FLK88i5vYYx93WvfhNiKZxOOKrTo7GTrBJHYRDbPd0U0laOmHQ5IA*lIGFpAl900Dm9qb0IXZ1In8p*b3j045ppypPt2s!/mnull&bo=DgGBAQ4BgQEBByA!&rf=photolist&t=5', '2023-05-12 17:23:10', '2023-06-11 17:23:10', 10, 2);
INSERT INTO `t_history` VALUES (5, 3, '李四', 'lisi', 4, '《红楼梦》', 'http://m.qpic.cn/psc?/V54HJSIm40p3K72sIUEw4GAfWS0D9t4S/ruAMsa53pVQWN7FLK88i5k6jWxK.zFiFBkACGoZO140xZTsJFFW.pLFEzF*RZ7BrK95xh.3VRBgTqJXF1USGu.HSTJPvdyizMiV8HBb*UU4!/mnull&bo=2AA7AdgAOwEDByI!&rf=photolist&t=5', '2023-05-12 17:23:28', '2023-06-11 17:23:28', 10, 1);
INSERT INTO `t_history` VALUES (9, 3, '李四', 'lisi', 18, '《斗破苍穹》', 'https://m.qpic.cn/psc?/V54HJSIm40p3K72sIUEw4GAfWS0D9t4S/ruAMsa53pVQWN7FLK88i5irl6bKyRtcd0KZnE3*PEF9nXjLaec71eO0qvb9FkxpxtLKlXpHecplVHfmvSPg8l96bNb4PueslS4yiIx8F324!/mnull&bo=0AK*A9ACvwMBByA!&rf=photolist&t=5', '2023-05-17 22:58:06', '2023-05-23 16:42:42', 30, 1);
INSERT INTO `t_history` VALUES (39, 3, '李四', 'lisi', 1, '《C++程序设计》', 'https://m.qpic.cn/psc?/V54HJSIm40p3K72sIUEw4GAfWS0D9t4S/ruAMsa53pVQWN7FLK88i5vYYx93WvfhNiKZxOOKrTo7GTrBJHYRDbPd0U0laOmHQ5IA*lIGFpAl900Dm9qb0IXZ1In8p*b3j045ppypPt2s!/mnull&bo=DgGBAQ4BgQEBByA!&rf=photolist&t=5', '2023-05-24 09:05:24', '2023-05-24 09:05:38', 30, 2);
INSERT INTO `t_history` VALUES (41, 3, '李四', 'lisi', 4, '《三国演义》', 'https://m.qpic.cn/psc?/V54HJSIm40p3K72sIUEw4GAfWS0D9t4S/ruAMsa53pVQWN7FLK88i5vYYx93WvfhNiKZxOOKrTo7muNitXn3p5dpJ9tNnaXjHtCf.tS3PtP5EZm1HCzC4kKJQG.9Q0wGoU82.e140kDU!/mnull&bo=WAJPA1gCTwMBByA!&rf=photolist&t=5', '2023-05-24 09:36:10', '2023-05-24 11:18:44', 30, 2);
INSERT INTO `t_history` VALUES (43, 3, '李四', 'lisi', 2, '《盗墓笔记》', 'https://m.qpic.cn/psc?/V54HJSIm40p3K72sIUEw4GAfWS0D9t4S/ruAMsa53pVQWN7FLK88i5irl6bKyRtcd0KZnE3*PEF*f3VbuZSSEDzg9.J60bdNXZErh1AmKCeJcHqcpsELSPUuV3wznas2wd8sGcIELR5I!/mnull&bo=OASgBTgEoAUBByA!&rf=photolist&t=5', '2023-05-24 11:36:31', '2023-05-24 11:37:52', 30, 2);
INSERT INTO `t_history` VALUES (44, 3, '李四', 'lisi', 2, '《盗墓笔记》', 'https://m.qpic.cn/psc?/V54HJSIm40p3K72sIUEw4GAfWS0D9t4S/ruAMsa53pVQWN7FLK88i5irl6bKyRtcd0KZnE3*PEF*f3VbuZSSEDzg9.J60bdNXZErh1AmKCeJcHqcpsELSPUuV3wznas2wd8sGcIELR5I!/mnull&bo=OASgBTgEoAUBByA!&rf=photolist&t=5', '2023-05-24 11:42:30', '2023-05-24 11:44:32', 30, 2);
INSERT INTO `t_history` VALUES (45, 3, '李四', 'lisi', 1, '《C++程序设计》', 'https://m.qpic.cn/psc?/V54HJSIm40p3K72sIUEw4GAfWS0D9t4S/ruAMsa53pVQWN7FLK88i5vYYx93WvfhNiKZxOOKrTo7GTrBJHYRDbPd0U0laOmHQ5IA*lIGFpAl900Dm9qb0IXZ1In8p*b3j045ppypPt2s!/mnull&bo=DgGBAQ4BgQEBByA!&rf=photolist&t=5', '2023-05-24 11:42:56', '2023-05-24 11:43:19', 30, 2);
INSERT INTO `t_history` VALUES (46, 3, '李四', 'lisi', 6, '《Java程序设计》', 'https://m.qpic.cn/psc?/V54HJSIm40p3K72sIUEw4GAfWS0D9t4S/ruAMsa53pVQWN7FLK88i5vYYx93WvfhNiKZxOOKrTo4fyKDfcww0G66WDwwbBuFwaqYJ9EgSPg5aPPMJUaZXy17SYeqs47CpgoeXD2.lPz8!/mnull&bo=9AH0AfQB9AEBByA!&rf=photolist&t=5', '2023-05-24 11:48:02', '2023-05-24 11:51:52', 30, 2);
INSERT INTO `t_history` VALUES (47, 3, '李四', 'lisi', 1, '《C++程序设计》', 'https://m.qpic.cn/psc?/V54HJSIm40p3K72sIUEw4GAfWS0D9t4S/ruAMsa53pVQWN7FLK88i5vYYx93WvfhNiKZxOOKrTo7GTrBJHYRDbPd0U0laOmHQ5IA*lIGFpAl900Dm9qb0IXZ1In8p*b3j045ppypPt2s!/mnull&bo=DgGBAQ4BgQEBByA!&rf=photolist&t=5', '2023-05-24 11:50:47', '2023-05-24 11:50:55', 30, 2);
INSERT INTO `t_history` VALUES (48, 3, '李四', 'lisi', 1, '《C++程序设计》', 'https://m.qpic.cn/psc?/V54HJSIm40p3K72sIUEw4GAfWS0D9t4S/ruAMsa53pVQWN7FLK88i5vYYx93WvfhNiKZxOOKrTo7GTrBJHYRDbPd0U0laOmHQ5IA*lIGFpAl900Dm9qb0IXZ1In8p*b3j045ppypPt2s!/mnull&bo=DgGBAQ4BgQEBByA!&rf=photolist&t=5', '2023-05-24 11:54:29', '2023-05-24 11:54:52', 30, 2);
INSERT INTO `t_history` VALUES (49, 3, '李四', 'lisi', 1, '《C++程序设计》', 'https://m.qpic.cn/psc?/V54HJSIm40p3K72sIUEw4GAfWS0D9t4S/ruAMsa53pVQWN7FLK88i5vYYx93WvfhNiKZxOOKrTo7GTrBJHYRDbPd0U0laOmHQ5IA*lIGFpAl900Dm9qb0IXZ1In8p*b3j045ppypPt2s!/mnull&bo=DgGBAQ4BgQEBByA!&rf=photolist&t=5', '2023-05-24 11:56:10', '2023-05-24 11:56:24', 30, 2);
INSERT INTO `t_history` VALUES (50, 3, '李四', 'lisi', 4, '《三国演义》', 'https://m.qpic.cn/psc?/V54HJSIm40p3K72sIUEw4GAfWS0D9t4S/ruAMsa53pVQWN7FLK88i5vYYx93WvfhNiKZxOOKrTo7muNitXn3p5dpJ9tNnaXjHtCf.tS3PtP5EZm1HCzC4kKJQG.9Q0wGoU82.e140kDU!/mnull&bo=WAJPA1gCTwMBByA!&rf=photolist&t=5', '2023-05-24 12:39:20', '2023-05-24 12:39:30', 30, 2);
INSERT INTO `t_history` VALUES (51, 3, '李四', 'lisi', 4, '《三国演义》', 'https://m.qpic.cn/psc?/V54HJSIm40p3K72sIUEw4GAfWS0D9t4S/ruAMsa53pVQWN7FLK88i5vYYx93WvfhNiKZxOOKrTo7muNitXn3p5dpJ9tNnaXjHtCf.tS3PtP5EZm1HCzC4kKJQG.9Q0wGoU82.e140kDU!/mnull&bo=WAJPA1gCTwMBByA!&rf=photolist&t=5', '2023-05-24 12:48:30', '2023-05-24 12:54:24', 30, 2);
INSERT INTO `t_history` VALUES (52, 3, '李四', 'lisi', 4, '《三国演义》', 'https://m.qpic.cn/psc?/V54HJSIm40p3K72sIUEw4GAfWS0D9t4S/ruAMsa53pVQWN7FLK88i5vYYx93WvfhNiKZxOOKrTo7muNitXn3p5dpJ9tNnaXjHtCf.tS3PtP5EZm1HCzC4kKJQG.9Q0wGoU82.e140kDU!/mnull&bo=WAJPA1gCTwMBByA!&rf=photolist&t=5', '2023-05-24 12:51:16', '2023-05-24 12:51:52', 30, 2);
INSERT INTO `t_history` VALUES (53, 3, '李四', 'lisi', 4, '《三国演义》', 'https://m.qpic.cn/psc?/V54HJSIm40p3K72sIUEw4GAfWS0D9t4S/ruAMsa53pVQWN7FLK88i5vYYx93WvfhNiKZxOOKrTo7muNitXn3p5dpJ9tNnaXjHtCf.tS3PtP5EZm1HCzC4kKJQG.9Q0wGoU82.e140kDU!/mnull&bo=WAJPA1gCTwMBByA!&rf=photolist&t=5', '2023-05-24 12:56:14', '2023-05-24 12:56:41', 30, 2);
INSERT INTO `t_history` VALUES (55, 3, '李四', 'lisi', 2, '《盗墓笔记》', 'https://m.qpic.cn/psc?/V54HJSIm40p3K72sIUEw4GAfWS0D9t4S/ruAMsa53pVQWN7FLK88i5irl6bKyRtcd0KZnE3*PEF*f3VbuZSSEDzg9.J60bdNXZErh1AmKCeJcHqcpsELSPUuV3wznas2wd8sGcIELR5I!/mnull&bo=OASgBTgEoAUBByA!&rf=photolist&t=5', '2023-05-24 18:48:47', '2023-05-24 18:48:55', 30, 2);
INSERT INTO `t_history` VALUES (56, 3, '李四', 'lisi', 4, '《三国演义》', 'https://m.qpic.cn/psc?/V54HJSIm40p3K72sIUEw4GAfWS0D9t4S/ruAMsa53pVQWN7FLK88i5vYYx93WvfhNiKZxOOKrTo7muNitXn3p5dpJ9tNnaXjHtCf.tS3PtP5EZm1HCzC4kKJQG.9Q0wGoU82.e140kDU!/mnull&bo=WAJPA1gCTwMBByA!&rf=photolist&t=5', '2023-05-24 18:49:03', '2023-05-24 18:51:18', 30, 2);
INSERT INTO `t_history` VALUES (58, 3, '李四', 'lisi', 5, '《活着》', 'https://m.qpic.cn/psc?/V54HJSIm40p3K72sIUEw4GAfWS0D9t4S/ruAMsa53pVQWN7FLK88i5irl6bKyRtcd0KZnE3*PEF9nXjLaec71eO0qvb9FkxpxtLKlXpHecplVHfmvSPg8l96bNb4PueslS4yiIx8F324!/mnull&bo=0AK*A9ACvwMBByA!&rf=photolist&t=5', '2023-05-25 14:30:56', NULL, 30, 2);
INSERT INTO `t_history` VALUES (59, 3, '李四', 'lisi', 4, '《三国演义》', 'https://m.qpic.cn/psc?/V54HJSIm40p3K72sIUEw4GAfWS0D9t4S/ruAMsa53pVQWN7FLK88i5vYYx93WvfhNiKZxOOKrTo7muNitXn3p5dpJ9tNnaXjHtCf.tS3PtP5EZm1HCzC4kKJQG.9Q0wGoU82.e140kDU!/mnull&bo=WAJPA1gCTwMBByA!&rf=photolist&t=5', '2023-05-25 14:33:50', '2023-05-25 14:34:16', 30, 2);

-- ----------------------------
-- Table structure for t_problem
-- ----------------------------
DROP TABLE IF EXISTS `t_problem`;
CREATE TABLE `t_problem`  (
  `pid` int NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `uid` int NULL DEFAULT NULL COMMENT '反馈人ID',
  `title` varchar(55) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '标题',
  `page` varchar(55) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '页面',
  `content` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '内容',
  `link` varchar(25) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '联系方式',
  `status` varchar(11) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '1未解决  2已解决',
  `time` datetime NULL DEFAULT NULL COMMENT '反馈时间',
  PRIMARY KEY (`pid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_problem
-- ----------------------------
INSERT INTO `t_problem` VALUES (1, 2, '8-23', '登陆页', '不知道，就想反馈', '18600000001', '1', '2022-08-23 09:20:15');
INSERT INTO `t_problem` VALUES (4, 2, '三国演义', '20', '陈述不清', '15883436602', '1', '2023-04-30 16:09:19');
INSERT INTO `t_problem` VALUES (5, 3, '封面少了', '1', '打开拉萨打开思路洪都拉斯客户端流口水的', '15883436602', '1', '2023-05-12 16:10:26');
INSERT INTO `t_problem` VALUES (6, NULL, '三国演义', NULL, '建议', '15982707339', '1', '2023-05-23 17:22:58');
INSERT INTO `t_problem` VALUES (7, NULL, '三国演义', NULL, '图书馆', '15982707339', '1', '2023-05-23 18:12:37');
INSERT INTO `t_problem` VALUES (8, NULL, ' ', ' ', 'xainzaishi22:40', '15982707339', '1', '2023-05-23 22:40:59');
INSERT INTO `t_problem` VALUES (9, 3, '三国演义', '10', 'w我要续借', '15982707339', '1', '2023-05-23 22:56:20');
INSERT INTO `t_problem` VALUES (10, 3, '三国演义', '10', '我的反馈', '15982707339', '1', '2023-05-24 12:40:06');
INSERT INTO `t_problem` VALUES (11, 3, '三国演义', '10', '我的建议', '15982707339', '1', '2023-05-24 12:57:20');
INSERT INTO `t_problem` VALUES (12, 3, '三国演义', '10', '我的反馈', '15982707339', '1', '2023-05-24 13:05:17');
INSERT INTO `t_problem` VALUES (13, 3, '三国演义', '10', '我的建议', '15982707339', '1', '2023-05-24 18:52:32');
INSERT INTO `t_problem` VALUES (14, 3, '三国演义', '10', '我的建议', '15982707339', '1', '2023-05-25 14:34:46');
INSERT INTO `t_problem` VALUES (15, 3, '三国演义', '10', '你好，这是我的反馈', '15982707339', '1', '2023-05-25 14:58:48');
INSERT INTO `t_problem` VALUES (16, 3, '三国演义', '10', '你好', '15982707339', '1', '2023-05-28 13:31:03');

-- ----------------------------
-- Table structure for t_role
-- ----------------------------
DROP TABLE IF EXISTS `t_role`;
CREATE TABLE `t_role`  (
  `rid` int NOT NULL AUTO_INCREMENT,
  `rolename` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_czech_ci NOT NULL COMMENT '角色类型 ，1代表用户 2代表管理员',
  PRIMARY KEY (`rid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_czech_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_role
-- ----------------------------
INSERT INTO `t_role` VALUES (1, '用户');
INSERT INTO `t_role` VALUES (2, '管理员');

-- ----------------------------
-- Table structure for t_type
-- ----------------------------
DROP TABLE IF EXISTS `t_type`;
CREATE TABLE `t_type`  (
  `tid` int NOT NULL AUTO_INCREMENT COMMENT '类型主键ID',
  `type_name` varchar(55) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '图书类型名称',
  PRIMARY KEY (`tid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_type
-- ----------------------------
INSERT INTO `t_type` VALUES (1, '历史类');
INSERT INTO `t_type` VALUES (2, '文学类');
INSERT INTO `t_type` VALUES (3, '编程类');
INSERT INTO `t_type` VALUES (4, '玄幻小说');
INSERT INTO `t_type` VALUES (5, '国外经典');
INSERT INTO `t_type` VALUES (6, '少儿漫画');
INSERT INTO `t_type` VALUES (7, '秘籍类');

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user`  (
  `uid` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '用户表主键ID',
  `account` varchar(55) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '账号',
  `name` varchar(55) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '姓名',
  `password` varchar(55) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '密码',
  `phone` varchar(11) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '手机',
  `times` int NULL DEFAULT NULL COMMENT '借阅量',
  `lend_num` int NULL DEFAULT NULL COMMENT '可借阅天数',
  `max_num` int NULL DEFAULT NULL COMMENT '最大可借数量',
  `role` int NULL DEFAULT NULL COMMENT '角色 1用户 2管理员',
  PRIMARY KEY (`uid`) USING BTREE,
  INDEX `name`(`name` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES (1, 'admin', '管理员', '4QrcOUm6Wau+VuBX8g+IPg==', '186000088', 0, 10, 10, 2);
INSERT INTO `t_user` VALUES (2, 'zhangsan', '张三', 'DIjVZpTC+zvMQW4SLBBy6w==', '18600000002', 7, 10, 20, 1);
INSERT INTO `t_user` VALUES (3, 'lisi', '李四', 'gnzLDuqKcGxMNKFokfhOew==', '18600002020', 8, 30, 16, 1);
INSERT INTO `t_user` VALUES (4, 'wangwu', '王五', '4QrcOUm6Wau+VuBX8g+IPg==', '18600000004', 0, 15, 10, 1);
INSERT INTO `t_user` VALUES (5, 'zhaoliu', '赵六', '4QrcOUm6Wau+VuBX8g+IPg==', '18600000005', 10, 11, 10, 2);
INSERT INTO `t_user` VALUES (6, 'sunqi', '孙琦', '4QrcOUm6Wau+VuBX8g+IPg==', '18600000007', 1, 15, 10, 1);
INSERT INTO `t_user` VALUES (8, 'test', '李白', '4QrcOUm6Wau+VuBX8g+IPg==', '15883436002', 1, 10, 9, 1);
INSERT INTO `t_user` VALUES (9, 'test', '李白', '4QrcOUm6Wau+VuBX8g+IPg==', '15883436002', 0, 10, 10, 1);
INSERT INTO `t_user` VALUES (10, 'hello', '大哥', '4QrcOUm6Wau+VuBX8g+IPg==', '12345678911', 0, 10, 10, 1);
INSERT INTO `t_user` VALUES (11, 'dage', '大哥', '4QrcOUm6Wau+VuBX8g+IPg==', '15883436602', 0, 10, 10, 2);

SET FOREIGN_KEY_CHECKS = 1;

