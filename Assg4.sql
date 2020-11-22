show databases;
use assg;
show tables;
create table Departments(
dept_id int auto_increment primary key,
dept_name varchar(20) not null default " " );
create table Professors(
prof_id int auto_increment primary key,
prof_fname varchar(20) not null, 
prof_lname varchar(20) not null, 
dept_id int,
designation varchar(20) not null,
salary int not null,
doj date not null,
email varchar(20) not null,
phone int(8) not null,
city varchar(20) not null,
foreign key(dept_id) references Departments(dept_id) on delete cascade);
create table works(
prof_id int primary key,
dept_id int ,
duration varchar(20) not null,
foreign key(prof_id) references Professors(prof_id) on delete cascade,
foreign key(dept_id) references Departments(dept_id) on delete cascade);
create table Shift(
prof_id int,
shift varchar(20) not null,
working_hours int not null,
foreign key (prof_id) references Professors(prof_id) on delete cascade); 
insert into Departments values(3,"IT");
insert into Professors values (202,"Virj","Sharma",2,"Assistant Professor",40000,"2017-12-08","nxdgmv@gmai.com",455215,"Mumbai");
insert into works values(202,2,9);
insert into Shift values (202,"Evening",8);
select * from Professors natural join Departments;
select Professors.prof_id,prof_fname,shift from Professors,Shift where Professors.prof_id = shift.prof_id;
select * from Departments inner join Professors on Departments.dept_id = Professors.dept_id ;
select prof_fname,dept_name from Departments inner join Professors on Departments.dept_id = Professors.dept_id ;
select prof_fname,dept_name,salary,shift from Departments inner join Professors on Departments.dept_id = Professors.dept_id inner join Shift on Shift.prof_id = Professors.prof_id where Professors.prof_id = 101;
create view p1 as select Professors.prof_id,prof_fname,email,shift,working_hours from Professors natural join Shift;
select * from p1;
select * from Professors;
insert into p1 (prof_id,prof_fname,email) values(103,"Amit","ngmv@gmail.com");
update p1
set email = "ok@email.com"
where prof_id = 202;
select Professors.prof_id,dept_name from Departments inner join Professors on Departments.dept_id = Professors.dept_id where dept_name="CS";
select dept_name from Departments inner join Professors on Departments.dept_id = Professors.dept_id where Professors.doj >= "2015-1-1";
select max(salary),prof_id from Professors;
select * from Professors where city in ("Pune","Mumbai") and prof_fname like 'a%' or  prof_fname like 'd%';
update professors
set salary = 1.05 * salary
where doj = "2015-01-01";
select * from Professors;
select dept_name,count(Departments.dept_id) from Departments inner join Professors on Departments.dept_id = Professors.dept_id group by dept_name;
