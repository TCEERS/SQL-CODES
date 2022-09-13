--CREATE TABLE employee(
--employee_id INT PRIMARY KEY,
--first_name VARCHAR(50),
--last_name VARCHAR(50),
--birth_date DATE,
--sex VARCHAR(1),
--salary INT,
--super_id INT,
--branch_id INT);

--CREATE TABLE branch(
--branch_id INT PRIMARY KEY,
--branch_name VARCHAR(50),
--mgr_id INT,
--mgr_start_date DATE,
--FOREIGN KEY(mgr_id) REFERENCES employee(employee_id) ON DELETE SET NULL);

--ALTER TABLE employee
--ADD FOREIGN KEY(branch_id) REFERENCES branch(branch_id) ON DELETE SET NULL;

--ALTER TABLE employee
--ADD FOREIGN KEY(super_id) REFERENCES employee(employee_id) ON DELETE NO ACTION;

--CREATE TABLE client(
--client_id INT PRIMARY KEY,
--client_name VARCHAR(50),
--branch_id INT,
--FOREIGN KEY(branch_id) REFERENCES branch(branch_id) ON DELETE SET NULL);

--CREATE TABLE works_with(
--employee_id INT,
--client_id INT,
--total_sales INT,
--PRIMARY KEY(employee_id, client_id),
--FOREIGN KEY(employee_id) REFERENCES employee(employee_id) ON DELETE CASCADE,
--FOREIGN KEY(client_id) REFERENCES client(client_id) ON DELETE CASCADE);

--CREATE TABLE branch_supplier(
--branch_id INT,
--supplier_name VARCHAR(50),
--supply_type VARCHAR(50),
--PRIMARY KEY(branch_id, supplier_name),
--FOREIGN KEY(branch_id) REFERENCES branch(branch_id) ON DELETE CASCADE);

--INSERT INTO employee VALUES(100, 'David', 'Wallace', '1967-11-17', 'M', 250000, NULL, NULL);
--INSERT INTO branch VALUES(1, 'Corporate', 100, '2006-02-09');
--UPDATE employee
--SET branch_id = 1
--WHERE employee_id = 100;

--INSERT INTO employee VALUES(101, 'Jan', 'Levinson', '1961-05-11', 'F', 110000, 100, 1);
--INSERT INTO employee VALUES(102, 'Michael', 'Scott', '1964-03-15', 'M', 75000, 100, NULL);
--INSERT INTO branch VALUES(2, 'Scranton', 102, '1992-04-06');
--UPDATE employee
--SET branch_id = 2
--WHERE employee_id = 102;
--INSERT INTO employee VALUES(103, 'Angela', 'Martin', '1971-06-25', 'F', 63000, 102, 2);
--INSERT INTO employee VALUES(104, 'Kelly', 'Kapoor', '1980-02-05', 'F', 55000, 102, 2);
--INSERT INTO employee VALUES(105, 'Stanley', 'Hudson', '1958-02-19', 'M', 69000, 102, 2);

--INSERT INTO employee VALUES(106, 'Josh', 'Porter', '1969-09-05', 'M', 78000, 100, NULL);
--INSERT INTO branch VALUES(3, 'Stamford', 106, '1998-02-13');
--UPDATE employee
--SET branch_id = 3
--WHERE employee_id = 106;

--INSERT INTO employee VALUES(107, 'Andy', 'Bernard', '1973-07-22', 'M', 65000, 106, 3);
--INSERT INTO employee VALUES(108, 'Jim', 'Halpert', '1978-10-01', 'M', 71000, 106, 3);

--INSERT INTO client VALUES(400, 'Dunmore Highschool', 2);
--INSERT INTO client VALUES(401, 'Lackawana Country', 2);
--INSERT INTO client VALUES(402, 'FedEx', 3);
--INSERT INTO client VALUES(403, 'John Daly Law, LLC', 3);
--INSERT INTO client VALUES(404, 'Scranton Whitepages', 2);
--INSERT INTO client VALUES(405, 'Times Newspaper', 3);
--INSERT INTO client VALUES(406, 'FedEx', 2);

--INSERT INTO works_with VALUES(105, 400, 55000);
--INSERT INTO works_with VALUES(102, 401, 267000);
--INSERT INTO works_with VALUES(108, 402, 22500);
--INSERT INTO works_with VALUES(107, 403, 5000);
--INSERT INTO works_with VALUES(108, 403, 12000);
--INSERT INTO works_with VALUES(105, 404, 33000);
--INSERT INTO works_with VALUES(107, 405, 26000);
--INSERT INTO works_with VALUES(103, 406, 15000);
--INSERT INTO works_with VALUES(105, 406, 130000);

--INSERT INTO branch_supplier VALUES(2, 'Hammer Mill', 'Paper');
--INSERT INTO branch_supplier VALUES(2, 'Uni-ball', 'Writing Utensils');
--INSERT INTO branch_supplier VALUES(3, 'Patriot Paper', 'Paper');
--INSERT INTO branch_supplier VALUES(2, 'J.T. Forms & Labels', 'Custom Forms');
--INSERT INTO branch_supplier VALUES(3, 'Uni-ball', 'Writing Utensils');
--INSERT INTO branch_supplier VALUES(3, 'Hammer Mill', 'Paper');
--INSERT INTO branch_supplier VALUES(3, 'Stamford Labels', 'Custom Forms');

--SELECT * FROM employee;
--Find the total sales of each saleman
--SELECT SUM(total_sales), employee_id
--FROM works_with
--GROUP BY employee_id;
--UPDATE works_with
--SET employee_id = 102
--WHERE total_sales = 15000;
--SELECT SUM(total_sales), employee_id
--FROM works_with
--GROUP BY employee_id;
--SELECT * FROM works_with
--Find how much each client spent
--SELECT SUM(total_sales), client_id
--FROM works_with
--GROUP BY client_id
--Find any client who are an LLC
--SELECT *
--FROM client
--WHERE client_name LIKE '%LLC';
--Find any branch supplier who are in label business
--SELECT *
--FROM branch_supplier
--WHERE supplier_name LIKE '%label%';

--Find any employee born in October
--SELECT *
--FROM employee
--WHERE birth_date LIKE '____-02%';
--Find any client who are schools
--SELECT *
--FROM client
--WHERE client_name LIKE '%school%';
--Find a list of employee and branch names
SELECT client_name, branch_id
FROM client
UNION
SELECT branch_name, branch_id
FROM branch;
