# Объектно-ориентированные системы
length(methods(print))
methods(print)
print.data.frame <- function(df) print(dim(df))
print(warpbreaks)

# Функции без сторонних эффектов
f <- function(k) {
    k <- k - 1
    a <- a + k^2
    a
}
k <- 5
f(k)
a <- 10

# replicate
get_status <- function(n, p = 0.1) {
    x <- rbinom(n, 1, p)
    sum(x)
}
replicate(5, get_status(100))

# mapply
mapply(seq, from = 1:4, to = 2:5, by = 1 / (1 + 1:4))

list(seq(1, 2, 1/2), seq(2, 3, 1/3), seq(3, 4, 1/4), seq(4, 5, 1/5))

# outer
n <- outer(letters, LETTERS, paste0)
dim(n)
diag(n)
n[1:5, 1:5]

# Vectorize
lp_norm <- function(x, p = 2) {
    if (p >= 1) sum(abs(x)^p)^(1/p) else NaN
}
lp_norm(1:10, -1:4)

lp_norm <- Vectorize(lp_norm, "p")
lp_norm(1:10, -1:4)

# do.call
df1 <- data.frame(id = 1:2, value = rnorm(2))
df2 <- data.frame(id = 3:4, value = runif(2))
df3 <- data.frame(id = 222, value = 7)
df <- do.call(rbind, list(df1, df2, df3))
df_o <- rbind(df1, df2, df3)
identical(df, df_o)

do.call(rbind, lapply(list.files(), function(file) read.csv(file)))

# Random walk with absortion
simulate_walk <- function(lower = -10, upper = 10, n_max = 200, p = 1e-3) {
    current_position <- (lower + upper) / 2
    for (i in 1:n_max) {
        is_absorbed <- rbinom(1, 1, p)
        if (is_absorbed) return(list(status = "Absorbed",
                                     position = current_position,
                                     steps = i))
        current_position <- current_position + rnorm(1)
        if (current_position < lower) return(list(status = "Left breach",
                                                  position = current_position,
                                                  steps = i))
        if (current_position > upper) return(list(status = "Right breach",
                                                  position = current_position,
                                                  steps = i))
    }
    return(list(status = "Max steps reached",
                position = current_position,
                steps = n_max))
}

#Simulate results
result <- replicate(1000, simulate_walk(), simplify = FALSE)
result <- data.frame(status = sapply(result, function(x) x$status),
                     position = sapply(result, function(x) x$position),
                     steps = sapply(result, function(x) x$steps))
tapply(result$position, result$status, length)
tapply(result$steps, result$status, mean)

# Random walk with absortion
simulate_round <- function(x = 0, y = 0, radius = 6, n_max = 100, p = 0.01) {
    current_position <- c(x, y)
    for (i in 1:n_max) {
        is_absorbed <- rbinom(1, 1, p)
        if (is_absorbed) return(1)
        current_position <- c(current_position[1] + rnorm(1), current_position[2] + rnorm(1))
        dist <- sqrt(current_position[1]^2 + current_position[2]^2)
        if (dist > radius) return(2)
    }
    return(3)
}
res <- replicate(100000, simulate_round(), simplify = TRUE)
sapply(x, count)
table(res)

methods(matrix
        )
methods(print)
methods(summary)
methods(plot)

