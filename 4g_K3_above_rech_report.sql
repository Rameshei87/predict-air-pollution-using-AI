set colsep ","
set heading ON
set feedback off
set trim on
set trimspool on
set underline off
set verify off
set wrap on
set long 999999
set pagesize 40000 
set linesize 9999 
set long 999999
set markup html on entmap on spool on preformat off;
alter session set nls_date_format = 'yyyy/mm/dd hh24:mi:ss' ;
SPOOL /home/ra/ramesh/Automation/report/4g_K3_above_recharge_report.xls
/* Formatted on 2019/04/16 08:15 (Formatter Plus v4.8.8) */
SELECT   TO_DATE (TO_CHAR (TO_DATE (entry_date, 'yyyymmddhh24miss') + .41667,
                           'yymmdd'
                          ),
                  'yymmdd'
                 ) recharge_date,
         SUM (original_amt / 1000000) recharge_amount,
         COUNT (DISTINCT pri_identity) unique_recharge_users
    FROM cbs_voucher_cdr
   WHERE TO_CHAR (TO_DATE (entry_date, 'yyyymmddhh24miss') + .41667, 'yymmdd') >=
                                              TO_CHAR (SYSDATE - 40, 'yymmdd')
        AND pri_identity LIKE '6757%' 
GROUP BY TO_CHAR (TO_DATE (entry_date, 'yyyymmddhh24miss') + .41667, 'yymmdd')
ORDER BY TO_CHAR (TO_DATE (entry_date, 'yyyymmddhh24miss') + .41667, 'yymmdd');
SPOOL OFF
exit;
