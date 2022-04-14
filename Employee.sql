--Create Payroll_Service Database
create database Payroll_Service;
use Payroll_Service;

--Create employee_payroll table
Create Table employee_payroll(
	Id int identity (1,1) primary key,
	Name varchar(200),
	Salary float,
	StartDate date);

--Insert employee_payroll data as part of CURD Operation
insert into employee_payroll (Name, Salary, StartDate) values
('Dhoni', 70000.00, '2007-02-03'),
('Virat', 50000.00, '2010-05-04'),
('Rohit', 60000.00, '2009-06-09'),
('Smrithi', 40000.00, '2018-03-05'),
('Mithai', 50000.00, '2020-08-02');

--Retrieve employee_payroll data
select * from employee_payroll;

--Retrieve salary of particular employee and particular date range
select salary from employee_payroll where Name = 'Virat';
select * from employee_payroll where StartDate between cast ('2018-01-01' as date) and GETDATE();

--add Gender to Employee_Payroll Table and Update the Rows to reflect the correct Employee Gender
alter table employee_payroll add Gender char(1);
update employee_payroll set Gender = 'M' where Id in (1,2,3);
update employee_payroll set Gender = 'F' where Id in (4,5);

--find sum, average, min, max and number of male and female employees
select sum(Salary) as sumsalary,Gender from employee_payroll group by Gender;
select avg(Salary) as avgsalary,Gender from employee_payroll group by Gender; 
select max(Salary) as maxsalary,Gender from employee_payroll group by Gender; 
select min(Salary) as minsalary,Gender from employee_payroll group by Gender; 
select count(Name) as EmployeeCount,Gender from employee_payroll group by Gender;  

select * from employee_payroll order by StartDate;

select sum(Salary) as sumsalary,Gender from employee_payroll group by Gender order by Gender;
select sum(Salary) as sumsalary,Gender from employee_payroll group by Gender Having Gender='M';

--add employee phone, department(not null), Address (using default values)
select * from employee_payroll;
alter table employee_payroll add Phone bigint;
update employee_payroll set Phone = 1234567890; 
update employee_payroll set Phone = 1234569874 where ID IN (2,4); 
alter table employee_payroll add Address varchar(100) not null default 'Bangalore';
alter table employee_payroll add Department varchar(250) not null default 'IT';

--Extend table to have Basic Pay, Deductions, Taxable Pay, Income Tax, Net Pay.
alter table employee_payroll add Basic_Pay float not null default 0.00;
update employee_payroll set Basic_Pay=70000.00 where Id=1; 
update employee_payroll set Basic_Pay=50000.00 where Id=2;
update employee_payroll set Basic_Pay=60000.00 where Id=3;
update employee_payroll set Basic_Pay=40000.00 where Id=4;
update employee_payroll set Basic_Pay=50000.00 where Id=5;
alter table employee_payroll add 
								 Deductions float not null default 0.00,
								 Taxable_Pay float not null default 0.00, 
								 Income_Tax float not null default 0.00,
								 Net_Pay float not null default 0.00;
update employee_payroll set Net_Pay = (Basic_Pay-Deductions-Taxable_Pay-Income_Tax);
select * from employee_payroll;
