a <- 10
b <- 28
c <- 8/3 
dt <- 0.02

dx <- function(v)  a*(v[2] - v[1])
dy <- function(v)  v[1]*(b - v[3]) - v[2]
dz <- function(v)  v[1]*v[2] - c*v[3] 

data <- data.frame(x = c(1, rep(0, 1000)), y = rep(0, 1001), z = rep(0, 1001)  )

dim(data)

for( i in 2:1001){
    data[i, ] <- c( dt*dx( data [ i-1 ,] ) + data[i -1, 1], 
                    dt*dy( data [ i-1 ,] ) + data[i -1, 2],
                    dt*dz( data [ i-1 ,] ) + data[i -1, 3]
                  )
}

plot(data[, 1:2], type = 'b', main = "Atractor de Lorenz", lwd = 3, col = rgb(.4, .4, .6, .9))
grid()

library(magick)

library(scatterplot3d)

s <- seq(10, 1000, by = 10)
s

png('lorenz%02d.png')
for( i in s){
    scatterplot3d(data[1:i, ], type = "b", lwd = 1, color = rgb(.4, .4, .6, .9), box = F  )
}
dev.off()

imgs <- list.files(getwd(), full.names = TRUE)
imgs <- imgs[ grep("png", imgs) ]
img_list <- lapply(imgs, image_read)
img_joined <- image_join(img_list)
img_animated <- image_animate(img_joined, fps = 10)
img_animated

image_write(img_animated, path = "tiger.gif", format = "gif")

file.remove(list.files(pattern=".png"))


