/*(1) ������ȣ�� 1�� ������ �̸�*/
	SELECT bookname FROM Book WHERE bookid=1;
/*(2) ������ 20,000�� �̻��� ������ �̸�*/
	SELECT bookname FROM Book WHERE price >= 20000;
/*(3) �������� �� ���ž�*/
	SELECT SUM(saleprice) 
	FROM Customer, Orders 
	WHERE Customer.custid=Orders.custid 
		AND Customer.name LIKE '������';
/*(4) �������� ������ ������ ��*/
	SELECT COUNT(*) FROM Customer, Orders 
	WHERE Customer.custid=Orders.custid 
         	AND Customer.name LIKE '������';
/*(5) �������� ������ ������ ���ǻ� ��*/
	SELECT COUNT(DISTINCT publisher) 
	FROM Customer, Orders, Book 
	WHERE Customer.custid=Orders.custid AND Orders.bookid=Book.bookid
	         AND Customer.name LIKE '������';
/*(6) �������� ������ ������ �̸�, ����, ������ �ǸŰ����� ����*/
	SELECT bookname, price, price-saleprice 
	FROM Customer, Orders, Book 
	WHERE Customer.custid=Orders.custid AND Orders.bookid=Book.bookid
         	AND Customer.name LIKE '������';
/*(7) �������� �������� ���� ������ �̸�*/
	SELECT bookname FROM Book b1
	WHERE NOT EXISTS 
	    (SELECT bookname FROM Customer, Orders
	     WHERE Customer.custid=Orders.custid AND Orders.bookid=b1.bookid
	              AND Customer.name LIKE '������');
/*	(�ٸ� ��)
	select bookname from book b1
	minus
	select bookname from customer c, orders o, book b
	     where c.custid=o.custid and o.bookid=b.bookid
	        and c.name like '������';*/