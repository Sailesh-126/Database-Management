create or replace trigger t3 after insert on book for each row
begin
if :new.price > 1000 then
dbms_output.put_line('Too costly');
end if;
end;
/