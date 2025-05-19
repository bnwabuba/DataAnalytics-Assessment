# DataAnalytics-Assessment
## SQL Proficiency Assessment

---

### Assessment_Q1.sql
**Task:** Identify customers with at least one funded savings and one funded investment plan.  
**Approach:**  
- Joined users with both `savings_savingsaccount` and `plans_plan`
- Applied filters to check for funded accounts
- Aggregated counts and deposits

---

### Assessment_Q2.sql
**Task:** Analyze average transaction frequency per customer per month.  
**Approach:**  
- Used `DATE_TRUNC` to group by month
- Aggregated and classified into frequency categories

---

### Assessment_Q3.sql
**Task:** Flag active accounts with no inflow for 1+ years.  
**Approach:**  
- Combined savings and plan records
- Retrieved most recent transaction per account
- Filtered for >365 days since last activity

---

### Assessment_Q4.sql
**Task:** Estimate Customer Lifetime Value (CLV).  
**Approach:**  
- Calculated tenure in months
- Computed average profit per transaction (0.1%)
- Applied formula to estimate CLV and sorted descending

---

## Challenges
- Interpreting `is_a_fund` and `is_regular_savings` flags
- Working with data in kobo (required conversion to Naira)
- Handling division by zero in tenure (added NULLIF)
