1. 테이블 생성 

```sql
create database original_DB;

create table member_info
(
	mem_name varchar(20) primary key, 
    job_code varchar(10) not null, 
    start_datetime datetime, 
	end_datetime datetime
);

insert into member_info(mem_name, job_code, start_datetime, end_datetime) values ('궁예','왕', str_to_date('20200401','%Y%m%d'), str_to_date('20210330','%Y%m%d'));
insert into member_info(mem_name, job_code, start_datetime, end_datetime) values ('사달라','외화벌이', str_to_date('20180401','%Y%m%d'), str_to_date('20220330','%Y%m%d'));
insert into member_info(mem_name, job_code, start_datetime, end_datetime) values ('이토히로부미','강도', str_to_date('20191231','%Y%m%d'), str_to_date('20200417','%Y%m%d'));
insert into member_info(mem_name, job_code, start_datetime, end_datetime) values ('펭수','웅변가', str_to_date('20210222','%Y%m%d'), str_to_date('20220331','%Y%m%d'));
insert into member_info(mem_name, job_code, start_datetime, end_datetime) values ('제프베조스','부자', str_to_date('20170321','%Y%m%d'), str_to_date('20311211','%Y%m%d'));
insert into member_info(mem_name, job_code, start_datetime, end_datetime) values ('한치두치세치네치','볶음밥볶음밥', str_to_date('20130102','%Y%m%d'), str_to_date('20200401','%Y%m%d')); 
insert into member_info(mem_name, job_code, start_datetime, end_datetime) values ('송강호','운전기사', str_to_date('20191230','%Y%m%d'), str_to_date('20210430','%Y%m%d'));
insert into member_info(mem_name, job_code, start_datetime, end_datetime) values ('정은','폭탄성애자', str_to_date('20200321','%Y%m%d'), str_to_date('20200413','%Y%m%d'));
```

<br>

2. 다른 DB에 백업

```sql
create database log_DB;

create table log_DB.member_info
as select * from original_DB.member.info;
```

<img width="522" alt="스크린샷 2023-08-04 오후 5 52 44" src="https://github.com/bokyung124/comento_DB/assets/53086873/cd306c10-d34f-4a51-b62b-6756220fc567">

<br>

3. 원본 테이블 데이터 변경

```sql
delete from member_info 
where start_datetime < str_to_date('20200416', '%Y%m%d');

update member_info set job_code='우주대스타' where mem_name='펭수';
```

<img width="463" alt="스크린샷 2023-08-04 오후 5 54 37" src="https://github.com/bokyung124/comento_DB/assets/53086873/dcb6183d-e0f5-4e1f-8781-b56d9b70ec21">

<br>

4. 데이터 복구

```sql
truncate member_info;

insert into member_info select * from log_DB.member_info;
```

<img width="524" alt="스크린샷 2023-08-04 오후 5 55 26" src="https://github.com/bokyung124/comento_DB/assets/53086873/4aa2b99e-653a-4697-beef-36d302d5857c">