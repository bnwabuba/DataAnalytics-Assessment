-- Q4: Customer Lifetime Value (CLV) Estimation
WITH transaction_summary AS (
    SELECT s.owner_id, COUNT(*) AS total_transactions, SUM(s.confirmed_amount) AS total_value
    FROM savings_savingsaccount AS s
    GROUP BY s.owner_id
),
tenure_summary AS (
    SELECT id AS customer_id, name,
        DATE_PART('month', AGE(CURRENT_DATE, date_joined)) AS tenure_months
    FROM users_customuser
),
clv_calc AS (
    SELECT t.owner_id AS customer_id, u.name, u.tenure_months, t.total_transactions,
        ROUND((t.total_transactions::decimal / NULLIF(u.tenure_months, 0)) * 12 * ((t.total_value / t.total_transactions) * 0.001) / 100, 2) AS estimated_clv
    FROM transaction_summary AS t
    JOIN tenure_summary AS u ON t.owner_id = u.customer_id
)
SELECT * FROM clv_calc
ORDER BY estimated_clv DESC;
