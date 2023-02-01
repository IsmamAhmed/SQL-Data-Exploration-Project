-- 1. List the details for all C type orders for the customer named "Charlie" that contained sales for the item "Apples".
	
	select * from Orders O inner join Customer C
	on C.CustId = O.CustId inner join SaleItem SI
	on O.OrderNo = SI.OrderNo inner join Item I
	on SI.ItemId = I.ItemId
	where OrderType = 'C' and CustName = 'Charlie' and ItemDesc = 'Apples'

 -- 2. List the order no. for orders that have been placed in 2014 containing more than 3 sale item entries.

	select O.OrderNo from Orders O inner join SaleItem SI
	on O.OrderNo = SI.OrderNo
	where OrderDate like '%2014%'
	group by O.OrderNo
	having count(*) > 3

--3. List the customers’ details for customers who have placed orders items in the "Fruit" (FR) or "Vegetable" (VG) category in 2015. 
-- Show each customer only once

	select distinct C.* from Customer C inner join Orders O
	on C.CustId = O.CustId inner join SaleItem SI
	on O.OrderNo = SI.OrderNo inner join Item I
	on SI.ItemId = I.ItemId
	where (OrderDate like '%2015%') and ItemCategory in ('FR', 'VG')

-- 4. List the id, description and category of items where the QOH is less than the reorder level.  
-- Sequence by item id within category.

	select ItemId, ItemDesc, ItemCategory from Item 
	where QtyOnhand < ReorderLvl
	Order By ItemCategory, ItemId

-- 5. List the details for the items that have been sold on any order below cost (Where the sale price less than item cost).

	select * from item
	where ItemPrice < ItemCost

 -- 6. List the details for all customers that have ordered items with characters "Bananas" anywhere in its description. 
 --Sequence the orders by order date, most recent first.

	select C.* from Customer C inner join Orders O
	on O.CustId = C.CustId inner join SaleItem SI
	on O.OrderNo = SI.OrderNo inner join Item I
	on I.ItemId = SI.ItemId
	where ItemDesc like '%Bananas%'
	order by OrderDate desc

-- 7. List the maximum quantity on hand for any item in the "Fruit" (FR) category.
	
	select max(QtyOnhand) as max_quantity_on_hand from Item
	where ItemCategory = 'FR'

-- 8. List the total quantity sold for the item with the description "Green Bananas" in Ontario in 2015.
	
	select sum(QtySold) as total_quantity_sold from SaleItem SI inner join Item I
	on I.ItemId = SI.ItemId inner join Orders O
	on SI.OrderNo = O.OrderNo inner join Customer C
	on C.CustId = O.CustId
	where (OrderDate like '%2015%') and (Prov = 'ON') and (ItemDesc = 'Green Bananas') 

-- 9. List the item details for all sold items on "R' type Orders. Sequence the output by item description. 

	select I.* from Item I inner join SaleItem SI
 	on I.ItemId = SI.ItemId inner join Orders O
	on O.OrderNo = SI.OrderNo
	where (OrderType = 'R') and (QtySold > 0) and (QtySold is not null)
	order by ItemDesc

-- 10. Count the number of times an item in the vegetable (VG) category has appeared on an order in 2015.
	
	select count(ItemCategory) as 'number of times an item in the vegetable category has appeared on an order in 2015' 
	from Item inner join SaleItem
	on Item.ItemId = SaleItem.ItemId inner join Orders
	on Orders.OrderNo = SaleItem.OrderNo
	where (ItemCategory = 'VG') and (OrderDate like '%2015%')

-- 11. Count the number of different item categories represented by sales in Quebec in March 2015.
	
	select ItemCategory, count(*) as item_category_count, sum(QtySold*ItemPrice) as sales from Item inner join SaleItem
	on Item.ItemId = SaleItem.ItemId inner join Orders
	on SaleItem.OrderNo = Orders.OrderNo inner join Customer
	on Customer.CustId = Orders.CustId
	where (Prov = 'QU') and (year(OrderDate) = 2015) and (month(OrderDate) = 03) 
	group by ItemCategory

 -- 12. List the details for the customers that purchased the item "Yellow Bananas" in 2015. 
 --Show each customer only once and sequence alphabetically by customer name
	
	select distinct C.* from Customer C inner join Orders O
	on C.CustId = O.CustId inner join SaleItem SI
	on O.OrderNo = SI.OrderNo inner join Item I
	on I.ItemId = SI.ItemId
	where ItemDesc = 'Yellow Bananas' and OrderDate like '%2015%'
	order by CustName asc

-- 13. List for each item by item id, the highest sale value (sale price * quantity sold) appearing on any order.
	
	select Item.ItemId, max(SalePrice*QtySold) as highest_sale_value from Item inner join SaleItem
	on Item.ItemId = SaleItem.ItemId
	group by Item.ItemId
	order by highest_sale_value

-- 14. Show the total value of sales (sale price * quantity sold) for each item category in 2015. 
--Order the output by greatest value to lowest value
	
	select ItemCategory, sum(SalePrice*QtySold) as total_sales_value from Item inner join SaleItem
	on Item.ItemId = SaleItem.ItemId
	group by ItemCategory
	order by total_sales_value desc

 -- 15. List the customer id for the Ontario customers that have placed 2 or more orders in 2014
	
	select C.CustId, count(O.CustId) as orders_placed from Customer C inner join Orders O
	on C.CustId = O.CustId
	where Prov = 'ON' and OrderDate like '%2014%' 
	group by C.CustId
	having count(O.CustId) >= 2

 -- 16. List in alphabetic sequence by item description the details of any items ordered by the customer named "Brian".  
 --Show each item only once.
	
	select distinct I.* from Item I inner join SaleItem SI
	on I.ItemId = SI.ItemId inner join Orders O
	on SI.OrderNo = O.OrderNo inner join Customer C
	on C.CustId = O.CustId
	where CustName = 'Brian'
	order by ItemDesc asc

--17. List the customer details for those customers who have bought strawberries in 2015 and who reside in either Ontario or Quebec.
	
	select C.* from Customer C inner join Orders O
	on C.CustId = O.CustId inner join SaleItem SI
	on O.OrderNo = SI.OrderNo inner join Item I
	on I.ItemId = SI.ItemId
	where (ItemDesc = 'Strawberries') and (OrderDate like '%2015%') and Prov in ('ON', 'QU') 

--18. Show for each item id the total value (sale price * quantity sold) for each sale item in July 2015 
--where that item appeared on at least 2 orders in that same time period.

	select ItemId, sum(SalePrice*QtySold) as total_value from SaleItem SI inner join Orders O
	on O.OrderNo = SI.OrderNo
	where year(OrderDate) = '2015' and month(OrderDate) = '07'
	group by ItemId
	having count(*) >= 2
	
--19. List the total inventory value (item cost * quantity on hand) for each item in the "VG" category. 
	
	select ItemDesc, sum(ItemCost*QtyOnhand) as total_inventory_value from Item
	where ItemCategory = 'VG'	
	group by ItemDesc

--20. Come up with 3 more select queries using aggregate SUM(), COUNT(), AVG(), MIN(), MAX() 
--that uses GROUP BY, HAVING, ORDER BY of your own showing query and results. 
	
--List the average inventory value for each item in the fruit category where the average inventory value is less than 100. 
--Order the results by item description alphabetically

	select ItemDesc, avg(ItemCost*QtyOnhand) as avg_inventory_value from Item
	where ItemCategory = 'FR'	
	group by ItemDesc
	having sum(ItemCost*QtyOnhand) < 100
	order by ItemDesc asc

--List the maximum inventory value for each item in the vegetable category where the maximum inventory value is less than 50. 
--Order the results by the maximum inventory value from lowest to highest. 

	select ItemDesc, max(ItemCost*QtyOnhand) as max_inventory_value from Item
	where ItemCategory = 'VG'	
	group by ItemDesc
	having max(ItemCost*QtyOnhand) < 50
	order by max_inventory_value asc

--List the minimum inventory value for each item in the fruit category where the minimum inventory value is greater than 50. 
--Order the results by the minimum inventory value from highest to lowest, and then order the item description alphabetically. 

	select ItemDesc, min(ItemCost*QtyOnhand) as min_inventory_value from Item
	where ItemCategory = 'FR'	
	group by ItemDesc
	having min(ItemCost*QtyOnhand) > 50
	order by min_inventory_value desc, ItemDesc 

--21. Write the following commands. I must be able to test run i), ii) and iii) below in sequence.
--21 i). Add a new item in the Item table to the database. 
	
	insert into Item 
	values (18000, 'Bok Choy', 'VG', '4.50', '1.50', 10, 50)

--21 ii). Update the quantity on hand by adding 50 new units (Use a formula. Don't directly hard code the new value).
	
	update Item 
	set QtyOnhand = QtyOnhand + 50
	where ItemDesc = 'Bok Choy'

--21 iii) Delete the item that you inserted into i).

	delete from Item
	where ItemId = 18000