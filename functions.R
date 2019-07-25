# Функции
str(c(mean, max))

fun_list <- c(mean, max)
sapply(fun_list, function(f) f(1:100))

# Функция как агрумент
apply_f <- function(f, x) f(x)
sapply(fun_list, apply_f, x = 1:100)

apply_f(function(x) sum(x^2), 1:10)

# Функция как return value
square <- function() function(x) x^2
square()
square()(5)

# Функции внутри функций
f <- function(x) {
    g <- function(y) if (y > 0) 1 else if (y < 0) -1 else 0
    sapply(x, g)
}
all.equal(f(-100:100), sign(-100:100))

# Исходный код функции
(f <- function(x) x^5)
sd
f

methods(plot)

# Возвращаемое значение
has_na <- function(c) {
    for (k in v) if (is.na(k)) return(TRUE)
    return(FALSE)
}
has_na <- function(v) any(is.na(v))

# Аргументы по умолчанию
seq(from = 1, to = 1, by = ((to - from)/(length.out - 1)),
    length.out = NULL, along.with = NULL, ...)

seq()
seq(1, 5, length.out = 11)

# Правила разбора аргументов
f <- function(arg1, arg2, remove_na = TRUE, ..., optional_arg) {}
f(1, arg2 = 2, remove = F, optional_arg = 42, do_magic = TRUE)

# 1. Точное совпадение имени аргумента - arg2, optional_arg
# 2. Частичное совпадение имени агрумента (только до ...) - remove_na
# 3. Разбор аргументов по позиции - arg1
# Неразобранные аргументы попадают в ... - do_magic

# Проброс аргументов
f <- function(x, pow = 2) x^pow
integrate(f, 0, 1)
integrate(f, 0, 1, pow = 5)

# Бинарные операторы
1:5 %in% c(1, 2, 5)
'%nin%' <- function(x, y) !(x %in% y)
1:5 %nin% c(1, 2, 5)

# ЗАДАЧА
# Пусть функция decorate_string действует поверх функции 
# paste, дополнительно приклеивая к результату аргумент 
# pattern. При этом этот аргумент должен быть присоединён 
# как в начале строки (строк), так и в конце, 
# но перевёрнутый задом наперёд.
decorate_string <- function(pattern, ...) { 
    q <- paste(...)
    return(paste(pattern, q, paste(rev(strsplit(pattern, NULL)[[1]]), collapse = ""), sep = ''))
}
decorate_string(pattern = ".:", 1:2, 3:4, 5:6, sep = "&")

# Generate deck card
values <- c("Ace", 2:10, "Jack", "Queen", "King")
suits <- c("Clubs", "Diamonds", "Hearts", "Spades")
card_deck <-outer(values, suits, paste, sep = " of ")       

# Function factory
generator <- function(set) function(n) sample(set, n, replace = 1)
     
# Define generators
card_generator <- generator(card_deck)
coin_generator <- generator(c("Heads", "Tails"))

# Let's play
card_generator(10)
coin_generator(5)

# Задача
# Воспользуйтесь подготовленным мной шаблоном, 
# чтобы получить две функции, содержащие честную 
# и нечестную рулетку. Честная -- это когда все 
# имеющиеся значения (всего их 37) выпадают с равной 
# вероятностью. А нечестная пусть выдаёт все значения, 
# кроме зеро, с равной вероятностью. Что же касается 
# зеро (первый элемент определённого мной вектора 
# roulette_values), то вероятность его выпадения 
# пусть будет в два раза больше, чем любого другого 
# значения.
generator <- function(set, prob = rep(1/length(set), length(set))) { 
    function(n) sample(set, n, prob = prob, replace = 1)
} 

roulette_values <- c("Zero!", 1:36)
fair_roulette <- generator(roulette_values)
rigged_roulette <- generator(roulette_values, prob = c(2/length(roulette_values), rep(1/length(roulette_values), length(roulette_values) - 1)))
fair_roulette(10)
rigged_roulette(10)

# ЗАДАЧА
# Давайте напишем бинарный оператор! 
# Пусть %+% действует на два числовых вектора, 
# складывая их поэлементно, но без учёта правил 
# переписывания: если длина векторов различна, 
# то возвращаем вектор большей длины, 
# но с пропущенными значениями в конце.
"%+%" <- function(x, y) {
    ind <- 1:max(length(x), length(y))
    return(sapply(ind, function(i) x[i] + y[i]))
}

1:5 %+% 1:2
5 %+% c(2, 6)
