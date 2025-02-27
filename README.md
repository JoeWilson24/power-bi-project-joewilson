# power-bi-project-joewilson

# Tasks accomplished:

## Importing the data

1. Connected to the Azure SQL Databse with the credentials provided and imported the "orders_powerbi" table.
2. Deleted Card Number column to ensure data privacy.
3. Split Order Date and Shipping Date columns into two disctinc columns each, separating date from time.
4. Removed all missing and null values from the Order Date column to maintain data integrity.
5. Imported the Products table from a .csv file.
6. Removed all duplicates from the Produt Code column to ensure uniqueness.
7. Imported the Stores table from an Azure Blob Storage using the credentials provided.
8. Cleaned the Region column, removing any incorrect values and replacing them with the correct values.
9. Used the Folder data connector import method, using 'Combine and Transform' to import the 3 .csv files into one query.
10. Created a Full Name column by combining the First NAme and Second Name columns in the query editor.
11. Removed indexing columns.
12. Cleaned other columns, removing time values from date time columns where not needed, e.g. join date and date of birth.
13. Ensured all naming of columns in all tables is of the correct naming conventions.

## Creating the data model

1. Created a date table from the minimum date in Order Date and the maximum date in Shipping Date.
2. Used DAX to create the following columns: Day of Week, Month Number, Month Name, Quarter, Year, Start of Year, Start of Quarter, Start of Month, Start of Week. 
3. Built the Star Schema Data Model, building relationships between: 

    Products[product_code] to Orders[product_code]
    Stores[store code] to Orders[Store Code]
    Customers[User UUID] to Orders[User ID]
    Date[date] to Orders[Order Date]
    Date[date] to Orders[Shipping Date]

    All relationships are one-to-many, with a single filter direction flowing from the dimension table side to the fact table side. 

4. Created a new table to house the measures.
5. Created the measures: Total Orders, Total Revenue, Total Profit, Total Customers, Total Quantity, Profit YTD, Revenue YTD.
6. Created a date hieracy using the following levels:

    Start of Year
    Start of Quarter
    Start of Month
    Start of Week
    Date

7. Created a new calculated column in the Stores table called Country that creates a full country name for each row, based on the Stores[Country Code] column, according to the following scheme:

    GB : United Kingdom
    US : United States
    DE : Germany

    This was done using the SWITCH function in DAX. 

8. Created a Geography column that concatenates the Stores[Country Region] and Stores[Country] columns together, with a comma inbetween. 
9. Create a Geography hierarchy using the following levels:

    World Region
    Country
    Country Region

## Setting up the report

1. Created four pages and named as follows: Executive Summary, Customer DEtails, Product Detail, Stores Map.
2. Added a navigation sidebar consisting of a blank shape.

## Building a Customer Detail Page

1. Added card visual for Total Customers Measure
2. Created a new measure for Revenue per Customer (Total Revenue divided by Total Customer).
3. Added a card visual for Revenue per Customer.
4. Created a Donut Chart: Displayed total customers per country, using the Customers[Country] column to filter the [Total Customers] measure.
5. Added a Donut Chart: Showed the number of customers purchasing each product category, using the Products[Category] column to filter the [Total Customers] measure.
6. Inserted a Line Chart: Positioned at the top of the page, displaying [Total Customers] on the Y-axis and the Date Hierarchy (drillable to months) on the X-axis.
7. Enhanced the Line Chart: Added a trend line and a 10-period forecast with a 95% confidence interval.
9. Built a Table: Displayed the top 20 customers by revenue, including their full name, revenue, and number of orders.
Applied Conditional Formatting: Added data bars to the revenue column in the table.
10. Created Card Visuals: Developed three card visuals to display the top customer's name, their order count, and total revenue.
Implemented a Date Slicer: Added a "between" style date slicer to enable year-based filtering.

## Building an executive summary page

1. Copied and Pasted: Duplicated a grouped card visual from the "Customer Detail" page onto the "Executive Summary" page.
2. Arranged Duplicates: Duplicated the card visuals two more times and arranged them horizontally across about half the page width.
3. Assigned Measures: Linked the card visuals to the "Total Revenue," "Total Orders," and "Total Profit" measures.
4. Formatted Callout Values: Adjusted the formatting to display no more than two decimal places for revenue and profit, and one decimal place for total orders.
5. Copied and Modified Line Graph: Transferred the line graph from the "Customer Detail" page and modified it:
6. Set the X-axis to the "Date Hierarchy," showing only year, quarter, and month levels.
7. Set the Y-axis to "Total Revenue."
8. Positioned the line chart below the card visuals.
9. Added Donut Charts: Inserted two donut charts displaying "Total Revenue" by "Store[Country]" and "Store[Store Type]," positioned to the right of the cards. Formatting was copied from the "Customer Detail" page.
10. Created a Bar Chart: Transformed the "Total Customers by Product Category" donut chart into a clustered bar chart:
11. Changed the X-axis field to "Total Orders."
12. Applied a theme-appropriate color to the bars.
13. Created Quarterly Target Measures: Developed measures for "Previous Quarter Profit," "Previous Quarter Revenue," and "Previous Quarter Orders," as well as corresponding target measures representing a 5% growth.
14. Added Revenue KPI: Inserted a new KPI for revenue:
15. Set the "Value" field to "Total Revenue."
16. Set the "Trend Axis" to "Start of Quarter."
17. Set the "Target" to "Target Revenue."
18. Formated the Trend Axis, setting the direction to "High is Good", bad color to red, and transparency to 15%.
19. Formatted the Callout value, so that it only showed 1 decimal place.
20. Duplicated KPI Cards: Duplicated the revenue KPI card two more times and configured them for profit and orders.
21. Arranged KPI Cards: Placed the three KPI cards below the revenue line chart.

## Building a Product Detail Page

1. Added a Map Visual: Inserted a new map visual on the "Stores Map" page, covering most of the page, with a slicer at the top.
2. Styled the map and enabled labels.
3. Set map controls: Auto-Zoom On, Zoom buttons Off, Lasso button Off.
4. Assigned the "Geography" hierarchy to the Location field and "ProfitYTD" to the Bubble size field.
5. Implemented a Country Slicer: Placed a slicer above the map, using "Stores[Country]" as the field.
6. Set the slicer style to "Tile" and enabled multi-select with Ctrl/Cmd and "Select All."
7. Created a Drillthrough Page: Developed a "Stores Drillthrough" page for detailed store performance summaries.
8. Set the page type to "Drillthrough" and configured drill-through settings.
9. Added Drillthrough Visuals:
10. Included a table displaying the top 5 products by "Total Orders," with columns for "Description," "Profit YTD," "Total Orders," and "Total Revenue."
11. Added a column chart showing "Total Orders" by product category.
12. Inserted gauges for "Profit YTD" against a 20% year-on-year growth profit target, using the "Target" field.
13. Added a card visual displaying the currently selected store.
14. Created Gauge Measures:
15. Ensured "Profit YTD" and "Revenue YTD" measures were present.
16. Created "Profit Goal" and "Revenue Goal" measures, representing a 20% increase over the previous year's year-to-date values.
17. Configured Drillthrough Page: Added the visuals to the drillthrough page, arranging them in a suitable layout.
18. Created a Custom Tooltip:
19. Developed a tooltip page.
20. Copied the profit gauge visual onto the tooltip page.
21. Set the map visual's tooltip to the newly created tooltip page.

## Cross-Filtering and Navigation 

1. Configured Edit Interactions:
2. Executive Summary Page:
3. Set the "Product Category" bar chart and "Top 10 Products" table to not filter the card visuals or KPIs.
4. Customer Detail Page:
5. Set the "Top 20 Customers" table to not filter any other visuals.
6. Set the "Total Customers by Product Category" donut chart to not affect the "Customers" line graph.
7. Set the "Total Customers by Country" donut chart to cross-filter the "Total Customers by Product Category" donut chart.
8. Product Detail Page:
9. Set the "Orders vs. Profitability" scatter graph to not affect any other visuals.
10. Set the "Top 10 Products" table to not affect any other visuals.
11. Added Navigation Buttons:
12. Inserted four blank buttons in the sidebar of the "Executive Summary" page.
13. Set the default button appearance to the relevant white PNG icon in the "Icon" tab of the "Button Style" pane.
14. Set the "On Hover" appearance to the alternative colorway of the relevant button in the "Icon" tab.
15. Enabled the "Action" format option for each button, set the type to "Page navigation," and selected the correct destination page.
16. Grouped the buttons together and copied them to the other report pages.