# ������
.libPaths()

installed.packages()

# ����������� �������
library(grid)
grid.newpage()
grid.lines()

# ��������� ������� �� CRAN
install.packages("xts", dependencies = TRUE)
library(xts)
update.packages()
sessionInfo()