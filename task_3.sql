========================================================================================
	Создание таблицы со значениями последовательности Падована
========================================================================================

CREATE TABLE task_3
	(Id INT IDENTITY PRIMARY KEY,
 	value INT)
  
INSERT task_3(value) VALUES(1)
INSERT task_3(value) VALUES(1)
INSERT task_3(value) VALUES(1)

DECLARE @i int = 4
WHILE @i < 79
	BEGIN
    	INSERT task_3(value) VALUES(
        (SELECT task_3.value FROM task_3 WHERE task_3.Id = @i - 2) +
        (SELECT task_3.value FROM task_3 WHERE task_3.Id = @i - 3))
        SET @i = @i + 1
	END
    
========================================================================================
	Создание функции получения n-го значения из последовательности Падована
========================================================================================

CREATE FUNCTION get_value(@n int)
	RETURNS int
    BEGIN
    	DECLARE @val int
        SELECT @val = task_3.value FROM task_3 WHERE task_3.Id = @n
        RETURN @val
    END    
        
========================================================================================
	Запуск функции 
	args:
		n (int) - n-ое расположение в последовательности
	return:
		val (int) - значение искомого n-го элемента в последовательности
========================================================================================

SELECT dbo.get_value(10)