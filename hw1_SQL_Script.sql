--Первая часть.

--Таблица employees

--1) Создать таблицу employees
-- - id. serial,  primary key,
-- - employee_name. Varchar(50), not null
create table employees (
	id serial primary key,
	employee_name varchar(50) not null
)

--2) Наполнить таблицу employee 70 строками.
insert into employees (id, employee_name)
	select generate_series(1,70) AS id, md5(random()::text) AS employee_name
	
--Таблица new_salary

--3) Создать таблицу new_salary
-- - id. Serial  primary key,
-- - monthly_salary. Int, not null	
create table new_salary (
	id serial primary key,
	monthly_salary int not null
)

--4) Наполнить таблицу new_salary 16 строками: - 1000, - 1100, - 1200, - 1300, - 1400, - 1500, - 1600,
-- - 1700, - 1800, - 1900, - 2000, - 2100, - 2200, - 2300, - 2400, - 2500
insert into new_salary (monthly_salary)
values (1000), (1100), (1200), (1300), (1400), (1500), (1600), (1700), 
		(1800), (1900), (2000), (2100), (2200), (2300), (2400), (2500)

--Таблица employee_salary

--5) Создать таблицу employee_salary
-- - id. Serial  primary key,
-- - employee_id. Int, not null, unique
-- - salary_id. Int, not null
create table employee_salary (
	id serial primary key,
	employee_id int not null unique,
	salary_id int not null
)

--6) Наполнить таблицу employee_salary 40 строками:
-- - в 10 строк из 40 вставить несуществующие employee_id
insert into employee_salary (id, employee_id, salary_id)
	values  (1, 8, 7),(2, 1, 4),(3, 5, 9),(4, 40, 13),(5, 23, 4),(6, 11, 3),(7, 52, 10),(8, 15, 13),(9, 26, 4),(10, 16, 1),
			(11, 33, 7),(12, 24, 7),(13, 70, 16),(14, 67, 8),(15, 41, 6),(16, 43, 9),(17, 56, 1),(18, 14, 5),(19, 39, 5),(20, 6, 7),
			(21, 46, 2),(22, 34, 3),(23, 4, 14),(24, 7, 5),(25, 38, 8),(26, 22, 6),(27, 62, 10),(28, 50, 12),(29, 36, 5),(30, 69, 7),
			(31, 79, 2),(32, 72, 16),(33, 87, 11),(34, 92, 4),(35, 86, 11),(36, 78, 8),(37, 82, 5),(38, 100, 8),(39, 99, 15),(40, 88, 11)

--Таблица roles

--7) Создать таблицу new_roles
-- - id. Serial  primary key,
-- - role_name. int, not null, unique
create table new_roles (
	id serial primary key,
	role_name int not null unique
)

--8)Поменять тип столба role_name с int на varchar(30)
ALTER table new_roles alter column role_name type varchar(30)
			
--9) Наполнить таблицу roles 20 строками:
insert into new_roles (role_name)
	values  ('Junior Python developer'),('Middle Python developer'),('Senior Python developer'),
			('Junior Java developer'),('Middle Java developer'),('Senior Java developer'),
			('Junior JavaScript developer'),('Middle JavaScript developer'),('Senior JavaScript developer'),
			('Junior Manual QA engineer'),('Middle Manual QA engineer'),('Senior Manual QA engineer'),
			('Progect Manager'),('Designer'),('HR'),('CEO'),('Sales manager'),
			('Junior Automation QA engineer'),('Middle Automation QA engineer'),('Senior Automation QA engineer')

--Таблица roles_employee

--10) Создать таблицу roles_employee
-- - id. Serial  primary key,
-- - employee_id. Int, not null, unique (внешний ключ для таблицы employees, поле id)
-- - role_id. Int, not null (внешний ключ для таблицы new_roles, поле id)
create table roles_employee (
	id serial primary key,
	employee_id int not null unique, 
	role_id int not null,
	foreign key (employee_id)
		references employees (id),
	foreign key (role_id)
		references new_roles (id)
)
			
--11) Наполнить таблицу roles_employee 40 строками:	
insert into roles_employee (id, employee_id, role_id)
	values  (1, 33, 16),(2, 41, 8),(3, 57, 10),(4, 17, 3),(5, 2, 4),(6, 26, 4),(7, 12, 1),(8, 32, 3),(9, 61, 18),(10, 38, 16),
			(11, 67, 13),(12, 69, 15),(13, 30, 17),(14, 58, 20),(15, 14, 6),(16, 8, 19),(17, 24, 10),(18, 3, 9),(19, 19, 14),(20, 59, 2),
			(21, 22, 1),(22, 23, 19),(23, 56, 5),(24, 10, 13),(25, 70, 10),(26, 35, 10),(27, 43, 17),(28, 18, 16),(29, 31, 19),(30, 51, 11),
			(31, 20, 14),(32, 52, 9),(33, 68, 1),(34, 63, 9),(35, 64, 9),(36, 34, 20),(37, 28, 13),(38, 66, 20),(39, 46, 10),(40, 9, 7)	
			
