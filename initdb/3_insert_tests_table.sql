INSERT INTO `node_mysql_test`.`tests`
(`id`, `integer`, `big_integer`, `unsigned_integer`, `float`, `double`, `string`, `text`, `enum`, `geometry`, `json`, `date`, `dateTime`, `timestamp`)
VALUES
('1', '10', '20', '30', '10.5', '20.55', 'abc', 'xyz', 'INFO', GeomFromText('POINT(139.766247 35.681298)'), '{\"x\": 100, \"y\": 200}', '2012-01-01', '2000-01-01 10:20:30', '2000-01-01 02:12:22');
