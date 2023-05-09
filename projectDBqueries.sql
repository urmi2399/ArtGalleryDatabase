-- Team 15
-- Members: Urmi Sheth 1002064934, 
--          Yash Patel 1002084351,
--          Keya Shah  1002079489 


-- 1. Retrieve the typeof art that was sold maximum in the last month(i.e last 1 month).
SELECT ART_TYPE, COUNT(ART_TYPE) AS NO_OF_ARTS FROM F22_S004_15_ART WHERE ART_ID IN(
SELECT ART_ID FROM F22_S004_15_ORG_BUYS
WHERE BUY_DATE BETWEEN '01-OCT-2022' AND '31-OCT-2022'
UNION
SELECT ART_ID FROM F22_S004_15_CUSTOMER_BUYS
WHERE BUY_DATE BETWEEN '01-OCT-2022' AND '31-OCT-2022')
GROUP BY ART_TYPE
order by NO_OF_ARTS DESC
FETCH FIRST 1 ROWS ONLY;

-----output------
SKETCHING	4




-- 2. Retrieve the type of art that was the most popular over the period of time. (positive ratings and status sold)
SELECT ART_TYPE, COUNT(ART_TYPE) AS NO_OF_ARTS FROM F22_S004_15_ART WHERE ART_ID IN(
SELECT ART_ID FROM F22_S004_15_ORG_BUYS
UNION
SELECT ART_ID FROM F22_S004_15_CUSTOMER_BUYS)
GROUP BY ART_TYPE
ORDER BY NO_OF_ARTS DESC;

-----output------
SKETCHING	7
POTTERY	4
HANDCRAFT	4
SCULPTURE	4
KNITTING	4
PAINTING	2




----------------------------------------
-- 3. Retrieve the art trend followed by a particular age group 
SELECT TYPE_OF_ART, COUNT(TYPE_OF_ART) AS TOTAL_NO_OF_ARTS
FROM 
(SELECT C.Person_id,C.TYPE_OF_ART, P.ZIP
FROM F22_S004_15_CUSTOMER C, F22_S004_15_PERSON P
WHERE C.Person_id IN
(SELECT   Person_id
FROM F22_S004_15_PERSON
WHERE EXTRACT(year FROM DOB) BETWEEN 2000 AND 2010
) AND C.Person_id = P.Person_id) 
GROUP BY TYPE_OF_ART;


-----output------
SKETCHING	2
HANDCRAFT	1
PAINTING	1
KNITTING	2



---------------------
-- Which type of art will give the most profit?
-- 4. Retrieve the type of art which will give the most profit.

SELECT ART_TYPE, SUM(PRICE)
FROM F22_S004_15_ART 
WHERE STATUS = 'SOLD'
GROUP BY ART_TYPE
ORDER BY SUM(PRICE) DESC
FETCH FIRST 1 ROW ONLY;

-----output------
SCULPTURE	8700



----------------------------------
--How big is the art gallery business (in dollars)?
--5.  Retrieve the total revenue of each art gallery.
    

SELECT DISTINCT(AG.ART_GALLERY_NAME),SUM(A.PRICE) OVER (PARTITION BY AG.ART_GALLERY_NAME, A.ART_GALLERY_ID)AS REVENUE
    FROM F22_S004_15_ART A, F22_S004_15_ART_GALLERY AG
    WHERE STATUS='SOLD' AND A.ART_GALLERY_ID = AG.ART_GALLERY_ID
    ORDER BY REVENUE DESC;

-----output------
RUBY CITY	8600
THE UPSTAIRS GALLERY	7400
UTA GALLERY	6100
RAIMBOW MUSUME	4050
THE MUSUME OF FINE ART	3400
MEXICAN ART	2450
GALLERY 414	1600




-----------------------------------
-- 6. Retrieve the place by analyzing the maximum number of sales of art by any given organization or customer.

SELECT ZIP,  COUNT(ZIP) AS TOTAL_NO_OF_SALES
FROM F22_S004_15_PERSON
WHERE PERSON_ID IN(
      SELECT PERSON_ID  
      FROM F22_S004_15_CUSTOMER 
      WHERE CUSTOMER_ID
      IN (
            SELECT CUSTOMER_ID 
            FROM F22_S004_15_CUSTOMER_BUYS))
GROUP BY ZIP
ORDER BY TOTAL_NO_OF_SALES DESC;


--------output-----
76013	7
78015	3
75002	2
77001	1
75001	1

-------------------------

--7   Retrieve the most popular artist by analyzing the sales of art for any particular area.
    
SELECT C.ARTIST_ID, COUNT(A.ART_ID) AS TOTAL_ART 
FROM F22_S004_15_CREATES C, F22_S004_15_ART A 
WHERE A.ART_ID 
IN (SELECT CB.ART_ID
FROM F22_S004_15_CUSTOMER_BUYS CB
WHERE CB.ART_ID IN (SELECT ART_ID FROM F22_S004_15_ART A WHERE STATUS='SOLD')
UNION
SELECT OB.ART_ID
FROM F22_S004_15_ORG_BUYS OB
WHERE OB.ART_ID IN (SELECT ART_ID FROM F22_S004_15_ART A WHERE STATUS='SOLD')) AND A.ART_ID = C.ART_ID
GROUP BY C.ARTIST_ID;


-------output----
9034	1
9005	1
9033	1
9014	1
9008	3
9021	1
9028	1
9032	1
9036	1
9004	1

-------------

--8. Retrieve the place by analyzing the maximum number of sales of art by any given organization.

SELECT ZIP, COUNT(ZIP) AS TOTAL_NO_OF_SALES
FROM F22_S004_15_ORGANIZATION WHERE ORGANIZATION_ID
IN (SELECT ORGANIZATION_ID FROM F22_S004_15_ORG_BUYS)
GROUP BY ZIP
ORDER BY TOTAL_NO_OF_SALES DESC ;




----------output------
75001	3
76013	2
73301	1



------
--9.Retrieve the Art Gallery revenue as whole, by art type as well as entire business 

SELECT ART_GALLERY_ID,ART_TYPE,SUM(PRICE) FROM F22_S004_15_ART
WHERE STATUS ='SOLD'
GROUP BY ROLLUP(ART_GALLERY_ID,ART_TYPE);

---------output------
901	POTTERY	1500
901	KNITTING	900
901	PAINTING	3500
901	SCULPTURE	600
901	SKETCHING	900
901		7400
902	POTTERY	1000
902	KNITTING	750
902	PAINTING	900
902	SCULPTURE	900
902	SKETCHING	500
902		4050
903	KNITTING	400
903	PAINTING	1500
903	HANDCRAFT	300
903	SCULPTURE	1200
903		3400
904	HANDCRAFT	600
904	SCULPTURE	6000

