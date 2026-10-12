create database analytics;
use analytics;
CREATE TABLE restaurant (
    restaurant_id INT,
    restaurant_name VARCHAR(100),
    city VARCHAR(50),
    area VARCHAR(50),
    cuisine VARCHAR(50),
    rating VARCHAR(20),
    price VARCHAR(20),
    review_count VARCHAR(20),
    restaurant_type VARCHAR(50),
    delivery_time VARCHAR(20)
);
INSERT INTO restaurant
VALUES
(1, '  Spice Hub  ', 'Vizag', 'MVP Colony', 'Indian',
 '4.5', '₹450', '1250', 'Casual Dining', '35 min'),

(2, 'SPICE HUB', 'VIZAG', 'mvp colony', ' indian ',
 '4.2', '450', '980', 'casual dining', '40 min'),

(3, '  Coastal Bites', ' vizag ', 'Beach Road', 'Seafood',
 '4.7', '₹600', '1500', 'Fine Dining', '45 min'),

(4, 'Biryani House ', 'RJY', 'Danavaipeta', 'Biryani',
 '4.1', '₹300', '750', 'Quick Bites', '30 min'),

(5, 'biryani house', 'rjy', 'danavaipeta ', ' biryani ',
 ' 4.3 ', '300', ' 820 ', 'Quick Bites', '28 min'),

(6, 'Green Leaf', 'Odalarevu', 'Main Road', 'Indian',
 NULL, '₹400', '1100', 'Family Restaurant', '40 min'),

(7, ' GREEN LEAF ', 'odalarevu', 'main road', 'INDIAN',
 '4.4', '₹ 400', '1050', 'family restaurant', '42 min'),

(8, 'Urban Tadka', 'Vizag', 'Gajuwaka', 'North Indian',
 '4.0', '₹550', '900', 'Casual Dining', '50 min'),

(9, 'Food Junction', 'VIZAG', 'Gajuwaka', 'Fast Food',
 '3.8', '₹250', ' 650 ', 'Quick Bites', '25 min'),

(10, 'food junction', ' vizag ', 'gajuwaka', 'fast food',
 '4.1', '250', '700', 'quick bites', '27 min'),

(11, 'Andhra Spice', 'RJY', 'Bommuru', 'Andhra',
 '4.6', '₹500', '1350', 'Casual Dining', '38 min'),

(12, '  Andhra Spice', 'RJY ', ' Bommuru ', 'andhra',
 '4.5', '500', '1400', 'Casual Dining', '36 min'),

(13, 'Royal Treat', 'Vizag', 'Dwaraka Nagar', 'Multi Cuisine',
 '4.8', '₹800', '2100', 'Fine Dining', '55 min'),

(14, 'royal treat ', 'VIZAG', 'dwaraka nagar', 'multi cuisine',
 '4.6', '₹ 800 ', '2050', 'fine dining', '52 min'),

(15, 'Taste Corner', 'Nagaram', 'Market Road', 'South Indian',
 '3.9', '₹200', '500', 'Quick Bites', '22 min');
 -- shows all coulmn in a table
select count(*) from restaurant;

-- shows particular or selected coulmn only
select restaurant_name,cuisine,city
from restaurant;
select restaurant_name,rating,price from restaurant;

-- shows where the restaurant rating is null
select * from restaurant where rating is null;
     
     -- =========================================
-- STAGE 2: DATA CLEANING
-- =========================================

select trim(restaurant_name) as clean_restaurant_name
from restaurant;

SELECT LOWER(TRIM(city)) AS clean_city
FROM restaurant;

SELECT LOWER(TRIM(cuisine)) AS clean_cuisine
FROM restaurant;

SELECT TRIM(rating) AS clean_rating
FROM restaurant;

SELECT TRIM(replace(price,'₹',' ')) AS clean_price
FROM restaurant;

SELECT TRIM(review_count) AS clean_review_count
FROM restaurant;

SELECT LOWER(TRIM(restaurant_type)) AS clean_restaurant_type
FROM restaurant;

SELECT TRIM(replace(delivery_time,'min',' ')) AS clean_delivery_time
FROM restaurant;

select*from restaurant
where rating  is null;

select restaurant_name,trim(restaurant_name) as clean_restaurant_name
from restaurant;

SELECT city,LOWER(TRIM(city)) AS clean_city
FROM restaurant;

SELECT cuisine,LOWER(TRIM(cuisine)) AS clean_cuisine
FROM restaurant;

SELECT rating,TRIM(rating) AS clean_rating
FROM restaurant;

SELECT price,TRIM(replace(price,'₹','')) AS clean_price
FROM restaurant;

SELECT review_count,TRIM(review_count) AS clean_review_count
FROM restaurant;

SELECT restaurant_type,LOWER(TRIM(restaurant_type)) AS clean_restaurant_type
FROM restaurant;

SELECT delivery_time,TRIM(replace(delivery_time,'min','')) AS clean_delivery_time
FROM restaurant;

     -- STAGE 3: DATA VALIDATION
     
     select trim(restaurant_name) as clean_restaurant_name,
count(*) as count_name
from restaurant
group by trim(restaurant_name)
having count(*)>1;

select trim(restaurant_name),trim(city),trim(area),count(*) as count_
from restaurant 
group by trim(restaurant_name),
trim(city),trim(area)
having count(*)>1;

select*from restaurant
where rating <0 or rating>5;

select*from restaurant
where price <=0;

select*from restaurant
where review_count <=0;

select*from restaurant
where delivery_time <=0;

select distinct upper(trim(city)) as clean_city from restaurant;

select distinct upper(trim(cuisine)) as clean_cuisine from restaurant;

select distinct upper(trim(restaurant_type)) as clean_restaurant_type from restaurant;

select * from restaurant where restaurant is null;

 -- STAGE 4: basic analysis
 
 select  count(restaurant_id) as total_restaurants from restaurant; -- total restaurant count
 
  select upper(trim(city)) as clean_city,count(restaurant_id) as total_restaurants from restaurant
  group by upper(trim(city)); -- total restaurant_count from city
  
   select upper(trim(cuisine)) as clean_cuisine,count(restaurant_id) as total_restaurants from restaurant
   group by upper(trim(cuisine));
   
   select avg(cast(trim(rating) as decimal(3,1))) as clean_rating from restaurant;
   
   select max(cast(trim(rating) as decimal(3,1)))as clean_rating from restaurant;
   select min(cast(trim(rating) as decimal(3,1)))as clean_rating from restaurant;
   
   
   select trim(restaurant_name) as clean_restaurant_name,cast(trim(rating) as decimal(3,1))as clean_rating from restaurant
   order by cast(trim(rating) as decimal(3,1)) desc
   limit 1;
   
   select trim(restaurant_name) as clean_restaurant_name,cast(trim(rating) as decimal(3,1))as clean_rating from restaurant
   order by cast(trim(rating) as decimal(3,1)) asc
   limit 1;
   
   select avg(cast(TRIM(replace(price,'₹',''))as decimal(10,2))) AS clean_price
   from restaurant;
   
   select sum(cast(trim(review_count) as decimal(10,2)))as total_reviews
FROM restaurant;
 
 select trim(restaurant_name) as clean_restaurant_name,cast(trim(review_count) as decimal(10,2)) as total_review
 from restaurant
 order by total_review desc
 limit 1;
 
  select trim(restaurant_name) as clean_restaurant_name,cast(trim(review_count) as decimal(10,2)) as total_review
 from restaurant
 order by total_review asc
 limit 1;
 
 select avg(cast(trim(replace(delivery_time,'min',''))as decimal (10,2))) as clean_delivery_time
 from restaurant;
 
 select upper(trim(restaurant_type)) as clean_restaurant_type,count(restaurant_id) from restaurant
 group by clean_restaurant_type;
 
 select  upper(trim(city)) as clean_city,count(city)from restaurant
 group by clean_city
 having count(city)>2;
 
 select upper(trim(cuisine)) as clean_cuisine, avg(cast(trim(rating) as decimal(3,1)))as clean_rating 
 from restaurant
 group by upper(trim(cuisine))
 having avg(cast(trim(rating) as decimal(3,1))) > 4.3;
 
  -- stage 5 
  
 select  upper(trim(city)) as clean_city, count(restaurant_id) as total_restaurants,avg(cast(trim(rating) as decimal(3,1)))as clean_rating 
 from restaurant
 group by clean_city
 having count(restaurant_id) >2
 and avg(cast(trim(rating) as decimal(3,1))) >4.2;
 
 SELECT
    TRIM(restaurant_name) AS clean_restaurant_name,
    CAST(TRIM(rating) AS DECIMAL(3,1)) AS clean_rating,
    CAST(TRIM(REPLACE(price, '₹', '')) AS DECIMAL(10,2)) AS clean_price,
    CAST(TRIM(review_count) AS DECIMAL(10,2)) AS total_review
FROM restaurant
WHERE CAST(TRIM(rating) AS DECIMAL(3,1)) >= 4.3
  AND CAST(TRIM(REPLACE(price, '₹', '')) AS DECIMAL(10,2)) <= 500
  AND CAST(TRIM(review_count) AS DECIMAL(10,2)) >
      (
          SELECT AVG(CAST(TRIM(review_count) AS DECIMAL(10,2)))
          FROM restaurant
      );
 
 WITH ranked_restaurants AS
(
    SELECT
        TRIM(restaurant_name) AS restaurant_name,
        UPPER(TRIM(city)) AS city,
        CAST(TRIM(rating) AS DECIMAL(3,1)) AS rating,

        RANK() OVER
        (
            PARTITION BY UPPER(TRIM(city))
            ORDER BY CAST(TRIM(rating) AS DECIMAL(3,1)) desc
        ) AS city_rank

    FROM restaurant
)

SELECT
    UPPER(TRIM(cuisine)) AS clean_cuisine,
    ROUND(
        AVG(CAST(TRIM(rating) AS DECIMAL(3,1))),
        2
    ) AS avg_rating
FROM restaurant
GROUP BY UPPER(TRIM(cuisine))
HAVING AVG(CAST(TRIM(rating) AS DECIMAL(3,1)))
       >
       (
           SELECT AVG(CAST(TRIM(rating) AS DECIMAL(3,1)))
           FROM restaurant
       );
       
       SELECT
    UPPER(TRIM(city)) AS clean_city,
    ROUND(
        AVG(CAST(TRIM(rating) AS DECIMAL(3,1))),
        2
    ) AS avg_rating
FROM restaurant
GROUP BY UPPER(TRIM(city))
ORDER BY avg_rating DESC
LIMIT 1;

WITH ranked_restaurants AS
(
    SELECT
        TRIM(restaurant_name) AS restaurant_name,
        UPPER(TRIM(city)) AS city,
        CAST(TRIM(review_count) AS UNSIGNED) AS review_count,

        RANK() OVER
        (
            PARTITION BY UPPER(TRIM(city))
            ORDER BY CAST(TRIM(review_count) AS UNSIGNED) DESC
        ) AS city_rank

    FROM restaurant
)

SELECT
    city,
    restaurant_name,
    review_count
FROM ranked_restaurants
WHERE city_rank = 1;

WITH ranked_restaurants AS
(
    SELECT
        TRIM(restaurant_name) AS restaurant_name,
        UPPER(TRIM(cuisine)) AS cuisine,
        CAST(TRIM(rating) AS DECIMAL(3,1)) AS rating,

        RANK() OVER
        (
            PARTITION BY UPPER(TRIM(cuisine))
            ORDER BY CAST(TRIM(rating) AS DECIMAL(3,1)) DESC
        ) AS cuisine_rank

    FROM restaurant
)

SELECT
    cuisine,
    restaurant_name,
    rating
FROM ranked_restaurants
WHERE cuisine_rank = 1;

SELECT
    CASE
        WHEN CAST(TRIM(REPLACE(price, '₹', '')) AS DECIMAL(10,2)) < 300
            THEN 'Budget'

        WHEN CAST(TRIM(REPLACE(price, '₹', '')) AS DECIMAL(10,2)) <= 600
            THEN 'Mid Range'

        ELSE 'Premium'
    END AS price_category,

    ROUND(
        AVG(CAST(TRIM(rating) AS DECIMAL(3,1))),
        2
    ) AS avg_rating

FROM restaurant

GROUP BY
    CASE
        WHEN CAST(TRIM(REPLACE(price, '₹', '')) AS DECIMAL(10,2)) < 300
            THEN 'Budget'

        WHEN CAST(TRIM(REPLACE(price, '₹', '')) AS DECIMAL(10,2)) <= 600
            THEN 'Mid Range'

        ELSE 'Premium'
    END;
    
    SELECT
    TRIM(r.restaurant_name) AS restaurant_name,
    UPPER(TRIM(r.city)) AS city,
    CAST(TRIM(r.rating) AS DECIMAL(3,1)) AS rating
FROM restaurant r
WHERE CAST(TRIM(r.rating) AS DECIMAL(3,1))
      >
      (
          SELECT AVG(CAST(TRIM(r2.rating) AS DECIMAL(3,1)))
          FROM restaurant r2
          WHERE UPPER(TRIM(r2.city))
                = UPPER(TRIM(r.city))
      );
      
      SELECT
    TRIM(restaurant_name) AS restaurant_name,
    CAST(TRIM(review_count) AS UNSIGNED) AS review_count
FROM restaurant
WHERE CAST(TRIM(review_count) AS UNSIGNED)
      >
      (
          SELECT AVG(CAST(TRIM(review_count) AS UNSIGNED))
          FROM restaurant
      )
ORDER BY review_count DESC;

SELECT
    TRIM(restaurant_name) AS restaurant_name,
    CAST(TRIM(rating) AS DECIMAL(3,1)) AS rating
FROM restaurant
ORDER BY rating DESC
LIMIT 3;

WITH ranked_restaurants AS
(
    SELECT
        TRIM(restaurant_name) AS restaurant_name,
        UPPER(TRIM(city)) AS city,
        CAST(TRIM(rating) AS DECIMAL(3,1)) AS rating,

        ROW_NUMBER() OVER
        (
            PARTITION BY UPPER(TRIM(city))
            ORDER BY CAST(TRIM(rating) AS DECIMAL(3,1)) DESC
        ) AS city_rank

    FROM restaurant
)

SELECT
    city,
    restaurant_name,
    rating,
    city_rank
FROM ranked_restaurants
WHERE city_rank <= 3;

SELECT
    CASE
        WHEN CAST(TRIM(rating) AS DECIMAL(3,1)) >= 4.5
            THEN 'Excellent'

        WHEN CAST(TRIM(rating) AS DECIMAL(3,1)) >= 4.0
            THEN 'Good'

        ELSE 'Needs Attention'
    END AS rating_category,

    COUNT(*) AS total_restaurants

FROM restaurant

GROUP BY
    CASE
        WHEN CAST(TRIM(rating) AS DECIMAL(3,1)) >= 4.5
            THEN 'Excellent'

        WHEN CAST(TRIM(rating) AS DECIMAL(3,1)) >= 4.0
            THEN 'Good'

        ELSE 'Needs Attention'
    END;

SELECT
    city,
    restaurant_name,
    rating
FROM ranked_restaurants
WHERE city_rank = 1;

-- stage 6 final insights

select count(restaurant_id),
 round(avg(CAST(TRIM(rating) AS DECIMAL(3,1))),2) AS avg_rating,
 round(avg(CAST(TRIM(REPLACE(price, '₹', '')) AS DECIMAL(10,2))),2) as avg_price,
sum(cast(trim(review_count) as decimal(10,2))) as total_review,
round(avg(TRIM(replace(delivery_time,'min',''))),2) AS clean_delivery_time from restaurant;

SELECT UPPER(TRIM(city)) AS city,
       COUNT(restaurant_id) AS total_restaurants,
       round( AVG(CAST(TRIM(rating) AS DECIMAL(3,1))),2) AS avg_rating,
      round(AVG(CAST(TRIM(REPLACE(price, '₹', '')) AS DECIMAL(10,2))),2) AS avg_price,
       SUM(CAST(TRIM(review_count) AS DECIMAL(10,2))) AS total_reviews
       FROM restaurant
       GROUP BY UPPER(TRIM(city));
       
       SELECT UPPER(TRIM(cuisine)) AS cuisine,
             COUNT(restaurant_id) AS total_restaurants,
			ROUND(AVG(CAST(TRIM(rating) AS DECIMAL(3,1))),2) AS avg_rating,
		     ROUND(AVG(CAST(TRIM(REPLACE(price, '₹', '')) AS DECIMAL(10,2))),2) AS avg_price,
             SUM( CAST(TRIM(review_count) AS DECIMAL(10,2))) AS total_reviews
             FROM restaurant
             GROUP BY UPPER(TRIM(cuisine));
             
 SELECT
    CASE WHEN CAST(TRIM(REPLACE(price, '₹', '')) AS DECIMAL(10,2)) < 300 THEN 'Budget'
         WHEN CAST(TRIM(REPLACE(price, '₹', '')) AS DECIMAL(10,2)) <= 600 THEN 'Mid Range'
         ELSE 'Premium' END AS price_category,
        COUNT(restaurant_id) AS total_restaurants,
AVG(CAST(TRIM(rating) AS DECIMAL(3,1))) AS avg_rating,
AVG( CAST(TRIM(review_count) AS DECIMAL(10,2))) AS avg_reviews
FROM restaurant
GROUP BY CASE
        WHEN CAST(TRIM(REPLACE(price, '₹', '')) AS DECIMAL(10,2)) < 300 THEN 'Budget'
        WHEN CAST(TRIM(REPLACE(price, '₹', '')) AS DECIMAL(10,2)) <= 600 THEN 'Mid Range'
		ELSE 'Premium'
     END;            
     
     SELECT
    TRIM(restaurant_name) AS restaurant_name,
    CAST(TRIM(rating) AS DECIMAL(3,1)) AS rating
FROM restaurant
ORDER BY rating DESC
LIMIT 3;

SELECT
    TRIM(restaurant_name) AS restaurant_name,
    CAST(TRIM(review_count) AS UNSIGNED) AS review_count
FROM restaurant
ORDER BY review_count DESC
LIMIT 3;
 
WITH ranked_restaurants AS
(
    SELECT
        TRIM(restaurant_name) AS restaurant_name,
        UPPER(TRIM(city)) AS city,
        CAST(TRIM(rating) AS DECIMAL(3,1)) AS rating,

        RANK() OVER
        (
            PARTITION BY UPPER(TRIM(city))
            ORDER BY CAST(TRIM(rating) AS DECIMAL(3,1)) DESC
        ) AS city_rank

    FROM restaurant
)

SELECT
    city,
    restaurant_name,
    rating
FROM ranked_restaurants
WHERE city_rank = 1;

WITH ranked_restaurants AS
(
    SELECT
        TRIM(restaurant_name) AS restaurant_name,
        UPPER(TRIM(city)) AS city,
        CAST(TRIM(review_count) AS UNSIGNED) AS review_count,

        RANK() OVER
        (
            PARTITION BY UPPER(TRIM(city))
            ORDER BY CAST(TRIM(review_count) AS UNSIGNED) DESC
        ) AS city_rank

    FROM restaurant
)

SELECT
    city,
    restaurant_name,
    review_count
FROM ranked_restaurants
WHERE city_rank = 1;

SELECT
    TRIM(restaurant_name) AS restaurant_name,
    CAST(TRIM(rating) AS DECIMAL(3,1)) AS rating,
    CAST(TRIM(review_count) AS UNSIGNED) AS review_count
FROM restaurant
WHERE CAST(TRIM(rating) AS DECIMAL(3,1)) >= 4.5
  AND CAST(TRIM(review_count) AS UNSIGNED)
      >
      (
          SELECT AVG(CAST(TRIM(review_count) AS UNSIGNED))
          FROM restaurant
      )
ORDER BY rating DESC;

SELECT
    TRIM(restaurant_name) AS restaurant_name,
    CAST(TRIM(rating) AS DECIMAL(3,1)) AS rating,
    CAST(TRIM(review_count) AS UNSIGNED) AS review_count
FROM restaurant
WHERE CAST(TRIM(rating) AS DECIMAL(3,1)) >= 4.5
  AND CAST(TRIM(review_count) AS UNSIGNED)
      <
      (
          SELECT AVG(CAST(TRIM(review_count) AS UNSIGNED))
          FROM restaurant
      )
ORDER BY rating DESC;

SELECT
    TRIM(restaurant_name) AS restaurant_name,
    CAST(TRIM(rating) AS DECIMAL(3,1)) AS rating,
    CAST(TRIM(review_count) AS UNSIGNED) AS review_count
FROM restaurant
WHERE CAST(TRIM(rating) AS DECIMAL(3,1)) < 4.0
  AND CAST(TRIM(review_count) AS UNSIGNED)
      >
      (
          SELECT AVG(CAST(TRIM(review_count) AS UNSIGNED))
          FROM restaurant
      )
ORDER BY review_count DESC;

SELECT
    TRIM(restaurant_name) AS restaurant_name,
    CAST(TRIM(REPLACE(delivery_time, 'min', '')) AS UNSIGNED)
        AS delivery_time
FROM restaurant
ORDER BY delivery_time ASC
LIMIT 1;

SELECT
    TRIM(restaurant_name) AS restaurant_name,
    CAST(TRIM(REPLACE(delivery_time, 'min', '')) AS UNSIGNED)
        AS delivery_time
FROM restaurant
ORDER BY delivery_time DESC
LIMIT 1;

SELECT
    UPPER(TRIM(city)) AS city,

    AVG(
        CAST(TRIM(REPLACE(delivery_time, 'min', '')) AS UNSIGNED)
    ) AS avg_delivery_time

FROM restaurant
GROUP BY UPPER(TRIM(city));

SELECT
    UPPER(TRIM(restaurant_type)) AS restaurant_type,

    AVG(
        CAST(TRIM(REPLACE(delivery_time, 'min', '')) AS UNSIGNED)
    ) AS avg_delivery_time

FROM restaurant
GROUP BY UPPER(TRIM(restaurant_type));

SELECT
    TRIM(restaurant_name) AS restaurant_name,

    CAST(TRIM(rating) AS DECIMAL(3,1)) AS rating,

    CAST(
        TRIM(REPLACE(delivery_time, 'min', ''))
        AS UNSIGNED
    ) AS delivery_time

FROM restaurant
ORDER BY delivery_time ASC;

SELECT
    UPPER(TRIM(city)) AS city,
    AVG(CAST(TRIM(rating) AS DECIMAL(3,1))) AS avg_rating
FROM restaurant
GROUP BY UPPER(TRIM(city))
ORDER BY avg_rating DESC
LIMIT 1;

SELECT
    UPPER(TRIM(cuisine)) AS cuisine,
    AVG(CAST(TRIM(rating) AS DECIMAL(3,1))) AS avg_rating
FROM restaurant
GROUP BY UPPER(TRIM(cuisine))
ORDER BY avg_rating DESC
LIMIT 1;

SELECT
    CASE
        WHEN CAST(TRIM(REPLACE(price, '₹', '')) AS DECIMAL(10,2)) < 300
            THEN 'Budget'
        WHEN CAST(TRIM(REPLACE(price, '₹', '')) AS DECIMAL(10,2)) <= 600
            THEN 'Mid Range'
        ELSE 'Premium'
    END AS price_category,

    AVG(CAST(TRIM(rating) AS DECIMAL(3,1))) AS avg_rating

FROM restaurant

GROUP BY
    CASE
        WHEN CAST(TRIM(REPLACE(price, '₹', '')) AS DECIMAL(10,2)) < 300
            THEN 'Budget'
        WHEN CAST(TRIM(REPLACE(price, '₹', '')) AS DECIMAL(10,2)) <= 600
            THEN 'Mid Range'
        ELSE 'Premium'
    END

ORDER BY avg_rating DESC
LIMIT 1;

SELECT
    TRIM(restaurant_name) AS restaurant_name,
    CAST(TRIM(rating) AS DECIMAL(3,1)) AS rating,
    CAST(TRIM(review_count) AS UNSIGNED) AS review_count
FROM restaurant
WHERE CAST(TRIM(rating) AS DECIMAL(3,1)) >= 4.5
  AND CAST(TRIM(review_count) AS UNSIGNED)
      >
      (
          SELECT AVG(CAST(TRIM(review_count) AS UNSIGNED))
          FROM restaurant
      )
ORDER BY rating DESC, review_count DESC;

SELECT
    TRIM(restaurant_name) AS restaurant_name,
    CAST(TRIM(rating) AS DECIMAL(3,1)) AS rating,
    CAST(TRIM(review_count) AS UNSIGNED) AS review_count
FROM restaurant
WHERE CAST(TRIM(rating) AS DECIMAL(3,1)) < 4.0
ORDER BY rating ASC;

	
     