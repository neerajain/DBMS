 use sdl;
 create table Patient(
 id int(11) auto_increment  primary key ,
 password varchar(25) not null,
 name varchar(20),
 age int not null,
 gender varchar(4),
 previous_history varchar(100) default "None");
create table Department(
name varchar(35));
create table MedicineTest(
name varchar(40) not null,
cost int not null,
quantity int);
create table Doctor(
 registration varchar(30) ,
 name varchar(20),
 fees int not null,
 yoe int not null,
 specialization varchar(100),
 visit_time time not null);
 select * from Patient;
select * from Department;
select * from MedicineTest;
select * from Doctor;
select * from appointment;

create table appointment(
registration varchar(20),
id int(10) not null,
vtime time not null,
doa date not null);
select id,vtime from appointment where registration="D101" and doa="2020-09-24" order by vtime;