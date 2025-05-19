-- Q2: Transaction Frequency Analysis
WITH monthly_transactions AS (
    SELECT owner_id, DATE_TRUNC('month', transaction_date) AS month, COUNT(*) AS transactions
    FROM savings_savingsaccount
    GROUP BY owner_id, DATE_TRUNC('month', transaction_date)
),
frequency_classification AS (
    SELECT owner_id, AVG(transactions) AS avg_transactions_per_month,
        CASE WHEN AVG(transactions) >= 10 THEN 'High Frequency'
            WHEN AVG(transactions) BETWEEN 3 AND 9 THEN 'Medium Frequency'
            ELSE 'Low Frequency'
        END AS frequency_category
    FROM monthly_transactions
    GROUP BY owner_id
)
SELECT frequency_category, COUNT(*) AS customer_count, ROUND(AVG(avg_transactions_per_month), 1) AS avg_transactions_per_month
FROM frequency_classification
GROUP BY frequency_category;
