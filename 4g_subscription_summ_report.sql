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
SPOOL /home/ra/ramesh/Automation/report/4g_subscriptions_summ_report.xls
/* Formatted on 2022/02/13 18:46 (Formatter Plus v4.8.8) */
SELECT   TO_DATE (SUBSTR (cust_local_end_date, 3, 6), 'yymmdd') date_,
         b.col2 subscription_name, COUNT (*) subscription_count,
         COUNT (DISTINCT pri_identity) unique_users,
         SUM (a.debit_from_advance_prepaid / 1000000) revenue
    FROM cbs_mon_cdr a, temp_dr_tpng_products b
   WHERE a.offeringid = b.col1
     AND pri_identity LIKE '6757%'
     AND SUBSTR (cust_local_end_date, 3, 6) >=
                                              TO_CHAR (SYSDATE - 40, 'yymmdd')
   and a.debit_from_advance_prepaid > '0' 
GROUP BY SUBSTR (cust_local_end_date, 3, 6), b.col2
ORDER BY SUBSTR (cust_local_end_date, 3, 6), b.col2;

SPOOL /home/ra/ramesh/Automation/report/4g_evd_recharge_summ_report.xls
SELECT   TO_DATE (SUBSTR (TO_CHAR (  TO_DATE (entry_date, 'yyyymmddhh24miss')
                                   + .41667,
                                   'yyyymmddhh24miss'
                                  ),
                          3,
                          6
                         ),
                  'yymmdd'
                 ) date_,
         channel_id, original_amt / 1000000 deno,
         SUM (original_amt / 1000000) recharge_amt,
         COUNT (DISTINCT pri_identity) users_, COUNT (*) count_
    FROM cbs_voucher_cdr
   WHERE SUBSTR (TO_CHAR (TO_DATE (entry_date, 'yyyymmddhh24miss') + .41667,
                          'yyyymmddhh24miss'
                         ),
                 3,
                 6
                ) >= TO_CHAR (SYSDATE - 40, 'yymmdd')
     AND original_amt > '0'
     --  AND channel_id IN ('4', '99', '3')
     AND card_sequence IS NULL
     AND pri_identity LIKE '6757%'
GROUP BY TO_DATE (SUBSTR (TO_CHAR (  TO_DATE (entry_date, 'yyyymmddhh24miss')
                                   + .41667,
                                   'yyyymmddhh24miss'
                                  ),
                          3,
                          6
                         ),
                  'yymmdd'
                 ),
         channel_id,
         original_amt / 1000000
ORDER BY 1, 2;
SPOOL OFF
exit;
