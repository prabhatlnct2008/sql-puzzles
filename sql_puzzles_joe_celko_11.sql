 /**** Problem 11 ****************/
 
 CREATE TABLE Projects
(WORKORDER_ID CHAR(5) NOT NULL, 
 step_nbr INTEGER NOT NULL  CHECK (step_nbr BETWEEN 0 AND 
1000),
 step_status CHAR(1) NOT NULL 
    CHECK (STEP_STATUS IN ('C', 'W')), -- complete, waiting
 PRIMARY KEY (workorder_id, step_nbr));
 
INSERT INTO PROJECTS VALUES(	'AA100'    ,    0    ,   'C'	);
INSERT INTO PROJECTS VALUES(	 'AA100'   ,     1    ,   'W' 	);
INSERT INTO PROJECTS VALUES(	 'AA100'   ,     2  ,    'W' 	);
INSERT INTO PROJECTS VALUES(	 'AA200'    ,    0 ,      'W' 	);
INSERT INTO PROJECTS VALUES(	 'AA200'     ,   1   ,    'W' 	);
INSERT INTO PROJECTS VALUES(	 'AA300'    ,    0    ,   'C'	);
INSERT INTO PROJECTs VALUES(	 'AA300'     ,   1     ,  'C'	);


/** Solution to problem **/

SELECT WORKORDER_ID , STEP_NBR , STEP_STATUS from
(
SELECT WORKORDER_ID , STEP_NBR , STEP_STATUS , LEAD(STEP_STATUS) over (PARTITION BY WORKORDER_ID ORDER BY STEP_STATUS) as lead_value
FROM PROJECTS
)
WHERE STEP_STATUS = 'C' AND STEP_NBR  = 0 AND LEAD_VALUE IS NOT NULL AND LEAD_VALUE <> 'C' ;

