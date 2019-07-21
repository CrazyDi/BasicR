get_fractions <- function(m, n){
    return(sort(unique(c(seq(0, 1, 1/m), seq(0, 1, 1/n))), decreasing = TRUE))
}