show databases;
use assg;
create table Customer(
cust_no int auto_increment primary key,
cust_fname varchar(20) not null,
cust_lname varchar(20) not null,
cust_company varchar(20) not null,
cust_addr varchar(50) not null,
city varchar(20) not null,
cust_phone int(11) not null);
create table author(
author_no int auto_increment primary key,
author_name varchar(30) not null,
country varchar(20));
create table publisher(
publisher_no int auto_increment primary key,
publisher_name varchar(20) not null,
publisher_addr varchar(50) not null,
publisher_year int not null);
create table book(
ISBN int(11) primary key,
title varchar(20) not null,
unit_price int not null,
author_no int,
publisher_no int,
pub_year int not null,
foreign key(author_no) references author(author_no) on delete cascade,
foreign key(publisher_no) references publisher(publisher_no) on delete cascade);
create table Oorder(
order_no int auto_increment primary key,
cust_no int,
ISBN int,
qty int not null, 
odate date,
foreign key(cust_no) references Customer(cust_no) on delete cascade,
foreign key(ISBN) references book(ISBN) on delete cascade);
insert into Customer(cust_fname,cust_lname,cust_company,cust_addr,city,cust_phone) values('Dhruv','Kanekal','PQR','Patwardhan Baug','Pune',888881111),
('Abhinav','Kale','XYZ','Hadapsar','Pune',888883333);
select * from Customer;
insert into author values(101,'abc','india'),(102,'pqr','india'),(103,'rst','india');
select * from author;
insert into publisher values(201,'AbC','qqq',2019),(202,'ABc','eeq',2020),(203,'DaC','qpp',2018);
select * from publisher;
insert into book values(454454,'frfft',450,101,201,2019),(454455,'frwdt',411,102,203,2019);
insert into book values(454456,'frfft',450,101,202,2005),(454457,'frwdt',411,102,202,2017);
select * from book;
insert into book values(565656,'yy',5,104,202,2020);
select city as cust_city from Customer;
insert into Oorder values(1001,2,454454,4,'2020-06-17');
insert into Oorder values(1002,1,454455,4,'2020-07-17');
create view T1 as select cust_fname,city,ISBN from Customer,Oorder where Customer.cust_no=Oorder.cust_no ;
select * from T1;
insert into Customer (cust_fname,cust_lname,cust_company,cust_addr,city,cust_phone)values
('Shaunak','Halbe','RPS','Nal Stop','Pune',888885555),
('Shaunak','Joshi','RPS','Andheri','Mumbai',888886666),
('Maanas','Limkar','STR','Churchgate','Mumbai',888887777),
('Anand','Joshi','STR','Andheri','Mumbai',888884444),
('Siddharth','Tabib','ABC','Mayur Colony','Pune',888886565),
('Siddharth','Kulkarni','ABC','Mayur Colony','Pune',888887720),
('Utkarsh','Khursale','ABC','Swargate','Nagpur',888882121);
select * from Customer;
insert into Customer (cust_fname,cust_lname,cust_company,cust_addr,city,cust_phone)values
('Par','Halbe','RPS','Nal Stop','Pune',919196456),
('Par','K','RPS','Nal Stop','Nagpur',919196456),
('Himanshu','Joshi','RPS','Andheri','Mumbai',888886261); 
select * from Customer where (city="Pune" or city="Mumbai") and (cust_fname like 'p%' or cust_fname like 'h%');
select distinct city from Customer;
insert into author values(104,'rst','india'),(105,'ccv','australia'),(106,'pt','usa'),
(107,'rtt','usa'),(108,'cpv','australia'),(109,'ppp','usa');
select * from author where country = "india" or country = "australia";
select * from book;
update book
set unit_price = 1.05*unit_price
where pub_year = 2019;
insert into publisher values(204,'PQR','qqq',2015),(205,'Sty','eeq',2016),(206,'DmC','qpp',2015),(207,'pR','qq',2015);
select * from publisher where publisher_year in (2015,2016);
select * from book;
insert into book values(454458,"gfyytg",320,103,204,2016),(454459,"ytg",350,106,205,2015),(454460,"gfyytg",390,108,205,2012);
insert into book values(454461,"gfyy",600,103,205,2016),(454462,"gyy",340,104,201,2006);
insert into book values(454463,"fsaf",345,104,204,2000),(454464,"ff",500,105,202,2004),(454465,"gdsdf",520,101,205,2006);
select ISBN,title,max(unit_price) from book;
select title,unit_price from book where unit_price between 300 and 400;
select title,unit_price,pub_year from book order by pub_year desc;
select title,author_no,publisher_no from book where pub_year in (2000,2004,2006);