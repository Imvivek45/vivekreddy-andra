/* 
Find all numbers that appear at least three times consecutively.
*/

select distinct ConsecutiveNums from (
select 
case when num = num1 and num = num2 then num else null end as ConsecutiveNums
from (

select id, 
num, 
lag(num) over( order by id ) as num1,
lag(num , 2) over( order by id ) as num2
 from logs
 ) a
 where 
 case when num = num1 and num = num2 then num else null end is not null 
) b ;

