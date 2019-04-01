-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- 主机： mysql:3306
-- 生成日期： 2019-04-01 11:10:16
-- 服务器版本： 8.0.13
-- PHP 版本： 7.2.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 数据库： `WCRTG`
--

-- --------------------------------------------------------

--
-- 表的结构 `award`
--

CREATE TABLE `award` (
  `id` int(11) NOT NULL COMMENT '主键',
  `student id` int(11) NOT NULL COMMENT '学生表主键',
  `name` char(16) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '奖项名字'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `college`
--

CREATE TABLE `college` (
  `id` int(11) NOT NULL,
  `name` char(16) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `job`
--

CREATE TABLE `job` (
  `id` int(11) NOT NULL COMMENT '主键',
  `laboratory id` int(11) NOT NULL COMMENT '实验室id',
  `name` int(11) NOT NULL COMMENT '职位名',
  `num` int(11) NOT NULL COMMENT '数量',
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '描述'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `job skill`
--

CREATE TABLE `job skill` (
  `id` int(11) NOT NULL COMMENT '主键',
  `job id` int(11) NOT NULL COMMENT '职位表主键',
  `skill id` int(11) NOT NULL COMMENT '技能表主键',
  `level` int(11) NOT NULL COMMENT '水平'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `laboratory`
--

CREATE TABLE `laboratory` (
  `id` int(11) NOT NULL COMMENT '主键',
  `college id` int(11) NOT NULL COMMENT '学院表主键',
  `name` char(16) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '名字',
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '描述'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `major`
--

CREATE TABLE `major` (
  `id` int(11) NOT NULL,
  `name` char(16) COLLATE utf8mb4_unicode_ci NOT NULL,
  `college id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `skill`
--

CREATE TABLE `skill` (
  `id` int(11) NOT NULL,
  `name` char(16) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `student`
--

CREATE TABLE `student` (
  `id` int(11) NOT NULL COMMENT '主键',
  `student id` int(11) NOT NULL COMMENT '学号',
  `password` char(40) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '密码',
  `name` char(16) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '姓名',
  `major id` int(11) NOT NULL COMMENT '专业',
  `grade` int(11) NOT NULL COMMENT '年级'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `student skill`
--

CREATE TABLE `student skill` (
  `id` int(11) NOT NULL COMMENT '主键',
  `student id` int(11) NOT NULL COMMENT '学生表主键',
  `skill id` int(11) NOT NULL COMMENT '技能表主键',
  `level` int(11) NOT NULL COMMENT '水平'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `submit record`
--

CREATE TABLE `submit record` (
  `id` int(11) NOT NULL COMMENT '主键',
  `student id` int(11) NOT NULL COMMENT '学生表主键',
  `job id` int(11) NOT NULL COMMENT '职位表主键',
  `time` timestamp NOT NULL COMMENT '投递时间戳',
  `status` int(11) NOT NULL COMMENT '状态'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 转储表的索引
--

--
-- 表的索引 `award`
--
ALTER TABLE `award`
  ADD PRIMARY KEY (`id`),
  ADD KEY `学生id外键` (`student id`);

--
-- 表的索引 `college`
--
ALTER TABLE `college`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `job`
--
ALTER TABLE `job`
  ADD PRIMARY KEY (`id`),
  ADD KEY `职位表外键实验室id` (`laboratory id`);

--
-- 表的索引 `job skill`
--
ALTER TABLE `job skill`
  ADD PRIMARY KEY (`id`),
  ADD KEY `职位技能外键职位Id` (`job id`),
  ADD KEY `职位技能外键技能id` (`skill id`);

--
-- 表的索引 `laboratory`
--
ALTER TABLE `laboratory`
  ADD PRIMARY KEY (`id`),
  ADD KEY `实验室外键学院id` (`college id`);

--
-- 表的索引 `major`
--
ALTER TABLE `major`
  ADD PRIMARY KEY (`id`),
  ADD KEY `专业表外键学院id` (`college id`);

--
-- 表的索引 `skill`
--
ALTER TABLE `skill`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `student id` (`student id`),
  ADD KEY `学生表外键专业id` (`major id`);

--
-- 表的索引 `student skill`
--
ALTER TABLE `student skill`
  ADD PRIMARY KEY (`id`),
  ADD KEY `技能表id外键` (`skill id`),
  ADD KEY `学生技能表外键学生Id` (`student id`);

--
-- 表的索引 `submit record`
--
ALTER TABLE `submit record`
  ADD PRIMARY KEY (`id`),
  ADD KEY `学生表id外键` (`student id`),
  ADD KEY `职位表id外键` (`job id`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `award`
--
ALTER TABLE `award`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键';

--
-- 使用表AUTO_INCREMENT `college`
--
ALTER TABLE `college`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `job`
--
ALTER TABLE `job`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键';

--
-- 使用表AUTO_INCREMENT `job skill`
--
ALTER TABLE `job skill`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键';

--
-- 使用表AUTO_INCREMENT `laboratory`
--
ALTER TABLE `laboratory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键';

--
-- 使用表AUTO_INCREMENT `major`
--
ALTER TABLE `major`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `skill`
--
ALTER TABLE `skill`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `student`
--
ALTER TABLE `student`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键';

--
-- 使用表AUTO_INCREMENT `student skill`
--
ALTER TABLE `student skill`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键';

--
-- 使用表AUTO_INCREMENT `submit record`
--
ALTER TABLE `submit record`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键';

--
-- 限制导出的表
--

--
-- 限制表 `award`
--
ALTER TABLE `award`
  ADD CONSTRAINT `学生id外键` FOREIGN KEY (`student id`) REFERENCES `student` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- 限制表 `job`
--
ALTER TABLE `job`
  ADD CONSTRAINT `职位表外键实验室id` FOREIGN KEY (`laboratory id`) REFERENCES `laboratory` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- 限制表 `job skill`
--
ALTER TABLE `job skill`
  ADD CONSTRAINT `职位技能外键技能id` FOREIGN KEY (`skill id`) REFERENCES `skill` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `职位技能外键职位Id` FOREIGN KEY (`job id`) REFERENCES `job` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- 限制表 `laboratory`
--
ALTER TABLE `laboratory`
  ADD CONSTRAINT `实验室外键学院id` FOREIGN KEY (`college id`) REFERENCES `college` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- 限制表 `major`
--
ALTER TABLE `major`
  ADD CONSTRAINT `专业表外键学院id` FOREIGN KEY (`college id`) REFERENCES `college` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- 限制表 `student`
--
ALTER TABLE `student`
  ADD CONSTRAINT `学生表外键专业id` FOREIGN KEY (`major id`) REFERENCES `major` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- 限制表 `student skill`
--
ALTER TABLE `student skill`
  ADD CONSTRAINT `学生技能表外键学生Id` FOREIGN KEY (`student id`) REFERENCES `student` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `技能表id外键` FOREIGN KEY (`skill id`) REFERENCES `skill` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- 限制表 `submit record`
--
ALTER TABLE `submit record`
  ADD CONSTRAINT `学生表id外键` FOREIGN KEY (`student id`) REFERENCES `student` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `职位表id外键` FOREIGN KEY (`job id`) REFERENCES `job` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
