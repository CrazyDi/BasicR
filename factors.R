# Факторы
set.seed(1337)
f <- factor(sample(LETTERS, 30, replace = TRUE))
f

# Уровни фактора
as.numeric(f)
as.character(f)
levels(f)
nlevels(f)

f[f == "A"] <- "Z"
f
f <- droplevels(f)
f

# Преобразование уровней фактора
levels(f) <- tolower(levels(f))
f

levels(f)[1] <- 'bbb'
f

# Упорядоченные факторы
temp <- c('freezing cold', 'cold', 'comfortable', 'hot', 'burning hot')
ft <- ordered(sample(temp, 14, replace = TRUE), temp)
ft
ft[ft >= "hot"]

# Преобразование количественной переменной в качественную
cut(rnorm(10), -5:5)
table(cut(rnorm(1000), -5:5))

# options
?options
options(stringsAsFactors = FALSE)

# tapply
str(warpbreaks)
tapply(warpbreaks$breaks, warpbreaks$wool, max)

avian <- read.csv("d:/R/R programming/avianHabitat.csv")

list.files()
list.files(pattern = ".*\\.csv$")
readLines("d:/R/R programming/avianHabitat.csv", 5)

avian$Observer <- as.factor(avian$Observer)

check_percent_range <- function(x) {
    any(x < 0 | x > 100)
}
check_percent_range(avian$PW)

library(stringr)
coverage_variables <- names(avian)[str_detect(names(avian), "^P")]
sapply(coverage_variables, function(name) check_percent_range(avian[[name]]))

unique(avian$Site)
avian$Site_name <- str_replace(avian$Site, "[:digit:]+", "")
avian$Site_name <- factor(str_replace(avian$Site, "[:digit:]+", ""))

tapply(avian$DBHt, avian$Site_name, mean)

coverage_variables <- names(avian)[-(1:4)][c(T, F)]
coverage_variables

avian$total_coverage <- rowSums(avian[, coverage_variables])
tapply(avian$total_coverage, avian$Site_name, mean)

tapply(avian$LHt, avian$Observer, max)
