------User Defined functions(Scalar function) -----
create schema sales;

CREATE TABLE sales.order_items(
	order_id INT,
	item_id INT,
	product_id INT NOT NULL,
	quantity INT NOT NULL,
	list_price DECIMAL (10, 2) NOT NULL,
	discount DECIMAL (4, 2) NOT NULL DEFAULT 0,
);

INSERT INTO 
    sales.order_items(product_id, quantity, list_price, discount)
VALUES
    (3,45,30,0.25);

select * from sales.order_items;

CREATE FUNCTION sales.udfNetSale(
    @quantity INT,
    @list_price DEC(10,2),
    @discount DEC(4,2)
)
RETURNS DEC(10,2)
AS 
BEGIN
    RETURN @quantity * @list_price * (1 - @discount);
END;


------calling scalar function-----

SELECT 
    sales.udfNetSale(10,100,0.1) net_sale;


SELECT 
    product_id, 
    SUM(sales.udfNetSale(quantity, list_price, discount)) net_amount
FROM 
    sales.order_items
GROUP BY 
    product_id
ORDER BY
    net_amount DESC;

