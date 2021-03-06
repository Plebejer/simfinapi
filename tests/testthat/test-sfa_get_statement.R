test_that("getting pl statement works", {
  exp_classes <- c(
    SimFinId = "integer",
    Ticker = "character",
    `Fiscal Period` = "character",
    `Fiscal Year` = "integer",
    `Report Date` = "Date",
    `Publish Date` = "Date",
    `Restated Date` = "Date",
    Source = "character",
    TTM = "logical",
    `Value Check` = "logical",
    Currency = "character",
    Revenue = "numeric",
    `Sales & Services Revenue` = "numeric",
    `Financing Revenue` = "numeric",
    `Other Revenue` = "numeric",
    `Cost of Revenue` = "numeric",
    `Cost of Goods & Services` = "numeric",
    `Cost of Financing Revenue` = "numeric",
    `Cost of Other Revenue` = "numeric",
    `Gross Profit` = "numeric",
    `Other Operating Income` = "numeric",
    `Operating Expenses` = "numeric",
    `Selling, General & Administrative` = "numeric",
    `Selling & Marketing` = "numeric",
    `General & Administrative` = "numeric",
    `Research & Development` = "numeric",
    `Depreciation & Amortization` = "numeric",
    `Provision for Doubtful Accounts` = "numeric",
    `Other Operating Expenses` = "numeric",
    `Operating Income (Loss)` = "numeric",
    `Non-Operating Income (Loss)` = "numeric",
    `Interest Expense, Net` = "numeric",
    `Interest Expense` = "numeric",
    `Interest Income` = "numeric",
    `Other Investment Income (Loss)` = "numeric",
    `Foreign Exchange Gain (Loss)` = "numeric",
    `Income (Loss) from Affiliates` = "numeric",
    `Other Non-Operating Income (Loss)` = "numeric",
    `Pretax Income (Loss), Adj.` = "numeric",
    `Abnormal Gains (Losses)` = "numeric",
    `Acquired In-Process R&D` = "numeric",
    `Merger & Acquisition Expense` = "numeric",
    `Abnormal Derivatives` = "numeric",
    `Disposal of Assets` = "numeric",
    `Early Extinguishment of Debt` = "numeric",
    `Asset Write-Down` = "numeric",
    `Impairment of Goodwill & Intangibles` = "numeric",
    `Sale of Business` = "numeric",
    `Legal Settlement` = "numeric",
    `Restructuring Charges` = "numeric",
    `Sale of Investments & Unrealized Investments` = "numeric",
    `Insurance Settlement` = "numeric",
    `Other Abnormal Items` = "numeric",
    `Pretax Income (Loss)` = "numeric",
    `Income Tax (Expense) Benefit, Net` = "numeric",
    `Current Income Tax` = "numeric",
    `Deferred Income Tax` = "numeric",
    `Tax Allowance/Credit` = "numeric",
    `Income (Loss) from Affiliates, Net of Taxes` = "numeric",
    `Income (Loss) from Continuing Operations` = "numeric",
    `Net Extraordinary Gains (Losses)` = "numeric",
    `Discontinued Operations` = "numeric",
    `Accounting Charges & Other` = "numeric",
    `Income (Loss) Incl. Minority Interest` = "numeric",
    `Minority Interest` = "numeric",
    `Net Income` = "numeric",
    `Preferred Dividends` = "numeric",
    `Other Adjustments` = "numeric",
    `Net Income (Common)` = "numeric"
  )

  ref_1 <- sfa_get_statement("GOOG", statement = "pl", fyear = 2015)
  checkmate::expect_data_table(
    ref_1,
    key = "Ticker",
    types = exp_classes,
    nrows = 1L,
    ncols = length(exp_classes),
    col.names = "unique"
  )
  expect_named(ref_1, names(exp_classes))

  ref_1_plus <- sfa_get_statement("GOOG", statement = "pl")
  checkmate::expect_data_table(
    ref_1_plus,
    key = "Ticker",
    types = exp_classes,
    min.rows = 13L,
    ncols = length(exp_classes),
    col.names = "unique"
  )
  expect_named(ref_1_plus, names(exp_classes))


  ref_2 <- sfa_get_statement(c("GOOG", "AAPL"), statement = "pl", fyear = 2015)
  checkmate::expect_data_table(
    ref_2,
    key = "Ticker",
    types = exp_classes,
    nrows = 2L,
    ncols = length(exp_classes),
    col.names = "unique"
  )
  expect_named(ref_2, names(exp_classes))

  ref_2_plus <- sfa_get_statement(c("GOOG", "AAPL"), statement = "pl")
  checkmate::expect_data_table(
    ref_2_plus,
    key = "Ticker",
    types = exp_classes,
    min.rows = 35L,
    ncols = length(exp_classes),
    col.names = "unique"
  )
  expect_named(ref_2_plus, names(exp_classes))

  ref_3 <- sfa_get_statement(
    c("GOOG", "AAPL"), statement = "pl", ttm = TRUE, fyear = 2015
  )
  checkmate::expect_data_table(
    ref_3,
    key = "Ticker",
    types = exp_classes,
    nrows = 2L,
    ncols = length(exp_classes),
    col.names = "unique"
  )
  expect_named(ref_3, names(exp_classes))

  ref_3_plus <- sfa_get_statement(
    c("GOOG", "AAPL"), statement = "pl", ttm = TRUE
  )
  checkmate::expect_data_table(
    ref_3_plus,
    key = "Ticker",
    types = exp_classes,
    min.rows = 33L,
    ncols = length(exp_classes),
    col.names = "unique"
  )
  expect_named(ref_3_plus, names(exp_classes))

  exp_classes <- append(
    exp_classes,
    c(`Shares (Basic)` = "numeric", `Shares (Diluted)` = "numeric"),
    after = which(names(exp_classes) == "Currency")
  )
  ref_4 <- sfa_get_statement(
    c("GOOG", "AAPL"), statement = "pl", shares = TRUE, fyear = 2015
  )
  checkmate::expect_data_table(
    ref_4,
    key = "Ticker",
    types = exp_classes,
    nrows = 2L,
    ncols = length(exp_classes),
    col.names = "unique"
  )
  expect_named(ref_4, names(exp_classes))

  ref_4_plus <- sfa_get_statement(
    c("GOOG", "AAPL"), statement = "pl", shares = TRUE
  )
  checkmate::expect_data_table(
    ref_4_plus,
    key = "Ticker",
    types = exp_classes,
    min.rows = 35L,
    ncols = length(exp_classes),
    col.names = "unique"
  )
  expect_named(ref_4_plus, names(exp_classes))
})


test_that("getting bs statement works", {
  exp_classes <- c(
    SimFinId = "integer",
    Ticker = "character",
    `Fiscal Period` = "character",
    `Fiscal Year` = "integer",
    `Report Date` = "Date",
    `Publish Date` = "Date",
    `Restated Date` = "Date",
    Source = "character",
    TTM = "logical",
    `Value Check` = "logical",
    Currency = "character",
    `Cash, Cash Equivalents & Short Term Investments` = "numeric",
    `Cash & Cash Equivalents` = "numeric",
    `Short Term Investments` = "numeric",
    `Accounts & Notes Receivable` = "numeric",
    `Accounts Receivable, Net` = "numeric",
    `Notes Receivable, Net` = "numeric",
    `Unbilled Revenues` = "numeric",
    Inventories = "numeric",
    `Raw Materials` = "numeric",
    `Work In Process` = "numeric",
    `Finished Goods` = "numeric",
    `Other Inventory` = "numeric",
    `Other Short Term Assets` = "numeric",
    `Prepaid Expenses` = "numeric",
    `Derivative & Hedging Assets (Short Term)` = "numeric",
    `Assets Held-for-Sale` = "numeric",
    `Deferred Tax Assets (Short Term)` = "numeric",
    `Income Taxes Receivable` = "numeric",
    `Discontinued Operations (Short Term)` = "numeric",
    `Misc. Short Term Assets` = "numeric",
    `Total Current Assets` = "numeric",
    `Property, Plant & Equipment, Net` = "numeric",
    `Property, Plant & Equipment` = "numeric",
    `Accumulated Depreciation` = "numeric",
    `Long Term Investments & Receivables` = "numeric",
    `Long Term Investments` = "numeric",
    `Long Term Marketable Securities` = "numeric",
    `Long Term Receivables` = "numeric",
    `Other Long Term Assets` = "numeric",
    `Intangible Assets` = "numeric",
    Goodwill = "numeric",
    `Other Intangible Assets` = "numeric",
    `Prepaid Expense` = "numeric",
    `Deferred Tax Assets (Long Term)` = "numeric",
    `Derivative & Hedging Assets (Long Term)` = "numeric",
    `Prepaid Pension Costs` = "numeric",
    `Discontinued Operations (Long Term)` = "numeric",
    `Investments in Affiliates` = "numeric",
    `Misc. Long Term Assets` = "numeric",
    `Total Noncurrent Assets` = "numeric",
    `Total Assets` = "numeric",
    `Payables & Accruals` = "numeric",
    `Accounts Payable` = "numeric",
    `Accrued Taxes` = "numeric",
    `Interest & Dividends Payable` = "numeric",
    `Other Payables & Accruals` = "numeric",
    `Short Term Debt` = "numeric",
    `Short Term Borrowings` = "numeric",
    `Short Term Capital Leases` = "numeric",
    `Current Portion of Long Term Debt` = "numeric",
    `Other Short Term Liabilities` = "numeric",
    `Deferred Revenue (Short Term)` = "numeric",
    `Liabilities from Derivatives & Hedging (Short Term)` = "numeric",
    `Deferred Tax Liabilities (Short Term)` = "numeric",
    `Liabilities from Discontinued Operations (Short Term)` = "numeric",
    `Misc. Short Term Liabilities` = "numeric",
    `Total Current Liabilities` = "numeric",
    `Long Term Debt` = "numeric",
    `Long Term Borrowings` = "numeric",
    `Long Term Capital Leases` = "numeric",
    `Other Long Term Liabilities` = "numeric",
    `Accrued Liabilities` = "numeric",
    `Pension Liabilities` = "numeric",
    Pensions = "numeric",
    `Other Post-Retirement Benefits` = "numeric",
    `Deferred Compensation` = "numeric",
    `Deferred Revenue (Long Term)` = "numeric",
    `Deferred Tax Liabilities (Long Term)` = "numeric",
    `Liabilities from Derivatives & Hedging (Long Term)` = "numeric",
    `Liabilities from Discontinued Operations (Long Term)` = "numeric",
    `Misc. Long Term Liabilities` = "numeric",
    `Total Noncurrent Liabilities` = "numeric",
    `Total Liabilities` = "numeric",
    `Preferred Equity` = "numeric",
    `Share Capital & Additional Paid-In Capital` = "numeric",
    `Common Stock` = "numeric",
    `Additional Paid in Capital` = "numeric",
    `Other Share Capital` = "numeric",
    `Treasury Stock` = "numeric",
    `Retained Earnings` = "numeric",
    `Other Equity` = "numeric",
    `Equity Before Minority Interest` = "numeric",
    `Minority Interest` = "numeric",
    `Total Equity` = "numeric",
    `Total Liabilities & Equity` = "numeric"
  )

  ref_1 <- sfa_get_statement("GOOG", statement = "bs", fyear = 2015)
  checkmate::expect_data_table(
    ref_1,
    key = "Ticker",
    types = exp_classes,
    nrows = 1L,
    ncols = length(exp_classes),
    col.names = "unique"
  )
  expect_named(ref_1, names(exp_classes))

  ref_1_plus <- sfa_get_statement("GOOG", statement = "bs")
  checkmate::expect_data_table(
    ref_1_plus,
    key = "Ticker",
    types = exp_classes,
    min.rows = 12L,
    ncols = length(exp_classes),
    col.names = "unique"
  )
  expect_named(ref_1_plus, names(exp_classes))


  ref_2 <- sfa_get_statement(c("GOOG", "AAPL"), statement = "bs", fyear = 2015)
  checkmate::expect_data_table(
    ref_2,
    key = "Ticker",
    types = exp_classes,
    nrows = 2L,
    ncols = length(exp_classes),
    col.names = "unique"
  )
  expect_named(ref_2, names(exp_classes))

  ref_2_plus <- sfa_get_statement(c("GOOG", "AAPL"), statement = "bs")
  checkmate::expect_data_table(
    ref_2_plus,
    key = "Ticker",
    types = exp_classes,
    min.rows = 34L,
    ncols = length(exp_classes),
    col.names = "unique"
  )
  expect_named(ref_2_plus, names(exp_classes))
})

test_that("getting cf statement works", {
  exp_classes <- c(
    SimFinId = "integer",
    Ticker = "character",
    `Fiscal Period` = "character",
    `Fiscal Year` = "integer",
    `Report Date` = "Date",
    `Publish Date` = "Date",
    `Restated Date` = "Date",
    Source = "character",
    TTM = "logical",
    `Value Check` = "logical",
    Currency = "character",
    `Net Income/Starting Line` = "numeric",
    `Net Income` = "numeric",
    `Net Income from Discontinued Operations` = "numeric",
    `Other Adjustments` = "numeric",
    `Depreciation & Amortization` = "numeric",
    `Non-Cash Items` = "numeric",
    `Stock-Based Compensation` = "numeric",
    `Deferred Income Taxes` = "numeric",
    `Other Non-Cash Adjustments` = "numeric",
    `Change in Working Capital` = "numeric",
    `Change in Accounts Receivable` = "numeric",
    `Change in Inventories` = "numeric",
    `Change in Accounts Payable` = "numeric",
    `Change in Other` = "numeric",
    `Net Cash from Discontinued Operations (Operating)` = "numeric",
    `Net Cash from Operating Activities` = "numeric",
    `Change in Fixed Assets & Intangibles` = "numeric",
    `Disposition of Fixed Assets & Intangibles` = "numeric",
    `Disposition of Fixed Assets` = "numeric",
    `Disposition of Intangible Assets` = "numeric",
    `Acquisition of Fixed Assets & Intangibles` = "numeric",
    `Purchase of Fixed Assets` = "numeric",
    `Acquisition of Intangible Assets` = "numeric",
    `Other Change in Fixed Assets & Intangibles` = "numeric",
    `Net Change in Long Term Investment` = "numeric",
    `Decrease in Long Term Investment` = "numeric",
    `Increase in Long Term Investment` = "numeric",
    `Net Cash from Acquisitions & Divestitures` = "numeric",
    `Net Cash from Divestitures` = "numeric",
    `Cash for Acquisition of Subsidiaries` = "numeric",
    `Cash for Joint Ventures` = "numeric",
    `Net Cash from Other Acquisitions` = "numeric",
    `Other Investing Activities` = "numeric",
    `Net Cash from Discontinued Operations (Investing)` = "numeric",
    `Net Cash from Investing Activities` = "numeric",
    `Dividends Paid` = "numeric",
    `Cash from (Repayment of) Debt` = "numeric",
    `Cash from (Repayment of) Short Term Debt, Net` = "numeric",
    `Cash from (Repayment of) Long Term Debt, Net` = "numeric",
    `Repayments of Long Term Debt` = "numeric",
    `Cash from Long Term Debt` = "numeric",
    `Cash from (Repurchase of) Equity` = "numeric",
    `Increase in Capital Stock` = "numeric",
    `Decrease in Capital Stock` = "numeric",
    `Other Financing Activities` = "numeric",
    `Net Cash from Discontinued Operations (Financing)` = "numeric",
    `Net Cash from Financing Activities` = "numeric",
    `Net Cash Before Disc. Operations and FX` = "numeric",
    `Change in Cash from Disc. Operations and Other` = "numeric",
    `Net Cash Before FX` = "numeric",
    `Effect of Foreign Exchange Rates` = "numeric",
    `Net Change in Cash` = "numeric"
  )

  ref_1 <- sfa_get_statement("GOOG", statement = "cf", fyear = 2015)
  checkmate::expect_data_table(
    ref_1,
    key = "Ticker",
    types = exp_classes,
    nrows = 1L,
    ncols = length(exp_classes),
    col.names = "unique"
  )
  expect_named(ref_1, names(exp_classes))

  ref_1_plus <- sfa_get_statement("GOOG", statement = "cf")
  checkmate::expect_data_table(
    ref_1_plus,
    key = "Ticker",
    types = exp_classes,
    min.rows = 12L,
    ncols = length(exp_classes),
    col.names = "unique"
  )
  expect_named(ref_1_plus, names(exp_classes))


  ref_2 <- sfa_get_statement(c("GOOG", "AAPL"), statement = "cf", fyear = 2015)
  checkmate::expect_data_table(
    ref_2,
    key = "Ticker",
    types = exp_classes,
    nrows = 2L,
    ncols = length(exp_classes),
    col.names = "unique"
  )
  expect_named(ref_2, names(exp_classes))

  ref_2_plus <- sfa_get_statement(c("GOOG", "AAPL"), statement = "cf")
  checkmate::expect_data_table(
    ref_2_plus,
    key = "Ticker",
    types = exp_classes,
    min.rows = 36L,
    ncols = length(exp_classes),
    col.names = "unique"
  )
  expect_named(ref_2_plus, names(exp_classes))
})

# TODO: Test all kinds of statements
test_that("warning is trigged when no company was found", {
  expect_warning(
    expect_null(sfa_get_statement("doesnotexist", statement = "cf")),
    'No company found for Ticker "doesnotexist".',
    fixed = TRUE
  )
})
