drop table   temp_voice_threshold purge ;


CREATE TABLE temp_voice_threshold AS
SELECT SUBSTR(col15,9,2) hrs,ROUND(SUM(col44/10000)) revenue FROM ocs_5_voice_cdr
WHERE col358 = '1'
AND SUBSTR(col15,3,6) = TO_CHAR(SYSDATE-7,'yymmdd')
GROUP BY SUBSTR(col15,9,2) ORDER BY SUBSTR(col15,9,2);


drop table   temp_gprs_threshold purge ;

/* Formatted on 2016/09/21 11:07 (Formatter Plus v4.8.8) */
CREATE TABLE temp_gprs_threshold AS
SELECT SUBSTR(col15,9,2) hrs,ROUND(SUM(col34/(1024*1024*1024))) usage_ FROM ocs_5_gprs_cdr
WHERE SUBSTR(col15,3,6) = TO_CHAR(SYSDATE-7,'yymmdd')
GROUP BY SUBSTR(col15,9,2) ORDER BY SUBSTR(col15,9,2);


drop table temp_recharge_threshold purge ;

/* Formatted on 2016/09/21 11:07 (Formatter Plus v4.8.8) */
CREATE TABLE temp_recharge_threshold AS
SELECT SUBSTR(col30,9,2) hrs,ROUND(SUM(col9/10000)) recharge FROM ocs_5_voucher_cdr
WHERE SUBSTR(col30,3,6) = TO_CHAR(SYSDATE-7,'yymmdd')
GROUP BY SUBSTR(col30,9,2) ORDER BY SUBSTR(col30,9,2);


exit;


