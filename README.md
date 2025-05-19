# DataAnalytics-Assessment

Hello! Welcome to my submission for this Data Analytics Assessment.

#### Assessment Question 1: The task was to write a query to find customers with at least one funded savings plan AND one funded investment plan, sorted by total deposits.
**Approach**:
          - Create a Common Table Expression (CTE) named `customer_accounts`. 
          - This table contains the owner_id, a concatenated name column, savings_count (the number of savings plans), investment_count (the number of investment plans), and the total deposit, corrected to one               decimal place in Naira from the `users_customuser`, `savings_savingsaccounts` and `plans_plan` tables.
          - This CTE was then filtered using a WHERE clause to only show the customers with at least one savings and one investment plan.

#### Assessment Question 2: The task was to calculate the average number of transactions per customer per month and categorize them.
**Approach**:
          - Create two Common Table Expressions (CTEs) named `all_transactions` and `transaction_frequencies`.
          - `all_transactions` contains the customer_id and number of transactions (transactions) grouped by customer_id and month of the transaction date from the `users_customuser` and `savings_savingsaccounts` tables.
          - `transaction_frequencies` contains the average number of transactions per month per customer (avg_transactions), which were also classified into High, Medium, and Low Frequency using the guidelines.
          - This classification was then counted and the average number of transactions was calculated and sorted using a custom sort with CASE statement.

#### Assessment Question 3: The task was to write a query to find customers with at least one funded savings plan AND one funded investment plan, sorted by total deposits.
**Approch**:


#### Assessment Question 4: The task was to calculate customer lifetime value (CLV) for all customers.
**Approach**

