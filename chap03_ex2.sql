/*(1) ���缭�� ������ �� ����*/
	SELECT count(*) FROM Book;
/*(2) ���缭���� ������ ����ϴ� ���ǻ��� �� ����*/
	SELECT COUNT(DISTINCT publisher)
	FROM Book
/*(3) ��� ���� �̸�, �ּ�*/
	SELECT name, address
	FROM Customer
/*(4) 2014�� 7�� 4��~7�� 7�� ���̿� �ֹ����� ������ �ֹ���ȣ*/
	SELECT *
	FROM Orders
	WHERE orderdate BETWEEN '20140704' AND '20140707'
/*(5) 2014�� 7�� 4��~7�� 7�� ���̿� �ֹ����� ������ ������ ������ �ֹ���ȣ*/
	SELECT *
	FROM Orders
	where orderdate between TO_DATE('20140701','yyyymmdd') and 
    TO_DATE('20140704','yyyymmdd');	
/*(6) ���� ���衯 ���� ���� �̸��� �ּ�*/
	SELECT name, address
	FROM Customer
	WHERE name LIKE '��%'
/*(7) ���� ���衯 ���̰� �̸��� ���ơ��� ������ ���� �̸��� �ּ�*/
	SELECT name, address
	FROM Customer
	WHERE name LIKE '��%��'
/*(8) �ֹ����� ���� ���� �̸�(�μ����� ���)*/
	SELECT name FROM Customer
	WHERE name NOT IN 
		(SELECT name
		FROM Customer, Orders
		WHERE Customer.custid=Orders.custid);
/*(9) �ֹ� �ݾ��� �Ѿװ� �ֹ��� ��� �ݾ�*/
	SELECT SUM(saleprice), AVG(saleprice)
	FROM Orders
/*(10) ���� �̸��� ���� ���ž�*/
	SELECT name, SUM(saleprice)
	FROM Customer, Orders
	WHERE Customer.custid=Orders.custid
	GROUP BY name;
/*(11) ���� �̸��� ���� ������ ���� ���*/
	SELECT name, Book.bookname
	FROM Customer, Orders, Book
	WHERE Customer.custid=Orders.custid 
	        AND Orders.bookid=Book.bookid
/*(12) ������ ����(Book ���̺�)�� �ǸŰ���(Orders ���̺�)�� ���̰� ���� ���� �ֹ�*/
	SELECT *
	FROM Book, Orders
	WHERE Book.bookid=Orders.bookid
	      AND price-saleprice=
		(SELECT MAX(price-saleprice) 
		 FROM Book, Orders
	         WHERE Book.bookid=Orders.bookid);
/*(13) ������ �Ǹž� ��պ��� �ڽ��� ���ž� ����� �� ���� ���� �̸�*/
	SELECT name, AVG(saleprice) 
	FROM Customer, Orders
	WHERE Customer.custid=Orders.custid
	GROUP BY name 
	HAVING AVG(saleprice) > 
	          (SELECT AVG(saleprice) FROM Orders); 