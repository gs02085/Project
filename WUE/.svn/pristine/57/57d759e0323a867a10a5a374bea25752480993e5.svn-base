-- 장바구니
CREATE TABLE `cart` (
  `cseq` int NOT NULL AUTO_INCREMENT,
  `email` varchar(50) DEFAULT NULL,
  `pseq` int DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `result` char(1) DEFAULT 'n',
  `reg_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`cseq`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb3;
-- 고객
CREATE TABLE `customer` (
  `cseq` int NOT NULL AUTO_INCREMENT,
  `name` varchar(40) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `pw` varchar(20) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `zip_code` varchar(20) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `status` char(1) DEFAULT '0',
  `grade` varchar(10) DEFAULT '도라지',
  `reg_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `mod_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `point` int DEFAULT '0',
  PRIMARY KEY (`cseq`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;

-- 주말 농장 테이블
CREATE TABLE `fram` (
  `fseq` int NOT NULL AUTO_INCREMENT, --  (농장 상품번호)
  `email` varchar(16) DEFAULT NULL, -- seller 아이디
  `experience_date` date DEFAULT NULL, -- 체험일 (당일체험기준)
  `experience_time` varchar(20) DEFAULT NULL, -- (체험시간)
  `experience_price` int DEFAULT NULL, -- 체험가격
  `experience_number` int DEFAULT NULL, -- 체험 가능 인원
  `experience_context` varchar(50) DEFAULT NULL, -- 체험 내용(이름)
  `indate` timestamp NULL DEFAULT CURRENT_TIMESTAMP, -- 예약등록일
  PRIMARY KEY (`fseq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 주말 농장 이미지 테이블
CREATE TABLE `fram_postimage` (
`fpseq` int NOT NULL AUTO_INCREMENT references `fram` (fseq),   -- 예약이미지 번호
  `email` varchar(20) DEFAULT NULL, -- seller 이메일
  `fseq` int DEFAULT NULL, -- 농장 상품 번호
  `url` varchar(100) DEFAULT NULL, -- 사진 명
  `reg_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP, -- 이미지 등록날짜
  PRIMARY KEY (`fpseq`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- 고객 등급
CREATE TABLE `grade` (
  `gnum` int NOT NULL,
  `name` varchar(200) DEFAULT NULL,
  `reg_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`gnum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

CREATE TABLE `instagram_post` (
  `iseq` int NOT NULL AUTO_INCREMENT, -- 댓글 번호
  `postnumber` int DEFAULT NULL, -- 게시글 번호
  `context` varchar(100) DEFAULT NULL, -- 게시글 내용
  `comment` varchar(100) DEFAULT NULL, -- 추가글 
  `email` varchar(40) DEFAULT NULL, -- seller 아이디
  `reg_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP, -- 등록일
  PRIMARY KEY (`iseq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- 상품 종류
CREATE TABLE `kind` (
  `knum` int NOT NULL,
  `name` varchar(200) DEFAULT NULL,
  `reg_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`knum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- 좋아요 테이블
CREATE TABLE `like_table` (
  `lseq` int NOT NULL AUTO_INCREMENT,
  `email` varchar(50) DEFAULT NULL,
  `pseq` int DEFAULT NULL,
  `result` char(1) DEFAULT 'n',
  `reg_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`lseq`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb3;

-- 주문하기 상세 테이블
CREATE TABLE `order_detail` (
  `odseq` int NOT NULL AUTO_INCREMENT,
  `oseq` int DEFAULT NULL,
  `pseq` int DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `payment` int DEFAULT NULL,
  `result` char(1) DEFAULT '0',
  `reg_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `mod_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`odseq`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb3;

-- 주문하기 테이블
CREATE TABLE `orders` (
  `oseq` int NOT NULL AUTO_INCREMENT,
  `email` varchar(50) DEFAULT NULL,
  `amount` int DEFAULT NULL,
  `reg_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`oseq`),
  KEY `email_idx` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb3;

-- 상품 이미지
CREATE TABLE `pimages` (
  `iseq` int NOT NULL AUTO_INCREMENT,
  `url` char(200) DEFAULT NULL,
  `pseq` int DEFAULT NULL,
  `reg_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`iseq`)
) ENGINE=InnoDB AUTO_INCREMENT=230 DEFAULT CHARSET=utf8mb3;

-- 상품
CREATE TABLE `product` (
  `pseq` int NOT NULL AUTO_INCREMENT, -- 상품번호
  `name` varchar(100) DEFAULT NULL,  -- 이름
  `kind` char(1) DEFAULT NULL, -- 종류 
  `cost` int DEFAULT '0', -- 원가
  `price` int DEFAULT '0', -- 판매가
  `sale_price` int DEFAULT '0',  -- 세일가
  `best` char(1) DEFAULT 'n', -- 베스트 상품(n,y로 구분)
  `recommend` char(1) DEFAULT 'n', -- 추천 상품(n,y로 구분)
  `sale` char(1) DEFAULT 'n', -- 세일 여부(n,y로 구분) 
  `sseq` int DEFAULT NULL, -- seller 고유번호
  `quantity` int DEFAULT NULL, -- 수량
  `reg_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP, -- 등록일
  PRIMARY KEY (`pseq`)
);

-- 후기 테이블
CREATE TABLE `review` (
  `rseq` int NOT NULL AUTO_INCREMENT,
  `email` varchar(50) DEFAULT NULL,
  `pseq` int DEFAULT NULL,
  `title` varchar(1000) DEFAULT NULL,
  `content` varchar(3000) DEFAULT NULL,
  `reply` varchar(3000) DEFAULT NULL,
  `rep` char(1) DEFAULT 'n',
  `reg_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`rseq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

CREATE TABLE `seller` (
  `sseq` int NOT NULL AUTO_INCREMENT, -- seller 번호
  `name` varchar(40) DEFAULT NULL, -- 이름 
  `email` varchar(40) DEFAULT NULL,  -- 이메일 
  `pw` varchar(20) DEFAULT NULL,  -- 비빌번호
  `phone` varchar(20) DEFAULT NULL, -- 폰번호
  `zip_num` varchar(7) DEFAULT NULL, -- 우편번호
  `address` varchar(100) DEFAULT NULL, -- 주소
  `status` char(1) DEFAULT '0',  -- 상태(0.유지 1.탈퇴)
  `reg_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP, -- 등록일
  PRIMARY KEY (`sseq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

CREATE TABLE `seller_instagram` (
  `iseq` int NOT NULL AUTO_INCREMENT, -- 인스타 그램 번호
  `webSite` varchar(100) DEFAULT NULL, -- 주말농장 웹사이트 번호 
  `url` varchar(100) DEFAULT ' ', -- 개인 프로필 사진 번호
  `seller_email` varchar(40) DEFAULT NULL, -- seller 이메일
  `reg_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP, -- 등록일 
  `comment` varchar(100) DEFAULT NULL, -- 프로필 코멘트
  PRIMARY KEY (`iseq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

CREATE TABLE `sqna` (
  `sqseq` int NOT NULL AUTO_INCREMENT, -- 질문번호
  `title` varchar(1000) DEFAULT NULL, -- 제목
  `content` varchar(3000) DEFAULT NULL,  -- 내용 
  `reply` varchar(3000) DEFAULT NULL,  -- 답글
  `semail` varchar(50) DEFAULT NULL, -- seller 아이디
  `email` varchar(50) DEFAULT NULL, -- customer 아이디
  `rep` int DEFAULT '0', -- 답글여부(0.미답글 1.답글완료)
  `reg_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP, -- 등록일
  PRIMARY KEY (`sqseq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- 관리자
CREATE TABLE `worker` (
  `wseq` int NOT NULL AUTO_INCREMENT,
  `name` varchar(40) DEFAULT NULL,
  `id` varchar(20) DEFAULT NULL,
  `pw` varchar(20) DEFAULT NULL,
  `email` varchar(40) DEFAULT NULL,
  `phone` varchar(40) DEFAULT NULL,
  `reg_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`wseq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- 관리자 게시판 페이지(공지사항, QnA)
CREATE TABLE `wnotice` (
  `wseq` int NOT NULL AUTO_INCREMENT,
  `name` varchar(40) DEFAULT NULL,
  `type` char(1) DEFAULT '0',
  `title` varchar(20) DEFAULT NULL,
  `detail` varchar(1000) DEFAULT NULL,
  `hits` int DEFAULT NULL,
  `reg_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`wseq`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb3;

-- view ---------------------------------------------------------------------------------------
-- 베스트 상품 뷰
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` 
SQL SECURITY DEFINER VIEW `best_p_view` AS select `p`.`pseq` AS `pseq`,`p`.`name` AS `name`,`p`.`price` AS `price`,`p`.`sale_price` AS `sale_price`,`p`.`sale` AS `sale`,`i`.`url` AS `url` 
from (`product` `p` join `pimages` `i`)
 where ((`p`.`best` = 'y') and (`i`.`pseq` = `p`.`pseq`)) 
 group by `p`.`pseq` order by `p`.`reg_date` desc limit 7;
 
 -- 장바구니 뷰
 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` 
 SQL SECURITY DEFINER VIEW `cart_view` AS select `o`.`cseq` AS `cseq`,`o`.`email` AS `email`,`o`.`pseq` AS `pseq`,`p`.`name` AS `name`,`o`.`quantity` AS `quantity`,`p`.`quantity` AS `total_quantity`,`o`.`reg_date` AS `reg_date`,`p`.`price` AS `price`,`p`.`sale_price` AS `sale_price`,`p`.`sale` AS `sale`,`o`.`result` AS `result` 
 from ((`cart` `o` join `customer` `m`) join `product` `p`) 
 where ((`o`.`email` = `m`.`email`) and (`o`.`pseq` = `p`.`pseq`) and (`o`.`result` = 'n'));
 
 -- 좋아요 상품 뷰
 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` 
 SQL SECURITY DEFINER VIEW `like_view` AS select `l`.`lseq` AS `lseq`,`m`.`email` AS `email`,`p`.`pseq` AS `pseq`,`p`.`name` AS `pname`,`p`.`price` AS `price`,`p`.`sale_price` AS `sale_price`,`p`.`sale` AS `sale`,`l`.`result` AS `result` 
 from ((`like_table` `l` join `customer` `m`) join `product` `p`) 
 where ((`l`.`email` = `m`.`email`) and (`l`.`pseq` = `p`.`pseq`) and (`l`.`result` = 'n'));
 
 -- 주문하기 뷰
 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` 
 SQL SECURITY DEFINER VIEW `order_view` AS select `d`.`odseq` AS `odseq`,`o`.`oseq` AS `oseq`,`p`.`sseq` AS `sseq`,`o`.`email` AS `email`,`o`.`reg_date` AS `reg_date`,`d`.`mod_date` AS `mod_date`,`d`.`pseq` AS `pseq`,`d`.`quantity` AS `quantity`,`m`.`name` AS `name`,`m`.`zip_code` AS `zip_code`,`m`.`address` AS `address`,`m`.`phone` AS `phone`,`p`.`name` AS `pname`,`p`.`price` AS `price`,`p`.`sale_price` AS `sale_price`,`p`.`sale` AS `sale`,`d`.`result` AS `result`,`d`.`payment` AS `payment` 
 from (((`orders` `o` join `order_detail` `d`) join `customer` `m`) join `product` `p`) 
 where ((`o`.`oseq` = `d`.`oseq`) and (`o`.`email` = `m`.`email`) and (`d`.`pseq` = `p`.`pseq`));


-- insert문 -----------------------------------------------------------------------------------------------
-- 1. 고객
insert into customer(name, email, pw, phone) values('남도일', 'd@naver.com', '4444', '010-4444-4444');
insert into customer(name, email, pw, phone) values('코난', 'c@naver.com', '3333', '010-3333-3333');

-- 2. 등급
insert into grade(gnum, name) values(1, '도라지');
insert into grade(gnum, name) values(2, '인삼');
insert into grade(gnum, name) values(3, '산삼');

-- 3. 상품 종류
insert into kind(knum, name) values(1, '과일');
insert into kind(knum, name) values(2, '채소');
insert into kind(knum, name) values(3, '쌀_잡곡류');
insert into kind(knum, name) values(4, '견과류');

-- 4. 관리자
insert into worker(name, id, pw, email, phone) values('이아름', 'areum1991', 'areum1991', 'areum@gmail.com', '010-1111-1111');
insert into worker(name, id, pw, email, phone) values('김민아', 'gs01085', 'gs01085' ,'gs01085@naver.com', '010-3333-3333');
insert into worker(name, id, pw, email, phone) values('경여랑', 'kyung33', 'kyung33', 'kyung@naver.com', '010-2222-2222');
