USE adashi_staging;

-- Assessment 1
-- Task: Write a query to find customers with at least one funded savings plan AND one funded investment plan, sorted by total deposits.
WITH customer_accounts AS
	(SELECT p.owner_id, 
			CONCAT(u.first_name, ' ', u.last_name) AS name,
			SUM(CASE WHEN p.is_regular_savings = 1 THEN 1
				ELSE 0 END) AS savings_count,
			SUM(CASE WHEN p.is_a_fund = 1 THEN 1
				ELSE 0 END) AS investment_count,
			ROUND((SUM(CASE WHEN s.transaction_status = "success" THEN s.confirmed_amount END))/100, 2) AS total_deposit
	FROM users_customuser AS u
		JOIN savings_savingsaccount AS s
			ON u.id = s.owner_id
		JOIN plans_plan AS p
			ON s.plan_id = p.id
	GROUP BY 1,2
	ORDER BY 5 DESC)
SELECT owner_id, name, savings_count, investment_count, total_deposit
FROM customer_accounts
WHERE savings_count >= 1 AND investment_count >= 1
ORDER BY 5 DESC;