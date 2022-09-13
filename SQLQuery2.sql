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


--CREATE TABLE client(
--client_id INT PRIMARY KEY,
--client_name VARCHAR(50),
--branch_id INT);

ALTER TABLE client
ADD FOREIGN KEY(branch_id) REFERENCES branch(branch_id) ON DELETE SET NULL;