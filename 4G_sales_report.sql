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
spool /home/ra/ramesh/Automation/report/4G_sales_report.xls
/* Formatted on 2019/03/12 11:25 (Formatter Plus v4.8.8) */
SELECT   dealer_name,
         TO_CHAR (ROUND (recharge_cards_gross_),
                  '999,999,999'
                 ) recharge_cards_gross,
         TO_CHAR (ROUND (recharge_cards_disc_),
                  '999,999,999'
                 ) recharge_cards_disc,
         TO_CHAR (ROUND (evd_), '999,999,999') evd,
         TO_CHAR (ROUND (handsets), '999,999,999') handsets,
         TO_CHAR (ROUND (sims), '999,999,999') sims
    FROM (SELECT   dealer_name,
                   SUM (recharge_cards_gross) recharge_cards_disc_,
                   ROUND (SUM (recharge_cards_disc) / .92
                         ) recharge_cards_gross_,
                   SUM (evd) evd_, SUM (handsets) handsets, SUM (sims) sims
              FROM (SELECT   DECODE
                                (SUBSTR
                                       (cb_pos_transactions.transaction_num_v,
                                        1,
                                        4
                                       ),
                                 '2VNS', (SELECT a.name_v
                                            FROM cb_dealer_master a
                                           WHERE a.account_link_code_n =
                                                    cb_pos_transactions.account_link_code_n),
                                 cb_pos_transactions.name_v
                                ) dealer_name,
                             SUM
                                (DECODE
                                    (inv_item_master.item_group_code_v,
                                     'RAITCARDS', (  (NVL
                                                         (cb_pos_trans_dtls.amount_wt_n,
                                                          0
                                                         )
                                                     )
                                                   - ((  NVL
                                                            (cb_pos_trans_dtls.disc_amount_n,
                                                             0
                                                            )
                                                       + NVL
                                                            (cb_pos_trans_dtls.trans_disc_amt_n,
                                                             0
                                                            )
                                                      )
                                                     )
                                                   + ((NVL
                                                          (  cb_pos_trans_dtls.tax_amt1_n
                                                           + cb_pos_trans_dtls.tax_amt2_n
                                                           + cb_pos_trans_dtls.tax_amt3_n,
                                                           0
                                                          )
                                                      )
                                                     )
                                         )
                                      / 100,
                                     0
                                    )
                                ) "RECHARGE_CARDS_GROSS",
                             SUM
                                (DECODE
                                    (inv_item_master.item_group_code_v,
                                     'RAITCARDS', (  (NVL
                                                         (cb_pos_trans_dtls.amount_wt_n,
                                                          0
                                                         )
                                                     )
                                                   - ((  NVL
                                                            (cb_pos_trans_dtls.disc_amount_n,
                                                             0
                                                            )
                                                       + NVL
                                                            (cb_pos_trans_dtls.trans_disc_amt_n,
                                                             0
                                                            )
                                                      )
                                                     )
                                                   + ((NVL
                                                          (  cb_pos_trans_dtls.tax_amt1_n
                                                           + cb_pos_trans_dtls.tax_amt2_n
                                                           + cb_pos_trans_dtls.tax_amt3_n,
                                                           0
                                                          )
                                                      )
                                                     )
                                         )
                                      / 100,
                                     0
                                    )
                                ) recharge_cards_disc,
                             SUM
                                (DECODE
                                    (inv_item_master.item_group_code_v,
                                     'TEVD', (  (NVL
                                                    (cb_pos_trans_dtls.amount_wt_n,
                                                     0
                                                    )
                                                )
                                              - ((  NVL
                                                       (cb_pos_trans_dtls.disc_amount_n,
                                                        0
                                                       )
                                                  + NVL
                                                       (cb_pos_trans_dtls.trans_disc_amt_n,
                                                        0
                                                       )
                                                 )
                                                )
                                              + ((NVL
                                                     (  cb_pos_trans_dtls.tax_amt1_n
                                                      + cb_pos_trans_dtls.tax_amt2_n
                                                      + cb_pos_trans_dtls.tax_amt3_n,
                                                      0
                                                     )
                                                 )
                                                )
                                         )
                                      / 100,
                                     0
                                    )
                                ) "EVD",
                             SUM
                                (DECODE
                                    (inv_item_master.item_group_code_v,
                                     'T-HANDSETS', (  (NVL
                                                          (cb_pos_trans_dtls.amount_wt_n,
                                                           0
                                                          )
                                                      )
                                                    - ((  NVL
                                                             (cb_pos_trans_dtls.disc_amount_n,
                                                              0
                                                             )
                                                        + NVL
                                                             (cb_pos_trans_dtls.trans_disc_amt_n,
                                                              0
                                                             )
                                                       )
                                                      )
                                                    + ((NVL
                                                           (  cb_pos_trans_dtls.tax_amt1_n
                                                            + cb_pos_trans_dtls.tax_amt2_n
                                                            + cb_pos_trans_dtls.tax_amt3_n,
                                                            0
                                                           )
                                                       )
                                                      )
                                         )
                                      / 100,
                                     0
                                    )
                                ) "HANDSETS",
                             SUM
                                (DECODE
                                    (inv_item_master.item_group_code_v,
                                     'TSIMCD', (  (NVL
                                                      (cb_pos_trans_dtls.amount_wt_n,
                                                       0
                                                      )
                                                  )
                                                - ((  NVL
                                                         (cb_pos_trans_dtls.disc_amount_n,
                                                          0
                                                         )
                                                    + NVL
                                                         (cb_pos_trans_dtls.trans_disc_amt_n,
                                                          0
                                                         )
                                                   )
                                                  )
                                                + ((NVL
                                                       (  cb_pos_trans_dtls.tax_amt1_n
                                                        + cb_pos_trans_dtls.tax_amt2_n
                                                        + cb_pos_trans_dtls.tax_amt3_n,
                                                        0
                                                       )
                                                   )
                                                  )
                                         )
                                      / 100,
                                     0
                                    )
                                ) "SIMS",
                             (  SUM
                                   (DECODE
                                       (inv_item_master.item_group_code_v,
                                        'RAITCARDS', (  (NVL
                                                            (cb_pos_trans_dtls.amount_wt_n,
                                                             0
                                                            )
                                                        )
                                                      - ((  NVL
                                                               (cb_pos_trans_dtls.disc_amount_n,
                                                                0
                                                               )
                                                          + NVL
                                                               (cb_pos_trans_dtls.trans_disc_amt_n,
                                                                0
                                                               )
                                                         )
                                                        )
                                                      + ((NVL
                                                             (  cb_pos_trans_dtls.tax_amt1_n
                                                              + cb_pos_trans_dtls.tax_amt2_n
                                                              + cb_pos_trans_dtls.tax_amt3_n,
                                                              0
                                                             )
                                                         )
                                                        )
                                            )
                                         / 100,
                                        0
                                       )
                                   )
                              + SUM
                                   (DECODE
                                       (inv_item_master.item_group_code_v,
                                        'TEVD', (  (NVL
                                                       (cb_pos_trans_dtls.amount_wt_n,
                                                        0
                                                       )
                                                   )
                                                 - ((  NVL
                                                          (cb_pos_trans_dtls.disc_amount_n,
                                                           0
                                                          )
                                                     + NVL
                                                          (cb_pos_trans_dtls.trans_disc_amt_n,
                                                           0
                                                          )
                                                    )
                                                   )
                                                 + ((NVL
                                                        (  cb_pos_trans_dtls.tax_amt1_n
                                                         + cb_pos_trans_dtls.tax_amt2_n
                                                         + cb_pos_trans_dtls.tax_amt3_n,
                                                         0
                                                        )
                                                    )
                                                   )
                                            )
                                         / 100,
                                        0
                                       )
                                   )
                              + SUM
                                   (DECODE
                                       (inv_item_master.item_group_code_v,
                                        'T-HANDSETS', (  (NVL
                                                             (cb_pos_trans_dtls.amount_wt_n,
                                                              0
                                                             )
                                                         )
                                                       - ((  NVL
                                                                (cb_pos_trans_dtls.disc_amount_n,
                                                                 0
                                                                )
                                                           + NVL
                                                                (cb_pos_trans_dtls.trans_disc_amt_n,
                                                                 0
                                                                )
                                                          )
                                                         )
                                                       + ((NVL
                                                              (  cb_pos_trans_dtls.tax_amt1_n
                                                               + cb_pos_trans_dtls.tax_amt2_n
                                                               + cb_pos_trans_dtls.tax_amt3_n,
                                                               0
                                                              )
                                                          )
                                                         )
                                            )
                                         / 100,
                                        0
                                       )
                                   )
                              + SUM
                                   (DECODE
                                       (inv_item_master.item_group_code_v,
                                        'TSIMCD', (  (NVL
                                                         (cb_pos_trans_dtls.amount_wt_n,
                                                          0
                                                         )
                                                     )
                                                   - ((  NVL
                                                            (cb_pos_trans_dtls.disc_amount_n,
                                                             0
                                                            )
                                                       + NVL
                                                            (cb_pos_trans_dtls.trans_disc_amt_n,
                                                             0
                                                            )
                                                      )
                                                     )
                                                   + ((NVL
                                                          (  cb_pos_trans_dtls.tax_amt1_n
                                                           + cb_pos_trans_dtls.tax_amt2_n
                                                           + cb_pos_trans_dtls.tax_amt3_n,
                                                           0
                                                          )
                                                      )
                                                     )
                                            )
                                         / 100,
                                        0
                                       )
                                   )
                             ) "TOTAL"
                        FROM (((cb_pos_trans_dtls cb_pos_trans_dtls LEFT OUTER JOIN inv_item_master inv_item_master
                             ON cb_pos_trans_dtls.item_code_n =
                                                   inv_item_master.item_code_n)
                             LEFT OUTER JOIN
                             cb_pos_transactions cb_pos_transactions
                             ON cb_pos_trans_dtls.transaction_num_v =
                                         cb_pos_transactions.transaction_num_v)
                             LEFT OUTER JOIN
                             cb_retail_outlets cb_retail_outlets
                             ON cb_pos_transactions.location_code_n =
                                             cb_retail_outlets.location_code_n)
                             LEFT OUTER JOIN
                             cb_item_group cb_item_group
                             ON inv_item_master.item_group_code_v =
                                               cb_item_group.item_group_code_v
                             LEFT OUTER JOIN cb_dealer_master cb_dealer_master
                             ON cb_pos_transactions.account_link_code_n =
                                          cb_dealer_master.account_link_code_n
                       WHERE TO_CHAR (cb_pos_transactions.trans_date_dt,
                                      'MON-YYYY'
                                     ) = TO_CHAR (SYSDATE - 1, 'MON-YYYY')
                         AND cb_pos_transactions.customer_type_v IN
                                                                   ('D', 'W')
                         AND cb_pos_transactions.pos_type_v = 'P'
                         AND cb_pos_transactions.status_v <> 'C'
                         AND cb_item_group.item_group_code_v IN
                                ('RAITCARDS', 'TSIMCD', 'T-HANDSETS', 'TEVD')
                    GROUP BY cb_pos_transactions.account_link_code_n,
                             cb_pos_transactions.transaction_num_v,
                             cb_pos_transactions.name_v
                    ORDER BY total DESC)
          GROUP BY dealer_name)
ORDER BY 2 DESC;

spool /home/ra/ramesh/Automation/report/4G_sales_returns_report.xls
/* Formatted on 2018/09/04 18:57 (Formatter Plus v4.8.8) */
SELECT   name_v, item_desc_v, SUM (net_amount) amount
    FROM (SELECT   "CB_POS_TRANSACTIONS"."NAME_V",
                   "INV_ITEM_MASTER"."ITEM_DESC_V",
                   "CB_EXCHANGE_DETAILS"."QTY_N",
                   "CB_EXCHANGE_DETAILS"."NET_AMT_N" / 100 net_amount,
                   (SELECT reason_v
                      FROM cb_reason_master s
                     WHERE s.reason_code_v =
                                       cb_exchange_trans.reason_code_v)
                                                                       reason
              FROM ((((("CB_EXCHANGE_TRANS" "CB_EXCHANGE_TRANS" LEFT OUTER JOIN "CB_EXCHANGE_DETAILS" "CB_EXCHANGE_DETAILS"
                   ON "CB_EXCHANGE_TRANS"."EXCHG_TRANS_NUM_V" =
                                     "CB_EXCHANGE_DETAILS"."EXCHG_TRANS_NUM_V")
                   LEFT OUTER JOIN
                   "CB_POS_TRANSACTIONS" "CB_POS_TRANSACTIONS"
                   ON "CB_EXCHANGE_TRANS"."POS_TRANS_NUM_V" =
                                     "CB_POS_TRANSACTIONS"."TRANSACTION_NUM_V")
                   LEFT OUTER JOIN
                   "CB_RETAIL_OUTLETS" "CB_RETAIL_OUTLETS"
                   ON "CB_EXCHANGE_TRANS"."LOCATION_CODE_N" =
                                         "CB_RETAIL_OUTLETS"."LOCATION_CODE_N")
                   LEFT OUTER JOIN
                   "CB_USERS" "CB_USERS"
                   ON "CB_EXCHANGE_TRANS"."USER_CODE_N" =
                                                      "CB_USERS"."USER_CODE_N")
                   LEFT OUTER JOIN
                   "CB_REASON_MASTER" "CB_REASON_MASTER"
                   ON "CB_EXCHANGE_TRANS"."REASON_CODE_V" =
                                            "CB_REASON_MASTER"."REASON_CODE_V")
                   LEFT OUTER JOIN
                   "INV_ITEM_MASTER" "INV_ITEM_MASTER"
                   ON "CB_EXCHANGE_DETAILS"."ITEM_CODE_N" =
                                               "INV_ITEM_MASTER"."ITEM_CODE_N"
             WHERE (TO_CHAR ("CB_EXCHANGE_TRANS"."TRANS_DATE_DT", 'MM-YYYY') =
                                              TO_CHAR (SYSDATE - 1, 'MM-YYYY')
                   )
               AND "CB_POS_TRANSACTIONS"."POS_TYPE_V" = 'P'
               AND "CB_EXCHANGE_TRANS"."TRANS_TYPE_V" = 'R'
          ORDER BY "CB_POS_TRANSACTIONS"."TRANS_DATE_DT",
                   "CB_EXCHANGE_TRANS"."LOCATION_CODE_N")
   WHERE item_desc_v LIKE '%RAIT%'
GROUP BY name_v, item_desc_v;
SPOOL OFF
exit;


