create table tableA(
EmpID int Primary key,
Ename varchar(30),
Salary int);

insert into tableA (EmpID,Ename,Salary) values
(1,'AA',1000),
(2,'BB',300);

create table tableB(
EmpID int Primary key,
Ename varchar(30),
Salary int);

insert into tableB (EmpID, Ename,Salary) values
(2,'BB',400),
(3,'CC',500);

select Ename, EmpID, min(salary) as salary from
(select * from tableA
union
select * from tableB) as combine
group by Ename, EmpID;




