/*01-1 도서번호가 1인 도서의 이름*/
	SELECT bookname FROM Book WHERE bookid=1;
/*01-2 가격이 20,000원 이상인 도서의 이름*/
	SELECT bookname FROM Book WHERE price >= 20000;
/*01-3 박지성의 총 구매액*/
	SELECT SUM(saleprice) 
	FROM Customer, Orders 
	WHERE Customer.custid=Orders.custid 
		AND Customer.name LIKE '박지성';
/*01-4 박지성이 구매한 도서의 수*/
	SELECT COUNT(*) FROM Customer, Orders 
	WHERE Customer.custid=Orders.custid 
         	AND Customer.name LIKE '박지성';
/*01-5 박지성이 구배한 도허의 출판사 수*/
SELECT COUNT(DISTINCT publisher) 
FROM Customer, Orders, Book 
WHERE Customer.custid=Orders.custid AND Orders.bookid=Book.bookid
	         AND Customer.name LIKE '박지성';

/*01-6 박지성이 구매한 도서의 이름,가격,정가와 판매가격의 차이*/
SELECT bookname, price, saleprice, price-saleprice
FROM Customer, Orders, Book 
WHERE Customer.custid=Orders.custid AND Orders.bookid=Book.bookid
         	AND Customer.name LIKE '박지성';
            
/*01-7 박지성이 구매하지 않은 도서의 이름*/
select bookname
from book b1
where not exists
      (select bookname 
       from customer, orders 
       where customer.custid=orders.custid and orders.bookid=b1.bookid
            and customer.name like '박지성');
/*	(다른 답)
	select bookname from book b1
	minus
	select bookname from customer c, orders o, book b
	     where c.custid=o.custid and o.bookid=b.bookid
	        and c.name like '박지성';*/
		
	
/*ch03. ex1-5*/
select count(distinct publisher)
from customer, orders,book
where customer.custid=orders.custid 
    and orders.bookid=book.bookid 
    and customer.name like '박지성';
    
/*cho3. ex1-6*/
select bookname,price,price-saleprice
from customer, orders,book
where customer.custid=orders.custid 
    and orders.bookid=book.bookid 
    and customer.name like '박지성';
    
/*cho3. ex1-7*/
select bookname
from book
where not exists (
        select bookname
        from customer,orders
        where customer.custid=orders.custid 
                and orders.bookid=book.bookid 
                and customer.name like '박지성');
                
