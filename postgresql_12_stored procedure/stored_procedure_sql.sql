CREATE TABLE department (id INT NOT NULL PRIMARY KEY, codename VARCHAR(45));

INSERT INTO department
	VALUES(1, 'TRP-QC');
INSERT INTO department
	VALUES(2, 'SUJI-TOSHI');
INSERT INTO department
	VALUES(3, 'PPAP');
INSERT INTO department
	VALUES(4, 'TRP-IN HOUSE');
	
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

create or replace procedure add_codename(_id int, _codename VARCHAR(45))
language plpgsql
as $$
	begin
		insert into department(id, codename)
		values(_id, _codename);
	end;
$$;

call add_codename(5, 'TRP-OUT HOUSE');

create or replace procedure add_dept_id(_id int, _department_id int)
language plpgsql
as $$
	begin
		insert into supplier(id, department_id)
		values(_id, _department_id);
	end;
$$;

call add_dept_id(6, 3);