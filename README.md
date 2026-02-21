# Retail Customer Intelligence: RFM Segmentation & Behavioral Analysis
## Project Overview

This project is an end-to-end retail analytics case study designed to simulate how a data analyst works with real business data — from data cleaning and transformation to insight-driven dashboards.

The objective was to analyze customer purchase behavior, frequency patterns, and revenue contribution, and translate these analyses into actionable business strategies for marketing and retention teams.

The project follows a realistic analytics workflow:

**Python → Power BI**

## Business Questions Addressed

1. Which customer segments generate the most value and revenue?

2. How do frequency and recency impact the health of our customer base?

3. Which specific customers are at the highest risk of churning?

4. What is the average time elapsed since the last purchase across the entire base?

5. How should marketing budgets be prioritized based on customer loyalty tiers?

## Tech Stack
* **Python (Pandas/NumPy)** – Data cleaning, outlier detection, and processing of the initial transaction dataset.

* **Power BI** – Interactive dashboards, DAX, KPI tracking, and behavioral cluster mapping.

## Data Model

The project uses a structured dataset focused on customer transactions:

* CustomerID – Unique identifier for each customer.

* Total_Revenue – Aggregated spend per customer (Monetary).

* Order_Frequency – Total number of orders per customer (Frequency).

* Days_Since_Last_Purchase – Time elapsed since the last transaction (Recency).

* Segment – Behavioral tier assigned via RFM logic.

## Dashboard & Analysis

1️⃣ **Executive KPI Overview**
Focus: High-level business health at a glance.

Key Metrics:

Total Revenue (₹685.5K): The primary financial success metric after data cleaning.

Total Customers (973): Total unique reach of the current database.

Avg Recency (23.86 Days): Indicates the freshness of the customer base.

**Insights:**

The business maintains a healthy average recency of ~24 days, suggesting consistent engagement across the broad base.

2️⃣ **Segment Distribution & Revenue Impact**
Focus: Validating the Pareto Principle through Segment Analysis.

Components: Treemap (Population) & Donut Chart (Revenue Contribution).

Champions (45.64% Revenue): Despite being a smaller segment by count, they drive nearly half of all income.

Loyal Customers (15.18% Revenue): The "backbone" segment that provides stable, recurring value.

**Insights:**

Revenue is highly concentrated; losing even 5% of "Champions" would have a more significant impact than losing 20% of "New" customers.

3️⃣ **Customer Behavioral Clusters (Scatter Plot)**
Focus: Visualizing the relationship between Frequency and Recency.

Techniques Used:

Inverted Y-Axis: Positioned the "most recent" shoppers at the top for an intuitive "Health" view.

Bubble Scaling: Used Total Revenue to represent the monetary weight of each individual customer point.

**Insights:**

Identifies a clear gap where "At Risk" customers begin to drift away (30+ days since purchase), serving as the trigger point for automated marketing.

4️⃣ **High-Value Target List & Strategic Actions**
Focus: Operationalizing the data for immediate business use.

Components: Interactive Filterable Table & Strategic Recommendations Box.

Dynamic Table: Provides a real-time "hit list" of Customer IDs based on segment selection.

Prescriptive Insights: Maps specific data findings to marketing actions (e.g., "Win-Back" campaigns for At-Risk customers).

**Insights:**

This dashboard functions as a decision-support tool, allowing a marketing manager to export a specific list of "At Risk" IDs for a re-engagement campaign in seconds.

## SQL & DAX Techniques Used

* **Calculated Measures**: Created dynamic KPIs for Total Revenue and Average Recency.

* **Percent of Total**: Used DAX to calculate the revenue share of each segment relative to the whole.

* **Dynamic Filtering**: Integrated cross-filtering so that selecting a segment updates the "High-Value Target List" instantly.

## Future Enhancements

* Product Affinity: Analyzing which categories are most popular within the "Champion" segment.

* Predictive Churn: Using Python's Scikit-Learn to predict the probability of a customer moving to "Lost."

## Key Takeaways

* Demonstrates an end-to-end analytics workflow from Python cleaning to BI delivery.

* Focuses on business decision-making by providing a "Target List" for marketing outreach.

## 📌 Author Note
This project was built as a portfolio case study for a Data Analyst role, showcasing Python, Power BI, and RFM modeling skills through a real-world retail scenario.

Attached dashboard images for reference
![Dashbaord Screenshot](https://github.com/user-attachments/assets/842cc8be-5225-4375-9d24-e14d33d27216)
