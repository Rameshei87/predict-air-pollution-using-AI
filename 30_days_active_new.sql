set colsep ","
--set colsep '|'
set heading ON
set feedback off
set trim on
set trimspool on
set underline off
set verify off
set wrap on
set pagesize 250
set linesize 999
set long 999999
set pagesize 250
set linesize 999
set long 999999
set markup html on entmap on spool on preformat off;
spool /home/ra/ramesh/Automation/30_days_active_trend.xls
/* Formatted on 2020/01/08 09:17 (Formatter Plus v4.8.8) */
SELECT   TO_CHAR (TO_DATE (date_d, 'dd-mm-yy'), 'yy/mm/dd') date_, COUNT
    FROM temp_dr_30_active_new_png
   WHERE date_d >= TRUNC (SYSDATE - 40)
-- AND TYPE = 'PREPAID'
ORDER BY 1;
spool off;
exit;
