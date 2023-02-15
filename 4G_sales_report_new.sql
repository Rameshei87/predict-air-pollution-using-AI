--=====================4G Sales Summary==============================
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
/* Formatted on 2018/06/15 14:17 (Formatter Plus v4.8.8) */
spool /home/ra/ramesh/Automation/report/sales_report_rait_cards.xls

/* Formatted on 2022/05/27 08:42 (Formatter Plus v4.8.8) */
SELECT   loc, name_v,
         TO_CHAR
            (SUM (CASE
                     WHEN date_ BETWEEN '01-Jan-2022' AND '31-Jan-2022'
                        THEN sales_amt
                  END
                 ),
             '999,999,999'
            ) jan_2022_sales,
         TO_CHAR
            (SUM (CASE
                     WHEN date_ BETWEEN '01-Feb-2022' AND '28-Feb-2022'
                        THEN sales_amt
                  END
                 ),
             '999,999,999'
            ) feb_2022_sales,
         TO_CHAR
            (SUM (CASE
                     WHEN date_ BETWEEN '01-Mar-2022' AND '31-Mar-2022'
                        THEN sales_amt
                  END
                 ),
             '999,999,999'
            ) mar_2022_sales,
         TO_CHAR
            (SUM (CASE
                     WHEN date_ BETWEEN '01-Apr-2022' AND '30-Apr-2022'
                        THEN sales_amt
                  END
                 ),
             '999,999,999'
            ) apr_2022_sales,
         TO_CHAR
            (SUM (CASE
                     WHEN date_ BETWEEN '01-May-2022' AND '31-May-2022'
                        THEN sales_amt
                  END
                 ),
             '999,999,999'
            ) may_2022_sales,
         TO_CHAR
            (SUM (CASE
                     WHEN date_ BETWEEN '01-Jun-2022' AND '30-Jun-2022'
                        THEN sales_amt
                  END
                 ),
             '999,999,999'
            ) jun_2022_sales,
         TO_CHAR
            (SUM (CASE
                     WHEN date_ BETWEEN '01-Jul-2022' AND '31-Jul-2022'
                        THEN sales_amt
                  END
                 ),
             '999,999,999'
            ) jul_2022_sales,
         TO_CHAR
            (SUM (CASE
                     WHEN date_ BETWEEN '01-Aug-2022' AND '31-Aug-2022'
                        THEN sales_amt
                  END
                 ),
             '999,999,999'
            ) aug_2022_sales,
         TO_CHAR
            (SUM (CASE
                     WHEN date_ BETWEEN '01-Sep-2022' AND '30-Sep-2022'
                        THEN sales_amt
                  END
                 ),
             '999,999,999'
            ) sep_2022_sales,
         TO_CHAR
            (SUM (CASE
                     WHEN date_ BETWEEN '01-Oct-2022' AND '31-Oct-2022'
                        THEN sales_amt
                  END
                 ),
             '999,999,999'
            ) oct_2022_sales,
         TO_CHAR
            (SUM (CASE
                     WHEN date_ BETWEEN '01-Nov-2022' AND '30-Nov-2022'
                        THEN sales_amt
                  END
                 ),
             '999,999,999'
            ) nov_2022_sales,
         TO_CHAR
            (SUM (CASE
                     WHEN date_ BETWEEN '01-Dec-2022' AND '31-Dec-2022'
                        THEN sales_amt
                  END
                 ),
             '999,999,999'
            ) dec_2022_sales
    FROM agility_sales_data
   WHERE item_group != 'DIRECT TOPUP'
     AND date_ >= '01-Jan-2022'
     AND loc != 'HONIARA'
     AND name_v NOT IN ('JPTEST', 'Prospect Customer')
GROUP BY name_v, loc
UNION ALL
SELECT   '_GRAND_TOTAL', 'GRAND_TOTAL',
         TO_CHAR
            (SUM (CASE
                     WHEN date_ BETWEEN '01-Jan-2022' AND '31-Jan-2022'
                        THEN sales_amt
                  END
                 ),
             '999,999,999'
            ) jan_2022_sales,
         TO_CHAR
            (SUM (CASE
                     WHEN date_ BETWEEN '01-Feb-2022' AND '28-Feb-2022'
                        THEN sales_amt
                  END
                 ),
             '999,999,999'
            ) feb_2022_sales,
         TO_CHAR
            (SUM (CASE
                     WHEN date_ BETWEEN '01-Mar-2022' AND '31-Mar-2022'
                        THEN sales_amt
                  END
                 ),
             '999,999,999'
            ) mar_2022_sales,
         TO_CHAR
            (SUM (CASE
                     WHEN date_ BETWEEN '01-Apr-2022' AND '30-Apr-2022'
                        THEN sales_amt
                  END
                 ),
             '999,999,999'
            ) apr_2022_sales,
         TO_CHAR
            (SUM (CASE
                     WHEN date_ BETWEEN '01-May-2022' AND '31-May-2022'
                        THEN sales_amt
                  END
                 ),
             '999,999,999'
            ) may_2022_sales,
         TO_CHAR
            (SUM (CASE
                     WHEN date_ BETWEEN '01-Jun-2022' AND '30-Jun-2022'
                        THEN sales_amt
                  END
                 ),
             '999,999,999'
            ) jun_2022_sales,
         TO_CHAR
            (SUM (CASE
                     WHEN date_ BETWEEN '01-Jul-2022' AND '31-Jul-2022'
                        THEN sales_amt
                  END
                 ),
             '999,999,999'
            ) jul_2022_sales,
         TO_CHAR
            (SUM (CASE
                     WHEN date_ BETWEEN '01-Aug-2022' AND '31-Aug-2022'
                        THEN sales_amt
                  END
                 ),
             '999,999,999'
            ) aug_2022_sales,
         TO_CHAR
            (SUM (CASE
                     WHEN date_ BETWEEN '01-Sep-2022' AND '30-Sep-2022'
                        THEN sales_amt
                  END
                 ),
             '999,999,999'
            ) sep_2022_sales,
         TO_CHAR
            (SUM (CASE
                     WHEN date_ BETWEEN '01-Oct-2022' AND '31-Oct-2022'
                        THEN sales_amt
                  END
                 ),
             '999,999,999'
            ) oct_2022_sales,
         TO_CHAR
            (SUM (CASE
                     WHEN date_ BETWEEN '01-Nov-2022' AND '30-Nov-2022'
                        THEN sales_amt
                  END
                 ),
             '999,999,999'
            ) nov_2022_sales,
         TO_CHAR
            (SUM (CASE
                     WHEN date_ BETWEEN '01-Dec-2022' AND '31-Dec-2022'
                        THEN sales_amt
                  END
                 ),
             '999,999,999'
            ) dec_2022_sales
    FROM agility_sales_data
   WHERE item_group != 'DIRECT TOPUP'
     AND date_ >= '01-Jan-2022'
     AND loc != 'HONIARA'
     AND name_v NOT IN ('JPTEST', 'Prospect Customer')
ORDER BY 1, 2;


spool /home/ra/ramesh/Automation/report/sales_report_evd.xls
/* Formatted on 2022/05/27 08:43 (Formatter Plus v4.8.8) */
SELECT   loc, name_v,
         TO_CHAR
            (SUM (CASE
                     WHEN date_ BETWEEN '01-Jan-2022' AND '31-Jan-2022'
                        THEN sales_amt
                  END
                 ),
             '999,999,999'
            ) jan_2022_sales,
         TO_CHAR
            (SUM (CASE
                     WHEN date_ BETWEEN '01-Feb-2022' AND '28-Feb-2022'
                        THEN sales_amt
                  END
                 ),
             '999,999,999'
            ) feb_2022_sales,
         TO_CHAR
            (SUM (CASE
                     WHEN date_ BETWEEN '01-Mar-2022' AND '31-Mar-2022'
                        THEN sales_amt
                  END
                 ),
             '999,999,999'
            ) mar_2022_sales,
         TO_CHAR
            (SUM (CASE
                     WHEN date_ BETWEEN '01-Apr-2022' AND '30-Apr-2022'
                        THEN sales_amt
                  END
                 ),
             '999,999,999'
            ) apr_2022_sales,
         TO_CHAR
            (SUM (CASE
                     WHEN date_ BETWEEN '01-May-2022' AND '31-May-2022'
                        THEN sales_amt
                  END
                 ),
             '999,999,999'
            ) may_2022_sales,
         TO_CHAR
            (SUM (CASE
                     WHEN date_ BETWEEN '01-Jun-2022' AND '30-Jun-2022'
                        THEN sales_amt
                  END
                 ),
             '999,999,999'
            ) jun_2022_sales,
         TO_CHAR
            (SUM (CASE
                     WHEN date_ BETWEEN '01-Jul-2022' AND '31-Jul-2022'
                        THEN sales_amt
                  END
                 ),
             '999,999,999'
            ) jul_2022_sales,
         TO_CHAR
            (SUM (CASE
                     WHEN date_ BETWEEN '01-Aug-2022' AND '31-Aug-2022'
                        THEN sales_amt
                  END
                 ),
             '999,999,999'
            ) aug_2022_sales,
         TO_CHAR
            (SUM (CASE
                     WHEN date_ BETWEEN '01-Sep-2022' AND '30-Sep-2022'
                        THEN sales_amt
                  END
                 ),
             '999,999,999'
            ) sep_2022_sales,
         TO_CHAR
            (SUM (CASE
                     WHEN date_ BETWEEN '01-Oct-2022' AND '31-Oct-2022'
                        THEN sales_amt
                  END
                 ),
             '999,999,999'
            ) oct_2022_sales,
         TO_CHAR
            (SUM (CASE
                     WHEN date_ BETWEEN '01-Nov-2022' AND '30-Nov-2022'
                        THEN sales_amt
                  END
                 ),
             '999,999,999'
            ) nov_2022_sales,
         TO_CHAR
            (SUM (CASE
                     WHEN date_ BETWEEN '01-Dec-2022' AND '31-Dec-2022'
                        THEN sales_amt
                  END
                 ),
             '999,999,999'
            ) dec_2022_sales
    FROM agility_sales_data
   WHERE item_group = 'DIRECT TOPUP'
     AND date_ >= '01-Jan-2022'
     AND loc != 'HONIARA'
     AND name_v NOT IN ('JPTEST', 'Prospect Customer')
GROUP BY name_v, loc
UNION ALL
SELECT   '_GRAND_TOTAL', 'GRAND_TOTAL',
         TO_CHAR
            (SUM (CASE
                     WHEN date_ BETWEEN '01-Jan-2022' AND '31-Jan-2022'
                        THEN sales_amt
                  END
                 ),
             '999,999,999'
            ) jan_2022_sales,
         TO_CHAR
            (SUM (CASE
                     WHEN date_ BETWEEN '01-Feb-2022' AND '28-Feb-2022'
                        THEN sales_amt
                  END
                 ),
             '999,999,999'
            ) feb_2022_sales,
         TO_CHAR
            (SUM (CASE
                     WHEN date_ BETWEEN '01-Mar-2022' AND '31-Mar-2022'
                        THEN sales_amt
                  END
                 ),
             '999,999,999'
            ) mar_2022_sales,
         TO_CHAR
            (SUM (CASE
                     WHEN date_ BETWEEN '01-Apr-2022' AND '30-Apr-2022'
                        THEN sales_amt
                  END
                 ),
             '999,999,999'
            ) apr_2022_sales,
         TO_CHAR
            (SUM (CASE
                     WHEN date_ BETWEEN '01-May-2022' AND '31-May-2022'
                        THEN sales_amt
                  END
                 ),
             '999,999,999'
            ) may_2022_sales,
         TO_CHAR
            (SUM (CASE
                     WHEN date_ BETWEEN '01-Jun-2022' AND '30-Jun-2022'
                        THEN sales_amt
                  END
                 ),
             '999,999,999'
            ) jun_2022_sales,
         TO_CHAR
            (SUM (CASE
                     WHEN date_ BETWEEN '01-Jul-2022' AND '31-Jul-2022'
                        THEN sales_amt
                  END
                 ),
             '999,999,999'
            ) jul_2022_sales,
         TO_CHAR
            (SUM (CASE
                     WHEN date_ BETWEEN '01-Aug-2022' AND '31-Aug-2022'
                        THEN sales_amt
                  END
                 ),
             '999,999,999'
            ) aug_2022_sales,
         TO_CHAR
            (SUM (CASE
                     WHEN date_ BETWEEN '01-Sep-2022' AND '30-Sep-2022'
                        THEN sales_amt
                  END
                 ),
             '999,999,999'
            ) sep_2022_sales,
         TO_CHAR
            (SUM (CASE
                     WHEN date_ BETWEEN '01-Oct-2022' AND '31-Oct-2022'
                        THEN sales_amt
                  END
                 ),
             '999,999,999'
            ) oct_2022_sales,
         TO_CHAR
            (SUM (CASE
                     WHEN date_ BETWEEN '01-Nov-2022' AND '30-Nov-2022'
                        THEN sales_amt
                  END
                 ),
             '999,999,999'
            ) nov_2022_sales,
         TO_CHAR
            (SUM (CASE
                     WHEN date_ BETWEEN '01-Dec-2022' AND '31-Dec-2022'
                        THEN sales_amt
                  END
                 ),
             '999,999,999'
            ) dec_2022_sales
    FROM agility_sales_data
   WHERE item_group = 'DIRECT TOPUP'
     AND date_ >= '01-Jan-2022'
     AND loc != 'HONIARA'
     AND name_v NOT IN ('JPTEST', 'Prospect Customer')
ORDER BY 1, 2;
SPOOL OFF
exit;


