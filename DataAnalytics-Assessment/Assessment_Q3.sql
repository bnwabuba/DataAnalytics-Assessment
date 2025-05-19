-- Q3: Account Inactivity Alert
WITH all_transactions AS (
    SELECT plan_id, owner_id, confirmed_amount, transaction_date, 'Savings' AS type
    FROM savings_savingsaccount
    UNION ALL
    SELECT id AS plan_id, owner_id, NULL AS confirmed_amount, created_at AS transaction_date, 
           CASE WHEN is_a_fund = 1 THEN 'Investment'
               ELSE 'Savings'
           END AS type
    FROM plans_plan
),
latest_transactions AS (
    SELECT plan_id, owner_id, type, MAX(transaction_date) AS last_transaction_date
    FROM all_transactions
    GROUP BY plan_id, owner_id, type
)
SELECT plan_id, owner_id, type, last_transaction_date,
    DATE_PART('day', CURRENT_DATE - last_transaction_date) AS inactivity_days
FROM latest_transactions
WHERE last_transaction_date < CURRENT_DATE - INTERVAL '365 days';
