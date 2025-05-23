--case statement
SELECT
    id,
    CASE
        WHEN p_id IS NULL THEN 'Root'
        WHEN id NOT IN (SELECT DISTINCT p_id FROM Tree WHERE p_id IS NOT NULL) then 'Leaf'
        ELSE 'Inner'
    END AS type
FROM Tree;

--if condition
SELECT
    id,
    IF(P_id is null,'Root',IF(id not in (select distinct p_id from Tree where p_id is not null),'Leaf','Inner')) AS type
FROM Tree;

--union

SELECT
    id,
    'Root' AS type
FROM Tree
where p_id is null

union

SELECT
    id,
    'Leaf' AS type
FROM Tree
where id not in (select distinct p_id from Tree where p_id is not null) and p_id is not null

union

SELECT
    id,
    'Inner' AS type
FROM Tree
where id in (select distinct p_id from Tree) and p_id is not null