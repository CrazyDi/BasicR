# Строки
s <- c("Терпение и труд все перетрут", 
       "Кончил дело - гуляй смело",
       "Без труда не вытащишь и рыбку из пруда",
       "Работа не волк, в лес не убежит")
  
# Функции paste/paste0
paste(c("углекислый", "веселящий"), "газ")
paste(c("углекислый", "веселящий"), "газ", sep = '_')
paste(c("углекислый", "веселящий"), "газ", collapse = ", а также ")

# Функция strsplit
strsplit(s, " и ", fixed = TRUE)
strsplit(s, "[[:punct:]]")

# Регулярные выражения
grep("труд", s)
grepl("труд", s)
gsub("\\b[[:alpha:]]{4,5}\\b", "####", s)

# Пакет stringr
library(stringr)
str_extract(s, "н.")
str_replace(s, "[иа]", "?")
str_extract_all(s, "н.")

str_replace_all(s, "[иае]", "?")

# Функции tolower/toupper
tolower(month.name)
toupper(month.abb)

# Пути к файлам
getwd()
head(list.files())
list.dirs("..", recursive = FALSE)

# Форматирование чисел
c(pi, exp(pi))
formatC(c(pi, exp(pi)), digits = 3)
formatC(c(pi, exp(pi)), digits = 3, format = "e")

# Функция cat
print('Операция "Ы"'); cat('Операция "Ы"')
print("Трус\tБалбес\nБывалый"); cat("Трус\tБалбес\nБывалый")

library(stringr)
hamlet <- "To be, or not to be: that is the question:
Whether 'tis nobler in the mind to suffer
The slings and arrows of outrageous fortune,
Or to take arms against a sea of troubles,
And by opposing end them?"
hamlet <- str_replace_all(hamlet, "[:punct:]", "")
hamlet <- tolower(unlist(str_split(hamlet, "[:space:]")))
hamlet <- c("to", "be", "or", "not", "to", "be", "that", "is", "the", "question", 
            "whether", "tis", "nobler", "in", "the", "mind", "to", "suffer", 
            "the", "slings", "and", "arrows", "of", "outrageous", "fortune", 
            "or", "to", "take", "arms", "against", "a", "sea", "of", "troubles", 
            "and", "by", "opposing", "end", "them")
table(c)
sum(sapply(hamlet, function(i) grepl("\\b[[:alpha:]]{7}\\b", i)))
?stringr
