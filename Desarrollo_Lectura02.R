getwd()
rm(list = ls())

#### VECTORS #### 
a <- c(1,3,2)
# [1] 1 3 2

#### TRANSPOSE OF VECTORS #### 

transpuesta <- t(a)
transpuesta2 <- t(transpuesta)

# > transpuesta
#       [,1] [,2] [,3]
# [1,]    1    3    2

# > transpuesta2
#       [,1]
# [1,]    1
# [2,]    3
# [3,]    2

#### Multiplying a vector by a number #### 

7*a
# [1]  7 21 14

#### Sum of vectors ###
b<-c(2,8,9)

a+b
# [1]  3 11 11

### (Inner) product of vectors #### 
a*b
# [1]  2 24 18

sum(a*b)
# [1] 44

#### The length (norm) of a vector #### 
#square root (raiz cuadrada)
sqrt(sum(a * a))
# [1] 3.741657

#### The 0-vector and 1-vector #### 
#Repite el numero del primer argumento, las veces que se requiera
rep(0, 5)
# [1] 0 0 0 0 0

rep(1, 5)
# [1] 1 1 1 1 1

#### Orthogonal (perpendicular) vectors #### 
v1 <- c(1, 1)
v2 <- c(-1, 1)
sum(v1 * v2)
# [1] 0

#### Matrices #### 
A <- matrix(c(1, 3, 2, 2, 8, 9), ncol = 3)
# La matriz se llena con los datos columna por columna
A
#      [,1] [,2] [,3]
# [1,]    1    2    8
# [2,]    3    2    9


A2 <- matrix(c(1, 3, 2, 2, 8, 9), ncol = 3, byrow = T)
A2
# La matriz se llena con los datos fila por fila
#       [,1] [,2] [,3]
# [1,]    1    3    2
# [2,]    2    8    9

#### Multiplying a matrix with a number #### 
7 * A
#       [,1] [,2] [,3]
# [1,]    7   14   56
# [2,]   21   14   63

#### Transpose of matrices #### 
TransposeA <- t(A)
TransposeA
#       [,1] [,2]
# [1,]    1    3
# [2,]    2    2
# [3,]    8    9

#### Sum of matrices #### 
B <- matrix(c(5, 8, 3, 4, 2, 7), ncol = 3, byrow = T)
A + B
#       [,1] [,2] [,3]
# [1,]    6   10   11
# [2,]    7    4   16

#### Multiplication of a matrix and a vector #### 
#Multiplicacion matricial: Se multiplican la fila por la columna
A %*% a
#       [,1]
# [1,]   23
# [2,]   27

#Multiplicacion vectorial: se multiplica fila
A*a
#       [,1] [,2] [,3]
# [1,]    1    4   24
# [2,]    9    2   18

#### Multiplication of matrices #### 

A %*% B

#     [,1] [,2]
# [1,] 21 8
# [2,] 79 28
# [3,] 82 26

#### Some special matrices ####
# Llena la matriz de tantos ceros como por filas y columnas tenga la matriz

matrix(0, nrow = 2, ncol = 3)
#       [,1] [,2] [,3]
# [1,]    0    0    0
# [2,]    0    0    0

# Llena la matriz de tantos Unos como por filas y columnas tenga la matriz
matrix(1, nrow = 2, ncol = 3)
#       [,1] [,2] [,3]
# [1,]    1    1    1
# [2,]    1    1    1

# Matriz con un mismo elemento en su diagonal
diag(c(1,2, 3))
#       [,1] [,2] [,3]
# [1,]    1    0    0
# [2,]    0    2    0
# [3,]    0    0    3

#Llena la matriz de tantos Unos en su diagonal como la matriz lo permita
diag(1, 3)
#      [,1] [,2] [,3]
# [1,]    1    0    0
# [2,]    0    1    0
# [3,]    0    0    1

diag(diag(c(1, 2, 3)))
# [1] 1 2 3

diag(A)
# [1] 1 2

#### Inverse of matrices ###
#La Matriz I contiene en su diagonal 1 y el resto 0
#       [,1] [,2]
# [1,]    1    0
# [2,]    0    1
# donde: A %*% B = I

A <- matrix(c(1, 3, 2, 4), ncol = 2, byrow = T)
A
#       [,1] [,2]
# [1,]    1    3
# [2,]    2    4

B <- solve(A)
B
#       [,1] [,2]
# [1,]   -2  1.5
# [2,]    1 -0.5

A %*% B
#       [,1] [,2]
# [1,]    1    0
# [2,]    0    1

#### Solving systems of linear equations ####
 A <- matrix(c(1, 2, 3, 4), ncol = 2)
 b <- c(7, 10)
 x <- solve(A) %*% b
 x
 #      [,1]
 # [1,]    1
 # [2,]    2
 
 #### Details on inverse matrices ####
 
 # Inverting an n × n matrix#
 A <- matrix(c(2, 2, 3, 3, 5, 9, 5, 6, 7), ncol = 3)
 A
 #      [,1] [,2] [,3]
 # [1,]    2    3    5
 # [2,]    2    5    6
 # [3,]    3    9    7
 
 # Para encontrar B = A^-1, primero añadir a A la matriz identidad
 # llamar AB
 AB <- cbind(A, diag(c(1, 1, 1)))
 AB
 #      [,1] [,2] [,3] [,4] [,5] [,6]
 # [1,]    2    3    5    1    0    0
 # [2,]    2    5    6    0    1    0
 # [3,]    3    9    7    0    0    1
 
 # Hay que hacer un artificio u operación aritmética para obtener AB[1,1]=1
 # Luego restamos de la segunfa fila, una constante multiplicando a la primera para obtener AB[2,1]=0
 AB[1, ] <- AB[1, ]/AB[1, 1]
 AB[2, ] <- AB[2, ] - 2 * AB[1, ]
 AB[3, ] <- AB[3, ] - 3 * AB[1, ]
 AB
 #      [,1] [,2] [,3] [,4] [,5] [,6]
 # [1,]    1  1.5  2.5  0.5    0    0
 # [2,]    0  2.0  1.0 -1.0    1    0
 # [3,]    0  4.5 -0.5 -1.5    0    1
 
 # Lo siguiente hay que hacer un artificio u operación aritmética para obtener AB[2,2]=1
 # Repetimos la misma forma, restamos de la tercera fila, una constante multiplicando a la segunda para obtener AB[3,2]=0
 AB[2, ] <- AB[2, ]/AB[2, 2]
 AB[3, ] <- AB[3, ] - 4.5 * AB[2, ]
 AB
#       [,1] [,2]  [,3]  [,4]  [,5] [,6]
# [1,]    1  1.5  2.50  0.50  0.00    0
# [2,]    0  1.0  0.50 -0.50  0.50    0
# [3,]    0  0.0 -2.75  0.75 -2.25    1
 
 # Ahora, hay que hacer una operación aritmética para obtener AB[3,3]=1
 AB[3, ] <- AB[3, ]/AB[3, 3]
 AB
 #      [,1] [,2] [,3]       [,4]      [,5]       [,6]
 # [1,]    1  1.5  2.5  0.5000000 0.0000000  0.0000000
 # [2,]    0  1.0  0.5 -0.5000000 0.5000000  0.0000000
 # [3,]    0  0.0  1.0 -0.2727273 0.8181818 -0.3636364
 
 # Se obtuvo la matriz AB con ceros debajo de la principal diagonal
 # Se debe seguir operando para obtener ceros por encima de la principal diagonal
 AB[2, ] <- AB[2, ] - 0.5 * AB[3, ]
 AB[1, ] <- AB[1, ] - 2.5 * AB[3, ]
 AB
 #      [,1] [,2] [,3]       [,4]        [,5]       [,6]
 # [1,]    1  1.5    0  1.1818182 -2.04545455  0.9090909
 # [2,]    0  1.0    0 -0.3636364  0.09090909  0.1818182
 # [3,]    0  0.0    1 -0.2727273  0.81818182 -0.3636364
 
 # Por ultimo, para el presente ejemplo, se realiza una operacion aritmetica final
 AB[1, ] <- AB[1, ] - 1.5 * AB[2, ]
 AB
 #      [,1] [,2] [,3]       [,4]        [,5]       [,6]
 # [1,]    1    0    0  1.7272727 -2.18181818  0.6363636
 # [2,]    0    1    0 -0.3636364  0.09090909  0.1818182
 # [3,]    0    0    1 -0.2727273  0.81818182 -0.3636364
 
 # Se extrae las columnas 4, 5 y 6 para obtener la matriz deseada
 B <- AB[, 4:6]
 A %*% B
 
#### Least squares ####
x <- matrix(rbind(c(1, 1, 1, 1, 1),c(1.0, 2.0, 3.0, 4.0, 5.0)),ncol = 2, byrow = TRUE)
y <- c(3.7, 4.2, 4.9, 5.7, 6.0)
x

#donde solve es la inversa (^-1) y t es la transpuesta
beta.hat <- solve(t(x) %*% x) %*% t(x) %*% y
beta.hat
#       [,1]
# [1,] 3.07
# [2,] 0.61
  
  
  
  
  
  