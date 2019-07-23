# if и else
# if (<condition>) {<do something>} else {<do another thing>}
if (sqrt(2) > 1.5) {
    print("Greater!")
} else {
    print("Less!")
}

# ifelse
if (c(TRUE, FALSE)) print("Hmm...?")

ifelse(runif(8) > 0.5, "Орел", "Решка")

x <- runif(8)
ifelse(x > 2/3, "Камень",
       ifelse(x > 1/3, "Ножницы", "Бумага"))

# Множественный выбор: switch
switch("factorial",
       sum = 5 + 5,
       product = 5 * 5,
       factorial = factorial(5),
       0)

# Циклы: repeat
i <- 0
repeat {
    i <- i + runif(1)
    print(i)
    if (i > 5) break
}

 # Циклы: while
i <- 2^14
while (i > 1000) {
    i <- i / 2
    print(i)
}

# Циклы: for
for (i in 1:8) {
    if (i %% 2 == 0) print(i)
}

for (i in letters) {
    if (i == "b") next
    if (i == "d") break
    print(i)
}

# for против векторизации
v <- 1:1e6
system.time({
    x <- 0
    for (i in v) x[i] <- sqrt(v[i])
})

system.time({
    y <- sqrt(v)
})

identical(x, y)
