# Instacart Project 

### Company Background
- [Instacart](https://www.instacart.com/store) is a grocery / household goods delivery and pickup service (available in US and Canada)
- Customers order online (website / app) and have a personal shopper pick up at the stores and deliver on the same day
- Offer 24/7 delivery service 
- Major retailers / grocers: Costco / CVS / Target

![download](https://user-images.githubusercontent.com/117702329/209454081-c5bfebdd-83b1-4808-8783-b41e7455bc28.png)

------
### Motivation
1. Understand customer order behavior & repeat purchases
 
   - help Instacart find new retailers or grocers to satisfy customer needs

2. Understand the traffic by day (Sunday to Saturday) and time (24 hours timeframe) 
 
   - help Instacart effectively allocate the number of workers to meet customer demand

------
### Project Details
1. Tools: DbVisualizer & PostgreSQL 

2. Dataset provided by [Modern Data Lab](https://www.linkedin.com/company/moderndatalab/mycompany/)

   - 248,081 rows
   - 13 columns ([Entity Relationship Diagram](https://github.com/harris-wan-analyst/instacart_proj/blob/main/Entity%20Relationship%20Diagram.png))
   - data type: numeric & varchar

3. Tableau ([link](https://public.tableau.com/app/profile/harris.wan.analyst/viz/InstacartDashboard_16720277423100/InstacartDashborad))

------
### Key Findings
1. Custumer Order Behavior

   - Customers commonly ordered 5 products in each purchase 
   - The top 10 products customers order are all fruits (Banana: 1st place)
   - Fresh fruits and vegetables are also most commonly reordered 
   - On average, customers are 60% likely to reorder the same products  

2. Instacart traffic 

   - Weekends have more customers and purchase an average of 2 more products in each order compared to weekdays
   - Customers tend to shop in afternoons (2pm - 4pm) and in mornings (9am - 11am)
   - The department (produce) and aisles (fresh fruits & fresh vegetables) are the busiest everyday in the afternoon

------
### Recommendations 

- Partner with local fruit and veggie stores to meet customers' huge demand in fresh fruits and vegetables to prevent pontential shortage
- Ensure a variety of products are in stock in different places as customers tend to make repeat purchases
- Have more personal shoppers available on weekends and in 9 - 11 am and 2 - 4 pm to meet customer demand and satisfaction
