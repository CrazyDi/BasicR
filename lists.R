# Список
list(1:5, "my_data", matrix(0, 2, 2))

# Создание списков
list(a = 1, b = 1:3, '1to5' = 1:5, 42)
list(a = list(1, 2, 3), b = list(list(4), 5, 6))

# Конкатенация списков
l1 <- list(name = "john", salary = 1000)
l2 <- list(has_car = TRUE, car = "lamborgini")
c(l1, l2)

# Конверсия между списком и вектором
v <- 1:7
list(v)

l<- list(1:3, 4:5, last = 6)
unlist(l)

unlist(c(l, "spy!"))

# Доступ к элементам списка
l[3:2]; l[-(1:2)]
l[c(F, T, F)]; l["last"]

# Доступ к элементам списка
l[[1]]
l[["last"]]

# Замена и добавление элементов списка
l <- list(1:3, 4:5, last = 6)
l[[3]] <- NULL; l
l[[4]] <- 99; l

l <- list(vec = 1:7, fun = sqrt)
names(l)
is.null(l$string)
l$string <- "Citius, altius, forius"
l

# Применение функций к списку: lapply
l <- list(a = c("12", "34"), b = LETTERS[5:10], c = 1:5)
lapply(l, length)

lapply(l, paste, collapse = "|")
lapply(l, function(s) paste(s, collapse = "|"))

sapply(l, paste, collapse = "|")

# найти длиннейший элемент
get_longest <- function(l) {
    len <- sapply(l, length)
    ind <- which.max(len)
    list(number = ind, element = l[[ind]])
}

# генерация списков с элементами различной длины
gen_list <- function(n_elements, max_len, seed = 111) {
    set.seed(seed)
    len <- sample(1:max_len, n_elements)
    lapply(1:n_elements, function(i) rnorm(len[i]))
}

l1 <- gen_list(4, 10)
l1
gl1 <- get_longest(l1)
gl1
l2 <- gen_list(4, 10, 777)
l2
get_longest(l2)

# ЗАДАЧА
# Пусть x -- целочисленный вектор. 
# Напишите функцию, которая вернёт матрицу из двух строк. 
# В первой строке перечислите все различные элементы 
# вектора, упорядоченные по возрастанию. Во второй 
# строке укажите частоты (количество повторов) этих 
# элементов.
count_elements <- function(x) {
    m <- matrix(sort(unique(x)), nrow = 1)
    rbind(m, lapply(y, function(i) sum(x == i)))
}
count_elements(x)
