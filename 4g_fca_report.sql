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
SPOOL /home/ra/ramesh/Automation/report/4g_fca_report.xls

/* Formatted on 2022/02/13 18:49 (Formatter Plus v4.8.8) */
SELECT   pri_identity msisdn,
         TO_DATE (cust_local_end_date, 'yyyymmddhh24miss') fca_date
    FROM cbs_first_cdr
   WHERE SUBSTR (cust_local_end_date, 3, 6) >=
                                              TO_CHAR (SYSDATE - 10, 'yymmdd')
     AND pri_identity LIKE '6757%'
ORDER BY cust_local_end_date;


SPOOL OFF
exit;
