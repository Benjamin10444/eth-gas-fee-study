-- Hourly Ethereum gas fees, Jan to Sep 2026
-- Source: bigquery-public-data.crypto_ethereum.blocks
-- One row per hour: average base fee, transactions, block fullness

SELECT
  TIMESTAMP_TRUNC(timestamp, HOUR) AS hour,
  COUNT(*) AS blocks,
  AVG(base_fee_per_gas) / 1e9 AS avg_base_fee_gwei,
  SUM(transaction_count) AS tx_count,
  AVG(gas_used / gas_limit) AS block_fullness
FROM `bigquery-public-data.crypto_ethereum.blocks`
WHERE timestamp >= TIMESTAMP('2026-01-01')
  AND timestamp < TIMESTAMP('2026-10-01')
GROUP BY hour
ORDER BY hour;
