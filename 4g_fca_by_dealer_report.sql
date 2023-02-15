/* Formatted on 2019/05/22 13:29 (Formatter Plus v4.8.8) */
TRUNCATE TABLE temp_4g_sim_base;

INSERT INTO temp_4g_sim_base
   SELECT   (SELECT r.item_desc_v
               FROM inv_item_master@cbs_new r
              WHERE r.item_code_n = b.item_code_n) model,
            (SELECT location_v
               FROM cb_retail_outlets@cbs_new
              WHERE location_code_n = b.location_code_n) location_,
            mobile_number_v, b.transaction_num_v, c.name_v
       FROM cb_dealer_master@cbs_new a,
            gsm_starter_pack_dtls@cbs_new b,
            cb_pos_transactions@cbs_new c
      WHERE c.account_link_code_n = a.account_link_code_n
        AND b.transaction_num_v = c.transaction_num_v
        AND b.status_v != 'F'
        AND TRUNC (transaction_date_d) >= '01-jan-2016'
   ORDER BY 3, 1, 2;

COMMIT ;

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
SPOOL /home/ra/ramesh/Automation/report/4g_fca_by_dealer_report.xls

/* Formatted on 2019/05/22 13:29 (Formatter Plus v4.8.8) */
SELECT   TO_DATE (SUBSTR (CUST_LOCAL_END_DATE, 3, 6), 'yymmdd') date_, b.name_v dealer_name,
         b.location_, COUNT (DISTINCT a.pri_identity) fca_count
    FROM cbs_first_cdr a, temp_4g_sim_base b
   WHERE a.CUST_LOCAL_END_DATE = '675' || b.mobile_number_v
     AND SUBSTR (CUST_LOCAL_END_DATE, 3, 6) >= to_char(sysdate-90,'yymmdd') 
     AND pri_identity LIKE '6757%'
GROUP BY TO_DATE (SUBSTR (CUST_LOCAL_END_DATE, 3, 6), 'yymmdd'), b.name_v, b.location_
ORDER BY TO_DATE (SUBSTR (CUST_LOCAL_END_DATE, 3, 6), 'yymmdd'), b.name_v, b.location_;

SPOOL /home/ra/ramesh/Automation/report/3g_fca_by_dealer_report.xls

/* Formatted on 2022/02/13 19:01 (Formatter Plus v4.8.8) */
SELECT   TO_DATE (SUBSTR (col15, 3, 6), 'yymmdd') date_, b.name_v dealer_name,
         b.location_, COUNT (DISTINCT a.col22) fca_count
    FROM ocs_5_first_cdr@red a, temp_4g_sim_base b
   WHERE a.col22 = '675' || b.mobile_number_v
     AND SUBSTR (col15, 3, 6) >= TO_CHAR (SYSDATE - 90, 'yymmdd')
GROUP BY TO_DATE (SUBSTR (col15, 3, 6), 'yymmdd'), b.name_v, b.location_
ORDER BY TO_DATE (SUBSTR (col15, 3, 6), 'yymmdd'), b.name_v, b.location_;


SPOOL OFF
exit;
