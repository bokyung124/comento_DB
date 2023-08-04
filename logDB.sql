create table cus_log 
as select * from customer limit 0;

alter table cus_log
add constraint primary key(cs_id);

create table pur_log 
as select * from purchase limit 0;

alter table pur_log
add constraint primary key(pc_id);

alter table pur_log
modify pc_id int not null AUTO_INCREMENT;

alter table pur_log
modify column pc_date datetime;