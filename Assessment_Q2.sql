USE adashi_staging;

-- Assessment 2
-- Task: Calculate the average number of transactions per customer per month and categorize them.
WITH all_transactions AS
(SELECT u.id,
		MONTH(s.transaction_date) AS account_month,
		COUNT(s.savings_id) AS transactions
FROM users_customuser u
	JOIN savings_savingsaccount s
	ON u.id = s.owner_id
GROUP BY 1,2
),
transaction_frequencies AS
(SELECT id,
        AVG(transactions) as avg_transactions,
        CASE WHEN AVG(transactions) >= 10 THEN "High Frequency"
			WHEN AVG(transactions) >= 3 AND AVG(transactions) <= 9 THEN "Medium Frequency"
			ELSE "Low Frequency"
				END AS frequency_category
FROM all_transactions
GROUP BY 1)
SELECT 
		DISTINCT frequency_category,
		COUNT(frequency_category) AS customer_count,
        ROUND(AVG(avg_transactions),1) AS avg_transactions_per_month
FROM transaction_frequencies
GROUP BY 1
ORDER BY CASE WHEN frequency_category = 'High Frequency' THEN 1
              WHEN frequency_category = 'Medium Frequency' THEN 2
              ELSE 3 END;