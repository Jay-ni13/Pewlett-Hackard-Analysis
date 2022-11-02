# Pewlett-Hackard-Analysis
## Project Overview
Constructing an employee database for Pewlett-Hackard to determine how many employees will be eligible for their retirement package in the next few years and the positions/titles the company will need to fill; and whether there are enough experienced employees interested in staying on part-time to mentor new hires. 

## Resources
- Data Source: Pewlett-Hackard files; departments.csv, dept_emp.csv, dept_manager.csv, employees.csv, salaries.csv, titles.csv
- Software: PostgreSQL v11.17, pgAdmin 4 v6.15

## Results
We utilized QuickDBD to create a physical ERD for Pewlett-Hackard's Excel files.

![Pewlett-Hackard DB Schema](https://github.com/Jay-ni13/Pewlett-Hackard-Analysis/blob/main/Images/EmployeeDB.png)

### Number of Retiring Employees by Title
- Pewlett-Hackard has 72,458 employees born between 1952-1955 who will all be eligible for the company's retirement package over the next 4 years.
- The company's current employee count is 240,124; their workforce could be reduced by up to 30.2% by the end of 2026.

![Retiring Employees by Title](https://github.com/Jay-ni13/Pewlett-Hackard-Analysis/blob/main/Images/unique_titles.png)

- Most of these probable retirees--50,842--hold senior staff and engineering postions.
- The three departments who will be hit the hardest by staffing shortages with are 1) Development, 2) Production, and 3) Sales.

![Retiring Titles](https://github.com/Jay-ni13/Pewlett-Hackard-Analysis/blob/main/Images/retiring_titles.png)
![Retiring Count by Department](https://github.com/Jay-ni13/Pewlett-Hackard-Analysis/blob/main/Images/retiring_count_by_dept.png)

### Employees Eligible for the Mentorship Program
In anticipation of these upcoming retirements, Pewlett-Hackard's Sales and Development departments requested lists of employees getting ready to retire who might be willing to stay on in part-time roles to help mentor the anticipated influx of new hires rather than retiring completely.
- There are 1,549 current employees born in 1965 who would be eligible to participate in the mentorship program.

![Mentorship Eligibility](https://github.com/Jay-ni13/Pewlett-Hackard-Analysis/blob/main/Images/mentorship_eligibility.png)

## Summary
Moving forward, there are two questions that are central in determing how to prepare Pewlett-Hackard for the upcoming wave of retirements.
1) How many roles will need to be filled as the "silver tsunami" begins to make an impact?
  Each year over the next 4 years--if all of the retirement packages are accepted--an average of 18,114.5 positions will need to be filled.

![Retiring Count by Year](https://github.com/Jay-ni13/Pewlett-Hackard-Analysis/blob/main/Images/retiring_count_by_year.png)

2) Are there enough qualified, retirement-ready employees in the departments to mentor the next generation of Pewlett Hackard employees?

![Mentorship by Dept](https://github.com/Jay-ni13/Pewlett-Hackard-Analysis/blob/main/Images/mentorship_by_dept.png)

  Given the limited number of potential mentors and the large number of potential retires, it would be very difficult for a part-time mentor to handle 12 new hires to   mentee each year.

### Recommendations
To stem the rapid outflux of its workforce over the next 4 years, Pewlett-Hackard should offer pending retirees the option to continue on in their current positions as part-time, work-from-home employees for 1-2 years after their retirement eligibility date so that:
  1) The 4 year timeline is stretched to a 8-10 year timeline over which new employees are continually being hired and trained; and
  2) Employees interested in the mentorship program are not overtaxed by number of new hires they continually have to train.
