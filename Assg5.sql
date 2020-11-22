show databases;
use assg5;
create table Customer(
cust_id int not null primary key,
name varchar(10) not null, 
dateofPayment date not null, 
NameofScheme varchar(10) not null, 
Status char default'N'
);
create table Fine(
Cust_id int , 
Date date not null, 
Amt int not null, 
foreign key(Cust_id) references Customer(cust_id) on delete cascade on update cascade
);
insert into Customer values(1,"Neeraj","2020-09-10","abc",'N'),(2,"Mihir","2020-08-08","pqr",'N'),(3,"Raj","2020-08-07","rst",'N'),
(4,"Ram","2020-08-27","abc",'N'),(5,"Dhruv","2020-08-30","abc",'N');
select * from Customer;
delimiter //
create procedure fine(in id int,in nameofsc varchar(10))
begin
declare d date;
declare days int;
declare fin int;
select dateofPayment into d from Customer where cust_id = id;
set days = datediff(current_date(),d);
if days >14 and days<31 then
set fin = (days - 15)*5;
insert into Fine values(id,current_date(),fin);
update Customer set Status='P' where cust_id=id;
select "Fine Payed";
select "Fine Payed";
elseif days>30 then
set fin = 75 + (days - 30)*50;
insert into Fine values(id,current_date(),fin);
update Customer set Status='P' where cust_id=id;
select "Fine Payed";
else
select "No Fine Applicble";
end if;
end;
//
call fine(4,"abc")
//
select * from Customer;//
select * from Fine order by Cust_id;//
