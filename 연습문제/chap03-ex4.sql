select * from book;

/*04-1*/
insert into book 
values(11,'����������','���ѹ̵��',10000);

/*04-2*/
delete from book
where publisher like '�Ｚ��';

rollback;

/*04-3*/
/*04-4*/
update book
set publisher='�������ǻ�'
where publisher like '���ѹ̵��';

/*04-5*/
create table bookcompany(name varchar(20) primary key,
                        address varchar(20),
                        begin date);
                        
/*04-6*/  
alter table bookcompany add webaddress varchar2(30);

/*04-7*/
insert into bookcompany
VALUES ('�Ѻ���ī����','����� ������','1993-01-01','http://hanbit,co,kr');

select * from bookcompany;


