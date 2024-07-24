/*
MySQL Backup
Database: exam
Backup Time: 2024-07-24 14:18:32
*/

SET FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS `exam`.`admin`;
DROP TABLE IF EXISTS `exam`.`exam_manage`;
DROP TABLE IF EXISTS `exam`.`fill_question`;
DROP TABLE IF EXISTS `exam`.`judge_question`;
DROP TABLE IF EXISTS `exam`.`message`;
DROP TABLE IF EXISTS `exam`.`multi_question`;
DROP TABLE IF EXISTS `exam`.`paper_manage`;
DROP TABLE IF EXISTS `exam`.`replay`;
DROP TABLE IF EXISTS `exam`.`score`;
DROP TABLE IF EXISTS `exam`.`student`;
DROP TABLE IF EXISTS `exam`.`teacher`;
CREATE TABLE `admin` (
  `adminId` int NOT NULL AUTO_INCREMENT COMMENT 'ID号',
  `adminName` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '姓名',
  `sex` varchar(2) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '性别',
  `tel` varchar(11) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '电话号码',
  `email` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '电子邮箱',
  `pwd` varchar(16) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '密码',
  `cardId` varchar(18) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '身份证号',
  `role` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '角色(0管理员，1教师，2学生)',
  PRIMARY KEY (`adminId`) USING BTREE,
  KEY `sex` (`sex`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=9528 DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC COMMENT='管理员信息表';
CREATE TABLE `exam_manage` (
  `examCode` int NOT NULL AUTO_INCREMENT COMMENT '考试编号',
  `description` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '该次考试介绍',
  `source` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '课程名称',
  `paperId` int DEFAULT NULL COMMENT '试卷编号',
  `examDate` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '考试日期',
  `totalTime` int DEFAULT NULL COMMENT '持续时长',
  `grade` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '年级',
  `term` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '学期',
  `major` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '专业',
  `institute` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '学院',
  `totalScore` int DEFAULT NULL COMMENT '总分',
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '考试类型',
  `tips` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '考生须知',
  PRIMARY KEY (`examCode`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=20190020 DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC COMMENT='考试管理表';
CREATE TABLE `fill_question` (
  `questionId` int NOT NULL AUTO_INCREMENT COMMENT '试题编号',
  `subject` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '考试科目',
  `question` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '试题内容',
  `answer` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '正确答案',
  `analysis` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '题目解析',
  `score` int DEFAULT '2' COMMENT '分数',
  `level` varchar(5) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '难度等级',
  `section` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '所属章节',
  PRIMARY KEY (`questionId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10029 DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC COMMENT='填空题题库';
CREATE TABLE `judge_question` (
  `questionId` int NOT NULL AUTO_INCREMENT COMMENT '试题编号',
  `subject` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '考试科目',
  `question` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '试题内容',
  `answer` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '正确答案',
  `analysis` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '题目解析',
  `score` int DEFAULT '2' COMMENT '分数',
  `level` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '难度等级',
  `section` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '所属章节',
  PRIMARY KEY (`questionId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10013 DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC COMMENT='判断题题库表';
CREATE TABLE `message` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '留言编号',
  `title` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '标题',
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '留言内容',
  `time` date DEFAULT NULL COMMENT '留言时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC COMMENT='留言表';
CREATE TABLE `multi_question` (
  `questionId` int NOT NULL AUTO_INCREMENT COMMENT '试题编号',
  `subject` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '考试科目',
  `question` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '问题题目',
  `answerA` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '选项A',
  `answerB` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '选项B',
  `answerC` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '选项C',
  `answerD` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '选项D',
  `rightAnswer` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '正确答案',
  `analysis` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '题目解析',
  `score` int DEFAULT '2' COMMENT '分数',
  `section` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '所属章节',
  `level` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '难度等级',
  PRIMARY KEY (`questionId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10117 DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC COMMENT='选择题题库表';
CREATE TABLE `paper_manage` (
  `paperId` int DEFAULT NULL COMMENT '试卷编号',
  `questionType` int DEFAULT NULL COMMENT '题目类型',
  `questionId` int DEFAULT NULL COMMENT '题目编号'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC COMMENT='试卷管理表';
CREATE TABLE `replay` (
  `messageId` int DEFAULT NULL COMMENT '留言编号',
  `replayId` int NOT NULL AUTO_INCREMENT COMMENT '回复编号',
  `replay` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '内容',
  `replayTime` date DEFAULT NULL COMMENT '回复时间',
  PRIMARY KEY (`replayId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC COMMENT='回复表';
CREATE TABLE `score` (
  `scoreId` int NOT NULL AUTO_INCREMENT COMMENT '分数编号',
  `examCode` int DEFAULT NULL COMMENT '考试编号',
  `studentId` int DEFAULT NULL COMMENT '学号',
  `subject` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '课程名称',
  `ptScore` int DEFAULT NULL COMMENT '平时成绩',
  `etScore` int DEFAULT NULL COMMENT '期末成绩',
  `score` int DEFAULT NULL COMMENT '总成绩',
  `answerDate` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '答题日期',
  `achievement` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`scoreId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=127 DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC COMMENT='成绩管理表';
CREATE TABLE `student` (
  `studentId` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `studentName` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '姓名',
  `grade` varchar(4) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '年级',
  `major` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '专业',
  `clazz` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '班级',
  `institute` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '学院',
  `tel` varchar(11) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '电话号码',
  `email` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '电子邮件',
  `pwd` varchar(16) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '密码',
  `cardId` varchar(18) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '身份证号',
  `sex` varchar(2) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '性别',
  `role` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '2' COMMENT '角色(0管理员，1教师，2学生)',
  PRIMARY KEY (`studentId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=20155009 DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC COMMENT='学生信息表';
CREATE TABLE `teacher` (
  `teacherId` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `teacherName` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '姓名',
  `institute` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '学院',
  `sex` varchar(2) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '性别',
  `tel` varchar(11) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '电话号码',
  `email` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '邮箱',
  `pwd` varchar(16) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '密码',
  `cardId` varchar(18) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '身份证号',
  `type` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '职称',
  `role` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '角色（0管理员，1教师，2学生）',
  PRIMARY KEY (`teacherId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=20081003 DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC COMMENT='教师信息表';
BEGIN;
LOCK TABLES `exam`.`admin` WRITE;
DELETE FROM `exam`.`admin`;
INSERT INTO `exam`.`admin` (`adminId`,`adminName`,`sex`,`tel`,`email`,`pwd`,`cardId`,`role`) VALUES (9527, '超级管理员', '男', '13658377857', '1253838283@qq.com', '123456', '3132', '0');
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `exam`.`exam_manage` WRITE;
DELETE FROM `exam`.`exam_manage`;
INSERT INTO `exam`.`exam_manage` (`examCode`,`description`,`source`,`paperId`,`examDate`,`totalTime`,`grade`,`term`,`major`,`institute`,`totalScore`,`type`,`tips`) VALUES (20190015, '心理健康测评', '心理健康测评', 1010, '2024-04-12', 20, NULL, NULL, '', '总部', 100, '心理健康', '请注意时间'),(20190017, '性格', '性格测评', 1012, '2024-04-27', 20, NULL, NULL, NULL, '总部', NULL, '性格', '请注意时间'),(20190018, 'EQ', 'EQ测评', 1013, '2024-04-28', 10, NULL, NULL, NULL, '总部', NULL, 'EQ', '请注意时间'),(20190019, '智商测试', 'IQ测评', 1014, '2024-04-28', 20, NULL, NULL, NULL, '总部', NULL, 'IQ', NULL);
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `exam`.`fill_question` WRITE;
DELETE FROM `exam`.`fill_question`;
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `exam`.`judge_question` WRITE;
DELETE FROM `exam`.`judge_question`;
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `exam`.`message` WRITE;
DELETE FROM `exam`.`message`;
INSERT INTO `exam`.`message` (`id`,`title`,`content`,`time`) VALUES (2, '晚上加班,这感觉非常的nice', '今天是星期一的晚上,下班后回到宿舍继续写我的毕业设计,看着项目功能日渐丰满好开心哦,你们也要元气满满哦！', '2019-03-18'),(15, '咸鱼', '我是一条咸鱼', '2019-03-18'),(16, '今天中午吃什么', '今天去吃莲藕排骨汤吧，虽然也不好吃，但这里真的没什么东西可以吃了', '2019-03-18'),(20, '这个网站不错', '博主大大好厉害，网页看着很清新呢，喜欢这样嘞风格。', '2019-03-18'),(21, '男孩子', '哇，这么可爱，那肯定是男孩子呀。', '2019-03-18'),(22, '好人', '你是个好人，可是我们不合适。', '2019-03-18'),(25, '小乔', '花会枯萎，爱永不凋零，小乔要努力变强。', '2019-03-18'),(26, '妲己', '妲己会一直爱主人，因为被设定成这样，来和妲己玩耍吧。', '2019-03-18'),(27, '土味情话', '妈妈从小对我讲，不要早恋，遇到你以后，我决定不听妈妈的话了。', '2019-03-31'),(35, '贝塔', '开坦克', '2019-09-05');
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `exam`.`multi_question` WRITE;
DELETE FROM `exam`.`multi_question`;
INSERT INTO `exam`.`multi_question` (`questionId`,`subject`,`question`,`answerA`,`answerB`,`answerC`,`answerD`,`rightAnswer`,`analysis`,`score`,`section`,`level`) VALUES (10036, '心理健康测评', '我感觉全身没有一点力气。', '没有', '有时有', '经常有', '总是有', '', '', 0, '', ''),(10037, '心理健康测评', '我觉得讲话的声音变得有气无力，闲话少多了', '没有', '有时有', '经常有', '总是有', NULL, NULL, 0, NULL, NULL),(10038, '心理健康测评', '我晚上睡眠时间总的说比往常少多了', '没有', '有时有', '经常有', '总是有', NULL, NULL, 0, NULL, NULL),(10039, '心理健康测评', '我什么事情都不想干。', '没有', '有时有', '经常有', '总是有', NULL, NULL, 0, NULL, NULL),(10040, '心理健康测评', '我感到不高兴、愉快、不痛快', '没有', '有时有', '经常有', '总是有', NULL, NULL, 0, NULL, NULL),(10041, '心理健康测评', '我感到心里难受或心里不舒服', '没有', '有时有', '经常有', '总是有', NULL, NULL, 0, NULL, NULL),(10042, '心理健康测评', '我对周围的一切都感到没意思', '没有', '有时有', '经常有', '总是有', NULL, NULL, 0, NULL, NULL),(10043, '心理健康测评', '我感到紧张不安', '没有', '有时有', '经常有', '总是有', NULL, NULL, 0, NULL, NULL),(10044, '心理健康测评', '我不想吃东西。', '没有', '有时有', '经常有', '总是有', NULL, NULL, 0, NULL, NULL),(10045, '心理健康测评', '我觉得比平时瘦多了', '没有', '有时有', '经常有', '总是有', NULL, NULL, 0, NULL, NULL),(10046, '心理健康测评', '我真希望自己哪天突然死去', '没有', '有时有', '经常有', '总是有', NULL, NULL, 0, NULL, NULL),(10047, '心理健康测评', '小事我也感到非常着急', '没有', '有时有', '经常有', '总是有', NULL, NULL, 0, NULL, NULL),(10048, '心理健康测评', '遇到一点小事我就就感到烦恼', '没有', '有时有', '经常有', '总是有', NULL, NULL, 0, NULL, NULL),(10049, '心理健康测评', '我感到在生活中自己是个弱者', '没有', '有时有', '经常有', '总是有', NULL, NULL, 0, NULL, NULL),(10050, '心理健康测评', '我感到人活着没有什么意思', '没有', '有时有', '经常有', '总是有', NULL, NULL, 0, NULL, NULL),(10051, '心理健康测评', '我感到心慌', '没有', '有时有', '经常有', '总是有', NULL, NULL, 0, NULL, NULL),(10052, '心理健康测评', '我对异性毫无兴趣', '没有', '有时有', '经常有', '总是有', NULL, NULL, 0, NULL, NULL),(10053, '心理健康测评', '我觉得太笨，样样不如别人。', '没有', '有时有', '经常有', '总是有', NULL, NULL, 0, NULL, NULL),(10054, '心理健康测评', '我变得做什么事都拿不定主意', '没有', '有时有', '经常有', '总是有', NULL, NULL, 0, NULL, NULL),(10055, '心理健康测评', '我想自己去死', '没有', '有时有', '经常有', '总是有', NULL, NULL, 0, NULL, NULL),(10056, '性格测评', '在以下各行的词语中，选择最适合的词语。若你不能肯定哪一个是“最适合”的，请回忆一下当你在18岁以前的行为特点，哪个该是答案。', '冒险性——对新事物下决心做好。', '适应性——轻松自如融入任何环境。', '生动性——表情生动多手势。 ', '分析性——准确知道所有细节之间的逻辑关系。', '', '', 2, '', ''),(10057, '性格测评', '在以下各行的词语中，选择最适合的词语。若你不能肯定哪一个是“最适合”的，请回忆一下当你在18岁以前的行为特点，哪个该是答案。', '说服性——用逻辑与事实服人。                                                 ', '在任何冲突中不受干扰，保持冷静。', ' 娱乐性——充满乐趣与幽默感。 ', '持久性——完成一件事后才接手新事。', NULL, NULL, 2, NULL, NULL),(10058, '性格测评', '在以下各行的词语中，选择最适合的词语。若你不能肯定哪一个是“最适合”的，请回忆一下当你在18岁以前的行为特点，哪个该是答案。', '强烈意识性——决心依自己的方式做事。', '包容性——易接受他人的观点，不坚持己见。 ', '社交性——认为与人相处好玩，无所谓挑战或商机。', '牺牲性——为他人利益愿意放弃个人意见', NULL, NULL, 2, NULL, NULL),(10059, '性格测评', '在以下各行的词语中，选择最适合的词语。若你不能肯定哪一个是“最适合”的，请回忆一下当你在18岁以前的行为特点，哪个该是答案。', '竞争性——把一切当成竞赛，总是有强烈的赢的欲望。', '控制性——控制自己的情感，极少流露。', '因个人魅力或性格使人信服。  ', '体贴性——关心别人的感觉与需要。  ', NULL, NULL, 2, NULL, NULL),(10060, '性格测评', '在以下各行的词语中，选择最适合的词语。若你不能肯定哪一个是“最适合”的，请回忆一下当你在18岁以前的行为特点，哪个该是答案。', '机智型——对任何情况都能很快做出有效的反应。', '保守型——自我约束情绪与热忱。 ', '清新振作型——给旁人清新振奋的刺激。  ', '敬仰型——对人诚实尊重。 ', NULL, NULL, 2, NULL, NULL),(10061, '性格测评', '在以下各行的词语中，选择最适合的词语。若你不能肯定哪一个是“最适合”的，请回忆一下当你在18岁以前的行为特点，哪个该是答案。', '自立性——独立性强，机智，凭自己的能力判断。 ', '满足性——容易接受任何情况和环境。', '生气性——充满动力与兴奋。', '敏感性——对周围的人事十分在乎。 ', NULL, NULL, 2, NULL, NULL),(10062, '性格测评', '在以下各行的词语中，选择最适合的词语。若你不能肯定哪一个是“最适合”的，请回忆一下当你在18岁以前的行为特点，哪个该是答案。', '积极——相信自己有转危为安的能力。', '耐性——不因延误而懊恼，冷静且容忍度大', '推广——运用性格魅力或鼓励推动别人参与。', '计划性——事前做详尽计划，依计划进行工作。', NULL, NULL, 2, NULL, NULL),(10063, '性格测评', '在以下各行的词语中，选择最适合的词语。若你不能肯定哪一个是“最适合”的，请回忆一下当你在18岁以前的行为特点，哪个该是答案。', '确信——自信，极少犹豫。', '害羞——安静，不易开启话匣子的人', '率性——不喜预先计划，或受计划牵制', '程序性——生活与处事均依时间表，不喜欢干扰', NULL, NULL, 2, NULL, NULL),(10064, '性格测评', '在以下各行的词语中，选择最适合的词语。若你不能肯定哪一个是“最适合”的，请回忆一下当你在18岁以前的行为特点，哪个该是答案。', '直言不讳——毫不保留，坦率发言。  ', '迁就——愿改变，很快与人协调配合。', '乐观——自信任何事都会好转。 ', '井然有序——有系统、有条理安排事情。', NULL, NULL, 2, NULL, NULL),(10065, '性格测评', '在以下各行的词语中，选择最适合的词语。若你不能肯定哪一个是“最适合”的，请回忆一下当你在18岁以前的行为特点，哪个该是答案。', '强迫性——发号施令者，别人不敢造次反抗。', '友善——不主动交谈，经常是被动的回答者。   ', '趣味性——时时表露幽默感，任何事都能讲成惊天动地的故事。', '忠诚——保持可靠、忠心、稳定。', NULL, NULL, 2, NULL, NULL),(10066, '性格测评', '在以下各行的词语中，选择最适合的词语。若你不能肯定哪一个是“最适合”的，请回忆一下当你在18岁以前的行为特点，哪个该是答案。', '勇敢——敢于冒险，下决心做好。', '外交——待人得体有耐心。     ', '愉快——带给别人欢乐，令人喜欢，容易相处。', '细节——做事秩序井然，记忆清新。 ', NULL, NULL, 2, NULL, NULL),(10067, '性格测评', '在以下各行的词语中，选择最适合的词语。若你不能肯定哪一个是“最适合”的，请回忆一下当你在18岁以前的行为特点，哪个该是答案。', '自信——自我肯定个人能力与成功。   ', '坚持一贯——情绪平稳，反应永远能让人预料到。', '振奋——始终精神愉快，并把快乐推广到周围。  ', '文化性——对学术、艺术特别爱好。   ', NULL, NULL, 2, NULL, NULL),(10068, '性格测评', '在以下各行的词语中，选择最适合的词语。若你不能肯定哪一个是“最适合”的，请回忆一下当你在18岁以前的行为特点，哪个该是答案。', '独立性——自给自足，自我支持，无需他人帮忙。', '无攻击性——从不说或做引起他人不满与反对的事', '激发性——游戏般地鼓励别人参与。', '理想主义——以自己完美的标准来设想衡量事情。  ', NULL, NULL, 2, NULL, NULL),(10069, '性格测评', '在以下各行的词语中，选择最适合的词语。若你不能肯定哪一个是“最适合”的，请回忆一下当你在18岁以前的行为特点，哪个该是答案。', '果断——有很快做出判断与结论的能力。', '尖刻的幽默——直接的幽默近乎讽刺。 ', '感情外露——忘情地表达出自己的情感、喜好，与人娱乐时不由自主地接触别人', '深沉——认真，深刻，不肤浅的谈话或喜好。 ', NULL, NULL, 2, NULL, NULL),(10070, '性格测评', '在以下各行的词语中，选择最适合的词语。若你不能肯定哪一个是“最适合”的，请回忆一下当你在18岁以前的行为特点，哪个该是答案。', '行动者——闲不住，努力推动工作。别人跟随的领导。  ', '调解者——避免冲突，经常居中调和不同的意思。   ', '结交者——喜好周旋于宴会中，结交朋友。 ', '音乐性——爱好且认同音乐的艺术性，不单是为表演。', NULL, NULL, 2, NULL, NULL),(10071, '性格测评', '在以下各行的词语中，选择最适合的词语。若你不能肯定哪一个是“最适合”的，请回忆一下当你在18岁以前的行为特点，哪个该是答案。', '领导者——天生的带领者，不相信别人的能力如自己。', '聆听者——愿意听别人想说的。  ', '生趣——充满生机，精力充沛。   ', '忠心——对理想、工作、朋友都有不可言喻的忠实。  ', NULL, NULL, 2, NULL, NULL),(10072, '性格测评', '在以下各行的词语中，选择最适合的词语。若你不能肯定哪一个是“最适合”的，请回忆一下当你在18岁以前的行为特点，哪个该是答案。', '首领型——要求领导地位及别人跟随。', '知足型——满足自己拥有的，甚少羡慕人。', '可爱型——讨人喜欢，令人羡慕，人们注意的中心。', '制图型——用图表、数字来组织生活，解决问题。 ', NULL, NULL, 2, NULL, NULL),(10073, '性格测评', '在以下各行的词语中，选择最适合的词语。若你不能肯定哪一个是“最适合”的，请回忆一下当你在18岁以前的行为特点，哪个该是答案。', '工作者——不停地工作，不愿休息   ', '和气性——易相处，易说话，易让人接近。  ', '爱欢迎者——聚会时的灵魂人物，爱欢迎的宾客。  ', '完美主义者——对己对人高标准，一切事情有秩序。 ', NULL, NULL, 2, NULL, NULL),(10074, '性格测评', '在以下各行的词语中，选择最适合的词语。若你不能肯定哪一个是“最适合”的，请回忆一下当你在18岁以前的行为特点，哪个该是答案。', '勇敢型——大无畏，不怕冒险。', '模范型——时时保持自己举止合乎认同的道德规范。', '跳跃型——充满活力和生气的性格', '平衡型——稳定，走中间路线。', NULL, NULL, 2, NULL, NULL),(10075, '性格测评', '在以下各行的词语中，选择最适合的词语。若你不能肯定哪一个是“最适合”的，请回忆一下当你在18岁以前的行为特点，哪个该是答案。', '专横——喜命令支配，有时略傲慢。 ', '乏味——面上极少露表情或情绪    ', '露骨——好表现，华而不实，声音大。', '忸怩——躲避别人的注意力。         ', NULL, NULL, 2, NULL, NULL),(10076, '性格测评', '在以下各行的词语中，选择最适合的词语。若你不能肯定哪一个是“最适合”的，请回忆一下当你在18岁以前的行为特点，哪个该是答案。', '无同情心——不易理解别人的问题与麻烦。', '无热忱——不易兴奋，经常感到喜事难成。  ', '散漫——生活任性无秩序。             ', '不宽恕——不易宽恕或忘记别人对自己的伤害，易嫉妒。', NULL, NULL, 2, NULL, NULL),(10077, '性格测评', '在以下各行的词语中，选择最适合的词语。若你不能肯定哪一个是“最适合”的，请回忆一下当你在18岁以前的行为特点，哪个该是答案。', '逆反——抗拒或犹豫接受别人的方法，固持已见。 ', '保留性——不愿意参与，尤其当事物复杂时。  ', '重复——反复讲同一件事或故事，忘记自己已重复多次，总是不断找题说话', '怨恨性——把实际或想像的别人的冒犯，经常放在心中。    ', NULL, NULL, 2, NULL, NULL),(10078, '性格测评', '在以下各行的词语中，选择最适合的词语。若你不能肯定哪一个是“最适合”的，请回忆一下当你在18岁以前的行为特点，哪个该是答案。', '率直——直言不讳，不介意把自己的看法直说。', '惧怕——经常感到强烈的担心、焦虑、悲戚        ', '健忘——由于缺乏自我约束，不愿记无趣的事。', '挑剔——坚持做琐碎事情，要求注意细节。   ', NULL, NULL, 2, NULL, NULL),(10079, '性格测评', '在以下各行的词语中，选择最适合的词语。若你不能肯定哪一个是“最适合”的，请回忆一下当你在18岁以前的行为特点，哪个该是答案。', '不耐烦——难以忍受等待别人。  ', '优柔寡断——很难下定决心', '好插嘴——滔滔不绝的发言者，不是好听从，不留意别人也在话。           ', '无安全感——感到担心且无自信心。 ', NULL, NULL, 2, NULL, NULL),(10080, '性格测评', '在以下各行的词语中，选择最适合的词语。若你不能肯定哪一个是“最适合”的，请回忆一下当你在18岁以前的行为特点，哪个该是答案。', '不善表达——很难用语言或肢体当众表达感情。  ', '不愿参与——无兴趣且不愿意介入团体活动或别人生活', '难预测——时而兴奋，时而低落，承诺总难兑现。  ', '不受欢迎——由于强烈要求完美，而拒人千里之外', NULL, NULL, 2, NULL, NULL),(10081, '性格测评', '在以下各行的词语中，选择最适合的词语。若你不能肯定哪一个是“最适合”的，请回忆一下当你在18岁以前的行为特点，哪个该是答案。', '固执——坚持依自己的意见行事    ', '犹豫不决——迟迟才有行动，不易参与。  ', '即兴——不依照方法做事。', '难于取悦——标准太高，很难满意。', NULL, NULL, 2, NULL, NULL),(10082, '性格测评', '在以下各行的词语中，选择最适合的词语。若你不能肯定哪一个是“最适合”的，请回忆一下当你在18岁以前的行为特点，哪个该是答案。', '自负——自我评价高，认为自己是最好人选。', '平淡——中间性格，无高低情绪，很少表露感情。  ', '放任——容许别人（包括孩子）做他喜欢做的事。为的是讨好别人，令人喜欢自己 ', '悲观——尽管期待好结果，但往往先看到事物的不利之处。  ', NULL, NULL, 2, NULL, NULL),(10083, '性格测评', '在以下各行的词语中，选择最适合的词语。若你不能肯定哪一个是“最适合”的，请回忆一下当你在18岁以前的行为特点，哪个该是答案。', '好争吵——易与人争吵，永远觉得自己是正确的。', '无目标——不喜订目标，也无意订目标', '易发怒——有小孩般的情绪，易激动，事后马上又忘了。', '冷落感——容易感到被人疏离，经常无安全感或担心别人不喜欢与自己相处。', NULL, NULL, 2, NULL, NULL),(10084, '性格测评', '在以下各行的词语中，选择最适合的词语。若你不能肯定哪一个是“最适合”的，请回忆一下当你在18岁以前的行为特点，哪个该是答案。', '莽撞——充满自信，坚韧不拔，但经常不适当。', '漠不关心——不关心，得过且过，以不变应万变。', '天真——孩子般的单纯，不喜欢去理解生命的意义。      ', '消极——往往看到事物的反面，而少有积极的态度。', NULL, NULL, 2, NULL, NULL),(10085, '性格测评', '在以下各行的词语中，选择最适合的词语。若你不能肯定哪一个是“最适合”的，请回忆一下当你在18岁以前的行为特点，哪个该是答案。', '工作狂——为回报或成就感，不断工作，耻于休息。 ', '担忧——时时感到不确定、焦虑、心烦。  ', '需要认可——需要旁人认同、赞赏、如同演艺家需要观众的掌声、笑声与接受。', '孤独离群——感到需要大量时间独处。', NULL, NULL, 2, NULL, NULL),(10086, '性格测评', '在以下各行的词语中，选择最适合的词语。若你不能肯定哪一个是“最适合”的，请回忆一下当你在18岁以前的行为特点，哪个该是答案。', '不圆滑老练——常用冒犯或未斟酌的方式表达自己。', '胆怯——遇到困难退缩。   ', '喋喋不休——难以自控，滔滔不绝，不是好听众。', '过分敏感——被人误解时感到冒犯。', NULL, NULL, 2, NULL, NULL),(10087, '性格测评', '在以下各行的词语中，选择最适合的词语。若你不能肯定哪一个是“最适合”的，请回忆一下当你在18岁以前的行为特点，哪个该是答案。', '擅权——冲动地控制事情或别人，指挥他人。  ', '多疑——事事不确定，又对事缺乏信心。  ', '生活紊乱——缺乏组织生活秩序的能力。', '抑郁——很多时候情绪低落。     ', NULL, NULL, 2, NULL, NULL),(10088, '性格测评', '在以下各行的词语中，选择最适合的词语。若你不能肯定哪一个是“最适合”的，请回忆一下当你在18岁以前的行为特点，哪个该是答案。', '排斥异已——不接受他人的态度、观点、做事方法。', '无异议——对多数事情均漠不关心。  ', '反复——善变，互相矛盾，情绪与行动不合逻辑。', '内向——思想兴趣放在内心，活在自己世界里。', NULL, NULL, 2, NULL, NULL),(10089, '性格测评', '在以下各行的词语中，选择最适合的词语。若你不能肯定哪一个是“最适合”的，请回忆一下当你在18岁以前的行为特点，哪个该是答案。', '喜操纵——精明处事，影响事物，使自己得利', '含糊语言——低声说话，不在乎说不清楚', '杂乱无章——生活无秩序，经常找不到东西。', '情绪化——情绪不易高涨，不被欣赏时很容易低落', NULL, NULL, 2, NULL, NULL),(10090, '性格测评', '在以下各行的词语中，选择最适合的词语。若你不能肯定哪一个是“最适合”的，请回忆一下当你在18岁以前的行为特点，哪个该是答案。', '顽固——决心依自己的意愿行事，不易被说服。    ', '缓慢——行动思想均比较慢，通常是懒于行动。   ', '好表现——要吸引人，要做注意力的集中点。  ', '怀疑——不易相信别人，寻究语言背后的真正动机。', NULL, NULL, 2, NULL, NULL),(10091, '性格测评', '在以下各行的词语中，选择最适合的词语。若你不能肯定哪一个是“最适合”的，请回忆一下当你在18岁以前的行为特点，哪个该是答案。', '统治欲——毫不犹豫地表示自己的正确或控制能力。', '懒惰——总是先估量每件事要耗费多少精力。  ', '大嗓门——说话声与笑声总是令全场震惊。 ', '孤僻——需大量时间独处，喜避开人群。', NULL, NULL, 2, NULL, NULL),(10092, '性格测评', '在以下各行的词语中，选择最适合的词语。若你不能肯定哪一个是“最适合”的，请回忆一下当你在18岁以前的行为特点，哪个该是答案。', '易怒——当别人不能合乎自己的要求，如动作不够快时，易感到不耐烦而发怒。   ', '拖延——凡事起步慢，需要推动力。', '不专注——无法专心或集中注意力。', '猜疑——凡事怀疑，不相信别人。    ', NULL, NULL, 2, NULL, NULL),(10093, '性格测评', '在以下各行的词语中，选择最适合的词语。若你不能肯定哪一个是“最适合”的，请回忆一下当你在18岁以前的行为特点，哪个该是答案。', '烦躁——喜新厌旧，不喜欢长期做相同的事。', '勉强——不甘愿的，挣扎，不愿参与或投入', '轻率——因无耐性，不经思考，草率行动。 ', '报复性——情感不定，记恨并力惩冒犯自已的人。', NULL, NULL, 2, NULL, NULL),(10094, '性格测评', '在以下各行的词语中，选择最适合的词语。若你不能肯定哪一个是“最适合”的，请回忆一下当你在18岁以前的行为特点，哪个该是答案。', '狡猾——精明，总是有办法达到目地。  ', '妥协——为避免矛盾，宁愿放弃自己的立场。   ', '善变——像孩子般注意力短暂，需要各种变化，怕无聊。', '好批评——不断地衡量和下判断，经常考虑提出相反的意见。  ', NULL, NULL, 2, NULL, NULL),(10097, 'EQ测评', '当你感到焦虑或沮丧时，你会怎么做？', ' 找酒精、等物品来缓解情绪。', ' 把情绪压抑起来，不让别人看出来。', '找事情做，分散注意力。', '找人倾诉，寻求支持和安慰。', '', '', 2, '', ''),(10098, 'EQ测评', '当你与别人发生争执时，你会怎么做？', '攻击对方，试图压倒对方。', '坚持自己的观点，不肯妥协。', '退缩，避免冲突。', '试图寻找妥协的解决方案。', '', '', 2, '', ''),(10099, 'EQ测评', '当你需要帮助时，你会怎么做？', ' 指责别人没有提供帮助。', '不愿意向别人寻求帮助，宁愿自己承担', '等待别人主动提供帮助。', '主动向别人寻求帮助。', NULL, NULL, 2, NULL, NULL),(10100, 'EQ测评', ' 当你感到自己受到不公正待遇时，你会怎么做？', '采取报复行为', ' 保持沉默，不去反抗。', ' 大声抱怨，试图引起别人的同情。', '尝试寻找解决问题的方法。', NULL, NULL, 2, NULL, NULL),(10101, 'EQ测评', '当你面对一个陌生人时，你会怎么做？', '对对方表示不屑或敌意。', '保持沉默，不去交流。 ', ' 保持礼貌，但不会主动交流。', '尝试与对方建立联系，交流感受。', NULL, NULL, 2, NULL, NULL),(10102, 'EQ测评', '当你在职场中遇到挫折时，你会怎么做？', '放弃努力，认为自己无能为力。', '感到沮丧，但不会采取任何行动。', '抱怨和指责别人。', '寻找解决问题的方法，并采取行动', NULL, NULL, 2, NULL, NULL),(10103, 'EQ测评', '当你面对一个不同意见的人时，你会怎么做？', '攻击对方，试图压倒对方。', ' 坚持自己的观点，不肯妥协。', '退缩，避免冲突。 ', '尝试理解对方的观点，并找到妥协的解决方案。', NULL, NULL, 2, NULL, NULL),(10104, 'EQ测评', '当你需要做出重要的决定时，你会怎么做？', '犹豫不决，拖延时间。', '不愿意决定，宁愿让别人来做。', '轻率地做出决定', '仔细考虑各种选择，并做出决定。 ', NULL, NULL, 2, NULL, NULL),(10105, 'EQ测评', '当你面对一个困难的任务时，你会怎么做？', '放弃尝试，认为自己无法完成。', '做出一些尝试，但很快就放弃了。', '寻找帮助，与他人合作完成任务。', '坚持不懈地努力，直到完成任务', NULL, NULL, 2, NULL, NULL),(10106, 'EQ测评', '当你面对一个不同文化背景的人时，你会怎么做？', '对对方的文化背景表示不屑或敌意。', '不愿意与对方交往，认为文化差异太大。 1分', ' 保持礼貌，但不会主动交流', '尝试了解对方的文化背景，并与对方交往。', NULL, NULL, 2, NULL, NULL),(10107, 'IQ测评', '某市口腔医院的一项统计结果显示，65 岁至 74 岁老年人中，10 人中就有个全口无牙，调查结果表明，受教育程度越高的老人，全口无牙的比例越低，这说明这些老人对口腔保健比较重视，而大部分人受旧观念的影响认为人老了就应该掉牙，因此忽视了中老年人的口腔保健，使简单易治、痛苦小、治疗费用较低的龋齿、牙龈炎发展成治疗复杂、令人痛苦、治疗费用较高的牙髓病和牙周炎。\n如果这段文字所表述的内容是真实的，则以下哪一项也一定是真实的?', '某些观念、卫生习惯的改变，会影响一个人年老后患牙齿疾病的风险', '如果一个人受教育的程度比较低，年老后患牙齿疾病的风险就比较大', '定期检查，发现疾病及时治疗是老年人的预防口腔疾病有效方法', '80 岁的老人至少应有 20 颗功能牙，也就是 20 颗能够正常咀嚼食物、不松动的牙齿', 'A', '', 2, '', ''),(10108, 'IQ测评', '联合国粮农组织拉丁美洲地区代表日前表示，全球投资基金和美元疲软在很大程度上应该对世界食品价格高涨负责。近来从面包到牛奶在内的各种食品都出现了全球性涨价，并在一些国家推动了通胀，他说:“这场危机是由投机造成的，并将持续下去，对美元的信心不足已经使得投资基金转向商品寻求更高回报，首先是金属，然后是食品。”由此可以推出:', '投资基金投机行为造成全球食品上涨', '投资基金原来的投资对象是美元', '加拿大食品价格上涨与美元疲软有关', '投机行为也导致全球金属价格提高', 'D', NULL, 2, NULL, NULL),(10109, 'IQ测评', '有以下几个条件成立: (1)如果小王是工人，那么小张不是医生; (2)或者小李是工人，或者小王是工人; (3) 如果小张不是医生，那么小赵不是学生;(4)或者小赵是学生，或者小周不是经理。以下哪项如果为真，可得出“小李是工人”的结论?', '小周不是经理', '小王是工人', '小赵不是学生', '小周是经理', 'D', NULL, 2, NULL, NULL),(10110, 'IQ测评', '乒乓球单打决赛在甲、乙、丙、丁四位选手中进行，赛前，有些人预测比赛的结果，A 说:甲第 4。B 说:乙不是第 2，也不是第 4。C 说:丙的名次在乙的前面。D 说:丁将得第 1。比赛结果表明，四个人中只有一个人预测错了。那么，甲、乙、丙、丁四位选手的名次分别为?', '2、3、4、1', '1、2、4、3', '1、3、4、2', '4、3、1、2', 'D', NULL, 2, NULL, NULL),(10111, 'IQ测评', '9 个人组成的投票体，民主地决定各种议案，议案获得通过需要 5 票或 5 票以上。此时每个人的权力均等。一旦其中出现 5 个或 5 个以上的人结盟，那么其余的人实际上已被出局。若 9 个人形成4个联盟，人数分别为 3、3、2、1，每个联盟的权力不再相等。由此推出结论:', '人数分别为 3、3、2的权力相等，人数为1的联盟的权力为0', '若9个人形成3个联盟，这3 个联盟的人数分别为 4、3、2', '若9个人形成3个联盟，各联盟所拥有的权力均等', '人数分别为 3、3、2的权力相等，人数为1的联盟的权力为1', 'A', NULL, 2, NULL, NULL),(10112, 'IQ测评', '已知:(1) 如果甲和乙是肇事者，丙就不是肇事者; (2) 如果丁是肇事者那么乙就是肇事者; (3) 甲和丙都是肇事者。由此推出;', '乙和丁都是肇事者', '乙和丁都不是肇事者', '乙是肇事者，丁不是肇事者', '乙不是肇事者，丁是肇事者', 'B', NULL, 2, NULL, NULL),(10113, 'IQ测评', '假定一个人群只有两个人 A、B 构成，A、B 均知道一件命题 p，p 是A、B的知识，但此时 p 还不是他们的公共知识。当 A、B 双方均知道对方知道 p，并且他们各自都知道对方知道自己知道 p······这是一个无穷的过程。由此推出:', 'p与A、B之间是公共知识', 'p与A、B之间是基础知识', 'p与A、B之间是通用知识', 'p与A、B之间是同一知识', 'A', NULL, 2, NULL, NULL),(10114, 'IQ测评', '美国《科学》杂志公布了 2007 年度科学研究十大突破之一是:通过对人和老鼠的研究，科学家提出，记忆力和想象力均植根于人类大脑的海马区，该区是大脑重要的记忆中心。\n由此推断:', '大脑的记忆也许能重新梳理过去的经历', '大脑的记忆也许能产生关于未来的想象', '科学发现人类大脑的重要记忆中心', '科学家发现挑战人类智力的记忆程序', 'C', NULL, 2, NULL, NULL),(10115, 'IQ测评', '已知: (1)只要甲被录取，乙就不被录取: (2) 只要乙不被录取，甲就被录取; (3)甲被录取。已知这三个判断只有一个真，两个假。由此推出:', '甲、乙都被录取 ', '甲、乙都未被录取', '甲被录取，乙未被录取', '甲未被录取，乙被录取', 'B', NULL, 2, NULL, NULL),(10116, 'IQ测评', '古希腊哲学家同时也是自然科学家。例如:泰勒斯是天文学家，他确定了1年有 365 天，曾预言不定期一次日蚀:阿那克西曼德制造过日暴等仪器，还制作过海陆地图。\n据此，可以推出:', '有些自然科学家是古希腊哲学家', '有些自然科学家不是古希腊哲学家', '古希腊自然科学家都是哲学家', '古希腊哲学家都是天文学家', 'A', NULL, 2, NULL, NULL);
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `exam`.`paper_manage` WRITE;
DELETE FROM `exam`.`paper_manage`;
INSERT INTO `exam`.`paper_manage` (`paperId`,`questionType`,`questionId`) VALUES (1001, 1, 10013),(1001, 1, 10005),(1001, 1, 10001),(1001, 1, 10004),(1001, 1, 10000),(1001, 1, 10016),(1001, 1, 10032),(1001, 1, 10025),(1001, 1, 10030),(1001, 1, 10017),(1001, 1, 10027),(1001, 1, 10023),(1001, 1, 10014),(1001, 1, 10009),(1001, 1, 10008),(1001, 1, 10011),(1001, 1, 10010),(1001, 1, 10021),(1001, 1, 10022),(1001, 1, 10026),(1001, 2, 10017),(1001, 2, 10012),(1001, 2, 10004),(1001, 2, 10005),(1001, 2, 10003),(1001, 2, 10008),(1001, 2, 10020),(1001, 2, 10013),(1001, 2, 10006),(1001, 2, 10015),(1001, 3, 10002),(1001, 3, 10009),(1001, 3, 10003),(1001, 3, 10005),(1001, 3, 10004),(1001, 3, 10012),(1001, 3, 10011),(1001, 3, 10006),(1001, 3, 10008),(1001, 3, 10001),(1010, 1, 10033),(1010, 1, 10034),(1011, 1, 10035),(1010, 1, 10036),(1010, 1, 10037),(1010, 1, 10038),(1010, 1, 10039),(1010, 1, 10040),(1010, 1, 10041),(1010, 1, 10042),(1010, 1, 10043),(1010, 1, 10044),(1010, 1, 10045),(1010, 1, 10046),(1010, 1, 10047),(1010, 1, 10048),(1010, 1, 10049),(1010, 1, 10050),(1010, 1, 10051),(1010, 1, 10052),(1010, 1, 10053),(1010, 1, 10054),(1010, 1, 10055),(1012, 1, 10056),(1012, 1, 10057),(1012, 1, 10058),(1012, 1, 10059),(1012, 1, 10060),(1012, 1, 10061),(1012, 1, 10062),(1012, 1, 10063),(1012, 1, 10064),(1012, 1, 10065),(1012, 1, 10066),(1012, 1, 10067),(1012, 1, 10068),(1012, 1, 10069),(1012, 1, 10070),(1012, 1, 10071),(1012, 1, 10072),(1012, 1, 10073),(1012, 1, 10074),(1012, 1, 10075),(1012, 1, 10076),(1012, 1, 10077),(1012, 1, 10078),(1012, 1, 10079),(1012, 1, 10080),(1012, 1, 10081),(1012, 1, 10082),(1012, 1, 10083),(1012, 1, 10084),(1012, 1, 10085),(1012, 1, 10086),(1012, 1, 10087),(1012, 1, 10088),(1012, 1, 10089),(1012, 1, 10090),(1012, 1, 10091),(1012, 1, 10092),(1012, 1, 10093),(1012, 1, 10094),(1013, 1, 10097),(1013, 1, 10098),(1013, 1, 10099),(1013, 1, 10100),(1013, 1, 10101),(1013, 1, 10102),(1013, 1, 10103),(1013, 1, 10104),(1013, 1, 10105),(1013, 1, 10106),(1014, 1, 10107),(1014, 1, 10108),(1014, 1, 10109),(1014, 1, 10110),(1014, 1, 10111),(1014, 1, 10112),(1014, 1, 10113),(1014, 1, 10114),(1014, 1, 10115),(1014, 1, 10116);
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `exam`.`replay` WRITE;
DELETE FROM `exam`.`replay`;
INSERT INTO `exam`.`replay` (`messageId`,`replayId`,`replay`,`replayTime`) VALUES (26, 3, '好呀，我来了，你别跑！', '2019-03-18'),(22, 4, '心疼你2秒钟', '2019-03-18'),(25, 5, '我也要变强', '2019-03-19'),(25, 6, '俺也一样', '2019-03-19'),(21, 7, '既然这样，那就迎男而上吧', '2019-03-19'),(16, 8, '那条街确实没什么东西可以吃了。。。', '2019-03-19'),(15, 9, '咸鱼其实还可以吃，而你,emmmm', '2019-03-19'),(21, 11, '我不怕人多', '2019-03-19'),(20, 12, '是嘞，还行。', '2019-03-19'),(26, 13, '我也爱你ε=(´ο｀*)))唉', '2019-03-19'),(27, 14, '你这个坏孩子', '2019-03-31'),(33, 18, '是的，今天是周一。', '2019-04-14'),(34, 19, '1111', '2019-04-16'),(34, 20, '2222', '2019-04-16'),(35, 21, '666', '2019-09-05');
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `exam`.`score` WRITE;
DELETE FROM `exam`.`score`;
INSERT INTO `exam`.`score` (`scoreId`,`examCode`,`studentId`,`subject`,`ptScore`,`etScore`,`score`,`answerDate`,`achievement`) VALUES (126, 20190018, 20154084, 'EQ测评', NULL, 0, NULL, '2024-05-30', '一般');
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `exam`.`student` WRITE;
DELETE FROM `exam`.`student`;
INSERT INTO `exam`.`student` (`studentId`,`studentName`,`grade`,`major`,`clazz`,`institute`,`tel`,`email`,`pwd`,`cardId`,`sex`,`role`) VALUES (20154084, '林', '2015', '计算机科学与技术', '2', '软件工程学院', '13658377857', '13658377857@sina.cn', '123456', '124123124535', '男', '2');
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `exam`.`teacher` WRITE;
DELETE FROM `exam`.`teacher`;
INSERT INTO `exam`.`teacher` (`teacherId`,`teacherName`,`institute`,`sex`,`tel`,`email`,`pwd`,`cardId`,`type`,`role`) VALUES (20081001, '张', '南开大学', '男', '13598458442', '13598458442@163.com', '1234', '362322200589786338', '', '1'),(20081002, '王大志', '浙江大学', '男', '1231221312', '1231221312@163.com', '123456', '24241234', '', '1');
UNLOCK TABLES;
COMMIT;
