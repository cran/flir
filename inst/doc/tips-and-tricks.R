## ----include=FALSE------------------------------------------------------------
library(flir)

## -----------------------------------------------------------------------------
### Store the rule in a file
my_rule <- tempfile(fileext = ".yml")
cat("id: snapshot
language: r
severity: warning
rule:
  pattern: expect_error($CODE, $$$)
fix: |
  expect_snapshot(
    ~~CODE~~,
    error = TRUE
  )
message: ...",
file = my_rule
)

### Demo of the rule
fix_text('
expect_error(
  my_super_function(with, some, parameters),
  "a very detailed error message"
)
', linters = my_rule)

## -----------------------------------------------------------------------------
### Store the rule in a file
my_rule <- tempfile(fileext = ".yml")
cat("id: quotes
language: r
severity: warning
rule:
  pattern: my_function(value = \"deprecated_value\")
fix: my_function(value = \"replacement_value\")
message: ...",
file = my_rule
)

### Works when code has double quotes
fix_text('my_function(value = "deprecated_value")', linters = my_rule)

### Doesn't work when code has single quotes
fix_text("my_function(value = 'deprecated_value')", linters = my_rule)

## -----------------------------------------------------------------------------
### Store the rule in a file
my_rule <- tempfile(fileext = ".yml")
cat("id: quotes
language: r
severity: warning
rule:
  pattern: 
    context: my_function(value = \"deprecated_value\")
    strictness: ast
fix: my_function(value = \"replacement_value\")
message: ...",
file = my_rule
)

### Works when code has double quotes
fix_text('my_function(value = "deprecated_value")', linters = my_rule)

### Works when code has single quotes
fix_text("my_function(value = 'deprecated_value')", linters = my_rule)

