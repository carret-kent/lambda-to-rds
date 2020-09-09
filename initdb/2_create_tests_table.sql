CREATE TABLE IF NOT EXISTS `node_mysql_test`.`tests` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `integer` int(11) NOT NULL COMMENT '数値',
  `big_integer` bigint(20) NOT NULL DEFAULT '0',
  `unsigned_integer` int(10) unsigned NOT NULL,
  `float` double(8,2) NOT NULL,
  `double` double(15,8) NOT NULL,
  `string` varchar(255) DEFAULT NULL,
  `text` text NOT NULL,
  `enum` enum('DEBUG','INFO','NOTICE','WARNING','ERROR','CRITICAL','ALERT','EMERGENCY') NOT NULL,
  `geometry` geometry NOT NULL,
  `json` json NOT NULL,
  `date` date NOT NULL,
  `dateTime` datetime NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tests_integer_unique` (`integer`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC
