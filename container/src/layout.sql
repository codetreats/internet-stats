CREATE TABLE `connectionstate` (
  `date` date NOT NULL,
  `time` time NOT NULL,
  `online` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

ALTER TABLE `connectionstate`
  ADD PRIMARY KEY (`date`,`time`);
COMMIT;
