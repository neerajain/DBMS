use assg7;
create table Customer(
Cust_id int primary key,
name varchar(10) not null,
total_purchase int not null);
create table Category(
Cust_id int ,
Name varchar(10) not null,
Class varchar(10) not null,
foreign key(Cust_id) references Customer(cust_id) on delete cascade on update cascade);
insert into Customer values(107,"Rahul",7000);
select * from Customer;
drop procedure proc_Grad;
delimiter //
create function getClass(amt int) returns varchar(10) deterministic
begin
declare val varchar(20);
if (amt<=20000 and amt>=10000) then
set val = "Platinum";
elseif (amt<=9999 and amt>=5000) then
set val = "Gold";
elseif (amt<=4999 and amt>=2000) then
set val = "Silver";
else 
set val = "None";
end if;
return (val);
end;//
create procedure proc_Grad(in id int)
begin
declare na varchar(10);
declare pur int;
declare class varchar(10);
select name,total_purchase into na,pur from Customer where Cust_id = id;
if exists(select Cust_id from Category where Cust_id = id) then
select concat("Id - "+id+" already present");
else
if getClass(pur)<>"None" then
insert into Category values(id,na,getClass(pur));
end if;
end if;
end;
//
select * from Customer;
select * from Category//
call proc_Grad(106)//
select getClass(11000);//



