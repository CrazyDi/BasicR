# �������� ������������: <-
cats <- 5
dogs <- 2
pets <- cats + dogs
pets

# ���������� ���������
ls()

# ����� �������
?rnorm
rnorm(15)
rnorm(15, mean = 5, sd = 3)

# ��������� �������
returntwo <- function() {
    y <- 2
    return(y)
}

returntwo()

# ��������� �������
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

# ��������� �������
# ���������� �������� "����������� ������������", <<-
addten <- function(x) {
    moredogs <<- x + 10
}

addten(dogs)
dogs
moredogs

# �������� ���������� �� ���������
ls()
rm(dogs)
rm(moredogs)
ls()
rm(list = ls())
ls()

# ������
# �������� �������, ������� ��������� �� ���� ��� ����� � 
# ���������� ��������� ������� ������� �� ������.
divide <- function(x, y) {
    return(x/y)
}