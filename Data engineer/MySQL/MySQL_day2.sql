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

-- 데이터 삽입 확인
SELECT * FROM books;

-- 문자열 함수. CONCAT(Concatenate)

-- FROM절이 없으면 자동으로 Dummy Table을 사용
SELECT CONCAT('Hello', ' ', 'MySQL') AS full_name;

-- books 테이블에서 작가의 author_fname, author_lname 이어주기
SELECT CONCAT(author_fname, ' ', author_lname) AS full_name
FROM books;

-- CONCAT은 문자열 이외의 다른 데이터 타입들을 문자열화 해서 이어줄 수도 있다.
SELECT CONCAT(title, '-', released_year) AS title_year
FROM books;

-- 책 제목, 작가의 이름(fname), 발행일을 하나의 문자열로 이어주기
SELECT CONCAT(title, '-', author_fname,  '-', released_year)
FROM books;

-- CONCAT_WS : 문자열 사이를 구분하기 위한 구분자(sep)를 지정해서 연결하게 해준다.
SELECT CONCAT_WS('-', title, author_fname, released_year)
FROM books;

-- SUBSTRING : 문자열에서 원하는 인덱스 및 범위를 이용해 잘라낼 때 사용한다.
SELECT SUBSTRING("HELLO", 3, 2);

-- 개수를 지정하지 않으면 끝까지 다 추출
SELECT SUBSTRING("HELLO", 2);
SELECT SUBSTRING("HELLO", -4);

SELECT title FROM books;

-- 실습
SELECT CONCAT(SUBSTRING(title, 1, 10), '...') AS sort_title
FROM books;

-- 문자열 치환 : REPLACE
SELECT REPLACE('HELLO WORLD!', '!', '?');
SELECT REPLACE('I LOVE YOU', 'LOVE', 'LIKE');

SELECT REPLACE(title, ' ', '-')
FROM books;

-- CHAR_LENGTH(한글은 글자수), LENGTH(한글은 바이트 수)
SELECT LENGTH('MINGO'), CHAR_LENGTH('MINHO');
SELECT LENGTH('민호'), CHAR_LENGTH('민호');

-- UPPER, LOWER
SELECT UPPER(title), LOWER(title)
FROM books;

-- TRIM
SELECT TRIM('              HELLO       ');

-- LEADING FROM (TRIM OPTION)
SELECT TRIM(LEADING '.' FROM '.....HELLO....');

-- BOTH FROM  (TRIM OPTION)
SELECT TRIM(BOTH '.' FROM '.......HELLO.....');

-- TRAILING FROM (TRIM OPTION)
SELECT TRIM(TRAILING '.' FROM '...HELLO.....');



CREATE TABLE user(
	user_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	username VARCHAR(50) NOT NULL,
	address VARCHAR(100)
);

INSERT INTO user(username, address) 
VALUES ('A', '서울'),
			 ('B', '대전'),
			 ('C', '경기도'),
		   ('D', NULL),
			 ('E', NULL),
			 ('F', '서울'),
			 ('G', '경기도'),
			 ('H', '대구'),
			 ('I', '부산'),
			 ('J', '전주'),
			 ('K', '광주');
             
SELECT * FROM user;

-- ISNULL 
SELECT address, ISNULL(address)
FROM user;

-- IFNULL
SELECT username, IFNULL(address, '주소없음')
FROM user;

-- IF(조건, True Expression, False Expression)
-- 경기도 또는 서울이면, '수도권', 그 외는 '지방'
SELECT address, IF(address = '경기도' OR address = '서울', '수도권', '지방') AS region
FROM user;

-- books 테이블에 stock_quantity(재고 수량)가 50 이사이면 제고 많음, 30이상이면 재고 중간, 그외에는 재고 없음
SELECT stock_quantity, IF(stock_quantity >= 50, '재고 많음', IF(stock_quantity >= 30, '재고중간', '재고 없음')) AS stock_quantity
FROM books;

-- CASE WHEN THEN
SELECT 
	stock_quantity, 
	CASE 
		WHEN stock_quantity >= 50 THEN '재고 많음'
		WHEN stock_quantity >= 30 THEN '재고 중간'
		ELSE '재고 부족'
	END AS quantity_level
FROM books;

-- DISTINCT
SELECT DISTINCT author_lname
FROM books;

SELECT DISTINCT author_lname, author_fname
FROM books;

SELECT DISTINCT author_lname, author_fname, released_year
FROM books;

-- ORDER BY : 개발자가 직접 컬럼을 이용해서 순번을 지정
SELECT 
	book_id,
    title,
    pages
FROM books
ORDER BY pages DESC;

SELECT 
	book_id,
    title,
    pages
FROM books
ORDER BY title ASC;

SELECT
	author_fname,
    title,
    pages
FROM books
ORDER BY author_fname ASC, pages DESC;

-- LIMIT : 데이터 조회 시 지정한 부분(일부분)만 보여주기 위해서 사용
SELECT*
FROM books
LIMIT 3;

SELECT*
FROM books
LIMIT 3, 5;

-- 데이터 필터링 : WHERE절
-- EQUAL
SELECT title, released_year
FROM books
WHERE released_year=2000;

-- NOT EQUAL
SELECT title, released_year
FROM books
WHERE released_year != 2000;

-- LIKE
SELECT title
FROM books
WHERE title LIKE 'WH%';

SELECT title 
FROM books 
WHERE title LIKE '%es';

SELECT title 
FROM books 
WHERE title LIKE '%A%t%';

SELECT author_fname 
FROM books 
WHERE author_fname LIKE '%a%';

SELECT author_fname 
FROM books 
WHERE author_fname LIKE '_a%';

SELECT author_fname 
FROM books 
WHERE author_fname LIKE '_a___';

-- >, >=
SELECT title, released_year 
FROM books 
WHERE released_year > 2000;

SELECT title, released_year 
FROM books 
WHERE released_year >= 2000;

SELECT title, released_year 
FROM books 
WHERE title > 'F'; -- G 이상의 글자만 출력

SELECT title, pages 
FROM books 
WHERE pages < 198;

SELECT title, pages 
FROM books 
WHERE pages <= 198;

SELECT title, released_year 
FROM books 
WHERE title < 'F'; -- E 이하의 글자만 출력

-- IN, NOT IN
SELECT title, author_lname 
FROM books 
WHERE author_lname IN ('Lahiri', 'Gaiman'); -- or 개념

SELECT title, author_lname 
FROM books 
WHERE author_lname NOT IN ('Lahiri', 'Gaiman');

-- AND, OR
SELECT 10 > 1;
SELECT 10 < 1;

SELECT title, released_year, author_lname
FROM books
WHERE released_year < 2000 
  AND author_lname LIKE 'L%';

SELECT title, released_year, author_lname
FROM books
WHERE released_year < 2000
   OR author_lname LIKE 'L%';
   
-- AND와 OR 함께 사용
SELECT title, author_lname, released_year, pages
FROM books
WHERE author_lname LIKE 'L%' OR pages <= 300 
  AND released_year < 2000; -- 이 쿼리문의 문제는 AND와 OR의 우선순위가 없어서 잘못 데이터 추출
  
SELECT title, author_lname, released_year, pages
FROM books
WHERE ( author_lname LIKE 'L%' OR pages <= 300) 
  AND released_year < 2000;
  
-- BETWEEN, NOT BETWEEN
SELECT title, released_year
FROM books
WHERE released_year >= 2004 AND released_year <= 2015;

SELECT title, released_year
FROM books
WHERE released_year BETWEEN 2004 AND 2015;

SELECT title, released_year
FROM books
WHERE released_year NOT BETWEEN 2004 AND 2015;

SELECT title, released_year, author_fname
FROM books
WHERE author_fname BETWEEN 'B' AND 'K';



-- CHAR VARCHAR
CREATE TABLE sample_tb(
	country_code CHAR(3)
);

INSERT INTO sample_tb( country_code ) VALUES ('KOR'), ('JPN'), ('USA');

SELECT * FROM sample_tb;

INSERT INTO sample_tb ( country_code ) VALUES ('KOREA');
INSERT INTO sample_tb ( country_code ) VALUES ('K');

SELECT * FROM sample_tb;

SELECT country_code,
		LENGTH(country_code),
        CHAR_LENGTH(country_code)
FROM sample_tb;