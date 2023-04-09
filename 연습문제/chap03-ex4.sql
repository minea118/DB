select * from book;

/*04-1*/
insert into book 
values(11,'스포츠세계','대한미디어',10000);

/*04-2*/
delete from book
where publisher like '삼성당';

rollback;

/*04-3*/
/*04-4*/
update book
set publisher='대한출판사'
where publisher like '대한미디어';

/*04-5*/
create table bookcompany(name varchar(20) primary key,
                        address varchar(20),
                        begin date);
                        
/*04-6*/  
alter table bookcompany add webaddress varchar2(30);

/*04-7*/
insert into bookcompany
VALUES ('한빛아카데미','서울시 마포구','1993-01-01','http://hanbit,co,kr');

select * from bookcompany;


