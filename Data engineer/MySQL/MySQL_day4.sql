CREATE DATABASE book_shop;

USE book_shop;

CREATE TABLE books 
	(
		book_id INT NOT NULL AUTO_INCREMENT,
		title VARCHAR(100),
		author_fname VARCHAR(100),
		author_lname VARCHAR(100),
		released_year INT,
		stock_quantity INT,
		pages INT,
		PRIMARY KEY(book_id)
	);

INSERT INTO books (title, author_fname, author_lname, released_year, stock_quantity, pages)
VALUES
('The Namesake', 'Jhumpa', 'Lahiri', 2003, 32, 291),
('Norse Mythology', 'Neil', 'Gaiman',2016, 43, 304),
('American Gods', 'Neil', 'Gaiman', 2001, 12, 465),
('Interpreter of Maladies', 'Jhumpa', 'Lahiri', 1996, 97, 198),
('A Hologram for the King: A Novel', 'Dave', 'Eggers', 2012, 154, 352),
('The Circle', 'Dave', 'Eggers', 2013, 26, 504),
('The Amazing Adventures of Kavalier & Clay', 'Michael', 'Chabon', 2000, 68, 634),
('Just Kids', 'Patti', 'Smith', 2010, 55, 304),
('A Heartbreaking Work of Staggering Genius', 'Dave', 'Eggers', 2001, 104, 437),
('Coraline', 'Neil', 'Gaiman', 2003, 100, 208),
('What We Talk About When We Talk About Love: Stories', 'Raymond', 'Carver', 1981, 23, 176),
("Where I'm Calling From: Selected Stories", 'Raymond', 'Carver', 1989, 12, 526),
('White Noise', 'Don', 'DeLillo', 1985, 49, 320),
('Cannery Row', 'John', 'Steinbeck', 1945, 95, 181),
('Oblivion: Stories', 'David', 'Foster Wallace', 2004, 172, 329),
('Consider the Lobster', 'David', 'Foster Wallace', 2005, 92, 343);



SELECT * FROM books;

-- 집계(Aggregation)은 대부분 숫자 형식의 데이터에서만 적용된다.
-- 문자열 데이터는 집계가 안된다!!!
-- 예외는 있음. - COUNT

-- 최대, 최소
SELECT MAX(pages), MIN(pages)
FROM books;

SELECT
	pages,
    MAX(pages)
FROM books
GROUP BY pages;

SELECT
	SUM(pages),
    AVG(pages),
    STD(pages)
FROM books;

INSERT INTO books(title, pages) VALUES(NULL, NULL);

-- 집계 함수는 NULL값은 제외하고 집계가 된다.
SELECT
	COUNT(*),
    COUNT(pages),
    COUNT(title)
FROM books;

DELETE FROM books WHERE book_id=17;
COMMIT;


-- GROUP BY : 동일한 데이터를 요약 혹은 집계해서 하나의 열로 만든다.
SELECT
	author_lname,
    AVG(pages)
FROM books
GROUP BY author_lname;

SELECT
	author_lname,
    title
FROM books
GROUP BY author_lname;

INSERT INTO books
    (title, author_fname, author_lname, released_year, stock_quantity, pages)
VALUES ('10% Happier', 'Dan', 'Harris', 2014, 29, 256), 
       ('fake_book', 'Freida', 'Harris', 2001, 287, 428),
       ('Lincoln In The Bardo', 'George', 'Saunders', 2017, 1000, 367);

SELECT * FROM books;

SELECT 
	author_lname, author_fname, COUNT(*)
FROM books
GROUP BY author_lname, author_fname;

-- 2000년 이후 평균 페이지 수가 author_lname별 250페이지 이상인 데이터를 조회

SELECT 
	author_lname,
    AVG(pages) AS avg_pages
FROM books
WHERE released_year >= 2000
GROUP BY author_lname
HAVING AVG(pages) >= 250;


-- m to m
CREATE TABLE reviewers (
    id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL
);
 
CREATE TABLE series (
    id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(100),
    released_year YEAR,
    genre VARCHAR(100)
);
 
CREATE TABLE reviews (
    id INT PRIMARY KEY AUTO_INCREMENT,
    rating DECIMAL(2 , 1 ),
    series_id INT,
    reviewer_id INT,
    FOREIGN KEY (series_id) REFERENCES series (id),
    FOREIGN KEY (reviewer_id) REFERENCES reviewers (id)
);

INSERT INTO series (title, released_year, genre) VALUES
    ('Archer', 2009, 'Animation'),
    ('Arrested Development', 2003, 'Comedy'),
    ("Bob's Burgers", 2011, 'Animation'),
    ('Bojack Horseman', 2014, 'Animation'),
    ("Breaking Bad", 2008, 'Drama'),
    ('Curb Your Enthusiasm', 2000, 'Comedy'),
    ("Fargo", 2014, 'Drama'),
    ('Freaks and Geeks', 1999, 'Comedy'),
    ('General Hospital', 1963, 'Drama'),
    ('Halt and Catch Fire', 2014, 'Drama'),
    ('Malcolm In The Middle', 2000, 'Comedy'),
    ('Pushing Daisies', 2007, 'Comedy'),
    ('Seinfeld', 1989, 'Comedy'),
    ('Stranger Things', 2016, 'Drama');
 
 
INSERT INTO reviewers (first_name, last_name) VALUES
    ('Thomas', 'Stoneman'),
    ('Wyatt', 'Skaggs'),
    ('Kimbra', 'Masters'),
    ('Domingo', 'Cortes'),
    ('Colt', 'Steele'),
    ('Pinkie', 'Petit'),
    ('Marlon', 'Crafford');
    
 
INSERT INTO reviews(series_id, reviewer_id, rating) VALUES
    (1,1,8.0),(1,2,7.5),(1,3,8.5),(1,4,7.7),(1,5,8.9),
    (2,1,8.1),(2,4,6.0),(2,3,8.0),(2,6,8.4),(2,5,9.9),
    (3,1,7.0),(3,6,7.5),(3,4,8.0),(3,3,7.1),(3,5,8.0),
    (4,1,7.5),(4,3,7.8),(4,4,8.3),(4,2,7.6),(4,5,8.5),
    (5,1,9.5),(5,3,9.0),(5,4,9.1),(5,2,9.3),(5,5,9.9),
    (6,2,6.5),(6,3,7.8),(6,4,8.8),(6,2,8.4),(6,5,9.1),
    (7,2,9.1),(7,5,9.7),
    (8,4,8.5),(8,2,7.8),(8,6,8.8),(8,5,9.3),
    (9,2,5.5),(9,3,6.8),(9,4,5.8),(9,6,4.3),(9,5,4.5),
    (10,5,9.9),
    (13,3,8.0),(13,4,7.2),
    (14,2,8.5),(14,3,8.9),(14,4,8.9);
    
CREATE VIEW full_reviews AS
SELECT title, released_year, genre, rating, first_name, last_name FROM reviews
JOIN series ON series.id = reviews.series_id
JOIN reviewers ON reviewers.id = reviews.reviewer_id;

SELECT * FROM full_reviews;

-- 프로그램 이름별 집계
SELECT
	title,
    AVG(rating)
FROM full_reviews
GROUP BY title WITH ROLLUP;

SELECT
	title,
    COUNT(rating)
FROM full_reviews
GROUP BY title WITH ROLLUP;

SELECT
	released_year,
    genre,
    AVG(rating)
FROM full_reviews
GROUP BY released_year, genre WITH ROLLUP;



-- EMP
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
    
SELECT
    deptno,
    AVG(sal)
FROM emp
GROUP BY deptno;

SELECT
	ename,
    deptno,
    sal,
    AVG(sal) OVER(PARTITION BY deptno) AS dept_avg
FROM emp;

SELECT
	ename,
    sal,
    deptno,
    MIN(sal) OVER(PARTITION BY deptno) AS dept_min_sal,
    MAX(sal) OVER(PARTITION BY deptno) AS dept_max_sal
FROM emp;


SELECT
	ename,
    sal,
    deptno,
    AVG(sal) OVER(PARTITION BY deptno) AS dept_avg
FROM emp;

SELECT
	ename,
    sal,
    deptno,
    AVG(sal) OVER(PARTITION BY deptno) AS dept_avg,
    AVG(sal) OVER(PARTITION BY deptno ORDER BY sal) AS rolling_dept_sal
FROM emp;


SELECT
	ename, sal, deptno,
    RANK() OVER(PARTITION BY deptno ORDER BY sal DESC) AS overall_sal_rank,
    RANK() OVER(ORDER BY sal DESC) AS overall_sal_rank
FROM emp
ORDER BY deptno;

SELECT
	ename, sal,
    RANK() OVER(ORDER BY sal DESC) AS overall_sal_rank,
    DENSE_RANK() OVER(ORDER BY sal DESC) AS overall_sal_dense_rank
FROM emp;

SELECT
	ename, sal,
    RANK() OVER(ORDER BY sal DESC) AS overall_sal_rank,
    DENSE_RANK() OVER(ORDER BY sal DESC) AS overall_sal_dense_rank,
    ROW_NUMBER() OVER(ORDER BY sal DESC) AS rnum
FROM emp;

SELECT
	ename, sal, deptno,
    NTILE(4) OVER(ORDER BY saL) AS sal_quart
FROM emp;

SELECT
	empno, sal, deptno, ename,
    FIRST_VALUE(empno) OVER (PARTITION BY deptno ORDER BY sal DESC)
FROM emp;

SELECT
	empno, deptno, sal,
    LAG(sal) OVER(ORDER BY sal DESC) AS pre_sal
FROM emp;

SELECT
	empno, deptno, sal,
    LEAD(sal) OVER(ORDER BY sal DESC) AS next_sal
FROM emp;

-- 급여 상승이 얼마나 됐는지를 확인
SELECT * FROM emp_salary_hist;

SELECT
	empno, sal,
    LEAD(sal) OVER(PARTITION BY empno ORDER BY fromdate ASC) AS next_sal,
	LEAD(sal) OVER(PARTITION BY empno ORDER BY fromdate ASC) - sal AS sal_diff,
    fromdate
FROM emp_salary_hist;