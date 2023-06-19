 set SERVEROUTPUT on;
DECLARE

CURSOR c_moyenne_range IS  SELECT  code_e FROM ETUDIANT  ;

 v_code_e   ETUDIANT.code_e%TYPE;
m number ;
v_rang number  ;


BEGIN
----------calcule moyenne------------------------------------------------------------------------
OPEN c_moyenne_range;
 LOOP
 
                FETCH c_moyenne_range INTO  v_code_e  ;
                
               select sum( note * coefficient ) /sum( coefficient ) into m   FROM NOTES   INNER JOIN MODULE using(code_m ) where  code_e =   v_code_e;
            
                UPDATE  ETUDIANT SET   moyenne=ROUND(m,2)  WHERE  code_e = v_code_e;
            
             -- DBMS_OUTPUT.PUT_LINE(m );
              commit ;
             EXIT WHEN c_moyenne_range%NOTFOUND;

END LOOP;
CLOSE c_moyenne_range;


 ---------------------calcule Range------------------------------------------------
OPEN c_moyenne_range;
LOOP

         FETCH c_moyenne_range INTO  v_code_e  ;
            --we use in this case rank function 
        select rang  into v_rang   from (SELECT  code_e , RANK () OVER (  ORDER BY  moyenne DESC )rang FROM ETUDIANT)where code_e =   v_code_e;
         
        
        UPDATE  ETUDIANT SET  rang=v_rang  WHERE  code_e = v_code_e;
        
          --DBMS_OUTPUT.PUT_LINE(v_rang );
        commit ;
         EXIT WHEN c_moyenne_range%NOTFOUND;
         
END LOOP;
CLOSE c_moyenne_range;
--------------------------------------------------------------------------------------------
END;