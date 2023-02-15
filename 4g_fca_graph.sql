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
spool /home/ra/ramesh/Automation/4g_fca_trend.xls
/* Formatted on 2018/09/21 09:10 (Formatter Plus v4.8.8) */
SELECT   TO_CHAR (TO_DATE (SUBSTR (col15, 3, 6), 'yymmdd'), 'yy/mm/dd') date_,
         COUNT (DISTINCT col22) fca_count
    FROM ocs_5_first_cdr_tpng_v2
   WHERE SUBSTR (col15, 3, 6) >= TO_CHAR (SYSDATE - 40, 'yymmdd')
     AND SUBSTR (col15, 3, 6) != TO_CHAR (SYSDATE, 'yymmdd')
GROUP BY SUBSTR (col15, 3, 6)
ORDER BY SUBSTR (col15, 3, 6);
spool off;
exit;

