## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup--------------------------------------------------------------------
library(flir, warn.conflicts = FALSE)

## ----error=TRUE---------------------------------------------------------------
try({
stop("this is an error")

rlang::abort("this is an error")
})

## ----error=TRUE---------------------------------------------------------------
try({
n <- 10
stop("Got ", n, " values instead of 1.")
})

## ----error=TRUE---------------------------------------------------------------
try({
n <- 10
rlang::abort(paste0("Got ", n, " values instead of 1."))
})

## ----eval=FALSE---------------------------------------------------------------
# flir::lint_text(
#   'stop("Got ", n, " values instead of 1.")',
#   linters = "stop_abort"
# )

## ----eval=FALSE---------------------------------------------------------------
# flir::fix_text(
#   'stop("Got ", n, " values instead of 1.")',
#   linters = "stop_abort"
# )
# #> Old code: stop("Got ", n, " values instead of 1.")
# #> New code: rlang::abort(paste0("Got ", n, " values instead of 1."))

## ----eval=FALSE---------------------------------------------------------------
# flir::fix_text('stop("Got ", n, " values instead of 1.")')
# #> Old code: stop("Got ", n, " values instead of 1.")
# #> New code: rlang::abort(paste0("Got ", n, " values instead of 1."))

