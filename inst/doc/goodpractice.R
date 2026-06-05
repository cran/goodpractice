## ----setup, include = FALSE---------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----library------------------------------------------------------------------
library(goodpractice)

# goodpractice ships with an example package that has some issues
pkg_path <- system.file("bad1", package = "goodpractice")

## ----initial-gp-call-dummy, echo = TRUE, eval = FALSE-------------------------
# g <- gp(pkg_path)

## ----initial-gp-call, echo = FALSE, eval = TRUE-------------------------------
g <- suppressWarnings(gp(pkg_path))

## ----gp-print-----------------------------------------------------------------
g

## ----default-checks-length----------------------------------------------------
length(default_checks())

## ----find-url-checks----------------------------------------------------------
# find checks related to URLs
grep("url", all_checks(), value = TRUE)

## ----gp-desc-url-only---------------------------------------------------------
g_url <- gp(pkg_path, checks = "description_url")
g_url

## ----gp-tidyverse-extra-dummy, eval = FALSE-----------------------------------
# g <- gp(".", checks = c(default_checks(), tidyverse_checks()))

## ----check-lengths------------------------------------------------------------
length(tidyverse_checks())
length(all_checks())

## ----all-check-groups---------------------------------------------------------
all_check_groups()

## ----desc-check-group---------------------------------------------------------
checks_by_group("description")

## ----desc-namespace-only-dummy, eval = FALSE----------------------------------
# # run only DESCRIPTION and namespace checks
# gp(".", checks = checks_by_group("description", "namespace"))

## ----describe-check-groups-dummy, eval = FALSE--------------------------------
# describe_check_groups()

## ----kable, results="asis", echo = FALSE--------------------------------------
descs <- describe_check_groups()
df <- data.frame(Group = names(descs), Description = unlist(descs), row.names = NULL)
tbl <- knitr::kable(df)
if (knitr::is_html_output()) {
  tbl <- kableExtra::column_spec(tbl, 1L, extra_css = "white-space: nowrap")
  tbl <- kableExtra::column_spec(tbl, 2L, width = "100%")
}
tbl

## ----gp-skip-dummy, eval = FALSE----------------------------------------------
# # skip coverage and R CMD check — just run the fast checks
# options(goodpractice.exclude_check_groups = c("covr", "rcmdcheck"))
# gp(".")

## ----options-dummy, eval = FALSE----------------------------------------------
# options(goodpractice.exclude_check_groups = "covr")
# 
# # covr checks are excluded here (using defaults)
# gp(".")
# 
# # the "covr" check runs here because we asked for it by name
# gp(".", checks = "covr")

## ----options-files-dummy, eval = FALSE----------------------------------------
# options(goodpractice.exclude_path = c("R/RcppExports.R", "R/generated_bindings.R"))
# gp(".")

## ----future-dummy, eval = FALSE-----------------------------------------------
# future::plan("multisession")
# gp(".")

## ----tidyverse-only-dummy, eval = FALSE---------------------------------------
# # add tidyverse checks to the defaults
# gp(".", checks = c(default_checks(), tidyverse_checks()))
# 
# # or run only the tidyverse checks
# gp(".", checks = tidyverse_checks())

## ----checks-by-group-tidyverse------------------------------------------------
checks_by_group("tidyverse")

## ----check-names--------------------------------------------------------------
checks(g_url)

## ----failed-checks------------------------------------------------------------
failed_checks(g)

## ----results------------------------------------------------------------------
results(g)[1L:5L, ]

## ----print-inf-dummy, eval = FALSE--------------------------------------------
# print(g, positions_limit = Inf)

## ----export-json-dummy, eval = FALSE------------------------------------------
# export_json(g, "gp_results.json")

