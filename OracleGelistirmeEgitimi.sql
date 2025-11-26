-- Maaşı 10.000’den yüksek olan çalışanları listeler ve maaşa göre sıralar

SELECT first_name, last_name, salary
FROM hr.employees
WHERE salary > 10000
ORDER BY salary DESC;


-- IT departmanında çalışanların isimlerini ve departman adını getirir

SELECT e.first_name, e.last_name, d.department_name
FROM hr.employees e
JOIN hr.departments d ON e.department_id = d.department_id
WHERE d.department_name = 'IT';



-- Departman bazında çalışan sayısı ve ortalama maaşı gösterir, ortalama maaşa göre sıralar

SELECT department_id, COUNT(*) AS total_employees, AVG(salary) AS avg_salary
FROM hr.employees
GROUP BY department_id
ORDER BY avg_salary DESC;


-- Ortalama maaşın üstünde maaş alan çalışanları getirir

SELECT first_name, last_name, salary
FROM hr.employees
WHERE salary > (
    SELECT AVG(salary) 
    FROM hr.employees
);


-- En yüksek maaş alan çalışan

SELECT first_name, last_name, salary
FROM hr.employees
WHERE salary = (
    SELECT MAX(salary) 
    FROM hr.employees
);


-- Departman başına en yüksek maaş

SELECT department_id, MAX(salary) AS max_salary
FROM hr.employees
GROUP BY department_id
ORDER BY max_salary DESC;


--  Çalışan ve iş bilgisi

SELECT e.first_name, e.last_name, j.job_title
FROM hr.employees e
JOIN hr.jobs j ON e.job_id = j.job_id
ORDER BY e.last_name;


-- Maaşı belirli aralıkta olan çalışanlar

SELECT first_name, last_name, salary
FROM hr.employees
WHERE salary BETWEEN 5000 AND 10000
ORDER BY salary;


--  Belirli şehirde çalışanlar

SELECT e.first_name, e.last_name, l.city
FROM hr.employees e
JOIN hr.departments d ON e.department_id = d.department_id
JOIN hr.locations l ON d.location_id = l.location_id
WHERE l.city = 'London';


--  Çalışan sayısına göre departmanlar

SELECT d.department_name, COUNT(e.employee_id) AS num_employees
FROM hr.departments d
LEFT JOIN hr.employees e ON d.department_id = e.department_id
GROUP BY d.department_name
ORDER BY num_employees DESC;


-- Belirli pozisyondaki çalışanlar

SELECT first_name, last_name, job_id
FROM hr.employees
WHERE job_id = 'IT_PROG';


-- Departman ve maaş aralığı

SELECT d.department_name, e.first_name, e.last_name, e.salary
FROM hr.employees e
JOIN hr.departments d ON e.department_id = d.department_id
WHERE e.salary > 8000
ORDER BY d.department_name, e.salary DESC;


-- Toplam maaş ve ortalama maaş

SELECT SUM(salary) AS total_salary, AVG(salary) AS average_salary
FROM hr.employees;


--  Çalışanların başlangıç tarihine göre sıralama

SELECT first_name, last_name, hire_date
FROM hr.employees
ORDER BY hire_date ASC;


--  Birden fazla kriter ile filtreleme

SELECT first_name, last_name, salary, job_id
FROM hr.employees
WHERE salary > 6000 AND job_id = 'SA_REP';


-- Departman ve lokasyon bilgisi

SELECT d.department_name, l.city, l.country_id
FROM hr.departments d
JOIN hr.locations l ON d.location_id = l.location_id
ORDER BY d.department_name;


-- Çalışan ve yöneticisi

SELECT e.first_name || ' ' || e.last_name AS employee_name,
       m.first_name || ' ' || m.last_name AS manager_name
FROM hr.employees e
LEFT JOIN hr.employees m ON e.manager_id = m.employee_id
ORDER BY e.last_name;


-- İş başlığına göre maaş ortalaması

SELECT job_id, AVG(salary) AS avg_salary
FROM hr.employees
GROUP BY job_id
ORDER BY avg_salary DESC;


--  Departman bazlı toplam maaş

SELECT department_id, SUM(salary) AS total_salary
FROM hr.employees
GROUP BY department_id
ORDER BY total_salary DESC;


--  Çalışan ismine göre arama

SELECT first_name, last_name, job_id, salary
FROM hr.employees
WHERE first_name = 'Steven';
