/* Use This file to run in SQL Fiddle to set up the Schema
 * Try https://www.jdoodle.com/execute-sql-online/
 */

/* This section should be copied from GitHub and ran once to set up thhe Tables and insert the data */

/* If this runs more than once, drop tables first so it won't fail */
drop table people;
drop table secret_santa_selection;
drop table wish_list;

/* Create theh People Table 
 * Primary Key (PK) is ID
 * Name is both first and last name
 * Location is the US State they live in
 */
create table if not exists people (
  id int(6) not null
  ,name varchar(200) not null
  ,location varchar(50) not null
  ,primary key (id)
) 
;

/* Insert the values for People */
insert into people (id, name, location) 
values
  (1, 'Esmay Edmonds', 'Texas')
  ,(2, 'Jayden-James Galvan', 'Florida')
  ,(3, 'Arfa Andrews', 'California')
  ,(4, 'Yunus Dennis', 'Texas')
  ,(5, 'Garrett Southern', 'New York')
  ,(6, 'Harpreet Deacon', 'California')
  ,(7, 'Kacey Cummings', 'Texas')
  ,(8, 'Tamia Stott', 'Pennsylvania')
  ,(9, 'Izabela Waters', 'Florida')
  ,(10, 'Jiya Drew', 'Florida')
  ,(11, 'Mayur Naylor', 'California')
  ,(12, 'Taha Colon', 'Illinois')
  ,(13, 'Shaquille Lang', 'Texas')
  ,(14, 'Brenda Fox', 'Florida')
  ,(15, 'Ameen Martinez', 'Texas')
  ,(16, 'Ansh Flower', 'New York')
  ,(17, 'Arfa Corrigan', 'Illinois')
  ,(18, 'Luc Jaramillo', 'California')
  ,(19, 'Johnnie Chambers', 'Pennsylvania')
  ,(20, 'Samir Dodd', 'Illinois')
  ,(21, 'Marcus Moore', 'Texas')
  ,(22, 'Merlin Rubio', 'Florida')
  ,(23, 'Ajwa Hammond', 'Wisconsin')
  ,(24, 'Florrie Fitzpatrick', 'Illinois')
  ,(25, 'Valentina Winters', 'Texas')
;

/* Create Secret Santa Selection Table
 * ID is the Primary Key (PK) ID for the record in the table
 * Year is the year, this is an interger field, not a date
 * giver_ID is the Foreign Key (FK) that joins to the people.id field
 * receiver_id is the Foreign Key (FK) that joins to the people.id field
 */
create table if not exists secret_santa_selection (
  id int(6) not null
  ,year int(6) not null
  ,giver_id int(6) not null
  ,receiver_id int(6) not null
  ,primary key (id)
) 
;

/* Insert in the values */
insert into secret_santa_selection (id, year, giver_id, receiver_id)
values 
  (1,2019,1,16)
  ,(2,2019,2,8)
  ,(3,2019,3,5)
  ,(4,2019,4,12)
  ,(5,2019,5,6)
  ,(6,2019,6,17)
  ,(7,2019,7,22)
  ,(8,2019,8,4)
  ,(9,2019,9,24)
  ,(10,2019,10,11)
  ,(11,2019,11,18)
  ,(12,2019,12,13)
  ,(13,2019,13,15)
  ,(14,2019,14,21)
  ,(15,2019,15,19)
  ,(16,2019,16,2)
  ,(17,2019,17,7)
  ,(18,2019,18,10)
  ,(19,2019,19,3)
  ,(20,2019,20,25)
  ,(21,2019,21,20)
  ,(22,2019,22,23)
  ,(23,2019,23,1)
  ,(24,2019,24,9)
  ,(25,2019,25,14)
  ,(26,2020,1,7)
  ,(27,2020,2,16)
  ,(28,2020,3,24)
  ,(29,2020,4,12)
  ,(30,2020,5,1)
  ,(31,2020,6,2)
  ,(32,2020,7,20)
  ,(33,2020,8,10)
  ,(34,2020,9,3)
  ,(35,2020,10,25)
  ,(36,2020,11,23)
  ,(37,2020,12,21)
  ,(38,2020,13,9)
  ,(39,2020,14,18)
  ,(40,2020,15,22)
  ,(41,2020,16,13)
  ,(42,2020,17,19)
  ,(43,2020,18,15)
  ,(44,2020,19,11)
  ,(45,2020,20,6)
  ,(46,2020,21,5)
  ,(47,2020,22,4)
  ,(48,2020,23,17)
  ,(49,2020,24,14)
  ,(50,2020,25,8)
  ,(51,2021,1,11)
  ,(52,2021,2,16)
  ,(53,2021,3,19)
  ,(54,2021,4,2)
  ,(55,2021,5,21)
  ,(56,2021,6,18)
  ,(57,2021,7,15)
  ,(58,2021,8,6)
  ,(59,2021,9,3)
  ,(60,2021,10,1)
  ,(61,2021,11,20)
  ,(62,2021,12,10)
  ,(63,2021,13,8)
  ,(64,2021,14,24)
  ,(65,2021,15,7)
  ,(66,2021,16,14)
  ,(67,2021,17,22)
  ,(68,2021,18,4)
  ,(69,2021,19,17)
  ,(70,2021,20,13)
  ,(71,2021,21,12)
  ,(72,2021,22,5)
  ,(73,2021,23,25)
  ,(74,2021,24,23)
  ,(75,2021,25,9)
;

/* Create the Wish List Table 
 * ID is the Primary Key (PK) for the table
 * Year is the year, this is an interger field, not a date
 * person_id is the Foreign Key (FK) that joins to the people.id field
 * gift_idea is the item they are looking for, example: Starbucks Gift Card
 * Notes can be null (and will at first), but could have additional notes about the gift
 */
create table if not exists wish_list (
  id int(6) not null
  ,year int(6) not null
  ,person_id int(6) not null
  ,gift_idea varchar(256) not null
  ,notes varchar(256)
  ,primary key (id)
) 
;
/* Add data to the wish_list table */
insert into wish_list (id, year, person_id, gift_idea)
values 
  (1,2019,1,'Starbucks Gift Card')
  ,(2,2019,2,'Smart Reusable Notebook')
  ,(3,2019,3,'Portable Bluetooth Speaker')
  ,(4,2019,4,'Pac-Man Miniature Arcade Game')
  ,(5,2019,5,'Amazon Gift Card')
  ,(6,2019,6,'Starbucks Gift Card')
  ,(7,2019,7,'Coffee Warmer and Mug Set')
  ,(8,2019,8,'Smart Reusable Notebook')
  ,(9,2019,9,'Travel Mug')
  ,(11,2019,11,'Wireless Ear Buds')
  ,(12,2019,12,'Coffee')
  ,(13,2019,13,'Mini Waffle Maker')
  ,(14,2019,14,'Portable Bluetooth Speaker')
  ,(15,2019,15,'Travel Mug')
  ,(16,2019,16,'Starbucks Gift Card')
  ,(17,2019,17,'Solar Power Bank')
  ,(18,2019,18,'Amazon Gift Card')
  ,(19,2019,19,'Coffee Warmer and Mug Set')
  ,(21,2019,21,'Starbucks Gift Card')
  ,(22,2019,22,'Travel Mug')
  ,(23,2019,23,'Portable Bluetooth Speaker')
  ,(24,2019,24,'Amazon Gift Card')
  ,(25,2019,25,'Wireless Ear Buds')
  ,(26,2020,1,'Amazon Gift Card')
  ,(27,2020,2,'Starbucks Gift Card')
  ,(28,2020,3,'Starbucks Gift Card')
  ,(29,2020,4,'Travel Mug')
  ,(30,2020,5,'Smart Reusable Notebook')
  ,(32,2020,7,'Starbucks Gift Card')
  ,(33,2020,8,'Coffee')
  ,(34,2020,9,'Amazon Gift Card')
  ,(35,2020,10,'Starbucks Gift Card')
  ,(36,2020,11,'Coffee')
  ,(37,2020,12,'Travel Mug')
  ,(38,2020,13,'Newtons Cradle Balance Balls')
  ,(39,2020,14,'Travel Mug')
  ,(41,2020,16,'Portable Bluetooth Speaker')
  ,(42,2020,17,'Solar Power Bank')
  ,(43,2020,18,'Starbucks Gift Card')
  ,(44,2020,19,'Wireless Ear Buds')
  ,(45,2020,20,'Coffee')
  ,(46,2020,21,'Amazon Gift Card')
  ,(47,2020,22,'Coffee')
  ,(48,2020,23,'Starbucks Gift Card')
  ,(49,2020,24,'Amazon Gift Card')
  ,(50,2020,25,'Smart Reusable Notebook')
  ,(51,2021,1,'Solar Power Bank')
  ,(52,2021,2,'Starbucks Gift Card')
  ,(54,2021,4,'Travel Mug')
  ,(55,2021,5,'Wireless Ear Buds')
  ,(56,2021,6,'Actually Curious: Curiosity Edition Cards')
  ,(57,2021,7,'Solar Power Bank')
  ,(58,2021,8,'Coffee')
  ,(59,2021,9,'Amazon Gift Card')
  ,(60,2021,10,'Starbucks Gift Card')
  ,(62,2021,12,'Travel Mug')
  ,(63,2021,13,'Wireless Ear Buds')
  ,(64,2021,14,'Gray Malin The Goals Guided Journal')
  ,(65,2021,15,'Coffee')
  ,(66,2021,16,'Starbucks Gift Card')
  ,(67,2021,17,'Amazon Gift Card')
  ,(68,2021,18,'Coffee Warmer and Mug Set')
  ,(69,2021,19,'Starbucks Gift Card')
  ,(70,2021,20,'Portable Bluetooth Speaker')
  ,(71,2021,21,'Starbucks Gift Card')
  ,(72,2021,22,'Travel Mug')
  ,(73,2021,23,'Hey Dewy Portable Facial Humidifier')
  ,(75,2021,25,'Starbucks Gift Card')
;
