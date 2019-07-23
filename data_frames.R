# Создание дата фреймов
df <- data.frame(x = 1:4, y = LETTERS[1:4], z = c(T, F))
str(df)

# Имена
df <- data.frame(x = 1:4, y = LETTERS[1:4], z = c(T, F),
                 row.names = c("Alpha", "Bravo", "Charlie", "Delta"))

rownames(df); colnames(df)

# Размерности
nrow(df); ncol(df); dim(df)

# Индексация data frame
df[3:4, -1]
df[c(F, T), c("z", "x")]

df[, 1]; df[, 1, drop = F]
df$z

# Фильтрация по условию
df[df$x > 2,]
subset(df, x > 2)
subset(df, x > 2, select = c(x, z))

# Комбинирование data frame
rbind(df, data.frame(x = 5:6, y = c("K", "Z"), z = TRUE, row.names = c("Kappa", "Zulu")))
cbind(df, data.frame(season = c("Summer", "Autumn", "Winter", "Spring"), temp = c(20, 5, -10, 5)))

# Комбинирование data frame: merge
df_salary <- data.frame(x = c(3, 2, 6, 1), salary = c(100, 1000, 300, 500))
merge(df, df_salary, by = "x")

# Импорт данных
avian <- read.csv("d:/R/R programming/avianHabitat.csv")
str(avian)
head(avian)
summary(avian)

any(!complete.cases(avian))
any(avian$PDB < 0)
any(avian$PDB > 100)

check_percent_range <- function(x) {
    any(x < 0 | x > 100)
}

check_percent_range(avian$PW)

names(avian)
coverage_variables <- names(avian)[-(1:4)][c(T, F)]
coverage_variables
avian$total_coverage <- rowSums(avian[, coverage_variables])
summary(avian$total_coverage)

avian2 <- read.table("d:/R/R programming/avianHabitat2.csv", skip = 5, sep = ';', header = TRUE)
rbind(avian, avian2)
coverage_variables <- names(avian2)[-(1:4)][c(T, F)]
avian2$total_coverage <- rowSums(avian2[, coverage_variables])
avian[, avian$Observer := NULL]
avian$Observer <- NULL
avian <- rbind(avian, avian2)
names(avian)
names(avian2)
names(avian2$PB.) <- "PB"
colnames(avian2)[16] <- "PB"

avian <- read.csv("d:/R/R programming/avianHabitat.csv")
height_variables <- names(avian)[-(1:4)][c(F, T)]
avian$max_height <- rowSums(avian[, height_variables])
sapply(height_variables, function(i) max(avian[[i]]))
