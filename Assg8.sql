use assg7;
show tables;
show triggers;
create table Student(
Rollno int primary key,
Name varchar(20) not null,
DateofAdmission date,
branch varchar(20),
percent float(3),
Status varchar(10));
create table Alumni(
oldRollno int,
oldName varchar(20) not null,
operation varchar(20) not null,
percent float(3),
status varchar(20),
changed_at datetime,
delimiter //
create trigger after_update 
after update  
on Student for each row
begin
insert into Alumni values(old.Rollno,old.Name,"Update",old.percent,old.status,now());
end;// 
create trigger after_delete
after delete  
on Student for each row
begin
insert into Alumni values(old.Rollno,old.Name,"Delete",old.percent,old.status,now());
end;// 
insert into Student values(5,"RaMesh","2020-05-01","ENTC",82.8,"Student");//
update Student
set percent=94.4
where Rollno=1;//
delete from Student where Rollno=5;//
select * from Student;
select * from Alumni;//