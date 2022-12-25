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

------
### Key Findings
1. Custumer Order Behavior

   - Customers commonly ordered 5 products in each purchase 
   - The top 10 products customers order are all fruits (Banana: 1st place)
   - Fresh fruits and vegetables are also most commonly reordered 
   - On average, customers are 60% likely to reorder the same products  

2. Instacart traffic 

   - As expected, weekends have more customers and more orders followed by Monday
   - Customers tend to shop in the afternoon (2pm - 4pm) and in mornings (9am - 11am)
   - The department (produce) and aisles (fresh fruits & fresh vegetables) are the busiest everyday in the afternoon
