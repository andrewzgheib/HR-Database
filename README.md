<h1 align="center">HRMS-database</h1>

- This is a basic PostgreSQL database schema designed for a Human Resources department to store and manage employee information, insurance options, contracts, payments, and more. <br/>
- The [schema](https://github.com/andrewzgheib/HRMS-database/blob/main/schema-picture.png) consists of 16 tables, employing various relational models, domains, functions, etc. to ensure robust data management.

## Database Structure
1. `employee`: Contains personal and organizational details of employees.
2. `department`: Manages department information.
3. `employee_department`: Establishes the relationship between employees and their respective departments.
4. `position`: Stores position titles with associated schedules.
5. `employee_position`: Faciliates the assignment of employees to different positions accross various departments.
6. `schedule`: Manages schedule details for different positions.
7. `employee_insurance`: Links employees to their chosen insurance option, including coverage for family members.
8. `insurance`: Holds information about available insurance plans.
9. `contract`: Tracks contract details, including start and end dates, and an encrypted serial number for each contract.
10. `contract_type`: Records different types contracts within the organization.
11. `payment`: Stores payments records for employees based on their contracts.
12. `payment_currency`: Holds several payment currencies. 
13. `employee_pn`: Stores personal and office contact numbers , including optional extensions.
14. `address`: Records address details for employees accross different cities.
15. `city`: Lists cities within each country.
16. `country`: Contains a comprehensive list of countries.

## Key Features
- Employees can be associated with multiple departments simultaneously, holding different positions within each.
- Each employee can have distinct schedules tailored to their various positions.
- An insurance module enabling employees to enroll in one option per year, and optionally including family members in the same or different option.
- A contract system streamlining employee payments.

## Usage
Run the [HR-schema](https://github.com/andrewzgheib/HRMS-database/blob/main/schema-structure.sql) SQL file that contains all essential tables, attributes, and related components.

---
*Special thanks to [@MichaelaRif](https://github.com/MichaelaRif) for contributing*
