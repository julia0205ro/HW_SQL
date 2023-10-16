-- 1. Вывести всех работников чьи зарплаты есть в базе, вместе с зарплатами.
select employee_name, monthly_salary from employees 
join employee_salary on employees.id = employee_salary.id 
join new_salary on new_salary.id = employee_salary.salary_id 

-- 2. Вывести всех работников у которых ЗП меньше 2000.
select employee_name, monthly_salary from employees 
join employee_salary on employees.id = employee_salary.id 
join new_salary on new_salary.id = employee_salary.salary_id 
where monthly_salary < 2000

-- 3. Вывести все зарплатные позиции, но работник по ним не назначен. 
--(ЗП есть, но не понятно кто её получает.)
select distinct new_salary.id, monthly_salary from new_salary
full join employee_salary on new_salary.id = employee_salary.salary_id  
full join employees on employees.id = employee_salary.employee_id
where employee_name is null 

-- 4. Вывести все зарплатные позиции  меньше 2000 но работник по ним не назначен. 
--(ЗП есть, но не понятно кто её получает.)
select distinct new_salary.id, monthly_salary from new_salary
full join employee_salary on new_salary.id = employee_salary.salary_id  
full join employees on employees.id = employee_salary.employee_id
where employee_name is null and monthly_salary < 2000

-- 5. Найти всех работников кому не начислена ЗП.
select employee_name from employees e 
full join employee_salary es on e.id = es.employee_id 
full join new_salary ns on ns.id = es.salary_id 
where monthly_salary is null

-- 6. Вывести всех работников с названиями их должности.
select employee_name, role_name from employees e 
left join roles_employee re on e.id = re.employee_id 
left join new_roles nr on nr.id = re.role_id 

-- 7. Вывести имена и должность только Java разработчиков.
select employee_name, role_name from employees e 
full join roles_employee re on e.id = re.employee_id 
full join new_roles nr on nr.id = re.role_id 
where employee_name is not null and role_name like '%Java developer%'

-- 8. Вывести имена и должность только Python разработчиков.
select employee_name, role_name from employees e 
full join roles_employee re on e.id = re.employee_id 
full join new_roles nr on nr.id = re.role_id 
where employee_name is not null and role_name ilike '%python developer%'

-- 9. Вывести имена и должность всех QA инженеров.
select employee_name, role_name from employees e 
full join roles_employee re on e.id = re.employee_id 
full join new_roles nr on nr.id = re.role_id 
where employee_name is not null and role_name ilike '%qa engineer%'

-- 10. Вывести имена и должность ручных QA инженеров.
select employee_name, role_name from employees e 
full join roles_employee re on e.id = re.employee_id 
full join new_roles nr on nr.id = re.role_id 
where employee_name is not null and role_name ilike '%manual qa engineer%'

-- 11. Вывести имена и должность автоматизаторов QA
select employee_name, role_name from employees e 
full join roles_employee re on e.id = re.employee_id 
full join new_roles nr on nr.id = re.role_id 
where employee_name is not null and role_name ilike '%automation qa engineer%'

-- 12. Вывести имена и зарплаты Junior специалистов
select employee_name, monthly_salary from employees e 
left join employee_salary es on e.id = es.employee_id 
left join new_salary ns on ns.id = es.salary_id 
left join roles_employee re on e.id = re.employee_id 
left join new_roles nr on nr.id = re.role_id 
where role_name ilike '%junior%'

-- 13. Вывести имена и зарплаты Middle специалистов
select employee_name, monthly_salary from employees e 
left join employee_salary es on e.id = es.employee_id 
left join new_salary ns on ns.id = es.salary_id 
left join roles_employee re on e.id = re.employee_id 
left join new_roles nr on nr.id = re.role_id 
where role_name ilike '%middle%'

-- 14. Вывести имена и зарплаты Senior специалистов
select employee_name, monthly_salary from employees e 
left join employee_salary es on e.id = es.employee_id 
left join new_salary ns on ns.id = es.salary_id 
left join roles_employee re on e.id = re.employee_id 
left join new_roles nr on nr.id = re.role_id 
where role_name ilike '%senior%'

-- 15. Вывести зарплаты Java разработчиков
select role_name, monthly_salary from new_salary ns 
full join employee_salary es on ns.id = es.salary_id 
full join roles_employee re on re.employee_id = es.employee_id 
full join new_roles nr on nr.id = re.role_id 
where role_name ilike '%java developer%'

-- 16. Вывести зарплаты Python разработчиков
select role_name, monthly_salary from new_salary ns 
full join employee_salary es on ns.id = es.salary_id 
full join roles_employee re on re.employee_id = es.employee_id 
full join new_roles nr on nr.id = re.role_id 
where role_name ilike '%python developer%'

-- 17. Вывести имена и зарплаты Junior Python разработчиков
select employee_name, monthly_salary from employees e 
left join employee_salary es on e.id = es.employee_id 
left join new_salary ns on ns.id = es.salary_id 
left join roles_employee re on e.id = re.employee_id 
left join new_roles nr on nr.id = re.role_id 
where role_name ilike '%Junior Python developer%'

-- 18. Вывести имена и зарплаты Middle JS разработчиков
select employee_name, monthly_salary from employees e 
left join employee_salary es on e.id = es.employee_id 
left join new_salary ns on ns.id = es.salary_id 
left join roles_employee re on e.id = re.employee_id 
left join new_roles nr on nr.id = re.role_id 
where role_name ilike '%middle javascript developer%'

-- 19. Вывести имена и зарплаты Senior Java разработчиков
select employee_name, monthly_salary from employees e 
left join employee_salary es on e.id = es.employee_id 
left join new_salary ns on ns.id = es.salary_id 
left join roles_employee re on e.id = re.employee_id 
left join new_roles nr on nr.id = re.role_id 
where role_name ilike '%Senior Java developer%'

-- 20. Вывести зарплаты Junior QA инженеров
select role_name, monthly_salary from new_salary ns 
full join employee_salary es on ns.id = es.salary_id 
full join roles_employee re on re.employee_id = es.employee_id 
full join new_roles nr on nr.id = re.role_id 
where role_name ilike '%Junior%QA%engineer%'

-- 21. Вывести среднюю зарплату всех Junior специалистов
-- 22. Вывести сумму зарплат JS разработчиков
-- 23. Вывести минимальную ЗП QA инженеров
-- 24. Вывести максимальную ЗП QA инженеров
-- 25. Вывести количество QA инженеров
-- 26. Вывести количество Middle специалистов.
-- 27. Вывести количество разработчиков
-- 28. Вывести фонд (сумму) зарплаты разработчиков.
-- 29. Вывести имена, должности и ЗП всех специалистов по возрастанию
-- 30. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП от 1700 до 2300
-- 31. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП меньше 2300
-- 32. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП равна 1100, 1500, 2000
