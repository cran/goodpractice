internal_helper <- function(x) {
  x + 1
}

public_func <- function(x) {
  internal_helper(x)
}
