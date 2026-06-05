print.simple <- function(x, ...) {
  cat("simple object\n")
  invisible(x)
}

print.nested <- function(x, ...) {
  if (length(x) > 0) {
    cat(format(x), sep = "\n")
    invisible(x)
  } else {
    cat("empty\n")
    invisible(x)
  }
}

print.assigned_with_equals = function(x, ...) {
  cat("equals object\n")
  invisible(x)
}

print.with_helper <- function(x, ...) {
  fmt <- function(val) paste0("[", val, "]")
  cat(fmt(x), "\n")
  invisible(x)
}
