

use book_db1;
select * into outfile 'e:\\lck_data\\temp\\members.dat'
fields terminated by ',' enclosed by '"'
from members;

select * from order_h;

show databases;
use rela_test;

show index from `user`;

create database `index_test`;

use	`index_test`;
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

# P100: 그래픽 모드에서 입력한 데이터를 로그 영역에서 확인
INSERT  INTO `members` 
	(`memid`, `memname`, `addr`, `birthday`, `jobcd`, `enterdtm`) 
	VALUES
	('park', '박기자', '경기 부천시', '2002-09-30', '3', '2022-03-01 14:13:16');

# P101: SQL 문으로 추가 데이터 입력하기  
INSERT  INTO `members` 
	(`memid`, `memname`, `addr`, `birthday`, `jobcd`, `enterdtm`) 
	VALUES
	('seo', '서갑돌',  '인천 동구', '1998-03-10', '1', '2022-03-01 14:08:41');

INSERT  INTO `members` 
	(`memid`, `memname`, `addr`, `birthday`, `jobcd`, `enterdtm`) 
	VALUES
	('Taeh', '태현', '경기 수원시', '2002-10-15', '4', '2022-03-01 14:15:10');

select * from members;

show index from `members`;

select *
from members
where memid='kim1';

select *
from members
where memname = '서갑돌';



show table status like 'members';

create unique index idx_memname on members(memname);
-- 유니크 옵션을 넣으면 중복값을 허용하지 않는다 name 은 fk 중복이 가능한 키니까 말이 안되서 오류나는것.
show index from members;

drop index idx_memname on members;

select * from members;
select memid, memname, addr, birthday
from members;
-- 이래서 view 를 쓴다
create view birth_member as
select memid, memname, addr, birthday
from members;

select * from birth_member;

create view mlg_member as
select memid, memname, addr , birthday, mileage
from members
where mileage >= 1000;

select * from mlg_member;

drop view mlg_member;
