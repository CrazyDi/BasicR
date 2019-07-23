# Пакеты
.libPaths()

installed.packages()

# Подключение пакетов
library(grid)
grid.newpage()
grid.lines()

# Установка пакетов из CRAN
install.packages("xts", dependencies = TRUE)
library(xts)
update.packages()
sessionInfo()
