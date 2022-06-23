## Crear graficos usando el famoso conjunto de datos de iris
## autor: daniel-rojsanch

## Voy a empezar a seleccionar mis colores del tema buefy
## Con 5 colores bastara
col_buefy <-c("#7957d5",   ## purple
              "#ff3860",   ## red
              "#F4D03F",   ## yellow
              "#41b883",   ## green
              "#252334")   ## dark
## Es util una funcion que sirva para agregar trasparencia a un color 
add_transp <- function(colorHTML, transparency) paste(colorHTML, transparency, sep = "")

## svg("Img/scatter.svg")
par(bg = "#FDFEFE", fg = "#252334")
plot( iris$Petal.Width,iris$Sepal.Length, col = add_transp(col_buefy,"95")[iris$Species], main = "Ancho de Petalo vs Longitud de Sepalo", 
     col.main = "#7957d5",cex.main = 1.4, bty = "o",
     pch = 19, lwd = 9, xlab = "Ancho Petalo", ylab = "Longitud del Sepalo")

legend("bottomright", col = col_buefy, pch = 15, legend = unique(iris$Species), bty = "n", pt.cex = 2, title = "Especie")
grid()
## dev.off() 

## svg("Img/hist.svg")

par(bg = "#FDFEFE", fg = "#252334")

hist(iris$Sepal.Width, breaks = 35, col = col_buefy[2],
    ,main = "Histrograma Sepal Width", col.main = col_buefy[2], 
     cex.main = 1.6, prob = T, lwd = 3)

m <- mean(iris$Sepal.Width)
text(m + 0.5, 3, paste("mean:", m, sep = " "), col = col_buefy[1])
abline( v = m, col = col_buefy[1], lwd = 4, lty = "dotted")
grid()


## dev.off() 

## svg("Img/boxplot.svg")
par(bg = "#FDFEFE", fg = "#252334")

boxplot(iris$Petal.Length ~ iris$Species, main = "Boxplot Petal Width", 
       col = col_buefy[2], col.main = col_buefy[1], cex.main = 2, notch = T , boxwex = 0.5, 
        border = col_buefy[1], lwd = 3  )

grid()
## dev.off()


