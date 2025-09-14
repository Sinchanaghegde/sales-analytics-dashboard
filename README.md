# 📊 Sales Analytics Dashboard (SQL + Power BI)

This project demonstrates **Sales Analytics** using **MySQL for data analysis** and **Power BI for interactive dashboards**.  
It answers key business questions such as **top customers, product revenue, monthly sales trends, and KPIs**.  

⚠️ Note: The Power BI dashboard is built using the **CSV dataset** (not a direct MySQL connection).

---

## 🚀 Project Workflow
1. **Database Creation (MySQL)**
   - Created `salesdb` database.  
   - Designed `sales` table with fields for customers, orders, products, and sales.  

2. **SQL Analysis**
   - Wrote multiple SQL queries to extract insights:  
     - Top 10 customers by sales  
     - Top 10 products by revenue  
     - Regional performance  
     - Monthly sales trends  
     - High-value orders (> 5000)  
     - Customer Lifetime Value (CLV)  
     - KPIs: Total Sales, Orders, Customers, Avg Order Value  

3. **Power BI Dashboard (CSV Import)**
   - Used `sales_sample.csv` dataset directly in Power BI.  
   - Built interactive dashboards with:  
     - 📌 KPIs  
     - 📈 Monthly Sales Trend  
     - 📊 Top 10 Customers & Products  
     - 🌍 Regional Sales Distribution  
     - 🏷 Product Category Insights  

---

## 📊 Dashboard Preview
![Dashboard Screenshot](powerbi_dashboard/screenshot.png)

---

## 📂 Files in this Repository
- `sql_queries/sales_analysis.sql` → Contains all SQL queries.  
- `powerbi_dashboard/sales_dashboard.pbix` → Power BI dashboard file.  
- `dataset/sales_sample.csv` → Sample dataset (synthetic).  
- `README.md` → Project documentation.  

---

## 🔑 Key Insights
- Region **East** generated the highest revenue.  
- **Top 10 Customers** account for ~40% of total revenue.  
- Sales trend shows a **seasonal increase in Q4**.  
- **Technology** category dominates in product sales.  

---

## 🛠 Tech Stack
- **Database**: MySQL  
- **Visualization**: Power BI (CSV Import)  
- **Language**: SQL  

---

## 📌 How to Run
1. Import the `dataset/sales_sample.csv` into MySQL using the schema provided.  
2. Run SQL queries from `sql_queries/sales_analysis.sql`.  
3. Open `sales_dashboard.pbix` in Power BI Desktop → Load the CSV dataset → Refresh visuals.  
