1. 고객, 상품별 이상데이터 검출 프로시저

```sql
delimiter //

create procedure proc_pur()
begin
    declare cs varchar(10);
    declare pd varchar(10);

    select cs_id, pd_id
    into cs, pd
    from purchase
    group by cs_id, pd_id
    having count(1) >= 2;

    insert into pur_log(cs_id, pd_id) values (cs, pd);
end

delimiter ;
```

<img width="457" alt="스크린샷 2023-08-04 오후 2 03 52" src="https://github.com/bokyung124/comento_DB/assets/53086873/68f0ea8b-f841-4e8e-8068-c5894be74c97">

<br>

2. 휴대폰 데이터 형식 이상데이터 검출 프로시저

```sql
delimiter //

create procedure proc_cus()
begin
    declare id     varchar(10);
    declare name   varchar(30);
    declare gender varchar(5);
    declare birth  year;
    declare path   varchar(20);
    declare phone  varchar(23);

    declare endOfRow boolean default FALSE;
    declare cur cursor for
        select * 
        from customer
        where cs_phone not regexp '\\d{3}-\\d{3,4}-\\d{3,4}$';

    declare continue handler
        for not found set endOfRow = TRUE;

    open cur;
    integrity_loop : LOOP
        fetch cur into id, name, gender, birth, path, phone;
        if endOfRow then
            leave integrity_loop;
        end if;

    insert into cus_log values (id, name, gender, birth, path, phone);
    END LOOP integrity_loop;
    close cur;
end

delimiter ;
```

<img width="452" alt="image" src="https://github.com/bokyung124/comento_DB/assets/53086873/0f23f67d-90aa-4a17-9865-7aead6a23cb6">