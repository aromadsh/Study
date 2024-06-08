-- 데이터베이스 확인 --
SHOW DATABASES;

-- 데이터 베이스 생성 --
CREATE DATABASE computer_shop;
CREATE DATABASE pet_shop;

-- 데이터베이스 제거
DROP DATABASE pet_shop;

-- 데이터 베이스 사용
USE pet_shop;

-- 현재 사용중인 데이터베이스 확인
SELECT DATABASE();

-- pet_shop 데이터베이스에 dogs 테이블 생성
CREATE TABLE dogs (
	name  VARCHAR(50),
    breed VARCHAR(50),
    age INT 
    );

-- 고양이 테이블 생성
CREATE TABLE cats (
	name VARCHAR(50),
    age INT
    );

-- 테이블 확인
SHOW TABLES;

-- 컬럼 정보 확인
SHOW COLUMNS FROM cats;
DESC cats;

-- 테이블 삭제
DROP TABLE cats;

SHOW TABLES;

CREATE TABLE employees(
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    last_name VARCHAR(100) NOT NULL,
    first_name VARCHAR(100) NOT NULL,
    middle_name VARCHAR(100),
    age INT NOT NULL,
    current_status VARCHAR(100) NOT NULL DEFAULT 'employed'
    );
    
DESC employees;

CREATE TABLE cats (
	name VARCHAR(50),
    age INT
    );
    
SHOW TABLES;

-- cats 테이블에 데이터(레코드) 삽입하기 -> CREATE에 해당
INSERT INTO cats(name, age) VALUES('치즈', 3);

-- 컬럼의 순서를 바꿔서 넣어도 된다.
INSERT INTO cats(age, name) VALUES(5, '코코');

-- 데이터 조회(SELECT) -> READ에 해당
SELECT * FROM cats;

-- 데이터 사입 시에 컬럼 명시하지 않기
-- 테이블 생성 시에 정한 컬럼의 순서대로 데이터가 들어간다.
INSERT INTO cats VALUES ('망고', 2);

SELECT * FROM cats;

-- 여러 개의 데이터를 한꺼번에 삽입하기 : 다중 INSERT
INSERT INTO cats(name, age)
VALUES ('까미', 1), 
	   ('나비', 5);

SELECT * FROM cats;

-- NULL, NOT NULL
DESC cats;

-- age에는 값을 넣지 않을 것이다.
-- 값이 들어가지 않았기 때문에 age는 NULL이 된다.
INSERT INTO cats(name) VALUES('야옹');

SELECT * FROM cats;

-- NOT NULL 제약 조건
CREATE TABLE cats2(
	name VARCHAR(50) NOT NULL,
    age INT NOT NULL
    );

DESC cats2;

INSERT INTO cats2(name) VALUES ('야옹이');
SELECT * FROM cats2;

INSERT INTO cats2(name, age) VALUES ('야옹이', 3);
SELECT * FROM cats2;

-- 기본값(DEFAULT)
CREATE TABLE cats3(
	name VARCHAR(50) DEFAULT '고양이 이름',
    age INT DEFAULT 9999
    );

INSERT INTO cats3(age) VALUES(3);
SELECT * FROM cats3;

-- 강제 NULL 값 추가
INSERT INTO cats3(name, age) VALUES (NULL, NULL);
SELECT * FROM cats3;

-- NULL도 허용하지 않고, 기본값을 가지게 할 수 있을까요?
CREATE TABLE cats4(
	name VARCHAR(50) NOT NULL DEFAULT '고양이 이름',
    age INT NOT NULL DEFAULT 999
    );

INSERT INTO cats4 (name, age) VALUES (NULL, 3);
INSERT INTO cats4 VALUES ();
SELECT * FROM cats4;

INSERT INTO cats VALUES ('unnamed', 99);
SELECT * FROM cats;

-- 각 고양이를 구분하기 위한 ID 컬럼을 추가
CREATE TABLE cats5(
	cat_id INT NOT NULL,
    name VARCHAR(50),
    age int
    );

INSERT INTO cats5 VALUES(1, '야옹', 3);
INSERT INTO cats5 VALUES(2, '야옹', 3);
INSERT INTO cats5 VALUES(3, '야옹', 3);

SELECT * FROM cats5;

-- cat_id를 PRIMARY KEY로 만들기
-- PRIMARY KEY의 특징 : 중복 허용 x NULL 을 허용하지 않아야 한다.
CREATE TABLE cats6(
	cat_id INT NOT NULL PRIMARY KEY,
    name VARCHAR(50),
    age INT
    );
    
INSERT INTO cats6 VALUES(1, '야옹이', 3);
INSERT INTO cats6 VALUES(1, '야옹이', 3); -- ERROR
INSERT INTO cats6 VALUES(2, '야옹이', 3); -- INSERT OK

SELECT * FROM cats6;

-- 직접 데이터를 집어 넣을 때 KEY에 해당하는 값을 넣지 않아도 자동으로 증가 시켜가면서 ID값을 넣어주는 옵션
CREATE TABLE cats7(
	cat_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50),
    age INT);

INSERT INTO cats7(name, age) VALUES('야옹이', 3); -- 여러 번 실행

SELECT * FROM cats7;

DESC cats7;

-- 실습을 위해 cats 테이블 삭제
DROP TABLE cats;

-- 새로운 cats 테이블 만들기
CREATE TABLE cats(
	cat_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    breed VARCHAR(100),
    age INT);
    
-- 예제 데이터 넣어주기
INSERT INTO cats(name, breed, age) 
VALUES ('Ringo', 'Tabby', 4),
       ('Cindy', 'Maine Coon', 10),
       ('Dumbledore', 'Maine Coon', 11),
       ('Egg', 'Persian', 4),
       ('Misty', 'Tabby', 13),
       ('George Michael', 'Ragdoll', 9),
       ('Jackson', 'Sphynx', 7);

-- 확인       
SELECT * FROM cats;

-- name과 breed만 조회
SELECT name, breed
FROM cats;

-- 데이터 필터링 : WHERE
SELECT name, breed, age 
FROM cats 
WHERE breed = 'Tabby';

-- 나이가 4살인 고양이의 이름, 품종 조회
SELECT name, breed
FROM cats
WHERE age = 4;

-- 문자열을 이용해서 조회 할 때는 대소문자를 가리지 않는다.
SELECT *
FROM cats
WHERE name = 'rInGo';

-- 별칭(Alias 부여)
-- 컬럼의 이름이나 테이블의 이름을 개발자가 별칭을 부여할 때 사용
SELECT name AS kittyName
FROM cats;

-- 별칭에 띄어쓰기가 포함되어야 하는 경우에는 따옴표 사용하기
SELECT name AS '고양이 이름'
FROM cats;