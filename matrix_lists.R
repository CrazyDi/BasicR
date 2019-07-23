# МАТРИЦЫ
matrix(1:6, nrow = 2, ncol = 3)

# Создание матриц
matrix(1:6, nrow = 2, byrow = TRUE)

matrix(7:8, nrow = 2, ncol = 5)

# Атрибут dim
m <- matrix(1:6, ncol = 3)
dim(m)
c(nrow(m), ncol(m))

dim(m) <- NULL; m
dim(m) <- c(2, 3); m

# Арифметические операции
m1 <- matrix(1:4, nrow = 2)
m2 <- matrix(c(1, 2, 2, 3), nrow = 2)
m1 + m2
m1 + 5
m1 * 2
m1 * m2

# Умножение в смысле линейной алгебры
m1 %*% m2

# Индексирование матриц
m <- matrix(1:10, ncol = 5)
m[1, 3]
m
m[2, ]
m[, 4]

m[1, ] <- 0; m
m[, -5] <- 11:18; m

# Схлопывание размерности
m <- matrix(1:10, ncol = 5)
ind <- c(1, 3, 5)
m[, ind]

ind <- 3
m[, ind]

m[, ind, drop = FALSE]

# Именованные матрицы: rownames/colnames
m <- matrix(1:10, ncol = 5)
rownames(m) <- c("row1", "row2")
colnames(m) <- paste0("column", 1:5)
m

m["row1", c("column2", "column4"), drop = F]

# Присоединение матриц: rbind/cbind
rbind(m1, m2)
cbind(m1, m2)

# Аргумент ... (ellipsis)
# Аргумент ... позволяет передавать любое количество объектов
cbind(m1, m2, 1:2, c(5, 3), m2[, 1], m1 * 3, cbind(m2, m1))

# Применение функций к матрице: apply
m <- matrix(1:25, 5)
f <- function(x) sum(x^2)

# Три аргумента функции apply:
# Массив (матрица)
# Индекс (1 - по строкам, 2 - по столбцам)
# Функция
m
apply(m, 1, f)
apply(m, 2, f)

apply(m, 1:2, function(i) if (i>13) i else 13)
m[m <= 13] <- 13; m

# rowSums, rowMeans, colSums, colMeans
m <- matrix(1:25, 5)
rowSums(m)

all.equal(rowSums(m), apply(m, 1, sum))
all.equal(colMeans(m), apply(m, 2, mean))

# ЗАДАЧА
# Предположим, что у нас есть целочисленный вектор v и число n. 
# Наша задача — найти позицию элемента в векторе, 
# который ближе всего к числу n. При этом если таких элементов несколько, 
# необходимо указать все позиции.

# Напишите функцию, которая принимает на вход вектор и число 
# и возвращает вектор индексов, отвечающих указанному условию. 
# Индексы должны быть выстроены по возрастанию.

find_closest <- function(v, n) {
    u <- abs(v - n)
    return(which(u == min(u)))
}
