-----Create View-----

CREATE VIEW hr.emp_info
AS
SELECT
    c.id candidate_id,
    c.fullname candidate_name,
    e.id employee_id,
    e.fullname employee_name
FROM
    hr.candidates c
INNER JOIN hr.employees e 
        ON e.fullname = c.fullname;

---make use of already created view----
SELECT * FROM hr.emp_info;
