
DECLARE
                                                                        
CURSOR c_set_choix IS  SELECT  code_e FROM ETUDIANT  order by moyenne desc    ;  
 v_code_e   ETUDIANT.code_e%TYPE;
v_choix varchar2(10) ;
v_count_choix1 number  ; 
v_count_choix2 number  ;
v_count_choix3 number  ;


BEGIN

--------------------------------clear Master table to   reset agine-----------
delete from Master ;
commit ;

-------------------------------set  specialite  fro every ETUDIANT ----------
OPEN c_set_choix;
LOOP
            FETCH c_set_choix INTO  v_code_e  ;
            
            select count(Specialite) into v_count_choix1 from MASTER  where  Specialite= (select choix1 from choix where code_e=v_code_e) ;
            select count(Specialite) into v_count_choix2 from MASTER  where  Specialite= (select choix2 from choix where code_e=v_code_e) ;
            select count(Specialite) into v_count_choix3 from MASTER  where  Specialite= (select choix3 from choix where code_e=v_code_e) ;
         
                
         if  v_count_choix1 < 2 then
                 select  choix1 into v_choix from CHOIX  WHERE  code_e = v_code_e;
                 insert into MASTER  select * from ETUDIANT where  code_e = v_code_e;
                 UPDATE  MASTER SET   Specialite =  v_choix WHERE  code_e = v_code_e;

                 --UPDATE  ETUDIANT SET   Specialite =  v_choix WHERE  code_e = v_code_e;
        
            elsif v_count_choix2 < 2 then
                 select  choix2 into v_choix from CHOIX  WHERE  code_e = v_code_e;
                 insert into MASTER  select * from ETUDIANT where  code_e = v_code_e;
                 UPDATE  MASTER SET   Specialite =  v_choix WHERE  code_e = v_code_e;
                --UPDATE  ETUDIANT SET   Specialite =  v_choix WHERE  code_e = v_code_e;
        
            elsif v_count_choix3 < 2 then
                 select  choix3 into v_choix from CHOIX  WHERE  code_e = v_code_e;
                 insert into MASTER  select * from ETUDIANT where  code_e = v_code_e;
                 UPDATE  MASTER SET   Specialite =  v_choix WHERE  code_e = v_code_e;
                -- UPDATE  ETUDIANT SET   Specialite =  v_choix WHERE  code_e = v_code_e;
        end if ;
        
        
          commit ;
          EXIT WHEN c_set_choix%NOTFOUND;
END LOOP;
CLOSE c_set_choix;


END;