------Indexes-----
------SQL Server Clustered Index and Primary key constraint-----
create schema production;
CREATE TABLE production.part_prices(
    part_id int,
    valid_from date,
    price decimal(18,4) not null,
    PRIMARY KEY(part_id, valid_from) 
);

----This statement defines a primary key ---
alter table sales.order_items
add primary key (quantity);

-----creates a clustered index -----
CREATE CLUSTERED INDEX ix_parts_id
ON production.part_prices (part_id);  

INSERT INTO 
    production.part_prices(part_id, valid_from, price)
VALUES
    (1,GETDATE(),100),
	(2,GETDATE(),200);

SELECT 
    part_id, 
    valid_from,
	price
FROM 
    production.part_prices
WHERE 
    part_id = 2;


