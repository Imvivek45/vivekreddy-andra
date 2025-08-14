/*
Table: Employee

+-------------+------+
| Column Name | Type |
+-------------+------+
| id          | int  |
| salary      | int  |
+-------------+------+
id is the primary key (column with unique values) for this table.
Each row of this table contains information about the salary of an employee.
 

Write a solution to find the nth highest distinct salary from the Employee table. If there are less than n distinct salaries, return null.

The result format is in the following example.

 

Example 1:

Input: 
Employee table:
+----+--------+
| id | salary |
+----+--------+
| 1  | 100    |
| 2  | 200    |
| 3  | 300    |
+----+--------+
n = 2
Output: 
+------------------------+
| getNthHighestSalary(2) |
+------------------------+
| 200                    |
+------------------------+
Example 2:

Input: 
Employee table:
+----+--------+
| id | salary |
+----+--------+
| 1  | 100    |
+----+--------+
n = 2
Output: 
+------------------------+
| getNthHighestSalary(2) |
+------------------------+
| null                   |
+------------------------+
*/

CREATE FUNCTION getNthHighestSalary(N IN NUMBER) RETURN NUMBER IS
result NUMBER;
BEGIN
    /* Write your PL/SQL query statement below */

    RETURN result;
END;


CREATE or REPLACE FUNCTION getNthHighestSalary(N IN NUMBER) RETURN NUMBER IS
result varchar2(20);
cnt NUMBER(2);
BEGIN
    /* Write your PL/SQL query statement below */
    select count(*) into cnt from employee;
    
    if cnt < N 
    then
        result := 'null';
    else
        select to_char(salary) into result 
        from (  select dense_rank() over(order by salary desc ) rnk , salary from (select distinct salary from employee)  ) a 
        where rnk = N;
    end if;    

    dbms_output.put_line('+------------------------------------+');
    dbms_output.put_line('|  '||'getNthHighestSalary('||N||')'  || '  |' );
    dbms_output.put_line('+------------------------------------+');
    dbms_output.put_line('|   '|| result ||'                                        |');
    dbms_output.put_line('+------------------------------------+');

    RETURN null;
END;

