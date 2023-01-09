DROP PROCEDURE IF EXISTS get_types(varchar(50));
CREATE OR REPLACE PROCEDURE get_types(type_arg varchar(50))
LANGUAGE 'plpgsql'
AS $$
DECLARE record_name wonder_of_world.name_of_wonder%TYPE;
DECLARE record_wonder wonder_of_world.type_of_wonder%TYPE;

BEGIN
    SELECT name_of_wonder, type_of_wonder into record_name, record_wonder FROM wonder_of_world WHERE type_of_wonder = type_arg;
    RAISE INFO 'Name of world: %,  Type of wonder: %', TRIM(record_name), TRIM(record_wonder);
END;
$$;
-- Виклик процедури
CALL get_types('Civil');