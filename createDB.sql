-- 카테고리

create table category (
    cate_id     varchar(10) PRIMARY KEY,
    cate_name   varchar(30) NOT NULL
);

insert into category 
values  ('ct01', 'top'),
        ('ct02', 'neat'),
        ('ct03', 'pants'),
        ('ct04', 'skirt'),
        ('ct05', 'dress'),
        ('ct06', 'sports'),
        ('ct07', 'outer');

-- 상품

create table product (
    pd_id       varchar(10) PRIMARY KEY,
    pd_name     varchar(30) NOT NULL,
    pd_price    int NOT NULL,
    pd_detail   longtext,
    pd_image    blob NOT NULL,
    cate_id     varchar(10),
    FOREIGN KEY(cate_id) REFERENCES category(cate_id) ON UPDATE CASCADE
);

insert into product
values  ('pd01', 'sh1', 10000, 'pretty t-shirt', blob),
        ('pd02', 'sk1', 30000, 'cargo skirt', blob),
        ('pd03', 'dr1', 59000, 'floral dress', blob),
        ('pd04', 'tr1', 50000, 'training set', blob);

-- 고객

create table customer (
    cs_id       varchar(10) PRIMARY KEY,
    cs_name     varchar(30) NOT NULL,
    gender      varchar(5),
    birth       year,
    cs_path     varchar(20) NOT NULL,
    cs_phone    varchar(23) NOT NULL
);

insert into customer 
values  ('cs01', 'anna', 'F', 2001, 'p01', '010-0028-3928'),   
        ('cs02', 'jane', 'M', 1992, 'p02', '010-3492-3119'),   
        ('cs03', 'bell', 'F', 1998, 'p01', '010-0038-9899'),   
        ('cs04', 'james', 'M', 2003, 'p03', '010-33-23'),  
        ('cs05', 'Mic', 'F', 1983, 'p05', '01092372938');  

-- 추천

create table recommend (
    cs_id   varchar(10) NOT NULL,
    pd_id   varchar(10) NOT NULL,
    rc_code varchar(10) NOT NULL,
    FOREIGN KEY(cs_id) REFERENCES customer(cs_id) ON UPDATE CASCADE,
    FOREIGN KEY(pd_id) REFERENCES product(pd_id) ON UPDATE CASCADE
);

insert into recommend 
values  ('cs01', 'pd01', 'rc01'),
        ('cs02', 'pd03', 'rc02'),
        ('cs03', 'pd02', 'rc03');

-- 구매

create table purchase (
    pc_id   varchar(20) PRIMARY KEY,
    pc_date datetime NOT NULL,
    cs_id   varchar(10) NOT NULL,
    pd_id   varchar(10) NOT NULL,
    FOREIGN KEY(cs_id) REFERENCES customer(cs_id) ON UPDATE CASCADE,
    FOREIGN KEY(pd_id) REFERENCES product(pd_id) ON UPDATE CASCADE
);

insert into purchase
values  ('pc01', now() ,'cs01', 'pd02'),
        ('pc02', now(), 'cs02', 'pd01'),
        ('pc03', now(), 'cs03', 'pd03');

-- 장바구니

create table cart (
    cart_id varchar(20) PRIMARY KEY,
    cs_id   varchar(10) NOT NULL,
    pd_id   varchar(10) NOT NULL,
    amount  int,
    FOREIGN KEY(cs_id) REFERENCES customer(cs_id) ON UPDATE CASCADE,
    FOREIGN KEY(pd_id) REFERENCES product(pd_id) ON UPDATE CASCADE
);

insert into cart 
values  ('ct01', 'cs01', 'pd01', 1),    
        ('ct02', 'cs02', 'pd02', 3),
        ('ct03', 'cs03', 'pd04', 2);