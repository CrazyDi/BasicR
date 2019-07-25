# Концепция tidy data
set.seed(1122)
df <- data.frame(Name = c("John", "Peter", "Mary", "Caroline"),
                 DrugA_T1 = runif(4, 35, 36),
                 DrugA_T2 = runif(4, 36, 39), 
                 DrugB_T1 = runif(4, 36, 36.6),
                 DrugB_T2 = runif(4, 37, 38.5))
df

# Связка gather-spread
install.packages("tidyr")
library(tidyr)
gather(df, Variable, Temperature, -Name)

# Связка separate_unite
df <- gather(df, Variable, Temperature, -Name)
df <- separate(df, Variable, c("DrugType", "Time"), "_")
df

# dplyr: функция select
library(dplyr)
select(df, Time, Temperature)
select(df, 3:4)
select(df, starts_with("T"))
select(df, -Name, -DrugType)

# dplyr: функция filter
filter(df, Temperature > 37, Name %in% c("John", "Mary"))

# dplyr: функция arrange
arrange(df, Name, -Temperature)

# dplyr: функция mutate
mutate(df, DrugType = gsub("Drug", "", DrugType))

# dplyr: связка функций group by и summarise
summarise(group_by(df, Time), AvgTemp = mean(Temperature))

# Конвейеры: оператор %>%
df <- data.frame(type = c(1, 1, 2, 2, 3, 3), value = c(5, 10, 50, 180, 7, 7))
arrange(summarise(group_by(df, type), Total = sum(value)), -Total)

a<- group_by(df, type)
b <- summarise(a, Total = sum(value))
c <- arrange(b, -Total)

df %>% group_by(type) %>% summarise(Total = sum(value)) %>% arrange(-Total)

x %>% f
f(x)

x %>% f(y)
f(x, y)

x %>% f(y, param = .)
f(y, param = x)

library(stringr)

options(stringsAsFactors = FALSE)

# First approach
avian <- read.csv("d:/R/R programming/avianHabitat.csv" )

avian <- subset(avian, PDB > 0 & DBHt > 0, c("Site", "Observer", "PDB", "DBHt"))
avian$Site <- factor(str_replace(avian$Site, "[:digit:]+", ""))
subset(aggregate(avian$DBHt, list(Site = avian$Site, Observer = avian$Observer), max), x >= 5)


#Second approach
avian <- read.csv("d:/R/R programming/avianHabitat.csv" )
avian <- avian %>% subset(PDB > 0 & DBHt > 0, c("Site", "Observer", "PDB", "DBHt")) %>%
    transform(Site = factor(str_replace(.$Site, "[:digit:]+", "")))

aggregate(avian$DBHt, list(Site = avian$Site, Observer = avian$Observer), max) %>% subset(x >= 5)

# Third approach 
avian <- read.csv("d:/R/R programming/avianHabitat.csv")
avian %>% 
    filter(PDB > 0, DBHt > 0) %>%
    select(Site, Observer, contains("DB")) %>%
    mutate(Site = factor(str_replace(Site, "[:digit:]+", ""))) %>%
    group_by(Site, Observer) %>%
    summarise(MaxHt = max(DBHt)) %>%
    filter(MaxHt >= 5)

avian <- read.csv("d:/R/R programming/avianHabitat.csv")
avian$Site <- factor(str_replace(avian$Site, "[:digit:]+", ""))
avianE <- select(avian, Site, Observer, EHt)
avianE <- filter(avian, EHt > 0)
summarise(group_by(avianE, Site, Observer), n = n())
avian %>%
    select(Site, Observer, WHt) %>%
    filter(WHt > 0) %>%
    group_by(Site, Observer) %>%
    summarise(n = n())

