/****** Script for SelectTopNRows command from SSMS  ******/
SELECT distinct s.[Store number]
	  ,s.[Product number]
	  ,p.[Product type],p.[Description]
	  ,dt.highest
  FROM [Data Marts].[dbo].[retail inventory fact table] s
  inner join (select max(i.[Quantity bought]) as highest from [retail inventory fact table] i) dt
 on dt.highest = s.[Quantity bought]
 inner join [product dimension] p 
 on s.[Product number] = p.[Product number]
 order by s.[Store number]
  