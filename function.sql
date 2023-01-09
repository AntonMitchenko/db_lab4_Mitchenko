--функція get_type(type_arg), яка виводить усі чуда світу з даним типом 

DROP FUNCTION IF EXISTS get_type(varchar); 
CREATE OR REPLACE FUNCTION get_type(type_arg varchar) 
    RETURNS TABLE (name_wonder varchar, typese varchar)
    LANGUAGE 'plpgsql'
AS $$
BEGIN
    RETURN QUERY
        SELECT name_of_wonder::varchar, type_of_wonder::varchar
		FROM wonder_of_world
		WHERE type_of_wonder = type_arg;
END;
$$
-- Виклик функції
SELECT * FROM get_type('Ancient');
-- Другий варіант виклику
SELECT get_type('Valve');

select * from wonder_of_world