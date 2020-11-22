show databases;
use assg5;
#if not exists
#on duplicate key update id=id1,name=name1,salary=salary1,designation=designation1,doj=doj1;
create table N_Employee(
id int auto_increment primary key,
name varchar(20) default "",
salary int not null,
designation varchar(20),
doj date not null);
create table O_Employee(
id int auto_increment primary key,
name varchar(20) default "",
salary int not null,
designation varchar(20),
doj date not null);
insert into N_employee values(5,"GB",50000,"ir","2020-05-01");
select * from N_employee;
drop procedure copydata;
delimiter //
create procedure copydata()
begin
declare v_finished int default 0;
declare id1 int;
declare name1 varchar(20);
declare salary1 int;
declare designation1 varchar(20);
declare doj1 date;
declare c1 cursor for select id,name,salary,designation,doj from N_Employee;
declare continue handler for not found set v_finished=1;
open c1;
a: loop
fetch c1 into id1,name1,salary1,designation1,doj1;
insert ignore into O_Employee values(id1,name1,salary1,designation1,doj1); 
if v_finished=1 then 
leave a;
end if;
end loop a;
close c1;
end;
//
call copydata();//
insert into N_Employee values(9,"QS",90000,"prt","2020-08-24");//
select * from N_Employee;//
select * from O_Employee;//
