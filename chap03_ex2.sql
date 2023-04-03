/*(1) 마당서점 도서의 총 개수*/
	SELECT count(*) FROM Book;
/*(2) 마당서점에 도서를 출고하는 출판사의 총 개수*/
	SELECT COUNT(DISTINCT publisher)
	FROM Book
/*(3) 모든 고객의 이름, 주소*/
	SELECT name, address
	FROM Customer
/*(4) 2014년 7월 4일~7월 7일 사이에 주문받은 도서의 주문번호*/
	SELECT *
	FROM Orders
	WHERE orderdate BETWEEN '20140704' AND '20140707'
/*(5) 2014년 7월 4일~7월 7일 사이에 주문받은 도서를 제외한 도서의 주문번호*/
	SELECT *
	FROM Orders
	where orderdate between TO_DATE('20140701','yyyymmdd') and 
    TO_DATE('20140704','yyyymmdd');	
/*(6) 성이 ‘김’ 씨인 고객의 이름과 주소*/
	SELECT name, address
	FROM Customer
	WHERE name LIKE '김%'
/*(7) 성이 ‘김’ 씨이고 이름이 ‘아’로 끝나는 고객의 이름과 주소*/
	SELECT name, address
	FROM Customer
	WHERE name LIKE '김%아'
/*(8) 주문하지 않은 고객의 이름(부속질의 사용)*/
	SELECT name FROM Customer
	WHERE name NOT IN 
		(SELECT name
		FROM Customer, Orders
		WHERE Customer.custid=Orders.custid);
/*(9) 주문 금액의 총액과 주문의 평균 금액*/
	SELECT SUM(saleprice), AVG(saleprice)
	FROM Orders
/*(10) 고객의 이름과 고객별 구매액*/
	SELECT name, SUM(saleprice)
	FROM Customer, Orders
	WHERE Customer.custid=Orders.custid
	GROUP BY name;
/*(11) 고객의 이름과 고객이 구매한 도서 목록*/
	SELECT name, Book.bookname
	FROM Customer, Orders, Book
	WHERE Customer.custid=Orders.custid 
	        AND Orders.bookid=Book.bookid
/*(12) 도서의 가격(Book 테이블)과 판매가격(Orders 테이블)의 차이가 가장 많은 주문*/
	SELECT *
	FROM Book, Orders
	WHERE Book.bookid=Orders.bookid
	      AND price-saleprice=
		(SELECT MAX(price-saleprice) 
		 FROM Book, Orders
	         WHERE Book.bookid=Orders.bookid);
/*(13) 도서의 판매액 평균보다 자신의 구매액 평균이 더 높은 고객의 이름*/
	SELECT name, AVG(saleprice) 
	FROM Customer, Orders
	WHERE Customer.custid=Orders.custid
	GROUP BY name 
	HAVING AVG(saleprice) > 
	          (SELECT AVG(saleprice) FROM Orders); 