DELIMITER //
CREATE PROCEDURE CreateDB(IN dname varchar(80))
LANGUAGE SQL
NOT DETERMINISTIC
CONTAINS SQL
SQL SECURITY DEFINER
COMMENT ''
BEGIN
SET @sql =CONCAT('CREATE DATABASE ',dname,' CHARACTER SET utf8 COLLATE utf8_unicode_ci;');
PREPARE CreateDBSql FROM @sql;
EXECUTE CreateDBSql;
DEALLOCATE PREPARE CreateDBSql;
END 
//

CREATE PROCEDURE dropDB(IN dname varchar(80))
LANGUAGE SQL
NOT DETERMINISTIC
CONTAINS SQL
SQL SECURITY DEFINER
COMMENT ''
BEGIN
SET @sql =CONCAT('DROP DATABASE ',dname);
PREPARE CreateDBSql FROM @sql;
EXECUTE CreateDBSql;
DEALLOCATE PREPARE CreateDBSql;
END //

CREATE DEFINER=`root`@`localhost` PROCEDURE `createTable1`()
CREATE TABLE IF NOT EXISTS roomType (
typeID INT PRIMARY KEY,
title VARCHAR(80),
numOfSeats INT,
area INT,
animals BOOLEAN,
price INT
);
//

CREATE DEFINER=`root`@`localhost` PROCEDURE `createTable2`()
CREATE TABLE IF NOT EXISTS room (
roomID INT PRIMARY KEY,
room INT,
typeID INT,
Foreign key (typeID) References roomType (typeID) ON DELETE CASCADE
);
//

CREATE DEFINER=`root`@`localhost` PROCEDURE `createTable5`()
CREATE TABLE IF NOT EXISTS stat (
statusID INT PRIMARY KEY,
stat VARCHAR(80),
discount INT
);
//

CREATE DEFINER=`root`@`localhost` PROCEDURE `createTable4`()
CREATE TABLE IF NOT EXISTS client (
clientID INT PRIMARY KEY,
fullName VARCHAR(80),
statusID INT,
Foreign key (statusID) references stat(statusID) ON DELETE CASCADE
);
//

CREATE DEFINER=`root`@`localhost` PROCEDURE `createTable3`()
CREATE TABLE IF NOT EXISTS reservation (
reservID INT PRIMARY KEY,
roomID INT,
clientID INT,
arrivalDate VARCHAR(80),
numOfDays INT,
total INT,
Foreign key (roomID) references room(roomID),
Foreign key (clientID) references client(clientID) ON DELETE CASCADE
);
//



CREATE DEFINER=`root`@`localhost` PROCEDURE `showTable1`()
select * from roomType;
//

CREATE DEFINER=`root`@`localhost` PROCEDURE `showTable2`()
select * from room;
//

CREATE DEFINER=`root`@`localhost` PROCEDURE `showTable3`()
select * from reservation;
//

CREATE DEFINER=`root`@`localhost` PROCEDURE `showTable4`()
select * from client;
//

CREATE DEFINER=`root`@`localhost` PROCEDURE `showTable5`()
select * from stat;
//

CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteTable1`()
begin
set foreign_key_checks=0;
truncate table roomType;
set foreign_key_checks=1;
end
//

CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteTable2`()
begin
set foreign_key_checks=0;
truncate table room;
set foreign_key_checks=1;
end
//

CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteTable3`()
begin
set foreign_key_checks=0;
truncate table reservation;
set foreign_key_checks=1;
end
//

CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteTable4`()
begin
set foreign_key_checks=0;
truncate table client;
set foreign_key_checks=1;
end
//

CREATE PROCEDURE `deleteTable5`()
begin
set foreign_key_checks=0;
truncate table stat;
set foreign_key_checks=1;
end
//

CREATE PROCEDURE deleteAll()
begin
set foreign_key_checks=0;
truncate roomType;
truncate room;
truncate reservation;
truncate client;
truncate stat;
set foreign_key_checks=1;
end
//

CREATE PROCEDURE insertTable1(IN typeID INT, IN title VARCHAR(80), IN numOfSeats INT, IN area INT, IN animals BOOLEAN, IN price INT)
INSERT INTO roomType (typeID, title, numOfSeats, area, animals, price) VALUES(typeID, title, numOfSeats, area, animals, price);
//

CREATE PROCEDURE insertTable2(IN roomID INT, IN room INT, IN typeID INT)
INSERT INTO room (roomID, room, typeID) VALUES(roomID, room, typeID);
//

CREATE PROCEDURE insertTable3(IN reservID INT, IN roomID INT, IN clientID INT, IN arrivalDate VARCHAR(80), IN numOfDays INT, IN total INT)
INSERT INTO reservation (reservID, roomID, clientID, arrivalDate, numOfDays, total) VALUES(reservID, roomID, clientID, arrivalDate, numOfDays, total);
//

CREATE PROCEDURE insertTable4(IN clientID INT, IN fullName VARCHAR(80), IN statusID INT)
INSERT INTO client (clientID, fullName, statusID) VALUES(clientID, fullName, statusID);
//

CREATE PROCEDURE insertTable5(IN statusID INT, IN stat VARCHAR(80), IN discount INT)
INSERT INTO stat (statusID, stat, discount) VALUES(statusID, stat, discount);
//

CREATE PROCEDURE findTable1(IN num INT)
SELECT * FROM roomType WHERE numOfSeats=num;
//

CREATE PROCEDURE findTable2(IN typenum INT)
SELECT * FROM room WHERE typeID=typenum;
//

CREATE PROCEDURE findTable3(IN arrDate VARCHAR(80))
SELECT * FROM reservation WHERE arrivalDate=arrDate;
//

CREATE PROCEDURE findTable4(IN fName VARCHAR(80))
SELECT * FROM client WHERE fullName=fName;
//

CREATE PROCEDURE findTable5(IN st VARCHAR(80))
SELECT * FROM stat WHERE stat=st;
//

CREATE PROCEDURE deleteStrTable1(IN num INT)
DELETE FROM roomType WHERE numOfSeats=num;
//

CREATE PROCEDURE deleteStrTable2(IN typenum INT)
DELETE FROM room WHERE typeID=typenum;
//

CREATE PROCEDURE deleteStrTable3(IN arrDate VARCHAR(80))
DELETE FROM reservation WHERE arrivalDate=arrDate;
//

CREATE PROCEDURE deleteStrTable4(IN fName VARCHAR(80))
DELETE FROM client WHERE fullName=fName;
//

CREATE PROCEDURE deleteStrTable5(IN st VARCHAR(80))
DELETE FROM stat WHERE stat=st;
//

CREATE PROCEDURE deleteIDTable1(IN typeID_cur INT)
DELETE FROM roomType WHERE typeID_cur=typeID;
//

CREATE PROCEDURE deleteIDTable2(IN roomID_cur INT)
DELETE FROM room WHERE roomID_cur=roomID;
//

CREATE PROCEDURE deleteIDTable3(IN reservID_cur INT)
DELETE FROM reservation WHERE reservID_cur=reservID;
//

CREATE PROCEDURE deleteIDTable4(IN clientID_cur INT)
DELETE FROM client WHERE clientID_cur=clientID;
//

CREATE PROCEDURE deleteIDTable5(IN statusID_cur INT)
DELETE FROM stat WHERE statusID_cur=statusID;
//

CREATE PROCEDURE upgradeTable1(IN typeID_new INT, IN title_new VARCHAR(80), IN numOfSeats_new INT, IN area_new INT, IN animals_new BOOLEAN, IN price_new INT)
UPDATE roomType set typeID = typeID_new, title = title_new, numOfSeats = numOfSeats_new, area = area_new, animals = animals_new, price = price_new WHERE typeID = typeID_new;
//

CREATE PROCEDURE upgradeTable2(IN roomID_new INT, IN room_new INT, IN typeID_new INT)
UPDATE room set room = room_new, typeID = typeID_new WHERE roomID_new=roomID;
//

CREATE PROCEDURE upgradeTable3(IN reservID_new INT, IN roomID_new INT, IN clientID_new INT, IN arrivalDate_new VARCHAR(80), IN numOfDays_new INT, IN total_new INT)
UPDATE reservation set reservID = reservID_new, clientID = clientID_new, arrivalDate = arrivalDate_new, numOfDays = numOfDays_new, total = total_new WHERE reservID_new=reservID;
//

CREATE PROCEDURE upgradeTable4(IN clientID_new INT, IN fullName_new VARCHAR(80), IN statusID_new INT)
UPDATE client set fullName = fullName_new, statusID = statusID_new WHERE clientID_new=clientID;
//

CREATE PROCEDURE upgradeTable5(IN statusID_new INT, IN stat_new VARCHAR(80), IN discount_new INT)
UPDATE stat set stat = stat_new, discount = discount_new WHERE statusID_new=statusID;
//