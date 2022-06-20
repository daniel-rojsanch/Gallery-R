## WordCloud

## Cargamos los paquetes 
library(wordcloud2)
library(tidyverse)
library(tidytext)

## Funcion que nos ayudara, indica si un elemento(s) no esta en un vector regresa true  
"%!in%" <- Negate("%in%")

## Cargar todas las letras del grupo The Beatles
lyrics <- readLines("data/Songs.txt")

## Dividir el texto en palabras
## Poner nuestro texto que contiene todas la canciones the Beatles en una tabla
## la primera columna sera el numero del parrafo y la segunda tendra el texto

lyrics_theBeatles <- tibble(n = seq_along(lyrics),
                  texto = lyrics)

word_theBeatles <- lyrics_theBeatles %>%
  unnest_tokens(palabra, texto)

## Palabras que se consideran "un tanto inecesarias"
ignore <- c("i","you","he","she","it","we","they",
  "to","the","a","an","at","my","me","your","in",
  "with","of","this","that","all","for", "and", "but", "i'm",
  "don't","go","got","do","where","can","is","are","am","he's","oh","be","like","were",
    "it's","no","fa","so","his","as","by","fa","_eot","been","_sot","yes","who's","those","that's",
    "then","her","on","get","out","you'll","you've","ba","la","let","we're","she's","have","over",
           "gonna","mine","could","ain't","some","him","if","not","should","can't","i've","i'll",
           "only","our","or","hey","down","else","from","how","about","more","till","did","just",
           "us","very","than","they're","still","their","such","i'd","cos","every","we'll","gotta",
           "never","ever","nah","da","doo","take","gone","had","really","much","who","make","ah",
            "any","what's","off","yeh","them","yourself","didn't","there's","would","has","away",
           "before","round","ooh","let's","into")

## quitar las palabras del vector ignore
chid <- word_theBeatles[word_theBeatles$palabra %!in% ignore,]

## crear tabla de frecuencia y hacer el grafico

data <- table(chid$palabra)
wordcloud2(data)


?wordcloud2


