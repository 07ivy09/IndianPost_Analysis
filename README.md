# 📊 India Post Operations Analytics (Financial + Postal)

## 📌 Project Overview
This project analyzes **India Post operations**, combining both **financial services and postal services**, with a primary focus on financial transaction analytics and customer behavior.

Built from the perspective of a **Branch Post Master**, the solution simulates real-world customer behavior, account lifecycle, and transaction patterns across multiple services.

---
## 🎯 Objective
To design an end-to-end analytics solution that:

- Tracks transactions across branches and cities  
- Analyzes customer behavior and engagement  
- Simulates recurring financial products (RD, PLI, SSA, etc.)  
- Identifies key drivers impacting transaction value

---

## 🏤 Services Covered

### 🔹 Financial Services (Primary Focus)
- Recurring Deposit (RD)  
- Sukanya Samriddhi Account (SSA)  
- Postal Life Insurance (PLI)  
- Rural Postal Life Insurance (RPLI)  
- Savings Accounts  
- Time Deposit (TD)  

### 🔹 Postal Services (Secondary Analysis)
- Speed Post  
- Registered Post  
- Money Orders  

> While both domains are included, analytical focus is primarily on **financial transactions and customer behavior**.

---
## 🧠 Business Context
India Post operates through a hierarchical structure:

- Branch → Sub Office → Head Office → City  

Each customer:
- Can hold multiple accounts (3–5 on average)  
- Performs recurring transactions depending on service type  
- Generates long-term financial value  

---

## 🏗️ Data Architecture

### 🔹 Branch Hierarchy
- Branch Name  
- Sub Office  
- Head Office  
- City (Delhi, Mumbai, Kolkata, Chennai)  

---

### 🔹 Customers Table
- Customer_ID  
- Branch_ID  
- Customer details (Name, DOB, Gender)  
- Nominee & relationship  
- KYC status  

---

### 🔹 Accounts Table
- Account_ID  
- Customer_ID  
- Account Open Date  
- Maturity Date (calculated using tenure)  
- Account Close Date  
- Service Type
📌 One customer → multiple accounts

---

### 🔹 Date Table
- Covers: **2019 – March 2026**  
- Enables time-based analysis  

---

### 🔹 Transaction Simulation (SQL)

#### ✔ Recurring Transactions
- RD, PLI, RPLI → Monthly  
- SSA → Quarterly  
- Savings → Deposits & Withdrawals

#### ✔ Maturity Handling
- TD accounts mature  
- Amount transferred to Savings  
- Accounts updated dynamically

#### ✔ Historical Continuity
- Accounts opened earlier still generate transactions within the analysis period  

---

### 🔹 Fact Table (Fact_Transactions)

- Account_ID  
- Customer_ID  
- Branch_ID  
- Transaction Date  
- Amount  
- Service Type  
- Transaction Type  

📌 Grain: **One row = One transaction**

---

## 🔗 Data Model (Star Schema)

- **Fact Table**: Fact_Transactions  
- **Dimensions**:
  - Customers  
  - Accounts  
  - Branches  
  - Services  
  - Date
 
✔ Clean relationships  
✔ Optimized for DAX  
✔ Separate Measures Table  

---

## 📊 Dashboard Features

### 📍 1. Performance Overview
- Total Amount: ₹1.88B  
- Total Transactions: 1.18M  
- Avg Transaction Value: ₹1.59K  
- Active Customers: 51K  
- YTD Performance Tracking  

---

### 👥 2. Customer & Transaction Insights
- Customer Lifetime Value (CLV): ₹36.73K  
- Transactions per Customer: 23.04  
- Repeat Customers: 62.97%  
- High Value Transactions: 2.86%  

---

### 🔍 3. Key Drivers Analysis
- Decomposition Tree:
  - City → Service Type → Sub Office  
- Key Influencers Visual  
- Identifies drivers impacting transaction value  

---

### 🏢 4. Branch Performance
- Head Office vs Service Type comparison  
- Identifies top-performing regions  

---

## ⚙️ Tools & Technologies

- SQL → Data generation & transformation  
- Excel → Initial structuring  
- Power Query → Data cleaning  
- Power BI → Data modeling & visualization  
- DAX → KPI calculations  

---

## 💡 Key Learnings

- Designing a real-world **star schema**  
- Handling complex relationships  
- Building recurring transaction logic in SQL  
- Creating business KPIs like CLV and retention  
- Translating data into actionable insights  

---

## 🚀 Key Highlights

- Real-world domain simulation (India Post operations)  
- Advanced transaction modeling (dynamic dataset)  
- Strong SQL + Power BI integration  
- Business-focused storytelling  

---

## 🔮 Future Enhancements

- Customer segmentation (RFM analysis)  
- Forecasting trends  
- Power BI Service deployment  
- Row-Level Security (RLS)  

---

## 📂 Download Power BI File

Due to GitHub file size limitations, the `.pbix` file is hosted externally:

👉 [Download Power BI Dashboard](https://drive.google.com/file/d/1PeiZLO3VxhIxDOPZ2QpQRZm-OKtO4WRV/view?usp=drive_link)

## 👩‍💼 About the Project
This project is built using domain knowledge from working as a **Branch Post Master**, combining real-world operations with analytics to derive insights.

---


