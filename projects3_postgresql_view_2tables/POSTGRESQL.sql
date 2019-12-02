CREATE TABLE supplier (id INT NOT NULL PRIMARY KEY, department_id INT, 
	FOREIGN KEY (department_id) REFERENCES department(id));
    
INSERT INTO supplier
	VALUES(1, 2);
    
INSERT INTO supplier
	VALUES(2, 3);
    
INSERT INTO supplier
	VALUES(3, 4);
    
INSERT INTO supplier
	VALUES(4, 1);
    
INSERT INTO supplier
	VALUES(5, 2);
    

SELECT supplier.id, department.codename
	FROM supplier
        INNER JOIN department ON supplier.department_id = department.id;
    
CREATE TABLE department (id INT NOT NULL PRIMARY KEY, codename VARCHAR(45));

INSERT INTO department
	VALUES(1, 'TRP-QC');
INSERT INTO department
	VALUES(2, 'SUJI-TOSHI');
INSERT INTO department
	VALUES(3, 'PPAP');
INSERT INTO department
	VALUES(4, 'TRP-IN HOUSE');
	
CREATE VIEW department_details
as
SELECT
	id,
	codename
from
	supplier
inner join
	department using (id);