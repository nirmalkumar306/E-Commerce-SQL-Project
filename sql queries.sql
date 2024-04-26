/*
1 Customer Demographics:
------Average age of Customers--------*/
SELECT
avg(year(sysdate())-year_birth) as average_age
FROM customer_data;

/*------How many customers fall into each education leve category------*/


SELECT
education,count(*) from customer_data
group by education;


/*---------what is the distribution of  marital status amoung the customers-------*/


 SELECT
 marital_status,count(*) from customer_data
 group by marital_status;
 
 /*b ---- Income and Household Information.-------*/
 
 /*---1What is the average household income of the customer.----*/
 
SELECT
avg(income)as avg_income from customer_data;

/*------ 2.	How many customers have children and teenagers in their households?------*/ 
 
 SELECT
 kidhome,teenhome,count(*)as count from customer_data
 group by kidhome,teenhome;
 
 /*----c. c.	Purchase Behavior:----*/
 
 /*----1 What is the average number of days since the last purchase? -----*/
 
 
 SELECT
 avg(Recenchy) as avg_Recency
 from customer_data;
 
 /*----2.How much, on average, do customers spend on each product category? ---*/
 
 
 SELECT
 avg(MntWines)as avg_MntWines,
 avg(MntFruits)as avg_MntFruits,
 avg(MntMeatProduct)as avg_MntMeatProduct,
 avg(MntFishProduct)as avg_MntFishProduct,
 avg(MntSweetProduct)as avg_MntSweetProduct,
 avg(MntGoldProds)as avg_MntGoldProds
 from customer_data;
 
 
 /*-----d.	Campaign Response ----*/
 
 /*----1.How many customers accepted each campaign offer? ----*/
 
 
 SELECT
 sum(AcceptedCmp1)as cmp1_accepted,
 sum(AcceptedCmp2)as cmp2_accepted,
 sum(AcceptedCmp3)as cmp3_accepted,
 sum(AcceptedCmp4)as cmp4_accepted,
 sum(AcceptedCmp5)as cmp5_accepted
 from customer_data;
 
 /*--- 2.What is the overall response rate forthe last campaign?---*/
 
 SELECT
 Response,count(*) overall_Response
 from customer_data
 group by Response;
 
 
 /*----e.Online and Offline Purchases ----*/
 
 /*----1.	How many purchases are made through the website, catalog, and in-store? ----*/
 SELECT
 sum(NumWebPurchases) webpurchases,
 sum(NumCatalogPurchases) wcatalogpurchases,
 sum(NumStorePurchases) storepurchases
 from customer_data;
 /*---- 2.What is the average number of web visits per month?----*/
 
 SELECT
 avg(NumWebVisitsMonth) avg_NumWebVisitsMonth
 from customer_data;
 
 
 /*----f.Complaints and Engagement ----*/
 
 /*----1.	How many customers have complained in the last 2 years? ---*/
 
 SELECT
 count(*) as complaint_count from customer_data
 where complain=1;
 
 /*---- 2.	What is the overall engagement rate (accepted any campaign or responded) among customers?----*/
 
 SELECT
 (sum(AcceptedCmp1)+sum(AcceptedCmp2)+sum(AcceptedCmp3)+sum(AcceptedCmp4)+sum(AcceptedCmp5))
  overall_engagement from customer_data;
  
  /*---- g.	Discounts and Deals:----*/
  
  /*----- 1.	How many deals are made with discounts?-----*/
  
  SELECT
  sum(NumDealPurchases) deal_purchases from customer_data
  where NumDealPurchases is not null;
  
  /*---- 2.	What is the average number of deals and purchases made by customers?----*/
  
  SELECT
  avg(NumDealPurchases) avg_dealpurchases,
  avg(NumWebPurchases+NumCatalogPurchases+NumStorePurchases+NumWebVisitsMonth) avg_purchases,
  count(*) total_purchases from customer_data;
  
  /*----h.	Campaign Effectiveness: ----*/
  
  /*----1.	What is the conversion rate for each campaign? ----*/
  
  SELECT
  campaign,
  sum(response) accepted,
  count(*) total
  FROM(SELECT 'CAMPAIGN1' AS campaign,response FROM customer_data WHERE Acceptedemp1=1
  UNION ALL
  SELECT 'CAMPAIGN2' AS campaign,response FROM customer_data WHERE Acceptedemp2=1
  UNION ALL
  SELECT 'CAMPAIGN3' AS campaign,response FROM customer_data WHERE Acceptedemp3=1
  UNION ALL
  SELECT 'CAMPAIGN4' AS campaign,response FROM customer_data WHERE Acceptedemp4=1
  UNION ALL
  SELECT 'CAMPAIGN5' AS campaign,response FROM customer_data WHERE Acceptedemp5=1
  UNION ALL
  SELECT 'LAST_CAMPAIGN' AS campaign,response FROM customer_data WHERE response1=1)as campaigndata
  GROUP BY campaign;
  
  /*------2.Which campaign has the highest acceptance rate? ----*/
  
  SELECT
  campaign,
  sum(response) accepted,
  count(*) total
  FROM(SELECT 'CAMPAIGN1' AS campaign,response FROM customer_data WHERE Acceptedemp1=1
  UNION ALL
  SELECT 'CAMPAIGN2' AS campaign,response FROM customer_data WHERE Acceptedemp2=1
  UNION ALL
  SELECT 'CAMPAIGN3' AS campaign,response FROM customer_data WHERE Acceptedemp3=1
  UNION ALL
  SELECT 'CAMPAIGN4' AS campaign,response FROM customer_data WHERE Acceptedemp4=1
  UNION ALL
  SELECT 'CAMPAIGN5' AS campaign,response FROM customer_data WHERE Acceptedemp5=1
  )as campaigndata
  GROUP BY campaign
  order by campaign desc
  limit 1;
  
  
  /*----i.Web Enga gement and Purchases ----*/
  
  /*---- 1.	What is the correlation between the number of web visits and web purchases?----*/
  
  SELECT
  NumWebVisitsMonth,NumWebPurchases
  from customer_data;
  
  /*---- j.	Overall Spending Patterns ----*/
  
   /*----  1.	What is overall distribution of spending across all product categories?----*/
   
  SELECT
  sum(MntWines) as total_MntWines_spending,
 sum(MntFruits)as total_MntFruits_spending,
 sum(MntMeatProduct)as total_MntMeatProduct_spending,
 sum(MntFishProduct)as total_MntFishProduct_spending,
 sum(MntSweetProduct)as total_MntSweetProduct_spending,
 sum(MntGoldProds)as total_MntGoldProds_spending
 from customer_data;
   