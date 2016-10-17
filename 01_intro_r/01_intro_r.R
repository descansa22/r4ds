#################
# Nacho Hidalgo
# 2016-10-17
# reto
# basado en: https://cran.r-project.org/doc/manuals/R-intro.pdf
#################

# Ejercicio 1: dado x construido de la siguiente manera
w <- c(2, 7, 8)
v <- c("A", "B", "C")
x <- list(w, v)
# escribe una nueva sentencia que reemplace "A" por "K" en la lista x
x[[2]][1] <- "K"

# Ejercicio 2: dado a
a <- list ("x"=5, "y"=10, "z"=15)
# calcula en una sentencia la suma de sus elementos
# pista: ?unlist
suma <- sum(unlist(a))

# Ejercicio 3: dado
b <- list(a=1:10, b=seq(3), c=rep(2, 5))
# escribe una sentencia que devuelva un vector con la longitud de cada uno de los elementos de lista
longitudes <- lengths(b)

# Ejercicio 4
c <- list(a=1:10, c="Hello", d="AA")
# escribe una sentencia que devuelva todos los elementos de la lista menos el primero
newc <- c[2:length(c)]

# Ejercicio 5
d <- list(a=5:10, c="Hello", d="AA")
# escribe una sentencia que añada al final de d un elemento "ZZ"
newd <- c(d, e="ZZ")

# Ejercicio 6
e <- list("a", "b", "c")
# escribe una sentencia que asigne como nombres de elementos "one", "two" and "three" a e
e <- setNames(e, c("one", "two", "three"))

# Ejercicio 7
f <- list(1, 5, 7)
g <- list(2, 5, 8)
# escribe una sentencia que devuelva los valores de f que no están en g
# pista: ?`%in%`
diffElems <- setdiff(f, g)

# Ejercicio 8
# A partir del dataset state.center ya cargado en R
# Comprueba el tipo de dato, examínalo y conviértelo a data.frame
is.data.frame(state.center)
mode(state.center)
summary(state.center)
df <- data.frame(state.center$x, state.center$y)

# Ejercicio 9
# Crea un data.frame con 3 columnas a partir de 3 vectores numéricos a tu gusto
# Ordena las filas de manera descendente con los valores de la primera columna
# pista: ?order
x1 <- sample(1:1000, 10, replace=F)
x2 <- sample(1:1000, 10, replace=F)
x3 <- sample(1:1000, 10, replace=F)
df <- data.frame(one = x1, two = x2, three = x3)
newdata <- df[order(df$one, decreasing = TRUE),] 

# Ejercicio 10
# A partir del data.frame
h <- as.data.frame(diag(4))
# Renombra los nombres de las filas para que se llamen i_row (es decir, 1_row, 2_row, ...)
# y las columnas a j_col (es decir, 1_col, 2_col, ...)
# pista: puedes utilizar rownames, colnames, nrow, ncol, paste0 y sapply
colnames(h) <- paste0(1:ncol(h), rep("_col", ncol(h)))
rownames(h) <- paste0(1:nrow(h), rep("_row", nrow(h)))

# Ejercicio 11
# A partir del dataset VADeaths ya cargado en R
# a) Comprueba si es un data.frame y si no, conviértelo
is.data.frame(VADeaths)
df <- as.data.frame(VADeaths)

# b) Crea una una columna Total con la suma de cada fila
df$Total <- rowSums(df)

# c) Cambia de orden las columnas, de forma que Total sea la primera
df <- df[c(5, 1, 2, 3, 4)]

# Ejercicio 12
# A partir del dataset state.x77 ya cargado en R
# a) Comprueba si es un data.frame y si no, conviértelo
is.data.frame(state.x77)
df <- as.data.frame(state.x77)

# b) Extrae el número de estados con un ingreso menor a 4300
length(df[df$Income < 4300,])

# c) Extrae el estado con el ingreso más alto. Pista: ?which
x <- df[which(df$Income==max(df$Income)), ]

# Ejercicio 13
# A partir del dataset swiss, crea un data.frame únicamente con las filas
# 1, 2, 3, 10, 11, 12 and 13, y solo con las columnas Examination, Education and Infant.Mortality
df <- as.data.frame(swiss[c(1,2,3,10,11,12,13),c("Examination", "Education", "Infant.Mortality")])

# a) La mortalidad infantil de Sarine está mal, debería ser NA, cámbialo.
#No he encontrado ningún valor NA

# b) Crea una columna Total con la suma de cada fila. Si te encuentras NAs, ignóralos (suman 0)
df$Total <- rowSums(df)

# c) Crea una columna of con la proporción de Examination (Examination / Total)
df$PropExamination <- df$Examination/df$Total
