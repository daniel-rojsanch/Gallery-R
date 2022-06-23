t <- seq(-pi, pi, length.out = 100)

x <- function(t) 3*sin(2*t)*cos(t)
y <- function(t) 3*sin(2*t)*sin(t)

plot(x(t), y(t), main = "r(t) = 3sin(2t)", xlab = "", ylab = "", lwd = 2, 
     xlim = c(-3,3), ylim = c(-3, 3))
grid()


