# DataAnalytics-Assessment

Hello! Welcome to my submission for this Data Analytics Assessment.

### Assessment Question 1: The task was to write a query to find customers with at least one funded savings plan AND one funded investment plan, sorted by total deposits.
**Approach**:
- Create a Common Table Expression (CTE) named `customer_accounts`. 
- This table contains the owner_id, a concatenated name column, savings_count (the number of savings plans), investment_count (the number of investment plans), and the total deposit, corrected to one               decimal place in Naira from the `users_customuser`, `savings_savingsaccounts` and `plans_plan` tables.
- This CTE is then filtered using a WHERE clause to only show the customers with at least one savings and one investment plan.

This CTE approach makes the query more readable while determining the customers with at least one funded savings plan AND one funded investment plan, sorted by total deposits.

### Assessment Question 2: The task was to calculate the average number of transactions per customer per month and categorize them.
**Approach**:
- Create two Common Table Expressions (CTEs) named `all_transactions` and `transaction_frequencies`.
- `all_transactions` contains the customer_id and number of transactions (transactions) grouped by customer_id and month of the transaction date from the `users_customuser` and `savings_savingsaccounts` tables.
- `transaction_frequencies` contains the average number of transactions per month per customer (avg_transactions), which were also classified into High, Medium, and Low Frequency using the guidelines.
- This classification is then counted and the average number of transactions is calculated and sorted using a custom sort with a CASE statement.

This CTE approach makes the query more readable and maintainable while providing a logical structure that calculates the average number of transactions per customer per month and classifies the customers by frequency.


### Assessment Question 3: The task was to find all active accounts (savings or investments) with no transactions in the last 1 year (365 days)
**Approach**:
- Select plan_id, owner_id, account type (using is_regular_savings and is_a_fund), last_transaction_date (using MAX on transaction_date), and inactivity_days (calculated using DATEDIFF between CURDATE() and the last transaction date).
- This joins the `plans_plan` table with `savings_savingsaccount` to gather all necessary data.
- It filters to include only savings or investment accounts using a WHERE clause on is_regular_savings and is_a_fund flags.
- Results are grouped by plan_id, owner_id, customer_name, and account_type to handle multiple transactions per account.
- The HAVING clause filters for accounts with either NULL transaction dates or transactions older than 365 days.


### Assessment Question 4: The task was to calculate customer lifetime value (CLV) for all customers.
**Approach**:
- Create a Common Table Expression (CTE) named `clv_table`.
- This CTE contains customer_id, a concatenated name column, tenure_months (calculated using the TIMESTAMPDIFF statement, created_on, and the current date), total_transactions (distinct count of savings_id), and avg_profit_per_transaction (calculated using 0.1%, according to the provided guidelines).
- This CTE is then used to select customer_id, name, tenure_months, total_transactions, and the estimated_clv which is also calculated using the provided guidelines.
- The amounts used are corrected to one decimal place in Naira.


### Challenges
The main challenge encountered in the course of this project was **Data Quality and Consistency Issues**, particularly in the customer names. This could have been mitigated by enforcing specific guidelines and name verifications on signup. 
