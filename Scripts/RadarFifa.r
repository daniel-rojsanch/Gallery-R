library(fmsb)
library(dplyr)

fifa <- read.csv("data/FIFA2.csv")

head(fifa)

a  <- c( rgb(0.2,0.5,0.5,0.9), rgb(0.8,0.2,0.5,0.9) , rgb(0.7,0.5,0.1,0.9) )
b     <- c( rgb(0.2,0.5,0.5,0.4), rgb(0.8,0.2,0.5,0.4) , rgb(0.7,0.5,0.1,0.4) )

fif <- fifa |> select(Name, Stamina, Jumping, Agility, BallControl, Finishing, Vision, Aggression)

head(fif)

fif3 <- fif |> filter(Name %in% c("max", "min","K. Benzema", "D. Rojas","Iniesta")) 
# |>     select(Stamina, Jumping, Agility, BallControl, Finishing, Vision, Aggression)

fif3

# png("imagenes/radar.png")
radarchart(fif3[,2:8], pcol=a , pfcol=b , plwd=4 , plty=1)
legend("topright", legend = fif3[-c(1,2),]$Name, bty = "n", pch=20 , col=b
       , text.col = "grey", cex=1.2, pt.cex=3)
# dev.off()


