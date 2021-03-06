/****** Script for SelectTopNRows command from SSMS  ******/

--- What was the popular theme by year in terms of sets released in the 21st Century
select Century, [year] ,themes_name , total_set_num
      
from	 ( select  Century,  [year], themes_name,
          count([set_num]) as  total_set_num,
          ROW_NUMBER() over(partition by [year] order by count([set_num])desc ) rn

	    from [dbo].[test3]

		where Century = '21st Century'
		group by  [year], themes_name, Century

	)k

	where rn = 1
    order by year desc



	select year, theme_name, total_set_num
from (
	select year, theme_name, 
	count(set_num) total_set_num, 
	ROW_NUMBER() OVER (partition by year order by count(set_num) desc) rn

	from analytics
	where Century = '21st_Century'
		--and parent_theme_name is not null
	group by year, theme_name
     )g
where rn = 1	
order by year desc



  SELECT *
  FROM [dbo].[analytics]

  select * from [dbo].[test3]

  