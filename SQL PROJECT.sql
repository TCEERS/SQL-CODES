-----------------CREATE TABLES------------
-- 1)Employee with attributes (id, name, city, department, salary) Department with attributes (id, name) Company with attributes (id, name, revenue)

CREATE TABLE employee(
Employee_id INT PRIMARY KEY,
Employee_name VARCHAR(50) NOT NULL,
city VARCHAR(50) NOT NULL,
department_id INT NOT NULL,
salary INT NOT NULL);
DROP TABLE employee;
CREATE TABLE department(
department_id INT PRIMARY KEY IDENTITY,
department_name VARCHAR(50)
);

CREATE TABLE company(
company_id INT PRIMARY KEY,
company_name VARCHAR(50),
revenue INT);

ALTER TABLE employee ADD FOREIGN KEY(department_id) REFERENCES department(department_id) ON DELETE CASCADE;

-- 2) Add rows into department table
--(1, IT)
--(2, Management)
--(3, IT)
--(4, Support)

INSERT INTO department VALUES('IT');
INSERT INTO department VALUES('Management');
INSERT INTO department VALUES('IT');
INSERT INTO department VALUES('Support');

--3) Add rows into department table
--(1, David, London, IT, 80000)
--(2, Emily, London, IT, 70000)
--(3, Peter, Paris, IT, 60000)
--(4, Ava, Paris, IT, 50000)
--(5, Penny, London, Management, 110000)
--(6, Jim, London, Management, 90000)
--(7, Amy, Rome, Support, 30000)
--(8, Cloe, London, IT, 110000)

INSERT INTO employee VALUES(1, 'David', 'London', 3, 80000);
INSERT INTO employee VALUES(2, 'Emily', 'London', 3, 70000);
INSERT INTO employee VALUES(3, 'Peter', 'Paris', 3, 60000);
INSERT INTO employee VALUES(4, 'Ava', 'Paris', 3, 50000);
INSERT INTO employee VALUES(5, 'Penny', 'London', 2, 110000);
INSERT INTO employee VALUES(6, 'Jim', 'London', 2, 90000);
INSERT INTO employee VALUES(7, 'Amy', 'Rome', 4, 30000);
INSERT INTO employee VALUES(8, 'Cloe', 'London', 3, 110000);

--4)Add rows into company table
(IBM, 2000000)
(GOOGLE, 9000000)
(APPLE, 10000000)
INSERT INTO company VALUES(1, 'IBM', 2000000);
INSERT INTO company VALUES(2, 'GOOGLE', 2000000);
INSERT INTO company VALUES(3, 'APPLE', 2000000);
UPDATE TABLE company with correct revues for GOOGLE and APPLE

UPDATE company
SET revenue = 9000000
WHERE company_id = 2;

UPDATE company
SET revenue = 10000000
WHERE company_id = 3;

--5) Query all from company table
SELECT * FROM company;

--6) Query all from employee table
SELECT * FROM employee;

--7) Query all from department table
SELECT * FROM department;

--8) Change the name department with id = 1 to Management
UPDATE department
SET department_name = 'Management'
WHERE department_id = 1;

SELECT * FROM department;

--9) Delete employees wiht salary greater than 100000
DELETE FROM employee
WHERE salary > 100000;

--10) Query the names of companies
SELECT company_name FROM company;

--11) Query the name and city of every employee
SELECT employee_name, city FROM employee;

--12) Query companies with revenue greater than 5000000
SELECT * FROM company WHERE revenue > 5000000;

--13) Query all companies with revenue smaller than 5000000, but you cannot use the '<' operator
SELECT * FROM company WHERE revenue >= 5000000;

-- 14) Query all employee with salary greater than 50000 and smaller than 70000
SELECT * FROM employee WHERE salary BETWEEN 50000 AND 70000;

-- 15) Query all employee with salary greater than 50000 and smaller than 70000, but you cannot use BETWEEN
SELECT * FROM employee WHERE salary >= 50000 AND salary <= 70000;

--16) Query all employees with salary equal to 80000
SELECT * FROM employee WHERE salary = 80000;

--17) Query all names of employees with salary greater than 70000 together with employees who work on the IT department
SELECT employee_name FROM employee
WHERE salary > 70000 or department_id IN(SELECT department_id FROM department WHERE department_name = 'IT');

--18) Query all employees with salary no equal to 80000
SELECT * FROM employee WHERE salary <> 80000;
SELECT * FROM employee WHERE salary != 80000;

--19) Query all employees that work in city that starts with L
SELECT * FROM employee WHERE city LIKE 'L%';

--20) Query all employees that work in city that starts with L or ends with s
SELECT * FROM employee WHERE city LIKE 'L%' OR city LIKE '%s';

--21) Query all employees that work in city with "o" somewhere in the middle
SELECT * FROM employee
WHERE city LIKE '%o%';

--22) Query all departments (each name apearing only once)
SELECT DISTINCT department_name FROM department;