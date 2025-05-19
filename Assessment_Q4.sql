USE adashi_staging;

-- Assessment 4
-- Calculate CLV for all customers
WITH clv_table AS
	(SELECT u.id AS customer_id, 
		CONCAT(u.first_name, ' ', u.last_name) AS name,
		TIMESTAMPDIFF(MONTH, s.created_on, CURDATE()) AS tenure_months,
		COUNT(DISTINCT s.savings_id) AS total_transactions,
		AVG((s.confirmed_amount * 0.001)/100) AS avg_profit_per_transaction
	FROM users_customuser u
		JOIN savings_savingsaccount s
		ON u.id = s.owner_id
	GROUP BY 1,2
	ORDER BY 5 DESC)
SELECT customer_id, name, tenure_months,
		total_transactions,
		ROUND(((total_transactions/tenure_months) * 12 * avg_profit_per_transaction), 2) AS estimated_clv
FROM clv_table
GROUP BY 1, 2
ORDER BY 5 DESC;