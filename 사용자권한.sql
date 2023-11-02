관리자는 계정생성하고
해당 계정에 권한을 부여해서 어디까지 접근가능한지 설정해줘야된다.

계정 생성 + 권한 부여 
create user 'myone'@'%' identified by '123';
Create database book_db1;
create database book_db2;
create database book_db3;

생성된 사용자 확인
use mysql;
select host, user, password from user;
권한 부여
GRANT ALL privileges ON book_db3.* TO mytwo;

부여된 권한 확인
show grants for mytwo@'%';

권한 없애기
REVOKE ALL PRIVILEGES ON book_db3.* FROM 'mytwo';

use book_db1;
CREATE TABLE `members` (
	`memid` VARCHAR(9) NOT NULL COMMENT '회원ID'
		COLLATE 'utf8mb4_general_ci',
	`memname` VARCHAR(20) NOT NULL COMMENT '회원명'
		COLLATE 'utf8mb4_general_ci',
	`passwd` VARCHAR(128) NULL DEFAULT NULL
		COMMENT '비밀번호' COLLATE 'utf8mb4_general_ci',
	`passwdmdt` DATETIME NULL DEFAULT NULL COMMENT '비밀번호변경일시',
	`jumin` VARCHAR(64) NULL DEFAULT NULL COMMENT '주민등록번호'
		COLLATE 'utf8mb4_general_ci',
	`addr` VARCHAR(100) NULL DEFAULT NULL COMMENT '주소'
		COLLATE 'utf8mb4_general_ci',
	`birthday` DATE NULL DEFAULT NULL COMMENT '생년월일',
	`jobcd` CHAR(1) NULL DEFAULT NULL COMMENT '직업코드'
		COLLATE 'utf8mb4_general_ci',
	`mileage` DECIMAL(7,0) UNSIGNED NULL DEFAULT '0' COMMENT '마일리지',
	`stat` ENUM('Y','N') NOT NULL DEFAULT 'Y' COMMENT '상태'
		COLLATE 'utf8mb4_general_ci',
	`enterdtm` DATETIME NOT NULL DEFAULT current_timestamp()
		COMMENT '가입일시',
	`leavedtm` DATETIME NULL DEFAULT NULL COMMENT '탈퇴일시',
	PRIMARY KEY (`memid`)
)
COLLATE='utf8mb4_general_ci'
ENGINE=InnoDB
;

INSERT  INTO `members` 
	(`memid`, `memname`, `addr`, `birthday`, `jobcd`, `mileage`, `enterdtm`) 
	VALUES
	('hong1', '홍길동', '인천 동구 송림동', '2000-05-08', '2', 500, '2022-03-01 14:10:27');

INSERT  INTO `members` 
	(`memid`, `memname`, `addr`, `birthday`, `jobcd`, `mileage`, `enterdtm`) 
	VALUES
	('hong2', '홍길동', '서울 강남구 신사동', '1990-01-05', '9', 1000,  '2022-03-01 14:11:50');

INSERT  INTO `members` 
	(`memid`, `memname`, `addr`, `birthday`, `jobcd`, `enterdtm`) 
	VALUES
	('kim1', '김갑수', '인천 연수구 연수동', '2003-07-01', '1', '2022-03-01 14:12:39');
    
    
    select * from members;
    
    GRANT ALL privileges ON book_db1.* TO myone;


