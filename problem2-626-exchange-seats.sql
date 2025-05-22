--case statement
select
     case
        when id%2=1 and id < (select max(id) from seat) then id + 1
        when id%2=0 then id-1
     else
        id
    END AS id,
    student
from
    seat
order by id

--self join
SELECT
  s1.id,
  COALESCE(s2.student, s1.student) AS student
FROM Seat s1
LEFT JOIN Seat s2
  ON (
    (s1.id % 2 = 1 AND s2.id = s1.id + 1) OR
    (s1.id % 2 = 0 AND s2.id = s1.id - 1)
  )
ORDER BY s1.id;

--window function lead,lag
SELECT
  id,
  case
     when id%2=1 and id < (select max(id) from seat) then lead(student) over(order by id)
     when id%2=0 then lag(student) over(order by id)
     else student
   END as student
FROM Seat
ORDER BY id

--bitwise operator
SELECT
  s1.id,
  coalesce(s2.student,s1.student) as student
FROM Seat s1
left join Seat s2
on (s1.id +1)^1-1=s2.id
ORDER BY id
