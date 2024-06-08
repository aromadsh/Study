USE book_shop;

CREATE TABLE customers (
    id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(50)
);

CREATE TABLE orders (
    id INT PRIMARY KEY AUTO_INCREMENT,
    order_date DATE,
    amount DECIMAL(8,2),
    customer_id INT,
    FOREIGN KEY (customer_id) REFERENCES customers(id)
);

INSERT INTO customers (first_name, last_name, email) 
VALUES ('Boy', 'George', 'george@gmail.com'),
       ('George', 'Michael', 'gm@gmail.com'),
       ('David', 'Bowie', 'david@gmail.com'),
       ('Blue', 'Steele', 'blue@gmail.com'),
       ('Bette', 'Davis', 'bette@aol.com');
       
       
INSERT INTO orders (order_date, amount, customer_id)
VALUES ('2016-02-10', 99.99, 1),
       ('2017-11-11', 35.50, 1),
       ('2014-12-12', 800.67, 2),
       ('2015-01-03', 12.50, 2),
       ('1999-04-11', 450.25, 5);
       
SELECT * FROM customers;
SELECT * FROM orders;

-- CROSS JOIN
SELECT * FROM customers, orders;

-- INNER JOIN
SELECT *
FROM customers as c, orders as o
WHERE c.id = o.customer_id;

-- 일반적으로 WHERE절로 JOIN을 수행하지는 않는다.
SELECT *
FROM customers c -- 기준 테이블로서 주로 PRIMARY KEY가 있는 테이블로 지정
JOIN orders o ON c.id = o.customer_id;

-- 주문한 고객의 이름, 성, 날짜, 금액
SELECT
	c.first_name,
    c.last_name,
    
    o.order_date,
    o.amount
FROM customers AS c
JOIN orders AS o ON c.id = o.customer_id
WHERE o.amount >= 100;

-- LEFT JOIN, RIGHT JOIN
SELECT *
FROM customers c
LEFT JOIN orders o ON c.id = o.customer_id;

SELECT *
FROM customers c
RIGHT JOIN orders o ON c.id = o.customer_id;

-- 집합 레벨의 이해 (PK 는 레벨 1, FK 는 레벨 N)

CREATE TABLE dept (
    deptno DECIMAL(10,0) NOT NULL,
    dname VARCHAR(14),
    loc VARCHAR(13),
    PRIMARY KEY (deptno)
);

CREATE TABLE emp (
    empno DECIMAL(4,0) NOT NULL,
    ename VARCHAR(10),
    job VARCHAR(9),
    mgr DECIMAL(4,0),
    hiredate DATE,
    sal DECIMAL(7,2),
    comm DECIMAL(7,2),
    deptno DECIMAL(10,0),
    PRIMARY KEY (empno),
    CONSTRAINT emp_fk FOREIGN KEY (deptno) REFERENCES dept(deptno)
);

CREATE TABLE emp_dept_hist (
    empno DECIMAL(4,0) NOT NULL,
    deptno DECIMAL(10,0) NOT NULL,
    fromdate DATE NOT NULL,
    todate DATE,
    PRIMARY KEY (empno, deptno, fromdate),
    CONSTRAINT emp_dept_hist_fk_1 FOREIGN KEY (empno) REFERENCES emp(empno),
    CONSTRAINT emp_dept_hist_fk FOREIGN KEY (deptno) REFERENCES dept(deptno)
);

CREATE TABLE emp_salary_hist (
    empno DECIMAL(4,0) NOT NULL,
    fromdate DATE NOT NULL,
    todate DATE,
    sal DECIMAL,
    PRIMARY KEY (empno, fromdate),
    CONSTRAINT emp_salary_hist_fk FOREIGN KEY (empno) REFERENCES emp(empno)
);

INSERT INTO dept (deptno, dname, loc)
VALUES
    (10, 'ACCOUNTING', 'NEW YORK'),
    (20, 'RESEARCH', 'DALLAS'),
    (30, 'SALES', 'CHICAGO'),
    (40, 'OPERATIONS', 'BOSTON');

INSERT INTO emp (empno, ename, job, mgr, hiredate, sal, comm, deptno)
VALUES
    (7369, 'SMITH', 'CLERK', 7902, '1980-12-17', 800.00, NULL, 20),
    (7499, 'ALLEN', 'SALESMAN', 7698, '1981-02-20', 1600.00, 300.00, 30),
    (7521, 'WARD', 'SALESMAN', 7698, '1981-02-22', 1250.00, 500.00, 30),
    (7566, 'JONES', 'MANAGER', 7839, '1981-04-02', 2975.00, NULL, 20),
    (7654, 'MARTIN', 'SALESMAN', 7698, '1981-09-28', 1250.00, 1400.00, 30),
    (7698, 'BLAKE', 'MANAGER', 7839, '1981-05-01', 2850.00, NULL, 30),
    (7782, 'CLARK', 'MANAGER', 7839, '1981-06-09', 2450.00, NULL, 10),
    (7839, 'KING', 'PRESIDENT', NULL, '1981-11-17', 5000.00, NULL, 10),
    (7844, 'TURNER', 'SALESMAN', 7698, '1981-09-08', 1500.00, 0.00, 30),
    (7900, 'JAMES', 'CLERK', 7698, '1981-12-03', 950.00, NULL, 30),
    (7902, 'FORD', 'ANALYST', 7566, '1981-12-03', 3000.00, NULL, 20),
    (7934, 'MILLER', 'CLERK', 7782, '1982-01-23', 1300.00, NULL, 10);

INSERT INTO emp_dept_hist (empno, deptno, fromdate, todate)
VALUES
    (7369, 30, '1980-12-17', '1981-03-31'),
    (7369, 20, '1981-04-01', '9999-12-31'),
    (7499, 30, '1981-02-20', '9999-12-31'),
    (7521, 10, '1981-02-22', '1983-08-31'),
    (7521, 30, '1983-09-30', '9999-12-31'),
    (7566, 10, '1981-04-02', '1982-03-31'),
    (7566, 30, '1982-04-01', '1983-05-31'),
    (7566, 20, '1983-06-01', '9999-12-31'),
    (7654, 30, '1981-09-28', '9999-12-31'),
    (7698, 10, '1981-05-01', '1982-04-30'),
    (7698, 30, '1982-05-01', '9999-12-31'),
    (7782, 10, '1981-06-09', '9999-12-31'),
    (7839, 10, '1981-11-17', '9999-12-31'),
    (7844, 30, '1981-09-08', '9999-12-31'),
    (7900, 30, '1981-12-03', '9999-12-31'),
    (7902, 20, '1981-12-03', '1982-03-30'),
    (7902, 10, '1982-04-01', '1982-11-30'),
    (7902, 20, '1982-12-01', '9999-12-31'),
    (7934, 20, '1982-01-23', '1982-11-30'),
    (7934, 10, '1982-12-01', '9999-12-31');

INSERT INTO emp_salary_hist (empno, fromdate, todate, sal)
VALUES
    (7369, '1980-12-17', '1981-12-31', 600),
    (7369, '1982-01-01', '1982-12-31', 700),
    (7369, '1983-01-01', '9999-12-31', 800),
    (7499, '1981-02-20', '1982-12-31', 1400),
    (7499, '1983-01-01', '9999-12-31', 1600),
    (7521, '1981-02-22', '1982-12-31', 800),
    (7521, '1983-01-01', '1983-06-30', 1000),
    (7521, '1983-07-01', '9999-12-31', 1250),
    (7566, '1981-04-02', '1982-12-31', 2000),
    (7566, '1983-01-01', '9999-12-31', 2975),
    (7654, '1981-09-28', '1982-06-30', 1100),
    (7654, '1982-07-01', '9999-12-31', 1250),
    (7698, '1981-05-01', '1981-12-31', 1800),
    (7698, '1982-01-01', '1982-12-31', 2200),
    (7698, '1983-01-01', '9999-12-31', 2850),
    (7782, '1981-06-09', '1982-12-31', 1500),
    (7782, '1983-01-01', '9999-12-31', 2450),
    (7839, '1981-11-17', '1982-12-31', 4000),
    (7839, '1983-01-01', '9999-12-31', 5000),
    (7844, '1981-09-08', '1982-06-30', 1200),
    (7844, '1982-07-01', '1982-12-31', 1400),
    (7844, '1983-01-01', '9999-12-31', 1500),
    (7900, '1981-12-03', '1982-12-31', 700),
    (7900, '1983-01-01', '9999-12-31', 950),
    (7902, '1981-12-03', '1982-12-31', 2500),
    (7902, '1983-01-01', '9999-12-31', 3000),
    (7934, '1982-01-23', '9999-12-31', 1300);

SELECT * FROM dept;
SELECT * FROM emp;
SELECT * FROM emp_dept_hist;
SELECT * FROM emp_salary_hist;

SELECT e.empno, e.ename, e.deptno, d.dname
FROM emp e
JOIN dept d ON e.deptno = d.deptno;