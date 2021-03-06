/****** Script for SelectTopNRows command from SSMS  ******/
SELECT [Warehouse ID]
      ,[Retail Order ID]
      ,[Shipping ID]
      ,[Quantity Ordered]
	  ,s.[Product Number]
      ,[Days to Ship Product]
  FROM [Data Marts].[dbo].[retail order fact table] s
  inner join (select min([Days to ship product]) as [Quick ship] 
				from [retail order fact table]) dt
on dt.[Quick ship] = s.[Days to Ship Product]
order by [Warehouse ID]

SELECT [Warehouse ID]
      ,[Retail Order ID]
      ,[Shipping ID]
      ,[Quantity Ordered]
	  ,s.[Product Number]
      ,[Days to Ship Product]
  FROM [Data Marts].[dbo].[retail order fact table] s
  inner join (select max([Days to ship product]) as [Quick ship] 
				from [retail order fact table]) dt
on dt.[Quick ship] = s.[Days to Ship Product]
order by [Warehouse ID]