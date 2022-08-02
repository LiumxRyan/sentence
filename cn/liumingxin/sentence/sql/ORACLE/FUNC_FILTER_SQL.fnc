CREATE OR REPLACE FUNCTION FUNC_FILTER_SQL(sSql IN VARCHAR2) RETURN VARCHAR2 IS
  retval NUMBER;
  src_LEN NUMBER;
  tar_LEN NUMBER;
  tSql varchar2(3000);
BEGIN
   retval := 0;
   if sSql is null then
     retval := 0;
     return retval;
   end if;

   src_LEN := LENGTH(trim(sSql));
   tSql    := lower(trim(sSql));

   tSql    := Replace(tSql,'insert','');
   tSql    := Replace(tSql,'update','');
   tSql    := Replace(tSql,'delete','');
   tSql    := Replace(tSql,'truncate','');
   tSql    := Replace(tSql,'exec','');
   tSql    := Replace(tSql,'alter','');
   tSql    := Replace(tSql,'alert','');
   tSql    := Replace(tSql,'script','');
   tSql    := Replace(tSql,'</','');
   tSql    := Replace(tSql,'create','');
   tSql    := Replace(tSql,'drop','');
   tSql    := Replace(tSql,'cursor','');
   tSql    := Replace(tSql,'fetch','');
   tSql    := Replace(tSql,'when','');
   tSql    := Replace(tSql,'lock','');
   tSql    := Replace(tSql,'revoke','');
   tSql    := Replace(tSql,'--','');
   tSql    := Replace(tSql,'/**/','');

   tar_LEN := LENGTH(tSql);

   IF src_LEN = tar_LEN THEN
     retval := 0;
   ELSE
     retval := 1;
   END IF;

 RETURN retval;
END;