use mulcam;

create table Persons (
PersonID int,
LastName varchar(255),
FirstName varchar(255),
Address varchar(255),
City varchar(255)
);

drop table Persons;

create table Persons (
PersonID int Not null auto_increment,
LastName varchar(255),
FirstName varchar(255),
Address varchar(255),
City varchar(255),
primary key(PersonID)
);

create table customers as 
select LastName, FirstName
from Persons;
 
alter table Persons add Email int;
alter table Persons drop column Email;

alter table Persons add Email int;
alter table Persons modify Email varchar(255);

create table Students (
	studentNumber int not null auto_increment,
    name varchar(255),
    age int,
    address varchar(255),
    primary key(studentNumber)
);

create table scores (
	studentNumber int,
    math int,
    english int,
    science int
);

insert into students (name, age, address) 
values ('홍경수', 20, '일산동구 강석로 152');

select * from students;

insert into students
values (2, '민재국', 21, '남양주시 오남');

select * from students; 

insert into students
values (4, '백승엽', 21, '서울시 서초구 효령로');

insert into students (name, age, address) 
values ('송경일', 22, '인천시 남동구');

update students set name='손경일' where studentNumber = 5;

delete from students where studentNumber = 1;
select * from students;

insert into students (name, address) values ('홍경수', '일산동구 강석로152');
alter table students modify address varchar(255) not null;

insert into students (name, age) value ('오다솜', 25);

delete from students where studentNumber=6;