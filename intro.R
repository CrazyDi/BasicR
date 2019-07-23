# Оператор присваивания: <-
cats <- 5
dogs <- 2
pets <- cats + dogs
pets

# Глобальное окружение
ls()

# Вызов функций
?rnorm
rnorm(15)
rnorm(15, mean = 5, sd = 3)

# Написание функций
returntwo <- function() {
    y <- 2
    return(y)
}

returntwo()

# Окружения функций
addten <- function(x) {
    x <- x + 10
}

addten(cats)
cats

addten <- function(x) {
    return(x + 10)
}

morecats <- addten(cats)
morecats

# Окружения функций
# Существует оператор "глобального присваивания", <<-
addten <- function(x) {
    moredogs <<- x + 10
}

addten(dogs)
dogs
moredogs

# Удаление переменных из окружения
ls()
rm(dogs)
rm(moredogs)
ls()
rm(list = ls())
ls()

# ЗАДАЧА
# Напишите функцию, которая принимает на вход два числа и 
# возвращает результат деления первого на второе.
divide <- function(x, y) {
    return(x/y)
}