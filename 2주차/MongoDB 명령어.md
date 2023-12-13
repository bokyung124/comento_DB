## MongoDB

- 대표적인 NoSQL 데이터베이스 중 하나로, 문서 지향적(Document-oriented) 
- 테이블 구조가 아닌 BSON(Binary JSON) 형태의 문서로 데이터를 저장하며, 이를 통해 데이터의 유연한 저장과 빠른 접근이 가능하게 됨

<br>

- **Document**
    - MongoDB에서의 기본 데이터 단위로, JSON과 비슷한 형태의 BSON(Binary JSON) 형식으로 데이터 저장
    - 한 문서는 여러 개의 key-value 쌍으로 구성되며, 이는 관계형 데이터베이스의 레코드(행)에 해당함
- **Collection**
    - MongoDB에서는 관련된 문서들을 모아서 Collection으로 관리
    - 관계형 데이터베이스의 테이블에 대응됨
    - 하지만, Collection은 스키마를 미리 정의하지 않아도 되므로 동일한 Collection 내의 문서들은 서로 다른 구조를 가질 수 있음
- **Database**
    - 여러 개의 Collection을 모아서 Database로 관리
    - 관계형 데이터베이스의 데이터베이스 개념과 비슷함

<br>

- 장점
    - 유연한 데이터 모델링, 확장성, 빠른 읽기/쓰기 성능
    - 대규모 데이터를 다루거나, 빠르게 변화하는 스키마를 가진 애플리케이션 개발에 유용

- 하지만, 트랜잭션 처리나 조인 연산 등의 복잡한 연산을 필요로 하는 경우에는 관계형 데이터베이스가 더 적합할 수 있음

## DB level

- `show dbs` : DB 목록 보기
- `use [DB 이름]` : DB 이동
- `db.stats()` : DB 전체 통계 정보 보기
- `show collections` : 컬렉션 보기

## DDL / Collection

- `db.createCollection("cc")` : 테이블 생성
- `db.createCollection("cc", {cappted:true, size:1024})` : 고정 사이즈 테이블 생성
- `db.cc.isCapped()` : 테이블 옵션 보기
- `db.cc.count()` : 문서 수 보기
- `db.cc.drop()` : 컬렉션 삭제
- `db.cc.stats()` : 컬렉션 통계 정보 보기
- `db.cc.renameCollection("ccc")` : 컬렉션 이름 변경
- `db.table.updateMany({}, {$set: {join_date: new Date()}})` : 필드 추가 (수동)
    - `ALTER TABLE table ADD COLUMN join_date DATETIME`
- `db.table.updateMany({}, {$unset: {"join_date": ""}})` : 필드 삭제 (수동)
    - `ALTER TABLE table DROP COLUMN join_date`

## DML / CRUD

### insert

```sql
-- 단 건 삽입
db.collection_name.insertone(
    {}
)

-- 다수 건 삽입
db.collection_name.insertMany(
    [
        {},
        {}
    ]
)

-- 다수 건, 날짜 삽입
db.coct5.insertMany(
    [
        {"SN":"sn01", "no":1},
        {"SN":"sn02", "no":2},
        {"SN":"sn03", "no":3, "reg_dttm":new Date()}
    ]
)
```

### read

```sql
-- 전체 문서 조회
db.getCollection('coct1').find({})
db.coct1.find()

-- 하나만 조회
db.employees.findOne()

-- 리스트로 조회
db.employees.find()

-- 컬럼 지정
db.people.find({ },{ user_id: 1, status: 1, _id: 0 })

-- where절 - and
db.people.find({ status: "A", age: 50 })

-- where절 - or
db.people.find({ $or:[{status:"A"},{age:50}]})

-- = 검색 : eq
db.employees.findOne(
    {user_id:{$eq:"bcd001"}}
)

-- != 검색 : ne
db.employees.find(
    {user_id:{$ne:"bcd001"}}
)

-- > 검색 : gt
-- >= 검색 : gte
-- < 검색 : lt
-- <= 검색: lte

-- between 검색
db.coct4.find(
    {no:{$gte:2, $lte:4}}
)

-- count(*)
db.people.find( { age: { $gt: 30 } } ).count()
```

### update

```sql
-- 단 건 업데이트
db.employees.updateOne()

-- 다 건 업데이트
db.employees.updateMany()

-- equal 업데이트
db.employees.updateMany(
    {statis:{$ne:"A"}},
    {$set:{statis:"A"}}
)
```

### delete

- `db.employees.deleteOne()` : 단 건 삭제
- `db.employees.deleteMany({})` : 다 건 삭제
- `db.coct1.deleteMany(no:{$gt:30}})` : 검색해서 삭제