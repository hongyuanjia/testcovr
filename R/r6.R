#' @export
A <- R6::R6Class("A", lock_objects = FALSE,
     public = list(
         initialize = function (x) {
             private$x <- x
         }
     ),
     private = list(
         x = NULL
     )
)

#' @export
factory <- function (r6, sym, value) {
    fun <- function (value) {
        sym <- sym
        if (missing(value) && sym != private$x) {
            private$x <- sym
        }
        private$x
    }
    environment(fun) <- r6$.__enclos_env__
    body(fun)[[2]][[3]] <- sym
    fun
}

#' @export
add_binding <- function (r6, sym) {
    makeActiveBinding(sym, factory(r6, sym, value), r6)
}
