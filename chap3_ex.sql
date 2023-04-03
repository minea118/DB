/*(1) 도서번호가 1인 도서의 이름*/
	SELECT bookname FROM Book WHERE bookid=1;
/*(2) 가격이 20,000원 이상인 도서의 이름*/
	SELECT bookname FROM Book WHERE price >= 20000;
/*(3) 박지성의 총 구매액*/
	SELECT SUM(saleprice) 
	FROM Customer, Orders 
	WHERE Customer.custid=Orders.custid 
		AND Customer.name LIKE '박지성';
/*(4) 박지성이 구매한 도서의 수*/
	SELECT COUNT(*) FROM Customer, Orders 
	WHERE Customer.custid=Orders.custid 
         	AND Customer.name LIKE '박지성';
/*(5) 박지성이 구매한 도서의 출판사 수*/
	SELECT COUNT(DISTINCT publisher) 
	FROM Customer, Orders, Book 
	WHERE Customer.custid=Orders.custid AND Orders.bookid=Book.bookid
	         AND Customer.name LIKE '박지성';
/*(6) 박지성이 구매한 도서의 이름, 가격, 정가와 판매가격의 차이*/
	SELECT bookname, price, price-saleprice 
	FROM Customer, Orders, Book 
	WHERE Customer.custid=Orders.custid AND Orders.bookid=Book.bookid
         	AND Customer.name LIKE '박지성';
/*(7) 박지성이 구매하지 않은 도서의 이름*/
	SELECT bookname FROM Book b1
	WHERE NOT EXISTS 
	    (SELECT bookname FROM Customer, Orders
	     WHERE Customer.custid=Orders.custid AND Orders.bookid=b1.bookid
	              AND Customer.name LIKE '박지성');
/*	(다른 답)
	select bookname from book b1
	minus
	select bookname from customer c, orders o, book b
	     where c.custid=o.custid and o.bookid=b.bookid
	        and c.name like '박지성';*/