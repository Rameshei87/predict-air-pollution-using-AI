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
spool /home/ra/ramesh/Automation/cont_30_days_active_trend.xls
/* Formatted on 12/10/2015 10:32:30 AM (QP5 v5.149.1003.31008) */
SELECT TO_CHAR (date_d, 'yy/mm/dd') date_, COUNT
  FROM temp_dr_30_active_png
 WHERE TRUNC (date_d) >= TRUNC (SYSDATE - 40) order by 1;
spool off;
exit;

