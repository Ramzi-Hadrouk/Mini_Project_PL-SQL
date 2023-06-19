DROP TRIGGER check_notes;
CREATE OR REPLACE TRIGGER check_notes before insert or update OF note ON NOTES
for Each Row
begin
    IF :new.note < 0 
     THEN
        raise_application_error(-20000, 'Advance cannot be less than 0 .');
    ELSIF :new.note > 20
     THEN
        raise_application_error(-20001 , 'Advance cannot be greater than 20 .');
    END IF;

end;