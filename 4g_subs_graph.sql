set colsep " "
set heading OFF 
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


/* Formatted on 2016/10/10 15:12 (Formatter Plus v4.8.8) */
SPOOL /home/ra/ramesh/Automation/4g_K3_data_trend.csv
/* Formatted on 2019/07/04 14:58 (Formatter Plus v4.8.8) */
SELECT   TO_CHAR (TO_DATE (SUBSTR (cust_local_end_date, 3, 6), 'yymmdd'),
                  'yy/mm/dd'
                 ) date_,
         SUM (a.debit_from_advance_prepaid / 1000000) revenue
    FROM ocs_5_mon_cdr_tpng_v2 a, temp_dr_tpng_products b
   WHERE b.col1 = a.offeringid
     AND SUBSTR (cust_local_end_date, 3, 6) >=
                                              TO_CHAR (SYSDATE - 40, 'yymmdd')
     AND b.col2 = '500MB 1 Day'
GROUP BY TO_CHAR (TO_DATE (SUBSTR (cust_local_end_date, 3, 6), 'yymmdd'),
                  'yy/mm/dd'
                 )
ORDER BY TO_CHAR (TO_DATE (SUBSTR (cust_local_end_date, 3, 6), 'yymmdd'),
                  'yy/mm/dd'
                 );
SPOOL off;

/* Formatted on 2016/10/10 15:12 (Formatter Plus v4.8.8) */
SPOOL /home/ra/ramesh/Automation/4g_K6_data_trend.csv
/* Formatted on 2019/07/04 15:00 (Formatter Plus v4.8.8) */
SELECT   TO_CHAR (TO_DATE (SUBSTR (cust_local_end_date, 3, 6), 'yymmdd'),
                  'yy/mm/dd'
                 ) date_,
         SUM (a.debit_from_advance_prepaid / 1000000) revenue
    FROM ocs_5_mon_cdr_tpng_v2 a, temp_dr_tpng_products b
   WHERE b.col1 = a.offeringid
     AND SUBSTR (cust_local_end_date, 3, 6) >=
                                              TO_CHAR (SYSDATE - 40, 'yymmdd')
     AND b.col2 = '1GB 3 Days'
GROUP BY TO_CHAR (TO_DATE (SUBSTR (cust_local_end_date, 3, 6), 'yymmdd'),
                  'yy/mm/dd'
                 )
ORDER BY TO_CHAR (TO_DATE (SUBSTR (cust_local_end_date, 3, 6), 'yymmdd'),
                  'yy/mm/dd'
                 );
SPOOL off;

/* Formatted on 2016/10/10 15:13 (Formatter Plus v4.8.8) */
SPOOL /home/ra/ramesh/Automation/4g_K12_data_trend.csv
/* Formatted on 2019/07/04 15:00 (Formatter Plus v4.8.8) */
SELECT   TO_CHAR (TO_DATE (SUBSTR (cust_local_end_date, 3, 6), 'yymmdd'),
                  'yy/mm/dd'
                 ) date_,
         SUM (a.debit_from_advance_prepaid / 1000000) revenue
    FROM ocs_5_mon_cdr_tpng_v2 a, temp_dr_tpng_products b
   WHERE b.col1 = a.offeringid
     AND SUBSTR (cust_local_end_date, 3, 6) >=
                                              TO_CHAR (SYSDATE - 40, 'yymmdd')
     AND b.col2 = '2GB 7Days'
GROUP BY TO_CHAR (TO_DATE (SUBSTR (cust_local_end_date, 3, 6), 'yymmdd'),
                  'yy/mm/dd'
                 )
ORDER BY TO_CHAR (TO_DATE (SUBSTR (cust_local_end_date, 3, 6), 'yymmdd'),
                  'yy/mm/dd'
                 );
SPOOL off;

/* Formatted on 2016/10/10 15:13 (Formatter Plus v4.8.8) */
SPOOL /home/ra/ramesh/Automation/4g_K55_data_trend.csv
/* Formatted on 2019/07/04 15:01 (Formatter Plus v4.8.8) */
SELECT   TO_CHAR (TO_DATE (SUBSTR (cust_local_end_date, 3, 6), 'yymmdd'),
                  'yy/mm/dd'
                 ) date_,
         SUM (a.debit_from_advance_prepaid / 1000000) revenue
    FROM ocs_5_mon_cdr_tpng_v2 a, temp_dr_tpng_products b
   WHERE b.col1 = a.offeringid
     AND SUBSTR (cust_local_end_date, 3, 6) >=
                                              TO_CHAR (SYSDATE - 40, 'yymmdd')
     AND b.col2 = '10GB 30Days'
GROUP BY TO_CHAR (TO_DATE (SUBSTR (cust_local_end_date, 3, 6), 'yymmdd'),
                  'yy/mm/dd'
                 )
ORDER BY TO_CHAR (TO_DATE (SUBSTR (cust_local_end_date, 3, 6), 'yymmdd'),
                  'yy/mm/dd'
                 );
SPOOL off;


/* Formatted on 2016/10/10 15:14 (Formatter Plus v4.8.8) */
SPOOL /home/ra/ramesh/Automation/4g_K110_data_trend.csv
/* Formatted on 2019/07/04 15:02 (Formatter Plus v4.8.8) */
SELECT   TO_CHAR (TO_DATE (SUBSTR (cust_local_end_date, 3, 6), 'yymmdd'),
                  'yy/mm/dd'
                 ) date_,
         SUM (a.debit_from_advance_prepaid / 1000000) revenue
    FROM ocs_5_mon_cdr_tpng_v2 a, temp_dr_tpng_products b
   WHERE b.col1 = a.offeringid
     AND SUBSTR (cust_local_end_date, 3, 6) >=
                                              TO_CHAR (SYSDATE - 40, 'yymmdd')
     AND b.col2 = '20GB 30 Days'
GROUP BY TO_CHAR (TO_DATE (SUBSTR (cust_local_end_date, 3, 6), 'yymmdd'),
                  'yy/mm/dd'
                 )
ORDER BY TO_CHAR (TO_DATE (SUBSTR (cust_local_end_date, 3, 6), 'yymmdd'),
                  'yy/mm/dd'
                 );
SPOOL off;

/* Formatted on 2016/10/10 15:14 (Formatter Plus v4.8.8) */
SPOOL /home/ra/ramesh/Automation/4g_Weekend_data_trend.csv
/* Formatted on 2019/07/04 15:02 (Formatter Plus v4.8.8) */
SELECT   TO_CHAR (TO_DATE (SUBSTR (cust_local_end_date, 3, 6), 'yymmdd'),
                  'yy/mm/dd'
                 ) date_,
         SUM (a.debit_from_advance_prepaid / 1000000) revenue
    FROM ocs_5_mon_cdr_tpng_v2 a, temp_dr_tpng_products b
   WHERE b.col1 = a.offeringid
     AND SUBSTR (cust_local_end_date, 3, 6) >=
                                              TO_CHAR (SYSDATE - 40, 'yymmdd')
     AND b.col2 = 'Weekend Data Bundle'
GROUP BY TO_CHAR (TO_DATE (SUBSTR (cust_local_end_date, 3, 6), 'yymmdd'),
                  'yy/mm/dd'
                 )
ORDER BY TO_CHAR (TO_DATE (SUBSTR (cust_local_end_date, 3, 6), 'yymmdd'),
                  'yy/mm/dd'
                 );


/* Formatted on 2016/10/10 15:14 (Formatter Plus v4.8.8) */
SPOOL /home/ra/ramesh/Automation/4g_K150_data_trend.csv
/* Formatted on 2019/07/04 15:02 (Formatter Plus v4.8.8) */
SELECT   TO_CHAR (TO_DATE (SUBSTR (cust_local_end_date, 3, 6), 'yymmdd'),
                  'yy/mm/dd'
                 ) date_,
         SUM (a.debit_from_advance_prepaid / 1000000) revenue
    FROM ocs_5_mon_cdr_tpng_v2 a, temp_dr_tpng_products b
   WHERE b.col1 = a.offeringid
     AND SUBSTR (cust_local_end_date, 3, 6) >=
                                              TO_CHAR (SYSDATE - 40, 'yymmdd')
     AND b.col2 = '30GB 30 Days'
GROUP BY TO_CHAR (TO_DATE (SUBSTR (cust_local_end_date, 3, 6), 'yymmdd'),
                  'yy/mm/dd'
                 )
ORDER BY TO_CHAR (TO_DATE (SUBSTR (cust_local_end_date, 3, 6), 'yymmdd'),
                  'yy/mm/dd'
                 );
SPOOL off;

/* Formatted on 2016/10/10 15:14 (Formatter Plus v4.8.8) */
SPOOL /home/ra/ramesh/Automation/4g_K30_data_trend.csv
/* Formatted on 2019/07/04 15:02 (Formatter Plus v4.8.8) */
SELECT   TO_CHAR (TO_DATE (SUBSTR (cust_local_end_date, 3, 6), 'yymmdd'),
                  'yy/mm/dd'
                 ) date_,
         SUM (a.debit_from_advance_prepaid / 1000000) revenue
    FROM ocs_5_mon_cdr_tpng_v2 a, temp_dr_tpng_products b
   WHERE b.col1 = a.offeringid
     AND SUBSTR (cust_local_end_date, 3, 6) >=
                                              TO_CHAR (SYSDATE - 40, 'yymmdd')
     AND b.col2 = 'Fortnightly Data Plan 5GB'
GROUP BY TO_CHAR (TO_DATE (SUBSTR (cust_local_end_date, 3, 6), 'yymmdd'),
                  'yy/mm/dd'
                 )
ORDER BY TO_CHAR (TO_DATE (SUBSTR (cust_local_end_date, 3, 6), 'yymmdd'),
                  'yy/mm/dd'
                 );
SPOOL off;



exit;

