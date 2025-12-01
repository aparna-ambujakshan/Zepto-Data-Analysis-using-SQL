# Zepto SQL Analysis
This project uses SQL to clean and analyze a Zepto product dataset. I fixed inconsistent pricing fields, removed invalid entries, and explored patterns in discounts, stock availability, category revenue, and product value. The queries highlight practical data cleaning and retail-focused analysis.

## Dataset Overview
The dataset includes fields such as product name, category, MRP, discount percent, selling price, available quantity, weight, and stock status.
Before analysis, several issues needed cleaning: missing values, MRP recorded in paise, duplicate product names, and products with incorrect values like zero MRP.

## Steps I followed:
**1. Data Cleaning**
- Renamed inconsistent columns
- Checked for nulls and duplicates
- Removed products with zero MRP or zero selling price
- Converted prices from paise to rupees
- Standardized categories

**2. Exploratory Analysis**

**Key questions explored using SQL:**

- Top products by discount percentage
- High-MRP items that are out of stock
- Estimated revenue by category
- High-MRP products with low discount
- Categories with highest average discount
- Best value by price per gram
- Weight-based segmentation (Low, Medium, Bulk)
- Total inventory weight per category

## Skills Demonstrated

- SQL data cleaning
- Exploratory data analysis
- Aggregations and grouping
- Feature creation (price per gram, weight categories)
- Retail and inventory insight generation
