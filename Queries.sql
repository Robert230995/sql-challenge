/*
-- Tabla Employees
CREATE TABLE employees (
    Emp_no INT PRIMARY KEY,
    Emp_title_id VARCHAR,
    Birth_date VARCHAR,
    First_name VARCHAR,
    Last_name VARCHAR,
    Sex VARCHAR,
    Hire_date VARCHAR
);

-- Tabla Departaments
CREATE TABLE departaments (
    Dept_no VARCHAR PRIMARY KEY,
    Dept_name VARCHAR
);

-- Tabla Dept_emp
CREATE TABLE dept_emp (
    Emp_no INT,
    Dept_no VARCHAR,
    FOREIGN KEY (Emp_no) REFERENCES employees(Emp_no),
    FOREIGN KEY (Dept_no) REFERENCES Departaments(Dept_no)
);

-- Tabla Dept_manager
CREATE TABLE dept_manager (
    Dept_no VARCHAR,
    Emp_no INT,
    FOREIGN KEY (Dept_no) REFERENCES Departaments(Dept_no),
    FOREIGN KEY (Emp_no) REFERENCES Employees(Emp_no)
);


-- Tabla Salaries
CREATE TABLE salaries (
    Emp_no INT,
    Salary INT,
    FOREIGN KEY (Emp_no) REFERENCES employees(Emp_no),
    PRIMARY KEY (Emp_no)
);

-- Tabla Titles
CREATE TABLE titles (
    Title_id INT PRIMARY KEY,
    Title VARCHAR
);

ALTER TABLE titles
ALTER COLUMN title_id TYPE VARCHAR;


SELECT E.Emp_no, E.Last_name, E.First_name, E.Sex, S.Salary
FROM Employees AS E
JOIN Salaries AS S ON E.Emp_no = S.Emp_no;

UPDATE Employees
SET Hire_date = TO_DATE(Hire_date, 'MM/DD/YYYY');

SELECT First_name, Last_name, Hire_date
FROM Employees
WHERE Hire_date BETWEEN '1986-01-01' AND '1986-12-31';


SELECT DM.Dept_no, D.Dept_name, DM.Emp_no, E.Last_name, E.First_name    
FROM Dept_manager AS DM
JOIN Departaments AS D ON DM.Dept_no = D.Dept_no
JOIN Employees AS E ON DM.Emp_no = E.Emp_no;


SELECT DE.Dept_no, E.Emp_no, E.Last_name, E.First_name, D.Dept_name
FROM Dept_emp AS DE
JOIN Employees AS E ON DE.Emp_no = E.Emp_no
JOIN Departaments AS D ON DE.Dept_no = D.Dept_no;


SELECT First_name, Last_name, Sex
FROM Employees
WHERE First_name = 'Hercules' AND Last_name LIKE 'B%';


SELECT E.Emp_no, E.Last_name, E.First_name 
FROM Employees AS E
JOIN Dept_emp AS DE ON E.Emp_no = DE.Emp_no
JOIN Departaments AS D ON DE.Dept_no = D.Dept_no
WHERE D.Dept_name = 'Sales';


SELECT E.Emp_no, E.Last_name, E.First_name, D.Dept_name   
FROM Employees AS E
JOIN Dept_emp AS DE ON E.Emp_no = DE.Emp_no
JOIN Departaments AS D ON DE.Dept_no = D.Dept_no
WHERE D.Dept_name IN ('Sales', 'Development');


SELECT Last_name, COUNT(*) AS Frequency
FROM Employees
GROUP BY Last_name
ORDER BY Frequency DESC;

*/

