# Pewlett-Hackard-Analysis


##  1. Overview of the analysis:

The analysis aims to make a smooth transition for the company from the high volume of retirements.   To accomplish this, we will determine the following:

- the number of retiring employees per title;
- identify employees that are eligible to participate in a mentorship program. 


## 2. Results:

- The title "Senior Engineer" has the highest retiring count.
- The title "Senior Staff" has the second highest retiring count.
- The title "Manager" has the lowest retiring count.

### Retiring titles

![Screen Shot 2022-09-09 at 12 06 25 PM](https://user-images.githubusercontent.com/108419097/189393688-8152ae14-8afc-4938-a09a-ef76ace605be.png)

- Most of the eligible employees have senior and other leadership positions.

### Mentorship eligibility

![Screen Shot 2022-09-09 at 12 12 33 PM](https://user-images.githubusercontent.com/108419097/189394667-403cf343-feb8-4611-8ef7-2d60a7e98a95.png)



## 3. Summary:

The number of retired employees (72,458, see table 1 below) is much higher than the count of people eligible for mentorship (1,549).  At a minimum, at least 70% of roles will need to fill as the "silver tsunami" retires.  However, looking at the current workforce, there aren't enough people to fill vacancies, let alone people with the right qualifications.

#### Query 1:

      -- total count of the people retired:
      SELECT SUM (rt.count) AS "total retired number"
      FROM retiring_titles AS rt;

#### Table 1: The total retired number

![Screen Shot 2022-09-09 at 1 24 41 PM](https://user-images.githubusercontent.com/108419097/189409321-3958fd6c-b7ef-48cf-9707-86400fcdeb3b.png)


#### Query 2: 

      -- sort mentee by title:
      SELECT COUNT(me.title) AS "count",
            me.title
      INTO mentee_titles
      FROM mentorship_eligibility AS me
      GROUP BY me.title
      ORDER BY count DESC;

#### Table 2: Retrieve the numbers of eligible mentee by their job title

![Screen Shot 2022-09-09 at 1 36 01 PM](https://user-images.githubusercontent.com/108419097/189411176-8a6f74c3-0ee1-4316-ac65-462c7ed6d0d2.png)



