-- ==========================================
-- DIMENSIONS
-- ==========================================

CREATE OR REPLACE VIEW gold.dim_customers AS
SELECT DISTINCT
    customer_id,
    customer_name,
    country
FROM silver.customer_usage_validated;

CREATE OR REPLACE VIEW gold.dim_plans AS
SELECT DISTINCT
    plan_type
FROM silver.customer_usage_validated;

-- ==========================================
-- FACT TABLE (NO AGGREGATION)
-- Grain: One row per subscription_id per payment_date
-- ==========================================

CREATE OR REPLACE VIEW gold.fact_plan_performance AS
SELECT
    customer_id,
    subscription_id,
    plan_type,
    country,
    start_date,
    end_date,
    network_usage_gb,
    payment_amount,
    payment_date
FROM silver.customer_usage_validated;
