```bash
brew install postgresql
brew services start postgresql
psql -U [user] postgres
```

```sql
-- 비밀번호 설정
alter user [user] password [pwd];

-- superuser 설정
alter user [user] superuser;

-- 스키마 표시 생략
set search_path to [user];

-- 3초에 한 번씩 모니터링 하기
\watch 3;
```

<img width="256" alt="스크린샷 2023-08-04 오후 6 00 10" src="https://github.com/bokyung124/comento_DB/assets/53086873/5f92651e-1a1a-448a-828c-522fec66e72a">

<br>

```sql
-- 현재 테이블의 lock 확인
select relation :: regclass, mode, granted, pid, * from pg_locks;
```

<img width="1110" alt="스크린샷 2023-08-04 오후 5 35 27" src="https://github.com/bokyung124/comento_DB/assets/53086873/b82f3108-135b-478b-9ec8-9f05476f1c6e">

<br>

- 특히 `RowExclusiveLock` lock은 해당 테이블에 접근이 지연되어 다른 쿼리에도 영향을 미칠 수 있으므로 반드시 lock을 해제해주어야 함 
- kill
    ```sql
    -- 해당 pid만 중지
    select pg_cancel_backend([pid]);

    -- 해당 pid와 연계된 모든 프로세스 종료
    select pg_terminate_backend([pid]) from pg_stat_activity;
    ```