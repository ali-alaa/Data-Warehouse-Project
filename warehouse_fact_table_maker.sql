/****** Script for SelectTopNRows command from SSMS  ******/
SELECT t.[Warehouse ID],t.[Order number],
case when s.prod_num is null then t.[product number] else s.prod_num end as [Product number],
t.[Quantity ordered],t.[Time to inspected],t.[Time to passed],
t.[Time to authorized],t.[Time to boxed],t.[Time to inventory]
  , case when s.[product quantity] is null then t.[quantity ordered]*5 else s.[product quantity] end as [Product quantity] 
  , case when s.[min_order_quantity] is null then floor(t.[quantity ordered]/3) else s.[min_order_quantity] end as [Minumum product quantity]
  into [warehouse fact table 2]
  FROM [Data Marts].[dbo].[warehouse_inventory_dim] s
  right join [Data Marts].[dbo].[warehouse_fact_table] t
  on s.warehouse_ID = t.[warehouse ID]
  and s.prod_num = t.[product number]
  
  --and s.prod_num in (select prod_num from [warehouse_inventory_dim] where prod_num is not null)
  

