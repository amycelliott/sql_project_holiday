/* Use This file to run in SQL Fiddle to set up the Schema
 * Try https://www.jdoodle.com/execute-sql-online/
 */
/* Table: people
 * This table has basic user information
 * Insert some basic records
 */
create table if not exists people (
  id int(6) not null
  ,name varchar(200) not null
  ,location varchar(50) not null
  ,primary key (id)
) 
;
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
