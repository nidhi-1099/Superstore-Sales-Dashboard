# Superstore Sales Dashboard

This project is an interactive Power BI dashboard created to analyze Superstore sales data. The dashboard focuses on sales performance, profit, discount impact, customer contribution, regional performance, shipping trends, and product-level analysis.

The main idea behind this project was to convert raw retail transaction data into a simple dashboard that can help understand business performance quickly.

## Dashboard Preview

### Executive Dashboard

![Executive Dashboard](images/sales-page-1.png)

### Product Performance

![Product Performance](images/sales-page-2.png)

## Short Description

The Superstore Sales Dashboard gives a clear overview of how the business is performing across different regions, cities, product categories, sub-categories, customers, and shipping modes. It helps track important KPIs like total sales, total profit, average discount, profit margin, total orders, total quantity, and total loss.

The dashboard is divided into two main pages:

- Executive Dashboard
- Product Performance

## Business Problem

Retail businesses generate a lot of sales data, but without proper analysis it becomes difficult to understand where the business is growing and where it is losing money.

This dashboard tries to answer important business questions such as:

- What are the total sales and total profit?
- Which month generated the highest sales?
- Which region is performing the best?
- Which category and sub-category are contributing the most?
- Who are the top customers by sales?
- Which shipping mode is used the most?
- Which products are profitable and which products are causing losses?
- Which cities are generating the highest sales?
- How much discount is being given and how it affects profit margin?

## Tech Stack

- Power BI Desktop
- Power Query
- DAX
- SQL
- Python
- Excel / CSV dataset
- Data Modeling
- Data Visualization

## Why I Used These Tools

### Power BI Desktop

I used Power BI Desktop because it is very useful for creating interactive business dashboards. It allowed me to create KPI cards, slicers, bar charts, line charts, donut charts, tables, and report pages in one place. Power BI also made it easier to design the dashboard in a clean way so that the insights can be understood quickly without going through the raw data.

### Power Query

Power Query was used for cleaning and preparing the data before building the dashboard. I used it to check columns, fix data types, remove unnecessary fields, handle missing or incorrect values, and make the dataset ready for analysis. This step was important because a dashboard is only useful when the data behind it is clean and properly structured.

### DAX

I used DAX to create calculated measures for important KPIs. Measures like total sales, total profit, average discount percentage, profit margin percentage, total orders, total quantity, and total loss were created using DAX. It helped me make the dashboard dynamic, so the values change automatically when filters like quarter, city, region, or year are selected.

### SQL

SQL was useful for understanding and analyzing the dataset in a structured way. I used it for checking records, filtering data, grouping values, and validating some business-level calculations. Since SQL is commonly used in real business environments, using it in this project helped me practice how data is usually queried before reporting.

### Python

Python was used for basic data analysis and understanding the dataset before creating the dashboard. With libraries like Pandas and NumPy, it becomes easier to inspect data, check missing values, understand numerical columns, and perform quick exploratory data analysis. This helped me get a better idea of the dataset before designing the Power BI visuals.

### Excel / CSV Dataset

The dataset was available in Excel/CSV format, so I used it as the main data source. Excel and CSV files are easy to import into Power BI and are commonly used in beginner and intermediate analytics projects. This format made it simple to load the data, clean it, and use it for dashboard creation.

### Data Modeling

Data modeling was used to organize the data properly for analysis. A good data model helps measures work correctly and makes the dashboard easier to maintain. It also improves report performance and helps connect different fields like sales, profit, product category, customer, region, and date in a meaningful way.

### Data Visualization

Data visualization was used to present the insights in a simple and clear format. Instead of only showing numbers, I used charts and KPI cards to make the analysis easier to understand. Visuals helped show trends, comparisons, top customers, regional performance, product performance, and loss-making areas more clearly.

## Data Source

The dataset used in this project is the Superstore sales dataset. It contains retail order details such as customer information, product details, order date, sales, profit, quantity, discount, shipping mode, city, state, region, category, and sub-category.

Main fields used in the analysis:

- Order ID
- Order Date
- Customer Name
- Segment
- City
- State
- Region
- Category
- Sub-Category
- Product Name
- Sales
- Profit
- Quantity
- Discount
- Ship Mode

## KPIs Tracked

The dashboard tracks the main business KPIs that are useful for understanding overall retail performance:

- Total Sales
- Total Profit
- Profit Margin %
- Average Discount %
- Total Orders
- Total Quantity Sold
- Total Loss
- Best Performing Region
- Best Performing City
- Best Product Category
- Best Product Sub-Category
- Top Customers by Sales
- Sales by Shipping Mode

## Dashboard Pages

### 1. Executive Dashboard

This page gives a high-level overview of the complete sales performance.

Key metrics shown:

- Total Sales: $2.30M
- Total Profit: $286K
- Average Discount: 15.62%
- Profit Margin: 12.47%
- Best Region: West
- Top Category: Technology

Main visuals included:

- Monthly sales trend
- Top categories by sales
- Top customers by sales
- Sales and profit by region
- Sales by ship mode
- Quarter and city filters

### 2. Product Performance

This page focuses on product-level and city-level performance.

Key metrics shown:

- Best City: New York City
- Best Sub-Category: Phones
- Total Profit: $286K
- Total Loss: $156K
- Total Orders: 5009
- Total Quantity: 38K

Main visuals included:

- Top 5 cities by sales
- Sub-category contribution
- Product-level sales, profit, loss, and quantity table
- Region and year filters

## Key Highlights

- Built a two-page interactive Power BI dashboard.
- Created an executive summary page for overall business performance.
- Created a product performance page to analyze profitable and loss-making products.
- Used KPI cards to show important business numbers clearly.
- Added filters for quarter, city, region, and year.
- Analyzed sales trends by month.
- Compared sales and profit across regions.
- Identified top customers by sales contribution.
- Analyzed category and sub-category performance.
- Found top cities and best-performing product areas.

## Main Insights

From the dashboard, I found some important business insights:

- Total sales reached around $2.30M with a total profit of $286K.
- The West region performed the best and generated the highest sales.
- Technology was the top category by sales contribution.
- Phones were the best-performing sub-category.
- New York City was the best city based on sales.
- Standard Class was the most used shipping mode.
- Some products generated good sales but also created losses, which shows the need to check discounting and pricing decisions.
- A small group of customers contributed a high amount of total sales, which can help the business focus on customer retention.

## Business Impact

This dashboard can help business users and decision-makers:

- Track sales and profit performance from one place.
- Identify the best-performing regions, cities, categories, and customers.
- Understand which products are generating profit and which are creating losses.
- Analyze monthly sales trends for planning and forecasting.
- Check how discounts are affecting profitability.
- Improve product and pricing decisions.
- Focus more on high-value customers and profitable product segments.
- Make faster decisions using visual insights instead of manually checking raw data.

## Project Outcomes

After completing this project, I was able to:

- Clean and prepare raw sales data for reporting.
- Build an interactive Power BI dashboard from start to end.
- Create useful DAX measures for business KPIs.
- Use charts and filters to make the report more interactive.
- Understand sales, profit, discount, and product performance together.
- Present business insights in a simple and professional dashboard format.

## Repository Contents

- `README.md` - Project documentation
- `images/sales-page-1.png` - Executive dashboard screenshot
- `images/sales-page-2.png` - Product performance dashboard screenshot

## How to Use This Project

To understand this project, first check the dashboard screenshots in the preview section. The first page explains the overall sales and profit performance, while the second page focuses more on product performance, city-level sales, profit, loss, and quantity.

If the Power BI file is added to the repository, it can be opened in Power BI Desktop to explore the dashboard interactively using filters like quarter, city, region, and year.

## Conclusion

This project helped me understand how retail sales data can be analyzed using Power BI. By looking at sales, profit, discount, customers, products, regions, and cities, the dashboard gives useful insights that can support better business decisions.
