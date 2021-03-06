#### FUndamentos de R ####
getwd()
setwd("C:/Users/Usuario/Desktop/Clases_de_R/Pr�cticas/Clase_1")

#Estos dos tipos de help son distintos, a�n no se en que 
help("mean")
help.search("mean")
?mean #Es lo mismo que help(mean)

# R tambi�n sirve como calculadora

# Vamos a trabajor con unos vectores
peso <- c(60,72,84,65,43,87,90,56)
length(peso) #Me da el n�mero de elementos
peso[3] #Las "[]" me permiten visualizar los elementos del vector, dentro de [] va el 
# el orden del elemento que quiero ver

altura <- c(1.59,1.75,1.85,1.60,1.57,1.90,1.83,1.73)
length(altura) #Tiene la misma longitud que peso

# Tambi�n se puede hacer operaciones con los vectores
imc <- peso/altura^2

# �Qu� ocurre si la longitud de los vectores son distintas?
altura2 <- c(1.59,1.75,1.85,1.60,1.57,1.90,1.83,1.73,1.85)
IMC <- peso/altura2 
length(peso)
length(altura2)
peso[1]
altura2[9]
60/(1.85)^2
IMC[9]
X/(1.85)^2=32.43243
# Despu�s de todo esto sigo sin saber que pasa cuando las longitudes no son iguales

#### Programaci�n en R ####

#Tipos de datos
  #numeric: n�mero real con doble precisi�n -> entero, fracci�n, notaci�n cient�fica
  #complex: n�meros complejos -> a+bi
  #character: cadena alfanum�ricas de texto.
  # logical: variables l�gicas -> TRUE FALSE

# NA: not available
x <- NA
x+1
y <- c(x,3,5,x)
mean(y) #Al tener un NA en sus elementos no puede calcular la media
mean(y, na.rm = T)# con rm.na=T se omite los NA

# Algunas operaciones con +Inf o -Inf 
# NaN's significa not a number

#### Matrices ####

# Una matriz es un vector num�rico de longitud 2, todos los elementos deben ser del mismo
# tipo. 
# Las funciones is.matrix() y as.matrix() fuerzan el car�cter de matriz a un objeto.

m1 <- matrix(1:12, ncol=3, byrow=T, dimnames=list(c("r1","r2","r3","r4"), 
                                                  c("c1","c2","c3")))
m1[1,1]#Seleccionar un elemento de una matriz
m1[,c(2,3)] #Selecionar las columnas 2 y 3
m1[,c(-1,-3),drop=F] #Mostrar todas las columnas menos la 1 y la 3. Si se omite drop=F, se
# visualiza la columna 2 como una fila.

sel <- matrix(rep(c(T,F),3),4,3) #Repite los valores de TRUE y FALSE en un matriz de orden 4,3
m1[sel] #Muestra los valores que conciden con TRUE

ncol(m1) #muestra el n�mero de columnas de una matriz
nrow(m1n)
t(m1) #Transpuesta de una matriz
cbind(1,m1) #Combina distintos vectores, por columnas, para crear una matriz
cbind(1:3,1:6,1:12)
#rbind() -> Combina distintos vectores, por filas, para crear una matriz
diag(m1) #Muestra la diagonal de una matriz (esta no tiene porque ser cuadrada)
help("col")
# No s� para que sirve las funciones col() y row().
apply(m1,1,sum) #Muestra la suma de los elementos de una misma fila de la matriz m1
apply(m1,2,mean) #Muestra la media de los elementos de una misma columna de la matriz m1

#### Estructuras de decisi�n ####

x <- runif(1,0,10) 
if (x>5) {
  y <- TRUE
} else {
  y <- FALSE
}
# El if tiene que ir en la siguiente fila. En este ejemplo x = 1.3172 y y = FALSE
# Pero eso cambia cada vez que ejecutamos en comando.

q <- runif(10,0,20) #10 es el n�mero de elementos,  0 - 20 es el rango
VectorBoolaono <- (q>=14) #El resultado es un vector logical
NumAprobados1 <- sum(VectorBoolaono)#NumAprobados es la suma 
NumAprobados2 <- length(VectorBoolaono[VectorBoolaono==T])#Otra forma de calcular el total
# de aprovados

which(VectorBoolaono)
if (NumAprobados1>0){
  q[which(VectorBoolaono)]
}
# which me muestra el orden de los elementos que cumplen con la condici�n (los TRUE)
# Ese if me muestra el valor de esos elementos que cumplen con la condici�n

help("which")
help("system.time")

system.time(sum(VectorBoolaono))
system.time(length(VectorBoolaono[VectorBoolaono==T])) #Al final no entiendo para que sirve jeje

x <- c("�Qu�","es","VERDAD?")
if("VERDAD?" %in% x){
  print("verdad se encontr� en IF")
} else if("VERDAD?" %in% x){
  print("VERDAD se encontr� en IF_ELSE")
} else{
  print("No se econtr� la VERDAD")
}
# Pta no entiendo
# Falta el ejemplo 4 de estructura de decisi�n. 

#### Estructura de repetici�n ####
#### Estructura while ####
#### Estructura repeat ####
#### Estructura NEXT / BREAK ####

#### Paquetes ####

# Una vez que se instal� un paquete se tiene que utlizar el comando library() para que ese 
# paquete empiece a funcionar.

install.packages("gclus") #Se instal� el paquete gclucs
library(gclus) #Esto es para empezar a utilizarlo
help(package = "gclus") #Esto es para visualizar el contenido del nuevo paquete instalado.

#### Funciones ####

es.par <- function(numero){
  residuo <- numero %% 2
  if (residuo==0)
  return(TRUE)
  return(FALSE)
}
# El nombre de la funci�n es "es.par", la funci�n se ejecuta sobre el objeto "numero".
# Dentro de las {} van las condiciones de la funci�n. El vector "residuo" es un "numero" 
# divisible por 2 if residuo es igual (==) a cero (0). es.par toma el valor de TRUE, caso
# contrario toma el valor FALSE

es.par(25) #FALSE
es.par(12482) #TRUE

es.impar <- function(n�mero){
  residuo <- n�mero %% 2
  if (residuo!=0)
    return(TRUE)
    return(FALSE)
}

es.impar(20)

es.divisible.por <- function(entero.grande,entero.peque�o){
  if(entero.grande %% entero.peque�o !=0)
    return(FALSE)
    return(TRUE)
}

es.divisible.por(40,10)
es.divisible.por(53,25) 

es.par <- function(num){
  es.divisible.por(num,2)
}

es.par(47)

#### Objetos en R ####
x <- c(2,4,6)
y <- c(3,7)

c(x,y)
x <- c(1:5)^2
x[-c(2,5)] #Los corchetes se utilizan para generar subvectores formado por alguna de las 
x[x>5] #de las coordenadas de un vector. 
which(x>15) #Me da el orden de los elementos dentro del vector que cumplen con la condici�n
# dentro de los par�ntesis

x <- matrix(5:8,3,4)
which(x>6) #El orden de los valores va de columna por columna de arriba a abajo.
y <- 1:3
z <- 4:6
cbind(y,z)
rbind(z,y)

x <- matrix(5:8, 3,4)
mean(x)#Saca la media de todos los valores de la matriz
apply(x,2,mean) #Esta funci�n aplica una misma operaci�n para cada una de las filas o
# columnas de una matriz, el primer elemento es la matriz, el segundo elemento es 1=fila
# 2=columna, el tercer elemento es la operaci�n.

# ////////////////////////////////////////////////////////////////////////////////////

# Operaciones m�s habituales en una matriz
x <- matrix(5:25, 4,4)
y <- matrix(3:45, 4,4)
x%*%y #Producto matricial
x*y #Producto de elemento por elemento
det(y) #determinante de una matriz
# Resolver sistemas de ecuaciones lineales:
  # (Ax=b) solve(A,b) = x(A)^-1*b

A <- matrix(c(1,2,3,4), ncol=2)
solve(A) # solve sirve para sacar la inversa de una matriz
eigen(A) #Autvalores de una matriz

# LISTAS: son vectores con objetos de distintos tipos. 

milista <- list(nombre= "Pepe", no.hijos=3, 
                edades.hijos = c(4,7,9))
str(milista) #Muestra los objetos en la lista y su tipo
milista$nombre #Me sale Pepe
milista[[1]] #Otra  foma de que salga pepe
milista$edades.hijos[2] #Para que salga el segundo elemento de la variable edades.hijos

milista[2:3]
milista[[2:3]]
 
# DATAFRAME

x <- 7:9
y <- c("a","b","c")
mi.fichero <- data.frame(edad=x,grupo=y) 
# Los dataframes son un tipo especial de lista, por eso se puede utilizar las mismas opciones
str(mi.fichero)
mi.fichero[[2]]
mi.fichero[2]
mi.fichero[2,]

# Factor
genero <- c("Masc", "Fem","Masc","Masc","Fem","Fem")
genero <- factor(genero)#Este comando otorga Un n�mero discreto a las categorias dentro 
# de una variable

as.integer(genero) #El comando factor le otorgo al elemento Masc el valor de 2 y a Fem el 
# valor de 1. Esto es por el orden alfab�tico. 

# FACTORES ORDINALES
eval.prof <- c(1,3,2,2,1,3) #Creamos un vector num�rico que registra los datos
eval.prof <- factor(eval.prof)#Covertimos el vector a un factor
levels(eval.prof) <- c("Malo","Regular","Bueno")#Asignamos los niveles al factor. Debe estar
# en un orden ascendente
eval.prof <- ordered(eval.prof) #Le endicamos que se trata de un factor ordinal

#### Exportaci�n e importaci�n de datos ####
# Creamos un dataframe
plantas <- c(15,16,18,18,12,12,25,10,15,22,14,14,16,4)
tratamiento <- c("s","s","s","s","s","s","s","s","s","s","n","n","n","n")
Datos <- data.frame(tratamiento, plantas)

# Exportamos los datos
write.csv(Datos, file="Prueba1.csv", row.names = F) #Elimino los n�mero de fila
# Recomendaci�n siempre usar row.names = F

write.table(Datos, file="Prueba2.txt", row.names = F)#Para exportarlo a un archivo tipo TXT

summary(Datos) #Resumen estad�stico de las variables del data frame

Sumario =summary(Datos)
capture.output(Sumario, file="Sumario.doc") #Se crea un archivo word del objeto sumario

# IMPORTAMOS DATOS

# read.table es para importar datos de tipo txt
x <- read.table("glucosa.txt", T)# Se pone el TRUE para que reconozca la primera fila como 
# nombre de las variables. 
class(x)
str(x)
x$glucosa
x$enfermera = factor(x$enfermera)

nubes <- read.table("cloud.txt")
class(nubes)
str(nubes)
ispc <- nubes$Ispc
Ispc <- ispc - mean(ispc)

# Se utiliza read.csv para importar archivos tipo csv 
Forbes2014 <- read.csv("Forbes2014.csv", header=T)
class(Forbes2014) #Es un data frame
head(Forbes2014) #Me muestralos seis primeros valores
str(Forbes2014) #2000 obs y 11 variables

library("rnoaa") #Esta es una libreria con paquetes sobre base de datos del clima

# WOLD BANK DEVELOPMENT INDICATORS
# El paquete WDI facilita la b�squeda y descarga de series de datos del WB
# Supongamos que nos interesa el PBI en ingl�s GDP
library(WDI) #Para decirle a R que queremos utilizar esta libreria
indicadores <- WDIsearch("gdp")#B�scamos todo lo que tiene que ver con GDP
class(indicadores) #Es una matriz
View(indicadores)
dim(indicadores)#493 filas y 2 columnas
indicadores[70,2]
# Supongamos que nos interesa el valor agregado de la agricultura como porcentaje del PBI.
# Es el indicador 70 
agricu.porc.pib <- WDI(country  = " all", indicator = indicadores[70,1], 
                       start = 2005, end = 2017)
class(agricu.porc.pib) #Es un dataframe
dim(agricu.porc.pib)

# Podemos hacer el llamado del indicador para Per�
peru <- agricu.porc.pib$NV.AGR.TOTL.ZS[agricu.porc.pib$country=="Peru"]
# Parece que esta vacio


#### ESTAD�STICA DESCRIPTIVA ####
# Cargamos la data
datos <- read.table("DataStat.txt", header=T) #Nunca te olivdes del .txt

# Calculamos las frecuencias relativas y absolutas de peso y nombre
tabla.peso <- table(datos$Peso)#Frecuencia absoluta. Tener en cuenta quer Peso es una 
# varaible num�rica
prop.table(datos$Peso) #Frecuencia relativa

tabla.nombre <- table(datos$Nombres)#Ning�n nombre se repite
prop.table(tabla.nombre)#Se tiene que crear el vector tabla.nombre para obtener las
# frecuencias relativas

# Se puede usar gr�ficos de sectores o gr�ficos de barras (pie(), barplot()) para las 
# variables cualitativas o variables cuantitativas de tipo discreto.
pie(table(datos$Edad), main = "Diagrama de sectores para la variable Edad") #Es muy 
# importante usar la funci�n table(), porque si no se utiliza se muestra un grafico de pie
# de las observaciones. Table me indica las frecuencias absolutas
barplot(table(datos$Edad), main="Diagrama de barras para la variable Edad")
barplot(table(datos$Sexo,datos$Edad), col = c(2,3))#Gr�fico de barras de dos variables
table(datos$Sexo,datos$Edad) #El gr�fico se entiende mejor con esta tabla

# En cuanto a las variables cuantitativas se suele emplear el histograma, el diagrama de 
# tallos y hojas; y el diagrama de de caja y bigotes. hist(), stem(), boxplot()

hist(table(datos$Edad), col="blue", main="Histograma para la variable Edad", 
     xlab="Edad", ylab="Frecuencia") #Siempre para tener las frecuencias se utiliza 
# la funci�n tale()
boxplot(datos$Edad, xlab="Edad", main="Boxplot para la variable Edad")

# Motor trend Car Road Test
mpg <- mtcars$mpg#mpg es millas por gal�n 
summary(mpg)
summary(mtcars)

# Medidas de posici�n

mean(datos$Peso, na.rm = F) #Medida de tendencia central - media
median(datos$Peso,na.rm = F) #Mediana
# R no tiene una funci�n para encontrar la moda, entoces debemos de crearla.
mode <- function(x){
  ux <- unique(x)
  ux[which.max(tabulate(match(x,ux)))]
}
mode(datos$Peso) 

quantile(datos$Peso, probs = c(0.25, 0.75))#Es para sacar los cuantiles, pero no estoy 
# seguro de como funciona. Esta es una medidad de tendencia no central. 

min(datos$Peso) #Otra medida de tendencia no central
max(datos$Peso) #Otra medida de tendencia no central

var(datos$Peso,na.rm = T) #Medidad de dispersi�n
sd(datos$Peso, na.rm = T) #desviaci�n est�ndar
IQR(datos$Peso, na.rm = T) #Rango intercuart�lico

# Medidas de forma
library(moments)
skewness(datos$Peso)# sirve para saber que tan asim�tica es la distribuci�n de una variable
# Un valor de cero significa que es perfectamente sim�trica. 
# Un valor postitivo indica que la mayoria de los datos se encuentra a la derecha del eje 
# simetr�a (que la cola va hacia la derecha). Y un valor negativo, lo contrario. 
barplot(table(datos$Peso))#con este gr�fico se pude visualizar la simetr�a. 
kurtosis(datos$Peso) #Una curtosis muy alta siginifica que tiene una forma de pico en el centro. 
kurtosis(datos$Peso) - 3 #Si es cero se le llama mesoc�rtica; si es positivo, lept�curtica
# y si es negatico, platic�rtica. 

# HACER EJERCIO DE LA P�GINA 115