select str_to_date(birthdate,'%Y/%m/%d') from employee;
describe employee;
ALTER TABLE employee ADD sdate DATE AS (STR_TO_DATE(birthdate, '%Y-%m-%d'));
ALTER TABLE employee ADD newdate DATE AS (STR_TO_DATE(hire_date, '%Y-%m-%d'));
select * from employee;
describe employee;
ALTER TABLE employee rename column sdate to birth_date;
ALTER TABLE employee drop column sdate;