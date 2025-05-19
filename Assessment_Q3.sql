USE adashi_staging;

-- Assessment 3
-- Task: Find all active accounts (savings or investments) with no transactions in the last 1 year (365 days)
SELECT p.id AS plan_id,
		s.owner_id,
        CASE WHEN p.is_regular_savings = 1 THEN "Savings"
			WHEN p.is_a_fund = 1 THEN "Investment"
			END AS type,
		MAX(s.transaction_date) AS last_transaction_date,
        DATEDIFF(CURDATE(), MAX(s.transaction_date)) AS inactivity_days
FROM plans_plan p
JOIN savings_savingsaccount s
ON s.plan_id = p.id
WHERE (p.is_regular_savings = 1 OR p.is_a_fund = 1)
GROUP BY 1,2,3
HAVING (MAX(s.transaction_date) IS NULL
		OR DATEDIFF(CURDATE(), MAX(s.transaction_date)) > 365)
ORDER BY 5 DESC;