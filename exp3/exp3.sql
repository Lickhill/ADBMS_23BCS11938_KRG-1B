drop table departments;
CREATE TABLE Departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50) NOT NULL
);

-- Insert data into the Departments table
INSERT INTO Departments (department_id, department_name) VALUES
(1, 'Sales'),
(2, 'HR'),
(3, 'IT'),
(4, 'Marketing');

select * from Departments;

drop table employees;
-- Create the Employees table with a new 'gender' column
CREATE TABLE Employees (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    gender VARCHAR(10), -- Added new 'gender' column
    salary DECIMAL(10, 2) NOT NULL,
    hire_date DATE NOT NULL,
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES Departments(department_id)
);

-- Insert data into the Employees table, including gender
INSERT INTO Employees (employee_id, first_name, last_name, gender, salary, hire_date, department_id) VALUES
(101, 'John', 'Doe', 'Male', 60000.00, '2020-01-15', 1),
(102, 'Jane', 'Smith', 'Female', 55000.00, '2020-03-22', 2),
(103, 'Peter', 'Jones', 'Male', 65000.00, '2021-06-10', 1),
(104, 'Mary', 'Lee', 'Female', 58000.00, '2021-08-01', 2),
(105, 'David', 'Chen', 'Male', 70000.00, '2019-11-05', 3),
(106, 'Alice', 'Williams', 'Female', 72000.00, '2019-12-20', 3),
(107, 'Sarah', 'Brown', 'Female', 62000.00, '2022-04-18', 4),
(108, 'Michael', 'Davis', 'Male', 53000.00, '2022-05-25', 4),
(109, 'Laura', 'Wilson', 'Female', 68000.00, '2021-09-12', 1),
(110, 'Kevin', 'Garcia', 'Male', 75000.00, '2020-07-07', 3);

select * from Employees;

--find the second higest salary
select max(salary) from Employees
where salary != (select max(salary) from Employees);

create table exp3(
id int
);

insert into exp3 (id) values (2),(3),(4),(4),(6),(6),(7),(8),(8);

select max(id) as maxNonDuplicate from exp3
where id not in (select id from exp3 group by id having count(id)>1);


-- RETURN ID AME DESCRIPTION OF ALL THE PRODUCTS THAT HAVEN'T SOLD ATLEAST ONCE
drop table Devices;
CREATE TABLE Devices (
    device_id INT PRIMARY KEY,
    device_name VARCHAR(100) NOT NULL,
    descriptions VARCHAR(255)
);

-- Insert sample data into the Devices table
INSERT INTO Devices (device_id, device_name, descriptions) VALUES
(1, 'Laptop', 'A portable computer for general use.'),
(2, 'Smartphone', 'A mobile device for communication and internet.'),
(3, 'Tablet', 'A portable touchscreen computer.'),
(4, 'Smartwatch', 'A wearable computer in the form of a watch.');

-- Create the Products table
drop table products;
CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    device_id INT,
    unit_price DECIMAL(10, 2) NOT NULL,
    quantity_sold INT NOT NULL,
    FOREIGN KEY (device_id) REFERENCES Devices(device_id)
);

-- Insert sample data into the Products table
INSERT INTO Products (product_id, device_id, unit_price, quantity_sold) VALUES
(101, 1, 1200.00, 50),
(102, 2, 800.00, 150),
(103, 1, 1500.00, 30),
(104, 3, 650.00, 0),
(105, 4, 300.00, 200),
(106, 2, 950.00, 0);

select p.product_id, p.unit_price from products as p
where quantity_sold=0

--hometask leetcode 1890, sql in from clause 