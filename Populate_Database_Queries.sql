--Create Tables

CREATE TABLE Customer (
CustId CHAR(6) PRIMARY KEY NOT NULL, 
CustName CHAR(18) ,
Prov CHAR(2)
);

CREATE TABLE Item (
ItemId CHAR(5) PRIMARY KEY NOT NULL, 
ItemDesc CHAR(18),
ItemCategory CHAR(2),
ItemPrice DECIMAL(6, 2),
ItemCost DECIMAL(6, 2),
QtyOnhand INT,
ReorderLvl  INT
);

CREATE TABLE Orders (
OrderNo CHAR(4) PRIMARY KEY NOT NULL,
CustId CHAR(6) REFERENCES Customer NOT NULL,
OrderDate DATETIME,
OrderType CHAR(2)
);

CREATE TABLE SaleItem (
OrderNo CHAR(4) REFERENCES Orders NOT NULL, 
ItemId CHAR(5) REFERENCES Item NOT NULL,
CONSTRAINT SaleItem_Orders_Item_PK PRIMARY KEY (OrderNo, ItemId),
SalePrice DECIMAL(6, 2),
QtySold INT
);

--Create Rows for Customer Table

INSERT INTO Customer VALUES (100, 'Brian', 'SK');
INSERT INTO Customer VALUES (101, 'Charlie', 'ON');
INSERT INTO Customer VALUES (102, 'Shawmiya', 'BC');
INSERT INTO Customer VALUES (103, 'Guled', 'QU');
INSERT INTO Customer VALUES (104, 'Ismam', 'ON');
INSERT INTO Customer VALUES (105, 'Troy', 'MB');
INSERT INTO Customer VALUES (106, 'LeBron', 'ON');
INSERT INTO Customer VALUES (107, 'Kawhi', 'ON');
INSERT INTO Customer VALUES (108, 'Giannis', 'SK');
INSERT INTO Customer VALUES (109, 'Pascal', 'BC');
INSERT INTO Customer VALUES (110, 'Fred', 'SK');
INSERT INTO Customer VALUES (111, 'Gary', 'BC');
INSERT INTO Customer VALUES (112, 'Ogugua', 'QU');
INSERT INTO Customer VALUES (113, 'Scottie', 'QU');
INSERT INTO Customer VALUES (114, 'Demar', 'QU');
INSERT INTO Customer VALUES (115, 'Kyle', 'ON');
INSERT INTO Customer VALUES (116, 'Devin', 'ON');
INSERT INTO Customer VALUES (117, 'Luka', 'MB');
INSERT INTO Customer VALUES (118, 'Paolo', 'MB');
INSERT INTO Customer VALUES (119, 'Kevin', 'MB');
INSERT INTO Customer VALUES (120, 'Kyrie', 'AB');
INSERT INTO Customer VALUES (121, 'Nikola', 'MB');
INSERT INTO Customer VALUES (122, 'Damian', 'QU');
INSERT INTO Customer VALUES (123, 'Zach', 'AB');
INSERT INTO Customer VALUES (124, 'Trae', 'MB');

--Create Rows for Item Table

INSERT INTO Item VALUES (11000, 'Potato', 'VG', 1.00, 0.50, 50, 50);
INSERT INTO Item VALUES (12000, 'Eggplant', 'VG', 2.00, 1.00, 25, 50);
INSERT INTO Item VALUES (15000, 'Cucumber', 'VG', 2.00, 1.00, 50, 50);
INSERT INTO Item VALUES (13000, 'Strawberries', 'FR', 3.00, 2.00, 50, 50);
INSERT INTO Item VALUES (14000, 'Lettuce', 'VG', 1.00, 0.50, 50, 50);
INSERT INTO Item VALUES (16000, 'Green Bananas', 'FR', 5.00, 3.00, 50, 50);
INSERT INTO Item VALUES (10000, 'Tomato', 'VG', 1.00, 0.50, 50, 50);
INSERT INTO Item VALUES (17000, 'Yellow Bananas', 'FR', 6.00, 3.00, 50, 50);
INSERT INTO Item VALUES (1000, 'Apples', 'FR', 2.00, 1.00, 50, 50);
INSERT INTO Item VALUES (2000, 'Brocolli', 'VG', 3.00, 2.00, 50, 50);
INSERT INTO Item VALUES (3000, 'Cauliflower', 'VG', 2.00, 1.00, 25, 50);
INSERT INTO Item VALUES (5000, 'Oranges', 'FR', 1.00, 0.50, 20, 50);
INSERT INTO Item VALUES (4000, 'Red Apple', 'FR', 1.00, 0.50, 50, 50);
INSERT INTO Item VALUES (7000, 'Watermelon', 'FR', 4.00, 2.00, 10, 50);
INSERT INTO Item VALUES (9000, 'Kiwi', 'FR', 1.00, 0.50, 50, 50);
INSERT INTO Item VALUES (6000, 'Bananas', 'FR', 5.00, 3.00, 50, 50);
INSERT INTO Item VALUES (8000, 'Carrot', 'VG', 2.00, 1.00, 50, 50);

--Create Rows for Orders Table

INSERT INTO Orders VALUES (1, 100, '2015-01-02 00:00:00.000', 'A');
INSERT INTO Orders VALUES (10, 109, '2015-05-25 00:00:00.000', 'B');
INSERT INTO Orders VALUES (11, 110, '2015-03-01 00:00:00.000', 'C');
INSERT INTO Orders VALUES (12, 111, '2013-07-27 00:00:00.000', 'A');
INSERT INTO Orders VALUES (13, 112, '2014-11-29 00:00:00.000', 'B');
INSERT INTO Orders VALUES (14, 113, '2014-11-30 00:00:00.000', 'C');
INSERT INTO Orders VALUES (15, 114, '2014-02-09 00:00:00.000', 'A');
INSERT INTO Orders VALUES (16, 115, '2015-08-10 00:00:00.000', 'B');
INSERT INTO Orders VALUES (17, 116, '2014-06-06 00:00:00.000', 'C');
INSERT INTO Orders VALUES (18, 117, '2013-02-05 00:00:00.000', 'A');
INSERT INTO Orders VALUES (19, 118, '2016-02-29 00:00:00.000', 'B');
INSERT INTO Orders VALUES (2, 101, '2016-03-03 00:00:00.000', 'C');
INSERT INTO Orders VALUES (20, 119, '2015-03-24 00:00:00.000', 'R');
INSERT INTO Orders VALUES (21, 120, '2016-02-01 00:00:00.000', 'B');
INSERT INTO Orders VALUES (22, 120, '2015-02-02 00:00:00.000', 'R');
INSERT INTO Orders VALUES (23, 109, '2014-05-05 00:00:00.000', 'R');
INSERT INTO Orders VALUES (24, 111, '2014-06-05 00:00:00.000', 'C');
INSERT INTO Orders VALUES (25, 113, '2014-08-09 00:00:00.000', 'B');
INSERT INTO Orders VALUES (26, 113, '2014-10-15 00:00:00.000', 'R');
INSERT INTO Orders VALUES (27, 122, '2015-07-10 00:00:00.000', 'R');
INSERT INTO Orders VALUES (28, 123, '2015-07-25 00:00:00.000', 'C');
INSERT INTO Orders VALUES (29, 124, '2015-07-02 00:00:00.000', 'A');
INSERT INTO Orders VALUES (3, 102, '2015-02-14 00:00:00.000', 'C');
INSERT INTO Orders VALUES (30, 101, '2015-02-10 00:00:00.000', 'C');
INSERT INTO Orders VALUES (31, 101, '2015-02-20 00:00:00.000', 'C');
INSERT INTO Orders VALUES (32, 101, '2015-03-02 00:00:00.000', 'C');
INSERT INTO Orders VALUES (33, 105, '2015-02-25 00:00:00.000', 'C');
INSERT INTO Orders VALUES (34, 123, '2014-05-06 00:00:00.000', 'D');
INSERT INTO Orders VALUES (35, 123, '2014-06-05 00:00:00.000', 'D');
INSERT INTO Orders VALUES (36, 124, '2014-06-09 00:00:00.000', 'A');
INSERT INTO Orders VALUES (37, 124, '2014-09-12 00:00:00.000', 'A');
INSERT INTO Orders VALUES (4, 103, '2015-08-18 00:00:00.000', 'A');
INSERT INTO Orders VALUES (40, 108, '2015-04-03 00:00:00.000', 'A');
INSERT INTO Orders VALUES (41, 102, '2015-07-15 00:00:00.000', 'C');
INSERT INTO Orders VALUES (42, 110, '2015-07-29 00:00:00.000', 'A');
INSERT INTO Orders VALUES (43, 115, '2015-07-20 00:00:00.000', 'B');
INSERT INTO Orders VALUES (44, 120, '2015-07-12 00:00:00.000', 'C');
INSERT INTO Orders VALUES (5, 104, '2015-01-01 00:00:00.000', 'B');
INSERT INTO Orders VALUES (6, 105, '2015-03-05 00:00:00.000', 'C');
INSERT INTO Orders VALUES (7, 106, '2015-09-11 00:00:00.000', 'A');
INSERT INTO Orders VALUES (8, 107, '2013-04-04 00:00:00.000', 'B');
INSERT INTO Orders VALUES (9, 108, '2015-07-07 00:00:00.000', 'C');

--Create Rows for SaleItem Table

INSERT INTO SaleItem VALUES (1, 13000, 3.00, 50);
INSERT INTO SaleItem VALUES (10, 13000, 2.50, 35);
INSERT INTO SaleItem VALUES (11, 11000, 1.00, 32);
INSERT INTO SaleItem VALUES (12, 12000, 2.00, 12);
INSERT INTO SaleItem VALUES (13, 13000, 3.00, 16);
INSERT INTO SaleItem VALUES (14, 14000, 1.00, 18);
INSERT INTO SaleItem VALUES (15, 1000, 2.00, 15);
INSERT INTO SaleItem VALUES (15, 15000, 2.00, 5);
INSERT INTO SaleItem VALUES (15, 2000, 3.00, 10);
INSERT INTO SaleItem VALUES (15, 8000, 0.95, 30);
INSERT INTO SaleItem VALUES (16, 16000, 5.00, 50);
INSERT INTO SaleItem VALUES (16,3000, 2.00, 20);
INSERT INTO SaleItem VALUES (16, 5000, 1.00, 10);
INSERT INTO SaleItem VALUES (17, 2000, 3.00, 10);
INSERT INTO SaleItem VALUES (18, 3000, 2.00, 12);
INSERT INTO SaleItem VALUES (19, 1000, 2.00, 16);
INSERT INTO SaleItem VALUES (2, 2000, 3.00, 22);
INSERT INTO SaleItem VALUES (20, 5000, 1.00, 18);
INSERT INTO SaleItem VALUES (21, 15000, 2.00, 11);
INSERT INTO SaleItem VALUES (22, 17000, 4.00, 24);
INSERT INTO SaleItem VALUES (23, 5000, 1.00, 10);
INSERT INTO SaleItem VALUES (24, 4000, 0.90, 30);
INSERT INTO SaleItem VALUES (25, 17000, 1.50, 15);
INSERT INTO SaleItem VALUES (26, 15000, 2.00, 5);
INSERT INTO SaleItem VALUES (27, 10000, 1.00, 50);
INSERT INTO SaleItem VALUES (28, 10000, 1.00, 30);
INSERT INTO SaleItem VALUES (29, 10000, 1.00, 100);
INSERT INTO SaleItem VALUES (3, 3000, 2.00, 15);
INSERT INTO SaleItem VALUES (30, 1000, 2.00, 10);
INSERT INTO SaleItem VALUES (31, 1000, 2.00, 10);
INSERT INTO SaleItem VALUES (32, 1000, 1.50, 15);
INSERT INTO SaleItem VALUES (33, 17000, 3.00, 20);
INSERT INTO SaleItem VALUES (34, 5000, 1.00, 5);
INSERT INTO SaleItem VALUES (35, 2000, 3.00, 5);
INSERT INTO SaleItem VALUES (36, 2000, 3.00, 5);
INSERT INTO SaleItem VALUES (37, 9000, 1.00, 10);
INSERT INTO SaleItem VALUES (4, 4000, 1.00, 16);
INSERT INTO SaleItem VALUES (40, 13000, 3.00, 12);
INSERT INTO SaleItem VALUES (41, 5000, 1.00, 12);
INSERT INTO SaleItem VALUES (42, 5000, 1.00, 13);
INSERT INTO SaleItem VALUES (43, 3000, 2.00, 15);
INSERT INTO SaleItem VALUES (44, 3000, 3.00, 16);
INSERT INTO SaleItem VALUES (5, 17000, 1.00, 10);
INSERT INTO SaleItem VALUES (6, 6000, 5.00, 60);
INSERT INTO SaleItem VALUES (7, 7000, 4.00, 40);
INSERT INTO SaleItem VALUES (8, 8000, 0.75, 30);
INSERT INTO SaleItem VALUES (9, 9000, 1.00, 5);