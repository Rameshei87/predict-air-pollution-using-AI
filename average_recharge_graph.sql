set colsep ","
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
set linesize 250
set long 999999
set markup html on entmap on spool on preformat off;
spool /home/ra/ramesh/Automation/average_recharge.xls
/* Formatted on 21/12/2015 4:32:59 PM (QP5 v5.149.1003.31008) */
  SELECT TO_CHAR (TO_DATE (DATE_D, 'yymmdd'), 'yy/mm/dd') date_,
         AVERAGE_RECHARGE
    FROM temp_dr_recharge_rep
   WHERE DATE_D >= TO_CHAR (SYSDATE - 40, 'yymmdd')
         AND DATE_D != TO_CHAR (SYSDATE, 'yymmdd')
GROUP BY DATE_D, AVERAGE_RECHARGE
ORDER BY DATE_D;

spool /home/ra/ramesh/Automation/total_recharge.xls
  SELECT TO_CHAR (TO_DATE (DATE_D, 'yymmdd'), 'yy/mm/dd') date_,
         ROUND (TOTAL_RECHARGE) TOTAL_RECHARGE
    FROM temp_dr_recharge_rep
   WHERE DATE_D >= TO_CHAR (SYSDATE - 40, 'yymmdd')
         AND DATE_D != TO_CHAR (SYSDATE, 'yymmdd')
GROUP BY DATE_D, TOTAL_RECHARGE
ORDER BY DATE_D;

spool /home/ra/ramesh/Automation/average_balance.xls
  SELECT TO_CHAR (TO_DATE (DATE_D, 'yyyymmdd'), 'yy/mm/dd') date_,
         AVERAGE_BALANCE
    FROM temp_dr_average_balance
   WHERE DATE_D >= TO_CHAR (SYSDATE - 40, 'yyyymmdd')
         AND DATE_D != TO_CHAR (SYSDATE, 'yyyymmdd')
GROUP BY DATE_D, AVERAGE_BALANCE
ORDER BY DATE_D;

SPOOL OFF;

exit;

