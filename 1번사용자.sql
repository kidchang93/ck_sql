CREATE TABLE `order_h` (
	`orderno` CHAR(9) NOT NULL COMMENT '주문번호'
		COLLATE 'utf8mb4_general_ci',
	`orddt` DATE NOT NULL COMMENT '주문일',
	`memid` VARCHAR(10) NOT NULL COMMENT '주문자ID'
		COLLATE 'utf8mb4_general_ci',
	`ordamt` DECIMAL(7,0) UNSIGNED NOT NULL DEFAULT '0'
		COMMENT '주문총액',
	`cancelyn` ENUM('Y','N') NOT NULL DEFAULT 'N'
		COMMENT '주문상태' COLLATE 'utf8mb4_general_ci',
	`canceldtm` DATETIME NULL DEFAULT NULL COMMENT '주문취소일시',
	`insdtm` DATETIME NOT NULL DEFAULT current_timestamp()
		COMMENT '등록일시',
	`moddtm` DATETIME NULL DEFAULT NULL COMMENT '변경일시',
	PRIMARY KEY (`orderno`) USING BTREE
)
COLLATE='utf8mb4_general_ci'
ENGINE=InnoDB
;


select * from order_h;

INSERT INTO `order_h` 
    (`orderno`, `orddt`, `memid`, `ordamt`, `insdtm`) VALUES
    ('202201001', '2022-01-24', 'seo', '10000', '2022-03-01 14:49:07');

INSERT INTO   `order_h` 
    (`orderno`, `orddt`, `memid`, `ordamt`, `insdtm`) VALUES
    ('202201002', '2022-01-24', 'hong2', '15000', '2022-03-01 14:50:35');

INSERT INTO   `order_h` 
    (`orderno`, `orddt`, `memid`, `ordamt`, `insdtm`) VALUES
    ('202201003', '2022-01-25', 'hong1', '20000', 
     '2022-03-01 14:51:19');

INSERT INTO   `order_h` 
    (`orderno`, `orddt`, `memid`, `ordamt`, `insdtm`) VALUES
    ('202201004', '2022-01-25', 'kim1', '10000', 
     '2022-03-01 14:51:58');

INSERT INTO   `order_h` 
    (`orderno`, `orddt`, `memid`, `ordamt`, `cancelyn`, 
     `canceldtm`, `insdtm`) VALUES
    ('202201005', '2022-01-25', 'park', '5000', 'Y', 
     '2022-01-25 00:00:00', '2022-03-01 14:53:12');

INSERT INTO   `order_h` 
    (`orderno`, `orddt`, `memid`, `ordamt`, `insdtm`) VALUES
    ('202202001', '2022-02-01', 'hong1', '30000', '2022-03-01 14:54:09');

INSERT INTO   `order_h` 
    (`orderno`, `orddt`, `memid`, `ordamt`, `insdtm`) VALUES
    ('202202002', '2022-02-01', 'hong1', '1000', '2022-03-01 14:54:40');

INSERT INTO   `order_h` 
    (`orderno`, `orddt`, `memid`, `ordamt`, `insdtm`) VALUES
    ('202202003', '2022-02-02', 'park', '10000', '2022-03-01 14:55:28');

INSERT INTO   `order_h` 
    (`orderno`, `orddt`, `memid`, `ordamt`, `insdtm`) VALUES
    ('202202004', '2022-02-02', 'abcd', '500', '2022-03-01 14:56:03');