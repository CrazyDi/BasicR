# Вектор
# Вектор - индексированный набор данных одного типа
# R не делает различия между скалярными и векторными величинами,
# т.е. скаляр - это вектор длины 1
# Индексация векторов начинается с единицы (не с нуля!)
x <- vector(length = 2)
x[1] <- 5
x[2] <- 8
x

# Создание векторов: функция С
x <- c(5, 8)
x

y <- c(x, 1, c(3, 4), x, NA)
y

# Создание векторов: оператор :
5:9
3:-1

# Создание векторов: функция seq
seq(1, 2, by = 0.25)
seq(3, 4, length.out = 5)
seq(3, 4, length = 5)

# Создание векторов: функция rep
rep(1:3, times = 3)
rep(1:3, each = 4)
rep(1:3, length.out = 5)

# ЗАДАЧА
# Напишите функцию get_fractions, которая принимает на вход два числа, m и n, 
# и возвращает аналогичный вектор, содержащий все дроби вида 
# {i/m, i = 0, 1, ..., m} и  {j/n, j = 0, 1, ..., n}. 
# Вектор не должен содержать повторов. И должен быть упорядочен в порядке убывания.
get_fractions <- function(m, n) {
    return(sort(unique(c(seq(0, 1, 1/m), seq(0, 1, 1/n))), decreasing = TRUE))
}

# Типы векторов
# Для определения типа вектора есть функции typeof и is.*
a <- c("Дуб - дерево", "Роза - цветок", "Воробей - птица")
typeof(a)
is.character(a)
is.logical(a)

# Приведение типов
# Естественным считается приведение слева направо по цепочке
# logical - integer - double - character
b <- c(FALSE, 1.5)
typeof(b)
b <- c(5, b, "abc")
typeof(b)
b

# Принудительное приведение типов осуществляется функциями as.*
as.numeric(b)
as.integer(b)

# Длина вектора
x <- 1:100
length(x) <- 4; x
length(x) <- 7; x 

# Именованные вектора
a <- c(uno = 1, dos = 2, "universal answer" = 42, 99)
names(a)
names(a) <- c("one", "two", "forty two", "ninety nine")
a

# Векторная арифметика
# Арифмтические операторы векторизованы (применяются поэлементно)
1:3 + c(-1, 2, 0)
1:3 * c(-1, 2, 0)
c(TRUE, TRUE, TRUE) & c(0, 1, 999)

# Векторизация
sqrt(1:4)
floor(seq(0, 3, by = 0.25))
sum(1:100)

# ЗАДАЧА
# Функция dice_roll(n) должна выдавать n независимых бросков игрального кубика. 
# Допустимые значения, разумеется, в диапазоне от 1 до 6.
dice_roll <- function(n) {
    x <- runif(n)
    ifelse(x > 5/6, 6,
           ifelse(x > 4/6, 5,
                  ifelse(x > 3/6, 4,
                         ifelse(x > 2/6, 3,
                                ifelse(x > 1/6, 2, 1)))))
    
}

# Правила переписывания (recycling)
1:5 + 0:1
1:10 + 3
(5:8) ^ 2
1:4 >= 3

# Доступ к элементам вектора
x <- seq(10, 100, by = 10)
x[]

# Положительные индексы
x[1]
x[3:4]
x[c(8, 7, 3, 6:8, x[1])]

# Отрицательные индексы
x[-5]
x[-(2:6)]
x[c(-3, -5, -length(x), -5)]

# Логические индексы
x[rep(c(TRUE, FALSE), 5)]
x[c(TRUE, FALSE)]
x[x > 77 & x < 99]

# Индексация по имени
a[c("two", "one", "forty two")]
a[c("forty two", "forty three", "forty four")]

# Функции all И any
all(x < 200); all(x > 20)
any(x > 150); any(x < 15)

# Функция which
which(x >= 50)
which.min(x)
which.max(x)

# Атрибуты объектов
x <- c(5, 3, 9)
names(x) <- c("V", "III", "IX")
attr(x, "author") <- "Caesar"
attributes(x)
attributes(x) <- NULL
attributes(x)

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
y

# fizz-buzz, vector-oriented style
x <- 1:100
z <- 1:100
x %% 5
x %% 5 == 0
z[x %% 5 == 0]
z[x %% 5 == 0] <- "buzz"
z[x %% 3 == 0] <- "fizz"
z[x %% 15 == 0] <- "fizz buzz"
z
all(y == z)

# Geometric progression
x <- 2 ^ (0:10)
x
log2(x)

# Some randomness
set.seed(42)
x <- sample(1:100, 50)

# Neigbors with greatest diff
x[-1]
x[-length(x)]
x[-1] - x[-length(x)]
k <- which.max(abs(x[-1] - x[-length(x)]))
x[c(k, k + 1)]

# Multiple min/max
x <- sample(1:100, 50, replace = TRUE)
min(x)
which.min(x)
which(x == min(x)) 

# ЗАДАЧА
# Напишите функцию, которая принимает один аргумент (числовой вектор) 
# и возвращает TRUE, если вектор обладает свойством нестрогой монотонности, 
# то есть является либо несторого возрастающим, либо нестрого убывающим. 
# В противном случае функция возвращает FALSE.
is_monotone <- function(x) {
    y <- x[-1] - x[-length(x)]
    if (all(y >= 0)||all(y <= 0)) {
        return(TRUE)
    } else {
        return(FALSE)
    }
}

# ЗАДАЧА
# Разбавим курс ложечкой комбинаторики. 
# Пусть у нас есть n предметов, из которых нужно выбрать k штук.
# Известнейшая комбинаторная формула Ckn=n!k!(n−k)! ("Цэ из эн по ка") 
# задаёт количество всевозможных сочетаний. 
# Похожий вид имеет и количество сочетаний с повторениями (мультикомбинаций).
# Запрограммируйте оба этих значения в виде функции, 
# зависящей от n и k. Аргумент with_repetitions будет отвечать 
# за вариант подсчёта: если он FALSE, то пусть считается количество 
# сочетаний, а если TRUE, то сочетаний с повторениями.
combin_count <- function(n, k, with_repretitions = FALSE) {
    if (with_repretitions) {
        return(factorial(n + k - 1) / (factorial(k) * factorial(n-1)))
    } else {
        return(factorial(n) / (factorial(k) * factorial(n-k)))
    }
}