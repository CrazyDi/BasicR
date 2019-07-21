1:5 + 0:1

1:10 + 3

(5:8) ^ 2

1:4 >= 3

x <- seq(10, 100, by = 10)

x[]

x[1]

x[3:4]

x[c(8, 7, 3, 6:8, x[1])]

x[-5]

x[-(2:6)]

x[c(-3, -5, -length(x), -5)]

x[rep(c(TRUE, FALSE), 5)]

x[c(TRUE, FALSE
    )]
x[x > 77 & x < 99]

a[c("two", "one", "forty two")]

all(x < 200)
all(x > 20)
any(x > 150)
any(x < 15)

which(x >= 50)
which.min(x)
which.max(x)

x <- c(5, 3, 9)
names(x) <- c("v", "III", "IX")
attr(x, "author") <- "Caesar"
attributes(x)
attributes(x) <- NULL

# fizz-buzz, imperative style
y <- vector(mode = "character", length = 100)
y <- character(100)
for (i in 1:100) {
    if (i %% 15 == 0) {
        y[i] <- "fizz buzz"
    } else if (i %% 3 == 0) {
        y[i] <- "fizz"
    } else if (i %% 5 == 0) {
        y[i] <- "buzz"
    } else {
        y[i] <- i
    }
}

# fizz-buzz, vector-oriented style
x <- 1:100
z <- 1:100
x %% 5
x %% 5 == 0
z[x %% 5 == 0] <- "buzz"
z

# Geometric progression
x <- 2 ^ (0:10)
x
log2(x)

# Some randomness
set.seed(42)
x <- sample(1:100, 50)

# Neibors with greatest diff
x[-1]
x[-length(x)]
x[-1] - x[-length(x)]
k <- which.max(abs(x[-1] - x[-length(x)]))
x[c(k, k+1)]

# Multiple min/max
x <- sample(1:100, 50, replace = TRUE)
min(x)
which.min(x)
which(x == min(x))

# Packing into a function
maxdiff <- function(x) {
    y <- abs(x[-1] - x[-length(x)])
    k <- which(y == max(y))
    print("First neighbor(s):")
    print(x[k])
    print("Second neighbor(s):")
    print(x[k + 1])
    print("Maximum absolute diff is:")
    print(max(y))
}
xx <- sample(1:100, 1e4, replace = TRUE)
maxdiff(xx
        )

# Пусть вектор называется нестрого возрастающим, 
# если каждый следующий элемент в нём не меньше, 
# чем предыдущий. Точно так же, вектор назовём 
# нестрого убывающим, если каждый следующий элемент
# в нём не больше, чем предыдущий. 
# Напишите функцию, которая принимает один 
# аргумент (числовой вектор) и возвращает TRUE, 
# если вектор обладает свойством нестрогой 
# монотонности, то есть является либо несторого 
# возрастающим, либо нестрого убывающим. 
# В противном случае функция возвращает FALSE.
is_monotone <- function(x) {
    y <- x[-1] - x[-length(x)]
    if (all(y >= 0)||all(y <= 0)) {
        return(TRUE)
    } else {
        return(FALSE)
    }
}

# Разбавим курс ложечкой комбинаторики. 
# Пусть у нас есть n предметов, 
# из которых нужно выбрать k штук.

# Известнейшая комбинаторная формула 
# Ckn=n!k!(n???k)! ("Цэ из эн по ка") 
# задаёт количество всевозможных сочетаний. 
# Похожий вид имеет и количество сочетаний
# с повторениями (мультикомбинаций).

# Запрограммируйте оба этих значения в 
# виде функции, зависящей от n и k. 
# Аргумент with_repetitions 
# будет отвечать за вариант подсчёта: 
# если он FALSE, то пусть считается 
# количество сочетаний, а если TRUE, 
# то сочетаний с повторениями.

combin_count <- function(n, k, with_repretitions = FALSE) {
    if (with_repretitions) {
        return(factorial(n + k - 1) / (factorial(k) * factorial(n-1)))
    } else {
        return(factorial(n) / (factorial(k) * factorial(n-k)))
    }
}
