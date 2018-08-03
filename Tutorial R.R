# Tutorial R
# Métodos de investigación cuantitativa
# Pablo De Tezanos-Pinto C.
# padeteza@uc.cl
# 2013

# Para este tutorial vamos a ocupar RStudio (disponbile en http://www.rstudio.com/),
# porque facilita un poco las cosas. En todo caso, los comandos funcionan exactamente
# igual en cualquier programa que ocupe R. 

# La idea es que lean esto directamente en RStudio para que puedan ir ejecutando
# los comandos a medida que avanzamos. Si bien no es necesario, puede ser una buena idea
# que vayan escribiendo en este mismo archivo sus comentarios, e intentando hacer
# los análisis por su cuenta con otras variables o con su propia base de datos.

# Configuración de RStudio.

# Depediendo de la configuración de su computador, puede que no alcancen a ver bien
# este texto. En ese caso, les recomiendo ajustar esta ventana con el mouse y cambiar
# el tamaño de la letra (en Tools -> Options -> Appearance). 

# También pueden aprovechar de cambiar otra configuración importante, en Tools ->
# Options -> General. "Save workspace to .RData on exit" dice "Ask". Debiea decir
# "Always". De esta forma, los objetos que vamos a ir creando van a quedar guardados
# para la próxima vez que abran el programa.


# Introducción a R

# R funciona escribiendo comandos en esta ventana -el editor- 
# o en la consola -la ventana justo abajo de ésta. En general, los comandos
# están compuestos de dos cosas: una función y un objeto. 

# las funciones son simplemente procesamientos que le pedimos a R,
# por ejemplo

2 + 2 # o 
mean(c(1,4,7,3,2)) # o incluso
help(mean)

# son ejemplos de funciones. Si están leyendo esto en RStudio,
# pueden ejecutar cada una de las funciones presionando "ctrl + Enter" 
# (en Mac, es "Command + Enter")
# en la línea correspondiente -por ejemplo en la línea 18 para calcular 2 + 2.
# El resultado de la función va a aparecer abajo, en la consola,
# con la excepción de "help()", que abre el archivo de ayuda de R,
# en este caso con información sobre la función "mean".

# La idea es que a medida que avanzan en este tutorial vayan ejecutando
# todas las funciones que estamos revisando.

# Normalmente, los resultados de las funciones son asignados a objetos,
# lo que permite seguir trabajando con esos resultados.
# Por ejemplo, en vez de 2 + 2, podemos escribir

resultado = 2+2 # (apreten "ctrl + Enter" para crear el objeto)

# Esto asigna el resultado de la función "2 + 2" a un objeto llamado "resultado"
# (?podríamos haber puesto cualquier nombre!)
# En la ventana de la derecha (Workspace), RStudio lista los objetos que hemos creado.
# La gracia es que ahora podemos seguir trabajando con este objeto:

resultado + 1

# es igual a 5, y si lo ejecutan el resultado va a aparecer en la consola.
# Si ejecutan simplemente "resultado", R entrega el valor asignado a este objeto.

resultado

# Los objetos pueden ser el resultado de cualquier operación, incluyendo
# los resultados de análisis estadísticos, bases de datos,
# tablas, listas y variables. 

# La función remove() elimina el objeto de su espacio de trabajo.

# Un detalle importante... en R las mayúsculas y minúsculas no son lo mismo.

Resultado # y 
Help(mean)

# van a generar un mensaje de error en la consola, porque no son lo mismo
# que "resultado" y "help(mean)".


# Librerías de R

# Una de las principales virtudes de R es que el código es abierto (open source),
# lo que permite que sea desarrollado y actualizado permanentemente y que distintas
# personas puedan extender este programa desarrollando "paquetes" o "librerías"
# para que R sea capaz de realizar nuevos análisis. 

# Por ejemplo, una librería que vamos a ocupar bastante es "psych", que 
# incluye una serie de funciones típicamente utilizadas en investigación en psicología.

# Antes de poder utilizar estas funciones en R, es necesario instalar "psych".
# Para esto, pueden ir a menú "Packages" en la ventana de abajo a la derecha -al 
# lado de "Help"- presionar el botón "Install Packages" y escribir psych en el 
# cuadro de diálogo. Esto va a descargar la librería e instalarla en su
# computador. Como siempre, también es posible hacer esto ocupando una función,
# en este caso:

install.packages("psych") # El progreso de la instalación aparece en la consola.

# Luego de que una librería ya está instalada, es necesario abrirla antes de poder ocupar
# sus funciones. Es una buena idea agregar las librerías utilizadas al comienzo de la 
# sintaxis. La función para cargar una librería instalada es

library(psych)

# Si abren el archivo de ayuda de esta librería,

help(psych)

# pueden ver una descripción de todas las nuevas funciones que ahora están disponibles.
# Además de funciones, esta librería incluye bases de datos que podemos ocupar como
# ejemplos. El comando

personalidad = epi.bfi 

# crea un nuevo objeto, una base de datos llamada "personalidad", ocupando los datos 
# disponibles en la librería psych (epi.bfi). La base de datos incluye 13 variables 
# de personalidad medidas en 231 personas.
# Esta información aparece en la ventana de la derecha (Workspace),
# donde se listan los objetos que hemos creado en nuestro espacio de trabajo. En RStudio,
# pueden hacer click en este objeto para ver los datos, o ejecutar

View(personalidad)

# Pueden ver más información sobre esta base de datos ejecutando

help(epi.bfi)

# Simplemente a modo de ejemplo, ahora podemos pedir un dispersiograma que muestra
# la relación entre extroversión y apertura a la experiencia. Este comando tiene dos 
# líneas (aunque podría haberlo escrito en una), por lo que antes de ejecutarlo 
# tienen que seleccionar ambas.

with (personalidad,
      plot(bfext,bfopen))

# El gráfico que aparece en "Plots" muestra que en general las personas más extrovertidas
# tienen también mayores puntajes de apertura a la experiencia.

# Antes de terminar esta sección me gustaría notar la importancia de escribir una
# sintaxis ordenada. Obviamente, a R le da exactamente lo mismo si la sintaxis está 
# ordenada o no. ?Pero R no es el único que tiene que leerla! Para los lectores humanos
# -para ustedes mismos y para las personas con quienes colaboran- es mucho más fácil
# entender una sintaxis ordenada:

# a) Escojan nombres amigables para las variables y los objetos.
#    Es decir, nombres que sean cortos pero que sean legibles y describan de qué 
#    estamos hablando. Por ejemplo, "bfext" es un nombre relativamente bueno (se refiere
#    al constructo extroversión en el contexto de una medición de personalidad 
#    "big five"); bffac3 (factor 3 de la medición big-five), en cambio, es malo. 
#    Aunque puedo imaginarme peores nombres. 
#
# b) Ocupen generosamente la opción de hacer comentarios en la sintaxis. Cualquier texto 
#    que sea precedido por un signo # es ignorado por R, pero puede ser tremendamente
#    útil para quien está leyendo y tratando de entender la sintaxis. 
#
# c) Indenten los comandos de forma que sean más fáciles de entender. El ejemplo del 
#    gráfico de dispersión que acabamos de hacer

with (personalidad,
      plot(bfext,bfopen))

#    está indentado porque esto facilita su interpretación. La primera línea indica que 
#    el comando será ejecutado usando la base de datos "personalidad", y la segunda línea
#    indica que se está pidiendo un gráfico que relacione las variables bfext y bfopen. 
#    Para comandos más complicados, con varias líneas, indentar hace una diferencia
#    mucho más grande. Por consenso, y porque ocupar "Tab" tiene comportamientos 
#    diferentes en distintos editores de texto, normalmente se ocupa la barra espacio 
#    para indentar.


# Explorando una base de datos

# Abrir una base de datos en R puede ser un proceso complicado, pero para eso está este
# tutorial. En verdad no tiene por qué ser complicado. Típicamente se ocupa Excel
# para digitar los datos de un estudio. Si bien es posible importar directamente
# los datos desde Excel, lo más fácil es guardar los datos en formato de texto, 
# porque es el formato preferido de R.

# Específicamente, les recomiendo guardar los datos en formato .csv (comma separated
# values). Todo lo que tienen que hacer es abrir el archivo Excel, poner "guardar como"
# y seleccionar este formato. En este tutorial incluye una base de datos en Excel llamada
# alumnos2012.xlsx, que tiene los datos de un estudio hecho con los alumnos del curso 
# durante el año 2012, en que grupos de alumnos generaron varias preguntas para medir 
# distintos constructos. Incluye temas tan diversos como las actitudes hacia el aborto,
# hacia el Starbucks en la universidad y el horóscopo de cada alumno. El archivo
# alumnos2012.pdf contiene más información sobre esta base de datos, que vamos a ocupar
# como ejemplo a lo largo de este tutorial. 

# Abran los datos en Excel, y guardénla como alumnos2012.csv (valores separados por
# comas) en la misma carpeta donde está este archivo (Tutorial R.R). Si bien es posible
# abrir el archivo ocupando comandos, esto requiere poner la dirección completa
# del archivo o cambiar el directorio de trabajo, y R a veces se confunde cuando los 
# nombres de las carpetas tienen espacios o acentos. Por lo tanto, la mejor opción es 
# abrirlo ocupando un menú. Pueden hacer esto en la ventana de "Workspace" presionando
# el botón "Import Dataset", o pueden ocupar el siguiente comando para abrir un cuadro de 
# diálogo. Les recomiendo esta segunda opción, porque así queda un registro
# de la necesidad de abrir una base de datos para continuar. El comando

estudio2012 = read.csv(file.choose(),
                       header = TRUE) # abrir archivo alumnos2012.csv

# abre un cuadro de diálogo donde pueden seleccionar el archivo alumnos2012.csv. Les
# recomiendo que siempre pongan un comentario indicando el nombre del archivo que hay 
# que abrir -en beneficio de sus colaboradores y de ustedes mismos.

# Dependiendo de la configuración del computador, es posible que el archivo
# está separado por ; en vez de comas (porque en español se ocupa coma para
# indicar decimales). En este caso, hay que explicitar el separador.

estudio2012 = read.csv(file.choose(), # abrir archivo alumnos2012.csv
                       header = TRUE,
                       sep=";")       # Ocupar ; como separador

# En detalle, este comando hace lo siguiente:

estudio2012 =                # crea un objeto llamado estudio2012
  read.csv(                # lee un archivo .csv
    file.choose(),       # abre un cuadro de diálogo para elegir un archivo
    header = TRUE        # indica que la primera línea del archivo
  )                        # incluye los nombres de las variables.

# Si todo salió bien, ahora tienen un objeto llamado "estudio2012" en su espacio
# de trabajo. Pueden hacer click sobre este objeto para mirar los datos. El estudio
# incluye 84 variables medidas en 112 alumnos.

# Un detalle técnico...

# Si se fijan, el archivo se llamaba "alumnos2012" pero el objeto que creamos se llama
# "estudio2012". Esto es precisamente para que quede claro que el archivo con los datos
# y la base de datos que creamos en R son cosas distintas. Pueden modificar todo lo que
# quieran el objeto de R, y eso no va a cambiar el archivo original con los datos. ?Esto
# es tremendamente bueno para su paz mental! En caso de cualquier problema, simplemente
# pueden volver a cargar los datos originales.

# El comando

names(estudio2012)

# nos entrega los nombres de todas las variables incluidas en la base de datos.
# y el comando

head(estudio2012)

# muestra en la consola las 6 primeras líneas de la base de datos. Esto cumple la
# misma función que hacer abrir el objeto en RStudio. A veces simplemente
# necesitamos mirar los datos con que estamos trabajando. Noten que hay algunos casos
# en que las personas no contestaron algunas preguntas (el participante 52,
# por ejemplo). En R, estos valores son codificados como NA, lo que es importante
# para algunas funciones.

estudio2012[52,] # imprime en la consola los datos de la fila 52

# Ok, una de las primeras cosas que debiéramos hacer cuando abrimos una base de datos
# es revisar los descriptivos para cada una de las variables. Más allá de ser una primera
# mirada a los resultados del estudio, esto permite identificar cualquier error en la 
# digitación o en la construcción de la base de datos.

describe(estudio2012)

# es una función de la librería "psych" que entrega los descriptivos de cada una de las
# variables. En cuanto a la calidad de la base de datos lo más importante es revisar el n, 
# que nos indica la cantidad de personas que contestaron cada pregunta (un n de cero en
# una pregunta probablemente refleja un error en la creación de la base de datos) y 
# el rango de respuesta (min y max). Las preguntas del cuestionario tenían un rango de 
# 1 a 7; claramente habría un error en la base de datos si en alguna pregunta el rango
# fuera distinto (de 1 a 34, por ejemplo).

# Además de esto, describe() entrega una buena cantidad de información descriptiva. El
# promedio, la mediana, la desviación estándar y el grado de asimetría (skew). 

# Algunas de las variables tienen un * junto a su nombre. Esto significa
# que son variables categóricas (porque están codificadas como texto en la base de datos).
# La variable sitsent (situación sentimental) incluía tres opciones,

table(estudio2012$sitsent)

# El promedio de esta variable no tiene ningún sentido. R simplemente asigna un número a
# cada categoría y la función describe() promedia todas las variables, aunque sean 
# categóricas. 

# Descriptivos. 

# La información descriptiva entregada con el comando describe() es más que suficiente
# para tener una buena idea del comportamiento de las variables. En general,
# vamos a estar interesados en el promedio (mean), la mediana (median) y la desviación
# estándar (sd). Todos estos indicadores pueden ser solicitados con su propio comando.

# En la mayoría de las situaciones vamos a querer referirnos a variables específicas,
# no a la base de datos completa como hicimos con describe(estudio2012). Como en R
# podemos tener un número ilimitado de bases de datos en nuestro espacio de trabajo,
# es necesario indicar tanto el nombre de la variable como la base de datos a la 
# que pertenece. Hay dos formas principales para hacer esto, y pueden ocupar 
# cualquiera de las dos dependiendo de lo que sea más fácil para cada situación. 

# La primera es ocupar el signo $ para indicar base de datos y el nombre de la variable:

mean(estudio2012$insom1, na.rm=TRUE)

# En este comando, se pide el promedio de la variable "insom1" en la base de datos 
# "estudio2012". La función mean() requiere especificar qué hacer con los datos
# perdidos (la gente que no contesta). na.rm=TRUE simplemente le dice a R que ignore
# a estos participantes para calcular el promedio.

# La otra forma, que también ocupamos hace un rato, es con el comando with(). 

help(with)

# Esto es especialmente útil cuando queremos ocupar varias variables. El comando

insomnio = with(estudio2012,
                data.frame(insom1, insom2, insom3, insom4, insom5))

# crea una nueva base de datos -ocupando la función data.frame()- que sólo tiene la
# información de los ítems de insomnio. Esto permite hacer análisis con la escala
# completa sin tener que volver a escribir cada variable.

describe(insomnio)

# Otras funciones descriptivas son:

sd(estudio2012$insom1, na.rm=TRUE)
median(estudio2012$insom1, na.rm=TRUE)

# y summary(), que es más o menos equivalente a describe() pero no requiere
# cargar una librería.

summary(insomnio)

# Tablas y gráficos de frecuencia.

# Además de indicadores descriptivos básicos como el promedio y la desviación estándar,
# muchas veces nos interesa revisar la distribución de una variable. El item insom1 es 
# un buen indicador general de insomnio: "Generalmente me cuesta conciliar el sueño 
# o despierto muchas veces en la noche". A partir de los descriptivos, 

describe(estudio2012$insom1)

# podemos observar que los niveles de insomnio están aproximadamente en el punto medio 
# de la escala (M = 3.44), que hay una variación considerable entre los participantes
# (SD = 2.03), y que la distribución es algo asimétrica: la mayoría de los participantes
# están a la izquierda de la distribución (Skew = .46). Esto es visible también
# a partir de una simple tabla de frecuencia:

table(estudio2012$insom1)

help(table)

# En esta tabla, queda claro que hay una importante variación en el grado de acuerdo
# con este ítem, aunque hay más personas en desacuerdo que de acuerdo. En vez de mirar
# un montón de números, podemos pedirle a R que nos dibuje un gráfico. El comando

barplot(table(estudio2012$insom1))

# dibuja un gráfico de barras con la información de la tabla que pedimos antes. 
# Además de los datos para el gráfico, podemos agregar un título y otras cosas.
# Esto no es necesario si están revisando el gráfico para ustedes mismos, 
# para tener una idea decómo se comportan los datos, pero si es necesario cuando quieren 
# mostrar estos resultados en un informe, artículo o presentación. 

# Abajo vamos a pedir el mismo gráfico, pero agregando opciones para mejorar 
# la presentación:

barplot(table(estudio2012$insom1),      # datos del gráfico
        main="Insomnio en estudiantes", # título principal
        xlab="Grado de acuerdo",        # etiqueta eje horizontal
        ylab="Frecuencia",              # etiqueta eje vertical
        col="lightblue"                 # cambio de color. ver colors() 
)

# Estas opciones están disponibles, con la misma sintaxis, para todo tipo de gráficos.
# Si están ocupando RStudio, pueden guardar el gráfico como imagen, pdf, o simplemente
# copiarlo en la memoria (para pegarlo en Word, por ejemplo) seleccionando la opción
# correspondiente en el botón "Export". Si apretan el botón "Zoom", el gráfico
# se abre en una nueva ventana, lo que puede ser útil para cambiar sus dimensiones.
# En ese caso hay que hacer click derecho para copiarlo o exportarlo.

# Cuando las variables son continuas, hacer una tabla de frecuencia es poco práctico
# y no entrega información útil. Consideremos por ejemplo el promedio de todos los ítems
# de insomnio:

estudio2012$insom = with(insomnio,
                         (insom1 + insom2 + insom3 + insom4 + insom5)/5)

describe(estudio2012$insom)

# Esta escala sigue siendo de 1 a 7, pero ahora tiene valores relativamente continuos. 
# Por este motivo, hacer una tabla de frecuencia es una mala idea:

table(estudio2012$insom)

# La solución es hacer un histograma. Los histogramas grafican una tabla de intervalos, 
# donde queremos saber cuántas personas tienen puntajes entre 1 y 2, 2 y 3, etc. 
# El comando es simplemente:

hist(estudio2012$insom)

# Al igual que en los gráficos anteriores, podemos agregar opciones para mejorar la 
# presentación.

hist(estudio2012$insom,                        # datos del gráfico
     main="Histograma escala de Insomnio",      # título principal
     xlab="Grado de acuerdo",                   # etiqueta eje horizontal
     ylab="Frecuencia",                         # etiqueta eje vertical
     col="lightblue"                            # cambio de color
)

# ?Por qué no ocupamos desde un comienzo his() para hacer el gráfico de frecuenciasí
# Los histogramas están diseñados para variables continuas (por eso las barras están
# juntas), y desgraciadamente R se confunde cuando le ponemos una variable discreta,
# como el primer item de la escala.

hist(estudio2012$insom1)

# dibuja una situación muy distinta, y menos preocupante, que la situación real:

barplot(table(estudio2012$insom1))

# De todas formas, esto es un error con la función hist(), que está sumando a las
# personas que marcan 1 y las que marcan 2 en la primera barra. Espero que lo solucionen
# pronto. La función truehist() de la librería MASS no tiene este problema.
# El punto que hay que recordar es que los histogramas son para variables continuas,
# no para variables discretas.


# Medidas de tendencia central

# Podemos ocupar el mismo comando que ocupamos antes (barplot) para hacer un gráfico 
# con los promedios de múltiples variables. Por ejemplo,

colMeans(insomnio, na.rm=TRUE) # imprime una tabla con los promedios de los ítems

barplot(colMeans(insomnio, na.rm=TRUE)) # grafica esta tabla

# Simplemente, la función barplot() saca los datos de una tabla de promedios
# en vez de una tabla de frecuencia.

# Abajo les copio un comando para el mismo gráfico, pero con mejor presentación.
# Como ven, indentar y poner comentarios es más útil cuando los comandos son más largos.

barplot(colMeans(insomnio, na.rm=TRUE),
        main="Promedios itemes escala insomnio",  # título principal
        
        ylab="Grado de acuerdo",                  # etiqueta eje vertical
        
        names=c("Item 1", "Item 2", 
                "Item 3", "Item 4", "Item 5"),     # Nombres para las variables
        
        col=rainbow(20, alpha = .6),               # R incluye también paletas de color. 
        # pueden ejecutar help(rainbow)
        # para más información
        
        ylim=c(1,7),                               # la pregunta era de 1 a 7.
        xpd=F,                                  # Es necesario para que las barras
        # no comiencen en el valor 0
)


# Si bien muchas veces basta con graficar los promedios, también es bueno incluir más 
# información -dispersión y asimetría, por ejemplo. Una forma simple de hacerlo es 
# con un box-plot. R tiene un comando especialmente para este tipo de gráficos: 

boxplot(insomnio)

# Simple, ?cierto? Abajo lo copio con algunas opciones para mejorar la presentación.

boxplot(insomnio, 
        main="Itemes escala insomnio",
        ylab="Grado de acuerdo",
        names=c("Item 1", "Item 2", "Item 3", "Item 4", "Item 5"),
        col=rainbow(5, alpha = .3)
)

# Si no hubiéramos hecho la base de datos con los ítems de insomnio, el comando
# sería un poco más largo. Abajo está hecho para los ítems de ansiedad ante las 
# evaluaciones:

with(estudio2012, 
     boxplot(data.frame(ansev1, ansev2, ansev3, ansev4, ansev5),
             main="Ansiedad ante evaluaciones",
             sub="Frecuencia de distintas conductas en periodos de evaluacion",
             ylab="Frecuencia conductas",
             names=c("Dificultad dormir", "Despertar frecuente", 
                     "Irritable", "Dolores", "Incapacidad de desconectarse"),
             col=rainbow(5, alpha = .3))
)

# Esta vez pusimos nombres descriptivos a los distintos ítems, por lo que probablemente
# es necesario abrir el gráfico en una nueva ventana para verlos bien (apretando Zoom).

# Comparando distintos grupos.

# La base de datos alumnos2012.csv que importamos incluía una serie de variables
# que identifican distintos grupos a los que pertenecen las personas. Por ejemplo,
# si son hombres o mujeres, o su situación sentimental.

table(estudio2012$genero)
table(estudio2012$sitsent)

# Estas variables están codificadas como texto, y en los casos en que alguien no contestá
# estas preguntas (3 personas no indicaron su género y 1 persona no indicó su situación
# sentimental) los datos tienen simplemente una celda vacía. Además, R (al menos en mi
# computador) no reacciona muy bien a los acentos. 

# Todo esto significa que tenemos que hacer algo de trabajo antes de poder ocupar estas
# variables para nuestros análisis. Por ejemplo, si hacemos un gráfico de barras para
# situación sentimental, nos encontramos con un par de problemas:

barplot(table(estudio2012$sitsent))

# 1. Hay una barra extra con la persona que prefirió no contestar esta pregunta.
# 2. El acento de "relación" es reemplazado por un punto en el gráfico.

# Las variables categóricas son importantes, y las vamos a ocupar para una serie de
# análisis. Vale la pena hacer un procesamiento preliminar de los datos.

# El siguiente comando crea una nueva variable -sitsentf- en la base de datos estudio2012
# donde se seleccionan solamente los grupos que nos interesan.

# En mi computador, "relación" aparece en la base de datos como "relaci\227n". 
# Puede que en su computador el acento aparezca sin problemas, o salga otra cosa: 
# "relaci-n", por ejemplo. Pueden revisar con el comando

levels(estudio2012$sitsent) 

# y ajustar la sintaxis en base a eso.

estudio2012$sitsentf = factor(estudio2012$sitsent,
                              
                              # Esto crea una variable nueva a partir de sitsent,
                              # considerándola como un factor (una variable categórica)
                              # por eso le puse el nombre sitsentf
                              
                              levels=c("En una relación",
                                       "Es complicado", "Soltero/a"),
                              
                              # Esto selecciona los niveles que nos interesan, es decir,
                              # sin incluir las personas que no contestaron.
                              # Noten que hay que escribir el texto tal cual como 
                              # aparece en R ("relación" en mi computador).
                              
                              labels=c("En una relacion",
                                       "Es complicado", "Soltero/a"))

# Por último, el argumento labels define las etiquetas
# para las categorías, lo que nos permite sacar el
# acento que producía problemas.

# El comando

estudio2012$sitsentf

# imprime todos los datos de esta variable en la consola. El participante
# 52 ahora tiene <NA> en vez de "". Cuando pedimos la tabla, ahora ya no incluye a este
# participante:

table(estudio2012$sitsentf)

# La base de datos,

names(estudio2012)

# ahora incluye al final una nueva variable "sitsentf". Esta variable está en la base de
# datos estudio2012 que tenemos en nuestro espacio de trabajo. No en el archivo 
# alumnos2012.

# Vamos a hacer el mismo procesamiento con genero

table(estudio2012$genero)

estudio2012$generof = factor(estudio2012$genero,
                             levels=c("Femenino","Masculino"),
                             labels=c("Mujer","Hombre"))

table(estudio2012$generof)

# y con orientación política

table(estudio2012$orienpol)

estudio2012$orienpolf = factor(estudio2012$orienpol,
                               
                               # Al seleccionar los niveles, podemos hacer varias cosas
                               # con esta variable: ordenarlos de izquierda a derecha,
                               # omitir los independientes y los que dicen "ninguna",
                               # y omitir a los que no contestaron. Todos estos van a 
                               # quedar como NA. (por supuesto, para otros análisis
                               # podríamos querer mantener a los independientes y a los
                               # que no se identifican)
                               
                               levels=c("Izquierda","Centro Izquierda","Centro",
                                        "Centro Derecha","Derecha"))

# Dado que los niveles tienen buenos nombres,
# no es necesario agregar etiquetas.

table(estudio2012$orienpolf)


# Descripción de la muestra.

# Una de las cosas más simples que podemos querer hacer con este tipo de variables
# es describir la cantidad de personas que pertenecen a cada grupo, por ejemplo 
# a través de gráficos de barra


barplot(table(estudio2012$orienpolf),
        col=rainbow(30, alpha=.6))

# Si quieren hacer un gráfico de torta, el comando es pie()

pie(table(estudio2012$sitsentf),
    main="Situacion sentimental estudiantes 2012",
    col=c("powderblue", "whitesmoke","skyblue2"),
    radius = 1)

# También es común querer cruzar dos tablas de frecuencia (crosstabs),
# lo que se hace simplemente agregando otra variable al comando table():

table(estudio2012$sitsentf,estudio2012$generof)

# ?Cómo podemos graficar esto? Una buena opción es ocupar nuevamente un gráfico
# de barras.

barplot(table(estudio2012$sitsentf, estudio2012$generof),
        legend=TRUE, # agrega automáticamente una leyenda
        col=heat.colors(3, alpha=.6)
)

# Para hacer que cada grupo tenga una barra, hay que ocupar el argumento "beside".

barplot(table(estudio2012$sitsentf, estudio2012$generof),
        legend=TRUE, 
        col=heat.colors(3, alpha=.6),
        beside=TRUE  # esta opción hace que cada grupo tenga una barra
)

# Por último, es común querer comparar los grupos en una o más variables continuas,
# como querer ver los niveles de insomnio separado por hombres y mujeres. 
# En un boxplot, podemos ocupar el signo ~ para indicar que se quiere separar por grupos.
# En general, ~ significa "predicho por" en R. (En mi computador, tengo que presionar 
# alt+? para escribir este tilde, pero eso va a depender de la distribución
# de su teclado).

boxplot(insom1~sitsentf, data=estudio2012,
        main="Problemas de insomnio en relaciones complicadas",
        ylab="Insomnio",
        col=heat.colors(3,alpha=.6))

# Aunque creo que comparar grupos a partir de boxplots es mejor, también pueden hacer
# un gráfico de barras con los promedios. La función tapply() es ideal para obtener 
# los promedios de distintos grupos. 


# El formato de esta función es poner primero la variable dependiente, después el 
# factor que define los grupos y después la función que se quiere ocupar. El resultado
# de tapply() puede ser entregado directamente a barplot().

barplot(tapply(estudio2012$insom1, estudio2012$sitsentf, mean, na.rm=TRUE))

# Abajo lo copio mejorando la presentación.

barplot(tapply(estudio2012$insom1, estudio2012$sitsentf, mean, na.rm=TRUE),
        main="Problemas de insomnio en relaciones complicadas",
        ylab="Insomnio",
        col=heat.colors(3,alpha=.6),
        ylim=c(1,7),                               # la pregunta era de 1 a 7.
        xpd=F)                                  # Es necesario para que las barras
# no comiencen en el valor 0

# Finalmente, la función tapply() también permite ocupar dos o más factores para definir
# los grupos. Todo lo que hay que hacer es ocupar el comando list() para hacer una lista
# con los factores a ocupar. El comando de abajo hace una tabla con los promedios de
# insomnio según situación sentimental, separando además hombres de mujeres.

tapply(estudio2012$insom1, 
       list(estudio2012$sitsentf, estudio2012$generof), mean, na.rm=TRUE)

# Esta vez vamos a asignar esta tabla a un objeto para simplificar los comandos
# siguientes. Como es un objeto temporal, le vamos a poner "x". Si tuviera un uso 
# más permanente sería mejor ponerle un nombre más descriptivo.

x = tapply(estudio2012$insom1, 
           list(estudio2012$sitsentf, estudio2012$generof), mean, na.rm=TRUE)

# Gráfico sin mayores opciones de formato.

barplot(x,
        beside=TRUE)

# Gráfico formateado para documentos, presentaciones, etc.

barplot(x,
        legend=TRUE,
        args.legend=list(x=8, y=-1, horiz=TRUE),
        # ?Sin este argumento la leyenda tapa los datos!
        
        beside=TRUE,
        main="Insomnio segun genero y situacion sentimental",
        ylab="Insomnio",
        col=heat.colors(3,alpha=.6),
        ylim=c(1,7), 
        xpd=F)

# Especialmente al reportar experimentos, es común hacer un gráfico de líneas
# para reportar interacciones entre dos factores. R tiene un comando para esto,
# interaction.plot(factor eje x, factor con diferentes líneas, variable dependiente).

with(estudio2012,
     interaction.plot(generof, sitsentf, insom1))

# Nuevamente, podemos mejorar la presentación del gráfico agregando más parámetros:

with(estudio2012,
     interaction.plot(generof, sitsentf, insom1,
                      ylim=c(1,7),
                      lty = 1,
                      col=c("red","blue","darkgreen"),
                      main="Insomnio segun genero y situacion sentimental",
                      ylab="Insomnio",
                      xlab=""))

# Desgraciadamente esta función no reacciona bien a NAs en la variable dependiente.
# Por ejemplo, el cuarto ítem de desconfianza en la pareja, "Si mi pareja reacciona
# de manera fría, tiendo a pensar que tiene un problema conmigo" tiene 3 personas
# que no contestaron.

summary(estudio2012$desconf4)

# Si hacemos el gráfico tal como lo hicimos antes, nos van a faltar varias líneas

with(estudio2012,
     interaction.plot(generof, sitsentf, desconf4,
                      ylim=c(1,7)))

# La solución es explicitar que la fórmula para el promedio tiene que ignorar los
# datos perdidos,

with(estudio2012,
     interaction.plot(generof, sitsentf, desconf4,
                      ylim=c(1,7),
                      
                      # agregando el siguiente argumento:
                      fun=function(x) mean(x, na.rm=TRUE)))

# Pareciera que los hombres, pero no las mujeres, tienden a tener mayor desconfianza
# o inseguridad en relaciones complicadas (recuerden que hay solo 4 participantes hombres
# que reportan su situación sentimental como complicada, ?no se tomen muy en serio estos
# resultados!)

table(estudio2012$sitsentf, estudio2012$generof)


# Relaciones entre variables continuas.

# Es tremendamente común el psicología querer relacionar distintas
# variables continuas a partir de dispersiogramas, como ya hicimos al comienzo de
# este tutorial con los niveles de extroversión y de apertura a la experiencia. 
# Revisemos la relación entre insomnio y ansiedad en periodo de evaluaciones.

# Primero tenemos que calcular el promedio de la escala. Dado que vamos a relacionarla
# con los niveles de insomnio, prefiero no ocupar los ítems que se refieren a 
# problemas de dormir en periodos de evaluaciones.

estudio2012$ansev = with(estudio2012,
                         (ansev3+ansev4+ansev5)/3)

# Ahora podemos pedir un dispersiograma

plot(estudio2012$ansev, estudio2012$insom,
     main="Relacion entre ansiedad ante evaluaciones e insomnio",
     col="cadetblue4",
     xlab="Ansiedad ante evaluaciones",
     ylab="Insomnio"
)

# Como se observa en el gráfico, hay una correlación positiva entre las dos
# variables. Quienes reportan más ansiedad en periodos de evaluaciones reportan
# también mayores niveles de insomnio.

# Para obtener el coeficiente de correlación entre estas variables pueden ocupar 
# la función cor().

cor(estudio2012$ansev, estudio2012$insom,
    use = "pairwise.complete.obs" # necesario cuando hay NAs
)

# Este tipo de gráficos permite además agregar más información. Por ejemplo, poner 
# una línea que indica la relación lineal entre las variables:

abline(lm(estudio2012$insom~estudio2012$ansev),
       col="firebrick")

# Para hacer esto más complicado, la función lm() ocupa un orden distinto para las 
# variables x e y. El comando plot tiene el formato (x, y), mientras que el 
# comando lm() tiene el formato y~x (y predicho por x).

# Otra opción es dibujar una linea que se ajuste a los datos, pero no forzar 
# que sea una linea recta. supsmu() es una buena función para hacer esto.

lines(supsmu(estudio2012$ansev, estudio2012$insom,
             bass=2), # de 0 a 10, controla el nivel de "smoothness" de la linea
      col="royalblue1")

# A veces nos interesa revisar la relación de dos variables continuas, pero separando
# por distintos grupos. Una forma simple de hacer esto es con la librería lattice. 

install.packages("lattice") # Una vez que ya lo tienen instalado no es necesario
# ejecutar nuevamente este comando.

library(lattice) 

# La función xyplot() de lattice funciona con la misma sintaxis que lm(): y~x, 
# pero además permite separar por grupos ocupando el signo | (en mi computador,
# esto es alt+1).

xyplot(insom~ansev|generof, estudio2012)

# La librería lattice tiene una gran cantidad de comandos para hacer gráficos,
# que pueden explorar libremente. En general opté por ocupar librerías solamente 
# cuando facilita substancialmente las cosas. Ahora vamos a ver una opción para 
# visualizar estos datos sin ocupar lattice.

# En vez de hacer gráficos por separado, podemos hacer que los círculos en el 
# dispersiograma tengan un color distinto en base al grupo al que pertenece la persona.

# Hacer el gráfico por separado para hombres y mujeres es más que suficiente,
# pero al explicarcómo incluir ambos en el mismo gráfico vamos a aprovechar de explicar
# algunas funciones más fundamentales de R y ejemplificarcómo podemos usar 
# las funciones de forma creativa para llegar al resultado que queremos.

# Primero tenemos que hacer un objeto con los colores que vamos a ocupar:

colores = c("red","blue")

# Esto simplemente crea un objeto con una lista de dos colores. La función c(), 
# que ya habíamos ocupado más arriba sin explicar, simplemente concatena los elementos
# para que queden en una lista. 

colores

# En vez de ocupar rainbow() o repetir los colores que se van a ocupar en cada gráfico,
# cuando están haciendo un informe puede ser útil hacer una paleta de colores 
# personalizada ocupando esta función. Esto permite además cambiar los colores de 
# todos los gráficos sin tener que modificar cada uno de los comandos. Basta reemplazar
# los colores en el objeto que crearon.

# Lo que tenemos ahora es una lista en que el elemento 1 es "red" y el elemento 2
# es "blue". Los factores (las variables categóricas) también están codificados
# como una lista. La función

levels(estudio2012$generof)

# muestra los valores que puede tener la variable generof. El primer elemento es "Mujer",
# y el segundo elemento es "Hombre".

# La gracia es que ahora podemos reemplazar "Mujer" y "Hombre" por "red" o "blue" tal
# como aparecen en el objeto "colores":

colores[estudio2012$generof] # obtiene los datos de "generof", 
# ocupando los elementos del objeto "colores"

# Ok, no importa por qué funciona. Lo que importa es que podemos hacer el siguiente
# gráfico de dispersión:

plot(estudio2012$ansev, estudio2012$insom,
     main="Relacion entre ansiedad ante evaluaciones e insomnio",
     
     col=colores[estudio2012$generof],             # Magia
     
     xlab="Ansiedad ante evaluaciones",
     ylab="Insomnio"
)

# También podemos agregar una leyenda con los colores:

legend("topleft",                       # Ubicación de la leyenda
       levels(estudio2012$generof),     # Texto. 
       # Podríamos haber escrito c("Mujer","Hombre")
       col = colores,                   # Los colores asociados con el texto
       pch=19                           # El símbolo a ocupar en la leyenda
)

# También podemos incluir una línea para cada grupo. Esto requiere ocupar solamente
# a los participantes hombres o mujeres según corresponda. 

# Al comienzo de este tutorial, vimos los datos del participante 52 con el comando

estudio2012[52,]

# En este caso, lo que está entre corchetes es un subgrupo de la base de datos, 
# con la forma: datos[filas, columnas]. Si quisiéramos ver los datos de la segunda
# columna (la situación sentimental), podemos ejecutar

estudio2012[,2]

# Noten que ahora el número está después de la coma, porque se refiere a una columna.
# Si quisiéramos saber la situación sentimental del participante 86, tenemos que
# ejecutar

estudio2012[86,2]

# Pero los números de fila y columna también pueden ser expresiones lógicas,
# lo que nos permite seleccionar parte de la base de datos según alguna condición, 
# por ejemplo que los participantes sean hombres:

estudio2012[estudio2012$generof=="Hombre", ]

# Noten que la condición está puesta antes de la coma, queremos seleccionar las filas
# donde el valor de generof es "Hombre". El uso de "==" también es importante. 
# Esto es para distinguirlo de "=", que se ocupa para asignar el resultado de una función
# a un objeto. Para dibujar las líneas que mejor se ajustan a los datos de mujeres y
# hombres, podemos correr el mismo comando de antes, abline(), pero ocupando un subset
# de la base de datos:

with(estudio2012[estudio2012$generof=="Mujer", ], # Selecciona únicamente a las mujeres
     abline(lm(insom~ansev), 
            col=colores[1])        # Selecciona el primer color de la lista
)

with(estudio2012[estudio2012$generof=="Hombre", ], # Selecciona únicamente a los hombres
     abline(lm(insom~ansev),
            col=colores[2])        # Selecciona el segundo color de la lista
)

# Matriz de correlaciones.

# Para terminar con el tema de los gráficos y de la exploración de datos, queda
# por mencionar que la función plot() también puede graficar las correlaciones entre 
# múltiples variables. Por ejemplo, podemos ver las correlaciones entre los cinco
# factores de personalidad del "big five" en la base de datos que viene con la
# librería psych. 

# En caso de que no la tengan cargada:

library(psych)
personalidad = epi.bfi 

# La función plot hace automáticamente la matriz de dispersiogramas si le entregan
# más de dos variables. Para simplificar los comandos, vamos a crear una nueva 
# base de datos solamente con los factores del big-five.

bf = with(personalidad,
          data.frame(bfagree, bfcon, bfext, bfneur, bfopen))

plot(bf)

# Si quieren ver la tabla de correlaciones en la consola, pueden ejecutar:

cor(bf)

# La función round() permite quitar decimales a esta o cualquier otra tabla.

round(cor(bf),
      2)

# La librería psych también tiene funciones gráficas para esto, con algunas opciones
# extra. En mi opinión estos gráficos son horribles, pero son útiles para explorar
# rápidamente las variables. Por defecto, la función pairs.panels() entrega
# dispersiogramas con una línea de ajuste, histogramas para ver la distribución
# de las variables, y además los coeficientes de correlación.

pairs.panels(bf)

# Obviamente, este tipo de gráficos pierde sentido a medida que aumenta el número de
# variables. Ejecutar

plot(personalidad)

# es poco práctico. Pero la librería psych incluye un gráfico que es perfecto para esto,
# y que no es horrible: cor.plot(). Este gráfico pone distintos colores dependiendo de
# qué tan fuerte es la correlación entre dos variables. A diferencia de plot() o de
# pairs.panels(), cor.plot() requiere los datos de una tabla de correlaciones.

cor(personalidad)

cor.plot(cor(personalidad))

# Como ven, el gráfico permite identificar de manera rápida cuáles son las
# variables que correlacionan entre si. 


# Cálculo de escalas y psicometría.

# El gráfico de correlaciones que entrega cor.plot() es una excelente introducción 
# al tema de la psicometría ycómo calcular escalas. Normalmente, al medir constructos
# psicológicos es preferible ocupar múltiples itemes ya que cada uno de ellos
# es un indicador imperfecto de los niveles del constructo. Pero si los ítems
# efectivamente están midiendo el mismo constructo, uno esperaría que la correlación 
# entre ellos sea alta. Por ejemplo, veamos la correlación entre los ítems de 
# insomnio:

x = cor(insomnio, # Vamos a asignar las correlaciones a un objeto, x
        use = "pairwise.complete.obs") # necesario cuando hay NAs

x # Imprime la tabla de correlaciones en la consola

cor.plot(x) # Grafica la tabla de correlaciones

# Claramente, los ítems 1 y 2 correlacionan muy fuertemente entre si (r = .9),
# y bastante bien con el resto. El ítem 3 correlaciona algo con el 1 y 2, 
# pero no correlaciona con los ítems 4 y 5, que si correlacionan entre si. 

# Hay dos formas principales de simplificar toda esta información para poder
# decidir si estos itemes son una medición confiable de los niveles de insomnio,
# o si están midiendo más de un constructo.

# La primera, y la más simple, es analizar la confiabilidad de la escala
# por medio del alpha de Cronbach. La librería psych tiene un comando para hacer 
# esto.

alpha(insomnio) # Probablemente tienen que moverse en la consola para ver
# el output completo de este análisis
help(alpha)

# A pesar de los problemas con el ítem 3, la escala tiene un alpha adecuado
# (std.alpha=.74), pero que podría ser un poco mejor al eliminar este ítem (.78),
# que tiene una correlación con el total relativamente baja (r.cor = .32).

# En estos casos, la decisión es más conceptual que estadística. Considerando el
# contenido del ítem 3 "A veces me despierto mucho antes de lo que tenía presupuestado",
# quizás sea mejor eliminarlo de la escala y ocuparlo por separado, ya que se refiere
# a un tipo de insomnio diferente, que además es menos frecuente en esta muestra.

# Antes de calcular el puntaje de insomnio sin el ítem 3, revisemos la confiabilidad
# de esta nueva escala. Ahora que no podemos ocupar el objeto insomnio que habíamos
# creado antes, tenemos que escribir cada una de las variables en la base de datos
# estudio2012. 

# La función cbind() combina objetos de R, en este caso columnas en la base de datos
# estudio2012. También podríamos haber ocupado data.frame().

with(estudio2012,
     alpha(cbind(insom1, insom2, insom4, insom5)))

# Ahora el alpha subió a .78, y vemos que los ítems 4 y 5 funcionan un poco peor.
# Más adelante vamos a ver por qué, pero por ahora vamos a calcular la escala de 
# insomnio con estos cuatro ítems.

# Calculo de escalas:

estudio2012$insom = with(estudio2012,
                         rowMeans(cbind(insom1, insom2, insom4, insom5),
                                  na.rm=TRUE))

# Para simplificar las cosas, antes habíamos calculado la escala sumando las 
# variables y dividiendo por el número de elementos. El principal problema de esto
# es que no permite especificar qué hacer con los datos perdidos.
# Al incluir na.rm=TRUE en la función rowMeans(), especificamos que si alguien
# contestá solamente algunos de los cuatro ítems, se calcule el promedio con la
# información que si está disponible. De otra forma ese participante quedaría con un 
# valor NA en esta escala. Ocupando esta opción, un participante quedaría con NA
# solamente cuando no haya contestado ninguno de los ítems.

summary(estudio2012$insom)

# Revisemos los ítems de ansiedad ante evaluaciones:

names(estudio2012) # ?Se acuerdan cuál era el nombre de estas variablesi

x = cor(with(estudio2012,
             cbind(ansev1, ansev2, ansev3, ansev4, ansev5)),
        use = "pairwise.complete.obs")

x

cor.plot(x)

# Esta escala se ve mucho mejor, ya que todos los ítems correlacionan entre si.

alpha(with(estudio2012,
           cbind(ansev1, ansev2, ansev3, ansev4, ansev5)))

# La confiabilidad es adecuada (.71) y no mejora al eliminar ningún ítem.

estudio2012$ansev = with(estudio2012,
                         rowMeans(cbind(ansev1, ansev2, ansev3, ansev4, ansev5),
                                  na.rm=TRUE))

summary(estudio2012$ansev)

# Análisis factorial

# Es perfectamente posible que una serie de ítems que fueron desarrollados
# para medir un constructo están en realidad midiendo dos o tres. Eso es exactamente
# lo que está ocurriendo con los ítems de insomnio. Aunque ahora nos vamos
# a concentrar en el análisis estadístico, este proceso debiera integrar también
# un análisis teórico y conceptual.

# Entender exactamentecómo funciona un análisis factorial es mucho más avanzado
# de lo que vamos a cubrir en el curso. Pero eso no significa que no lo podamos 
# ocupar.

# ?Cuántos factores estamos midiendo con los ítems de insomnio?
# Una forma de responder a esta pregunta es ejecutar la siguiente función:

fa.parallel(insomnio)

# fa.parallel() es una función de la librería psych nos ayuda a evaluar cuál es la 
# solución más optima en términos de cantidad de factores considerando parsimonia 
# -donde tener menos factores es mejor- y ajuste con los datos -donde tener más factores 
# es mejor.

# El gráfico entrega más información de la que realmente necesitamos, lo que importa
# es la línea de FA (análisis factorial). El primer factor logra explicar más 
# varianza en la escala que el segundo factor, que a su vez logra explicar más
# varianza en la escala que el tercer factor. Agregar un tercer factor es ciertamente
# poco práctico, ya que dos factores pueden explicar la mayor parte de la varianza.
# De hecho, probablemente un solo factor también es aceptable en este caso. 

# Con esta información, podemos hacer un análisis factorial exploratorio con dos
# factores, ocupando la función fa() de la librería psych.

fa(insomnio,    # las variables a incluir en el análisis
   2)           # la cantidad de factores

# La información entregada en la primera tabla nos indica cuánto se relaciona
# cada ítem con cada uno de los factores. Esto puede verse de forma gráfica con 

plot(fa(insomnio,2))

# Los ítems 1 y 2 se relacionan fuertemente con el primer factor (MR1), y los 
# ítems 4 y 5 se relacionan fuertemente con el segundo factor (MR2). El ítem 3 está
# más relacionado con el primer factor (.41) que con el segundo (-.09). 

# ?qué significa esto? Significa que la escala mide dos cosas, que de hecho 
# son perfectamente comprensibles al leer los ítems:

# Factor 1: Problemas de insomnio.
# Generalmente me cuesta conciliar el sueño o despierto muchas veces en la noche (insom1)
# Suelo presentar grandes dificultades para iniciar y mantener el sueño (insom2)
# A veces me despierto mucho antes de lo que tenía presupuestado (insom3)

# Factor 2: Conductas problemáticas de higiene del sueño.
# Cuando es hora de dormir, me dan ganas de ver televisión, 
# leer o hacer otra cosa (insom4)
# Suelo tener horarios de sueño desordenados, dormir siestas o pasar
# un tiempo excesivo en la cama (insom5)

# Obviamente estos dos constructos están relacionados, de hecho tienen una correlación
# de .39 según el análisis factorial. Pero no son lo mismo.

# Revisemos la confiabilidad antes de calcular cada escala.

# Problemas de insomnio:

alpha(with(estudio2012,
           cbind(insom1, insom2, insom3)))

# El alpha es .78.

estudio2012$insom = with(estudio2012,
                         rowMeans(cbind(insom1, insom2, insom3),
                                  na.rm=TRUE))
summary(estudio2012$insom)

# Conductas problemáticas insomnio:

alpha(with(estudio2012,
           cbind(insom4, insom5)))

# El alpha es .71, aunque con dos ítems normalmente se reporta la correlación (.56)

estudio2012$cinsom = with(estudio2012,
                          rowMeans(cbind(insom4, insom5),
                                   na.rm=TRUE))

summary(estudio2012$cinsom)


# ?qué pasa cuando hacemos un análisis factorial para los ítems de ansiedad en
# periodo de evaluacionesi De acuerdo al scree plot,

fa.parallel(with(estudio2012,
                 cbind(ansev1, ansev2, ansev3, ansev4, ansev5)))

# parece que la mejor solución es ocupar dos factores, aunque también sería
# aceptable ocupar uno.

x = fa(with(estudio2012,
            cbind(ansev1, ansev2, ansev3, ansev4, ansev5)),2)

x

plot(x)

# Los ítems 3, 4 y 5 cargan en un factor (MR2), y los ítems 1 y 2
# cargan en otro (MR1). El factor MR2 puede ser más propiamente llamado ansiedad
# en periodo de evaluaciones (irritable, dolores e incapacidad de desconectarse),
# el segundo factor son los ítems de insomnio durante este periodo. Al revisar
# la confiabilidad que tendrían estas escalas, 

alpha(with(estudio2012,
           cbind(ansev3, ansev4, ansev5)))

alpha(with(estudio2012,
           cbind(ansev1, ansev2)))

# vemos que es usable, pero ciertamente no es buena. ?qué hacer en este caso?
# La respuesta no está en los análisis estadísticos, sino en un análisis conceptual
# y de los objetivos de investigación. Los dos ítems de insomnio (ansev1 y ansev2)
# no correlacionan muy bien, y además ya tenemos otra escala para medir insomnio en
# general. Por lo tanto, creo que lo mejor es ocupar solamente el primer factor
# sin incluir los ítems de insomnio. 

estudio2012$ansev = with(estudio2012,
                         rowMeans(cbind(ansev3, ansev4, ansev5),
                                  na.rm=TRUE))

summary(estudio2012$ansev)

# Itemes invertidos.

# Es común que las escalas incluyan ítems invertidos, donde un mayor puntaje en el
# item refleja un menor nivel en el constructo que se quiere medir. Por ejemplo,
# la escala de "tolerancia hacia la diversidad sexual" tiene los siguientes ítems:

# (tolsex1) Me siento incómodo compartiendo socialmente con personas que son
# de distinta orientación sexual a la mía.
# (tolsex2) Las relaciones de pareja no heterosexuales son "anti naturales".
# (tolsex3) Las parejas del mismo sexo no deberían andar de la mano ni besarse en público.
# (tolsex4) Considero que el matrimonio debiera ser sólo entre un hombre y una mujer.
# (tolsex5) Me gustaría que cambiaran las leyes para promover un mayor
# respeto a las minorías sexuales.

# En realidad, esta escala debiera llamarse "intolerancia" a la diversidad sexual.
# Un mayor puntaje en los ítems 1, 2, 3 o 4 se asocia a una mayor intolerancia. Pero
# el quinto ítem está invertido: un mayor puntaje se asocia a una menor intolerancia.

# Veamos que pasa con estos ítems en un análisis factorial.

tolsex = with(estudio2012,
              data.frame(tolsex1, tolsex2, tolsex3, tolsex4, tolsex5))

fa.parallel(tolsex)

# A diferencia de las escalas que revisamos antes, estos ítems se agrupan
# claramente en un factor.

fa(tolsex)
plot(fa(tolsex))

# Como debiera ser, el ítem 5 tiene una relación negativa con el factor. 
# Además, el ítem 1 parece no estar funcionando muy bien con el resto de la escala.
# Si hacemos un análisis de confiabilidad,

alpha(tolsex)

# R automáticamente invierte el ítem 5, imprime un aviso en la consola, e indica
# que se invirtió el ítem con un signo - junto a su nombre. El alpha de la escala
# es bueno (.79), pero quedaría mejor si se elimina el ítem 1 (.84).

# Nuevamente, esta decisión tiene que ser conceptual también. A mí me parece adecuado
# eliminarlo, no porque sea un mal ítem, sino porque está midiendo algo ligeramente
# distinto -una reacción emocional vs. actitudes conservadoras más discursivas.

# Antes de promediar los ítems, en todo caso, tenemos que invertir los valores 
# de tolsex5! Lo más fácil es hacerlo directamente con la fórmula: 

# Puntaje invertido = Máximo + Mínimo - Puntaje original.

estudio2012$tolsex5i = 7 + 1 - estudio2012$tolsex5

summary(estudio2012$tolsex5i)

# Ahora podemos calcular la escala, donde un mayor puntaje va a reflejar un menor
# nivel de tolerancia hacia la diversidad sexual. Por lo tanto, vamos a aprovechar
# de cambiarle el nombre a "intolsex" (mayor puntaje mayor intolerancia)

estudio2012$intolsex = with(estudio2012,
                            rowMeans(cbind(tolsex2, tolsex3, tolsex4, tolsex5i),
                                     na.rm=TRUE))

summary(estudio2012$intolsex)


# Contraste de hipótesis y estimación de parámetros poblacionales

# Hasta ahora, hemos visto una serie de análisis, gráficos y tablas para visualizar
# la información obtenida en la muestra. Las siguientes secciones tratan en cambio
# sobre la estimación de lo que está ocurriendo en la población, a partir de los datos
# muestrales. 

# Chi-cuadrado
# Relaciones entre variables categóricas.

# En las secciones anteriores vimoscómo producir una tabla para ver la cantidad de 
# personas que pertenecen a ciertos grupos o categorías,

table(estudio2012$sitsentf)

# o hacer un cruce entre dos variables categóricas, como por ejemplo comparar la 
# situación sentimental de hombres y mujeres:

table(estudio2012$sitsentf, estudio2012$generof)

# ?Cómo saber si estas dos variables están relacionadasí ?Es más probable que los 
# hombres tengan relaciones complicadasí El análisis que corresponde ocupar para 
# contestar esta pregunta es un análisis de chi-cuadrado, que puede aplicarse
# a la frecuencia de una sola variable categórica, o a un cruce de varias variables.

# La función para hacer un análisis de chi-cuadrado es chisq.test(), y requiere 
# la información de una tabla de frecuencia -que puede obtenerse con table(). 
# Por ejemplo, 

table(estudio2012$generof) # Obtiene la cantidad de hombres y mujeres en la muestra.

chisq.test(table(estudio2012$generof)) # Hace un análisis de chi-cuadrado 
# con esta tabla.

# a partir de este análisis de chi-cuadrado vemos que la probabilidad de que nuestra
# muestra venga de una población donde hay igual cantidad de hombres y mujeres es 
# tremendamente baja (x2 = 27.75, p < .05). Esto nos indica que debemos rechazar esta 
# hipótesis nula y concluir que en la carrera de psicología en nuestra universidad 
# hay más mujeres que hombres. 

# Al parecer las mujeres tienen menos probabilidades de estar solteras que los hombres,
# quienes además tienen más probabilidades de estar en relaciones complicadas.

table(estudio2012$sitsentf, estudio2012$generof)

# Veamos si podemos generalizar esto a la población de estudiantes de psicología.

chisq.test(table(estudio2012$sitsentf, estudio2012$generof))

# Como se observa en la consola, la relación entre estas variables no alcanza a 
# ser estadísticamente significativa (x2 = 5.05, p = .08). Además, R imprime 
# un mensaje advirtiendo que la estimación del chi-cuadrado puede ser incorrecta.
# Esto se debe a que hay muy pocas mujeres y muy pocos hombre (menos de 5) que 
# tienen una relación complicada. 

# La función table() tiene un argumento especialmente diseñado para estos casos,
# es decir, para excluir ciertas categorías del análisis:

table(estudio2012$sitsentf, estudio2012$generof, 
      exclude="Es complicado")

# Esta vez, vamos a asignar el resultado del análisis a un objeto llamado x2
# (podríamos haber puesto cualquier nombre)

x2 = chisq.test(table(estudio2012$sitsentf, estudio2012$generof, 
                      exclude="Es complicado"))

x2

# La probabilidad de que esta muestra venga de una población donde el género no se 
# relaciona con estar soltero(a) o en un una relación es mayor a .05 (x2 = 1.64, p = .2),
# por lo que no corresponde rechazar la hipótesis nula. Los hombres y las mujeres
# tienen la misma probabilidad de estar en una relación.

# El análisis de chi-cuadrado, como la mayoría de los análisis que vamos a ver de 
# ahora en adelante, son objetos más complejos que los que hemos visto hasta ahora.

# Si bien ejecutar

x2 # el nombre del objeto al que asignamos el análisis de chi-cuadrado

# nos entrega la información básica, el objeto "x2" tiene más información. Para
# acceder a esta información se ocupa el mismo formato con que seleccionamos 
# una variable en una base de datos. Por ejemplo, para obtener la tabla de 
# valores observados, podemos ocupar

x2$observed

# lo que es exactamente lo mismo que la tabla original con que hicimos el análisis. 
# Para obtener los valores esperados según la hipótesis nula, podemos ejecutar

x2$expected

# En cualquier análisis, los valores que pueden obtenerse están listados en la página
# de ayuda.

help(chisq.test)

# Estimación del promedio poblacional y relaciones entre variables categóricas
# y numéricas. 

# Prueba t

# Prueba t para una muestra:
# Estimación del promedio de la población.

# En caso de querer estimar los niveles poblacionales de una variable numérica,
# pueden hacer una prueba t para una muestra en esta variable con la función
# t.test(). Por ejemplo, los datos de escala de intolerancia a la diversidad sexual

t.test(estudio2012$intolsex)

# indican que el promedio poblacional está entre 1.95 y 2.54 ocupando un intervalo
# de confianza de 95%. Considerando que la escala es de 1 a 7, el nivel es bastante
# bajo. Por defecto, la hipótesis nula de esta prueba es que el promedio 
# poblacional es igual a cero, algo que por supuesto no tiene sentido en esta escala
# de 1 a 7. Para cambiar la hipótesis nula, por ejemplo para estimar la probabilidad
# de que esta muestra venga de una población en que el promedio es cuatro (el punto
# medio de la escala), es necesario agregar el parámetro mu:

t.test(estudio2012$intolsex, mu=4)

# Obviamente, la probabilidad es tremendamente baja (p < 2.2e-16; eso son 16 ceros
# después de la coma). 

# La librería psych incluye un comando para hacer gráficos con barras de error
# ocupando intervalos de confianza.

error.bars(with(estudio2012,
                cbind(ansev1, ansev2, ansev3, ansev4, ansev5)),
           ylim=c(1,7))

# Este gráfico puede ser una forma útil de comparar los niveles de diferentes variables
# considerando información de estadística inferencial, pero es importante destacar
# que no es una prueba de hipótesis estadísticas. Son estimaciones independientes
# del promedio poblacional en cada ítem.

# Prueba t para muestras independientes:
# comparación del promedio de dos grupos.

# La misma función que ocupamos en la sección anterior, t.test(), puede ser ocupada
# para comparar los promedios de dos grupos de participantes, y evaluar la hipótesis
# nula de que ambos tienen el mismo promedio en la población. El formato para hacer
# este análisis es el mismo que ya hemos visto otras veces: la variable dependiente
# predicha por la variable independiente (y~x). A modo de ejemplo,  podemos evaluar 
# si los niveles de intolerancia a la diversidad sexual son diferentes según el género
# de los participantes:

t.test(estudio2012$intolsex~estudio2012$generof)

# Curiosamente, las mujeres muestran mayores niveles de intolerancia que los hombres
# (t(64)=2.48, p < .05). Es importante recordar que estos resultados son generalizables
# a una población particular; estudiantes de psicología de nuestra universidad, y
# no a los hombres y mujeres de chile, por ejemplo. Al revisar los resultados de otras
# variables, como opiniones hacia el aborto y orientación política, pareciera que las
# mujeres tienden a ser más conservadoras que los hombres en esta población, 
# lo que podría explicar las diferencias en tolerancia hacia la diversidad sexual.

table(estudio2012$orienpolf, estudio2012$generof)

# Volviendo a la revisión del output de una prueba t de muestras independientes, 
# es importante notar un par de aspectos más técnicos.

t.test(estudio2012$intolsex~estudio2012$generof)

# El título de esta prueba indica que se realizó una prueba t de Welch. Esto es porque
# las varianzas de los grupos no son iguales, y R automáticamente realiza el ajuste
# apropiado. Para forzar una prueba t clásica se puede agregar el argumento

t.test(estudio2012$intolsex~estudio2012$generof,
       var.equal=TRUE)

# que indica que deben asumirse varianzas iguales. Esto no es recomendado, ?para eso
# existe este ajuste! 

# Otro detalle es que esta función realiza por defecto un contraste de 
# hipótesis bilateral. En caso de que se quiera hacer un contraste unilateral,
# pueden ocupar el argumento:

t.test(estudio2012$intolsex~estudio2012$generof,
       alternative="greater")

# Pero incluso aunque quieran hacer un contraste unilateral esto no es necesario,
# la probabilidad asociada a la hipótesis nula en un contraste unilateral es simplemente
# la mitad de la probabilidad obtenida en un contraste bilateral.

# Prueba t para muestras dependientes
# Comparar el promedio poblacional de dos variables en un grupo.

# Para realizar una prueba t para muestras dependientes simplemente hay que agregar
# un argumento a la función t.test(): paired=TRUE. 

# Esta prueba asume que las variables efectivamente son comparables, lo que no siempre
# es cierto. En este estudio, la escala de empatía frente al aborto parece adecuada,
# ya que los participantes tenían que contestar la misma pregunta pero referida a 
# distintas situaciones:

# Imagina que una mujer recientemente tuvo un aborto y te relata su experiencia. ?qué
# tanto puedes empatizar con ella en las siguientes situacionesi (desde 1 = nada, hasta
# 7 = mucho).

# Las situaciones presentadas fueron las siguientes:

# abor1 Mi embarazo era un riesgo grave para mi salud.
# abor2 Mi hijo hubiese nacido con una enfermedad genética grave que lo
#       condenaba a sufrir.
# abor3 Fui víctima de violación, tenerlo hubiera sido un recuerdo constante de mi
#       experiencia traumática.
# abor4 Por razones económicas era incapaz de hacerme cargo de un hijo, no hubiese podido
#       abastecerlo ni en sus necesidades más básicas.
# abor5 Hubiera sido una madre soltera, estigmatizada por el resto de mi vida.

# En general, los niveles de empatía reportados disminuyen progresivamente:

with(estudio2012,
     describe(data.frame(abor1, abor2, abor3, abor4, abor5)))

# Dado que es la misma escala para cada situación, podemos comparar dos de ellas
# con una prueba t de muestras dependientes. Por ejemplo, ?Produce más empatía 
# una situación de riesgo grave para la salud de la madre que una situación donde 
# se encuentra una enfermedad genética grave en el hijo(a)?

t.test(estudio2012$abor1, estudio2012$abor2,
       paired=TRUE)

# Si, al menos en esta población. La probabilidad de que ambos promedios sean 
# iguales es menor a .05, por lo que podemos rechazar la hipótesis nula. 


# ANOVA Simple
# comparación de los promedios poblacionales de múltiples grupos.

# Para comparar los promedios de más de dos grupos es necesario hacer un análisis de 
# varianza. La función para hacer esto en R es aov(). Para estos análisis, vamos a 
# ocupar la escala de intuición:

# intui1 Muchas veces tengo muy claro la decisión que voy a tomar, aunque
#        no podría explicar por qué.
# intui2 A veces siento que puedo predecir lo que va a pasar antes de que suceda, 
#        como por ejemplo que me llamar? alguien.???
# intui3 Siento que puedo sabercómo es una persona casi inmediatamente, incluso
#        antes de conversar con ella.
# intui4 Si en una prueba o examen de alternativas no me acuerdo de la materia, 
#        muchas veces puedo elegir de forma intuitiva, porque "algo" me dice que 
#        es la respuesta correcta.
# intui5 Para cosas realmente importantes, confío más en mis sentimientos e intuición
#        que en argumentos racionales.


alpha(with(estudio2012,
           data.frame(intui1, intui2, intui3, intui4, intui5)))

# Parece mejor eliminar el ítem 1.

estudio2012$intui = with(estudio2012,
                         rowMeans(data.frame(intui2, intui3, intui4, intui5),
                                  na.rm=TRUE))

# ?Estar? relacionada la intuición con el signo zodiacal? Primero tenemos que preparar
# la variable zodiaco.

table(estudio2012$zodiaco)

estudio2012$zodiacof = factor(estudio2012$zodiaco,
                              levels=c("Acuario (21 Enero - 19 Febrero)",
                                       "Piscis (20 Febrero - 20 Marzo)",
                                       "Aries (21 Marzo - 20 Abril)",
                                       "Tauro (21 Abril - 20 Mayo)",
                                       "Géminis (21 Mayo - 20 Junio)",
                                       "Cáncer (21 Junio - 22 Julio)",
                                       "Leo (23 Julio - 22 Agosto)",
                                       "Virgo (23 Agosto - 22 Septiembre)",
                                       "Libra (23 Septiembre - 23 Octubre)",
                                       "Escorpión (24 Octubre - 21 Noviembre)",
                                       "Sagitario (22 Noviembre - 21 Diciembre)",
                                       "Capricornio (22 Diciembre - 20 Enero)"),
                              labels=c("Acuario",
                                       "Piscis",
                                       "Aries",
                                       "Tauro",
                                       "Geminis",
                                       "Cancer",
                                       "Leo",
                                       "Virgo",
                                       "Libra",
                                       "Escorpion",
                                       "Sagitario",
                                       "Capricornio"))

barplot(table(estudio2012$zodiacof))

# Ahora podemos hacer un ANOVA para ver si el signo zodiacal está relacionado con los
# niveles de intuición. 

# Ejecutar simplemente,

aov(intui~zodiacof, data=estudio2012)

# nos entrega una tabla con la suma de cuadrados y los grados de libertad, lo que no
# es suficiente información. Para este análisis, es absolutamente necesario asignar
# el resultado a un objeto, que vamos a llamar "aov" (podemos poner cualquier nombre).

aov = aov(intui~zodiacof, data=estudio2012)

# Ahora podemos ocupar la función summary() para ver el resultado de este análisis.

summary(aov)

# En base a los resultados del ANOVA, podemos concluir que no existe una relación
# entre el signo zodiacal y los niveles de intuición (F(11,98) = 1.15, p = .33). 
# Pero es importante notar que los n de cada grupo son muy pequeños para este análisis.
# Si vemos la información descriptiva,

boxplot(intui~zodiacof, data=estudio2012)

# Los participantes del signo Cáncer son los que reportan mayores niveles de intuición,
# lo que es consistente con la descripción entregada en 
# http://www.astrology-online.com/cancer.htm

# De acuerdo a Astro Lady, en todo caso, Cáncer, Escorpión y Picis son los signos
# más intuitivos (asociados al agua). 
# ver http://answers.yahoo.com/question/index?qid=20080124235717AAdSk0S
# Esto no parece cumplirse en esta muestra. 

# Quizás la intuición está relacionada con la mención que quieren elegir los alumnos
# de psicología...

table(estudio2012$mencion)

# Dado que desgraciadamente hay muy pocas personas que reportan estar interesados 
# en psicología comunitaria o psicología de la salud, vamos a sacarlos del análisis.

estudio2012$mencionf = factor(estudio2012$mencion,
                              levels=c("Clínica",
                                       "Educacional",
                                       "Laboral/Organizacional"),
                              labels=c("Clinica",
                                       "Educacional",
                                       "Laboral/Organizacional"))

# Ahora podemos hacer el ANOVA

aov = aov(intui~mencionf, data=estudio2012)
summary(aov)

# Esta vez, los resultados si son estadísticamente significativos. Pero qué grupos
# son diferentes de cualesi La información descriptiva

boxplot(intui~mencionf, data=estudio2012)

# parece indicar que las personas que quieren tomar psicología organizacional
# reportan un menor nivel de intuición. Para evaluar qué grupos presentan diferencias
# estadísticamente significativas es necesario hacer un test de Tukey, ocupando la 
# función TukeyHSD(), que requiere el resultado de un análisis de varianza.

TukeyHSD(aov)

# Al hacer las comparaciones entre estos grupos, vemos que la única diferencia
# estadísticamente significativa es la comparación entre los alumnos que quieren 
# especializarse en clínica y los alumnos que quieren especializarse en psicología
# organizacional. Los alumnos interesados en clínica reportan mayores niveles
# de intuición que los interesados en organizacional.

# Uno de los supuestos del ANOVA es que las varianzas de los grupos son iguales.
# Para evaluar si se cumple este supuesto, pueden hacer una prueba de levene ocupando
# la función levene.test() de la librería lawstat:

install.packages("lawstat")
library(lawstat)

levene.test(estudio2012$intui, estudio2012$mencionf)
help(levene.test)

# En este caso, la prueba no es estadísticamente significativa, por lo que podemos
# asumir que las varianzas de los grupos en la población efectivamente son iguales. 
# Si las varianzas fueran diferentes, corresponde hacer un ANOVA de Welch, que 
# no asume varianzas iguales: 

oneway.test(intui~mencionf, data=estudio2012)

# Estos resultados se reportan así: F de Welch (2, 28.63) = 3.56, p < .05. 

# Desgraciadamente, R no incluye por defecto el R2 en el output de ANOVA.
# para obtenerlo, podemos ocupar la función summary.lm() en el objeto que creamos
# para el análisis. 

summary.lm(aov)

# ANOVA Factorial
# Relación entre una variable numérica y múltiples variables categóricas.

# La función aov() también permite agregar más de una variable categórica, y evaluar 
# la interacción entre estas variables con el formato
# aov(variable dependiente~factor1*factor2). Nuevamente sería ideal tener más n del que
# tenemos en este estudio, especialmente para evaluar la interacción entre los dos 
# factores pero vamos a ver un ejemplo de todas formas, agregando género al análisis
# que acabamos de hacer.

# Hagamos primero un gráfico para ver los descriptivos.

with(estudio2012,
     interaction.plot(generof, mencionf, intui))

# Y ahora el análisis de varianza.

aov = aov(intui~mencionf*generof, data=estudio2012)
summary(aov)

# Si bien al parecer el género tiene un efecto más grande en los estudiantes interesados
# en psicología educacional, la interacción entre estos dos factores no es
# estadísticamente significativa. En cambio, hay un efecto principal de género, donde
# los hombres reportan menos intuición que las mujeres (F(1,93) = 6.86, p < .05), y de 
# mención, donde las personas interesadas en especializarse en clínica reportan mayores 
# niveles de intuición (F(2,93) = 10.34, p < .05).

# También pueden pedir los descriptivos para cada factor y sus interacciones con
# model.tables(), lo que además tiene la ventaja de que incluye el n de cada grupo (rep).
# Solamente una de las personas que está interesada en psicología educacional es hombre.

model.tables(aov, "means")

# Ahora el test de Tukey va a incluir comparaciones múltiples para género, para mención
# y también para la interacción entre estos dos factores, aunque típicamente las 
# coparaciones uno a uno entre las combinaciones de factores no se reportan.

TukeyHSD(aov)

# Para hacer un anova con múltiples factores sin incluir sus interacciones, basta
# reemplazar el signo * por un +.

aov = aov(intui~mencionf+generof, data=estudio2012)
summary(aov)

# El anova simple con mención explicaba un 5.5% de la varianza en los niveles de intuición.
# Al incluir género el nivel de varianza explicada es ahora un 9%.

summary.lm(aov)

# ANCOVA

# Para hacer un ancova y controlar estadísticamente por el efecto de una variable
# continua, simplemente puede agregarse esta variable como predictor en la función aov(),
# con +, ya que normalmente no nos interesan sus interacciones.

# Relaciones entre variables lineales.

# Prueba estadística para correlaciones.

# En la sección de descriptivos, vimos que era posible obtener el coeficiente de 
# correlación entre dos variables continuas con la función cor():

cor(estudio2012$insom, estudio2012$cinsom,
    use = "pairwise.complete.obs")

# Para saber si esta correlación es estadísticamente significativa, la función que hay 
# que ocupar es 

cor.test(estudio2012$insom, estudio2012$cinsom)

# Esta función no requiere especificar que deben omitirse los participantes con NA,
# por lo que probablemente es más práctica que cor() para obtener una correlación.
# Aún así, la gracia de cor es que permite hacer una matriz de correlaciones,
# lo que no es posible con cor.test(). 

# El output de esta prueba nos entrega la significación estadística (r = .35, p < .01),
# y también un intervalo de confianza para la correlación. En este caso, entre
# .18 y .50. 

# Al igual que en una prueba t (de hecho esto es una prueba t) podemos hacer una 
# hipótesis unilateral o bilateral. En caso de que tengan una hipótesis unilateral,
# simplemente tienen que agregar alternative="greater" (o "less") a la función 
# cor.test(). En general esto no es necesario. Simplemente pueden reportar la mitad
# de p cuando el contraste es unilateral.

cor.test(estudio2012$insom, estudio2012$cinsom,
         alternative="greater")

# Correlación parcial

# Para hacer una correlación parcial entre x e y, controlando por z, es necesario
# instalar la librería ppcor, y ocupar la función pcor.test(). Esta función simplemente
# no acepta observaciones con NAs, por lo que vamos a tener que procesar un poco nuestra 
# base de datos. El procedimiento que vamos a ocupar se aplica a cualquier otra
# situación en que queramos sacar de una base de datos a las personas que no 
# contestaron algunas de las variables, así que vale la pena revisarlo de todas formas.

# Primero, para simplificar las cosas, vamos a crear una nueva base de datos incluyendo
# Únicamente las variables insom, ansev y cinsom; que vamos a llamar corpar.

corpar = with(estudio2012,
              data.frame(insom, ansev, cinsom))

# Una vez hecho esto, podemos seleccionar Únicamente a las personas que efectivamente
# tienen puntajes en estas tres variables, ocupando el argumento "complete.cases":

corpar = corpar[complete.cases(corpar), ]

# Ahora que tenemos una base de datos que no tiene ningún NA,

corpar

# vamos a revisar la correlación entre insomnio y ansiedad ante evaluaciones, 
# controlando por conductas negativas del sueño. 

install.packages("ppcor") # Primero tenemos que instalar
library(ppcor)            # y cargar la librería ppcor

# La función pcor.test() ocupa el formato pcor.test(x, y, z), donde z es la variable
# que queremos controlar. 

pcor.test(corpar$insom, corpar$ansev, corpar$cinsom)

# La correlación se mantiene prácticamente igual al controlar por conductas negativas
# del sueño, lo que nos da cierta indicación de que la relación entre insomnio y 
# ansiedad en periodos de evaluaciones no puede ser explicada por esta variable. 


# Regresión

# Hacer regresión en R es exactamente lo mismo que hacer un ANOVA. De hecho, la función
# aov() ocupa la función básica para hacer modelos de regresión: lm(). El formato de esta
# función es exactamente el mismo: lm(variable dependiente~predictor1+predictor2). 

# Una de las escalas que no hemos ocupado es la de estrés universitario, que podemos
# usar para predecir los niveles de insomnio. La escala tiene los siguientes ítems:

# streu1 Siento que no me alcanza el tiempo para cumplir con todas mis responsabilidades 
#        académicas.
# streu2 Siento molestias físicas (dolor de cabeza, de estómago, náuseas, etc.) debido
#        a la cantidad de actividades que debo realizar.
# streu3 Siento que tengo tantas responsabilidades académicas que no logro
#        "desconectarme" en mi tiempo libre.
# streu4 Cuando pienso en todas las actividades que tengo que hacer me pongo irritable.
# streu5 Siento mucha presión para cumplir con todas mis responsabilidades
#        en la universidad.

# La confiabilidad es buena,

alpha(with(estudio2012,
           data.frame(streu1, streu2, streu3, streu4, streu5)))

# y aunque eliminar el primer ítem mejoraría un poco el alpha, la correlación del ítem
# con el total es adecuada (.4), por lo que prefiero incluirlo de todas formas.

estudio2012$streu = with(estudio2012,
                         rowMeans(data.frame(streu1, streu2, streu3, streu4, streu5),
                                  na.rm=TRUE))

summary(estudio2012$streu)

# Noten que el promedio está claramente por sobre el punto medio de la escala.

# Podemos predecir los niveles de insomnio a partir de los niveles de estrés 
# universitario reportados por los participantesi La función lm() funciona igual que
# aov(), y también es necesario asignar el resultado a un objeto, que ahora vamos
# a llamar lm.

lm = lm(insom~streu, data=estudio2012)
summary(lm)

# El resultado de este análisis indica que efectivamente los niveles de estrés 
# universitario predicen los niveles de insomnio de forma significativa. El output
# entrega los coeficientes no estandarizados: un punto en la escala de estrés
# se asocia (en general) a un aumento de .35 puntos en la escala de insomnio. 

# Como vimos en la sección de descriptivos, el resultado de este análisis puede 
# ser ocupado para dibujar la línea de regresión sobre un dispersiograma 
# que muestra la relación entre las variables.

plot(estudio2012$streu, estudio2012$insom)
abline(lm(insom~streu, data=estudio2012))

# lm() no entrega los coeficientes estandarizados. Si bien no es complicado hacer esto
# de forma manual, probablemente la opción más práctica es ocupar variables 
# estandarizadas (puntajes z) desde un comienzo. La librería psych incluye
# una función para convertir a puntaje z, o definir cualquier otro valor
# para el promedio y la desviación estándar de una variable.

datosz = with(estudio2012,
              rescale(cbind(insom, streu), mean = 0, sd = 1))

lmz = lm(insom~streu, data=datosz)  # La misma regresión que hicimos antes
# pero con puntajes z

summary(lmz) # Ahora los coeficientes son betas estandarizados

# También es posible ocupar lm.beta() de la librería QuantPsyc, pero este 
# comando no funciona cuando hay interacciones entre los predictores. 

install.packages("QuantPsyc")
library(QuantPsyc)
lm.beta(lm) # Entrega los coeficientes estandarizados.

# Regesión múltiple

# Para hacer una regresión múltiple, simplemente hay que agregar otros predictores
# ocupando + (a no ser que quieran evaluar también la interacción entre dos predictores).

lm = lm(insom~streu+ansev+intui, data=estudio2012)
summary(lm)

# Al incluir ansiedad en periodo de evaluaciones el efecto de estrés universitario
# deja de ser significativo, y -como es esperable- los niveles de intuición no predicen
# los niveles de insomnio. Es perfectamente posible entender ansiedad en periodo de 
# evaluaciones como un mediador del efecto de estrés universitario en insomnio. 
# La idea es que las personas pueden tener más o menos estrés universitario (streu),
# por ejemplo porque tomaron muchos ramos, y esto genera problemas de sueño (insom) 
# justamente porque disminuye la capacidad de enfrentar tranquilamente los periodos
# de evaluaciones (ansev).

# Una forma de evaluar mediación es haciendo tres regresiones, mostrando que

# 1. La variable independiente predice la variable dependiente.

lm1 = lm(insom~streu, data=estudio2012)
summary(lm1)

# 2. La variable independiente predice el mediador.

lm2 = lm(ansev~streu, data=estudio2012)
summary(lm2)

# 3. El efecto de la variable independiente deja de ser significativo al incluir
#    el mediador.

lm3 = lm(insom~ansev+streu, data=estudio2012)
summary(lm3)

# También es posible que el efecto de la variable independiente siga siendo
# significativo, pero se observe una reducción importante. Más abajo vamos a instalar
# la librería QuantPsyc, que incluye funciones para análisis más sofisticados de 
# mediación.

# Interacciones entre variables continuas

# Incluir interacciones en ecuaciones de regresión es prácticamente igual que en 
# ANOVAs, con la importante excepción de que los predictores tienen que estar centrados.
# Es decir, su promedio debe ser 0.

# Para hacer esto se podría crear otra variable restando el promedio a la variable 
# original, pero podemos ocupar la función meanCenter() de la librería QuantPsyc.

# A modo de ejemplo, vamos a incluir la interacción entre estrés universitario y conductas
# negativas del sueño. Quizás el estrés universitario afecta menos a las personas 
# que evitan ver televisión hasta tarde.

install.packages("QuantPsyc")
library(QuantPsyc)

estudio2012$streuc = meanCenter(estudio2012$streu)
estudio2012$cinsomc = meanCenter(estudio2012$cinsom)

# Ahora el modelo de regresión incluye un * en vez de un +, para incluir la 
# interacción entre los dos predictores ya centrados.

lm = lm(insom~streuc*cinsomc, data=estudio2012)
summary(lm)

# Como es esperable, las conductas asociadas a baja calidad del sueño predicen los 
# niveles de insomnio. Pero la interacción entre estrés universitario y estas conductas
# no es estadísticamente significativa.

# La librería QuantPsyc tiene funciones específicas para evaluar mediación y moderación
# (interacciones) entre las variables. Si les interesa pueden revisar las páginas
# de ayuda de esta librería. 

help(QuantPsyc)
help(moderate.lm)   # Para moderación en regresiones.
help(proximal.med)  # Para cálculo de efectos indirectos (mediación)

# Regresiones y ANOVA

# En R, el hecho de que las regresiones lineales y los ANOVA son lo mismo es explícito:
# aov() simplemente hace un modelo ocupando lm() y lo reporta como es tradicional en
# los análisis de varianza. De hecho, tanto aov() como lm() permiten agregar predictores
# continuos o categóricos. En el caso de las variables categóricas R automáticamente
# crea las variables dicotómicas que sean necesarias. La consecuencia práctica que 
# tiene esto es que pueden agregar tranquilamente predictores categóricos a lm() y
# predictores continuos a aov(). 

# Por ejemplo, podemos pedir el siguiente modelo, donde se incluyen genero y situación
# sentimental como predictores de insomnio.

lm = lm(insom~streu+ansev+        # Predictores continuos
          generof+sitsentf,   # Predictores categóricos
        data=estudio2012)

# El output de 

summary(lm)

# muestra que el único predictor significativo de insomnio es ansiedad en periodos 
# de evaluaciones. También se observa ser hombre predice mayores niveles de 
# insomnio, pero el efecto no es significativo. Además estar tener una situación
# sentimental "complicada" (vs. "En una relación") predice mayores niveles de insomnio,
# pero nuevamente el efecto no es estadísticamente significativo, posiblemente
# porque hay muy pocos participantes que reportan su situación sentimental como 
# complicada. 

# Lo que hemos revisado debiera ser más que suficiente para la mayoría de los análisis
# que se realizan típicamente en psicología. Los anexos incluyen un poco más de 
# información en caso de que alguna vez la necesiten. 


# ANEXOS

# Otras funciones útiles:

# Para buscar información.

help(mean) # también puede escribirse como
?mean      # y agregar dos ?? permite buscar en la documentación online de R
# por palabras clave. Por ejemplo,
??mean
??"mean center"

# Para combinar bases de datos en base a una variable (identificador) común:

help(merge)

# El lugar donde aparecen los gráficos puede dividirse para incluir varios 
# gráficos en la misma imagen

par(mfrow=c(1,2)) # Divide el output gráfico en dos columnas.
hist(estudio2012$intolsex)
boxplot(estudio2012$intolsex)
par(mfrow=c(1,1)) # Quita la división del output gráfico.



# Otros análisis estadísticos

# Evaluación de supuestos estadísticos en modelos de regresión.

# El comando plot() entrega cuatro gráficos útiles para evaluar si los datos cumplen
# los supuestos estadísticos asociados a un modelo de regresión. Como aparece en la 
# consola, tienen que apretar enter para ver el siguiente gráfico. 

plot(lm)

# El primer gráfico muestra la distribución de los residuos. Esto es equivalente
# a la idea de homogeneidad de varianza en ANOVA. La distribución de los residuos
# debiera ser uniforme, y la línea roja debiera ser horizontal. 

# El segundo gráfico evalúa si los residuos tienen una distribución normal. Los
# puntos en el gráfico debieran ajustarse a la línea diagonal. Los gráficos 2 y 3 son
# menos importantes. 


# ANOVA de mediciones repetidas

# Requiere transformar la base de datos de forma que cada participante tenga
# varias líneas, una por cada medición intra-sujeto. Dado esto, creo que es mejor
# hacer un análisis multinivel en todo caso. De todas formas abajo les copio 
# el ejemplo disponible en http://personality-project.org.

datafilename="http://personality-project.org/r/datasets/R.appendix3.data"
data.ex3=read.table(datafilename,header=T)    #read  the data into a table
data.ex3                                      #show the data
aov.ex3 = aov(Recall~Valence+Error(Subject/Valence),data.ex3)
summary(aov.ex3)
print(model.tables(aov.ex3,"means"),digits=3)       
#report the means and the number of subjects/cell
boxplot(Recall~Valence,data=data.ex3)          #graphical output


# Para modelos de ecuaciones estructurales (SEM) pueden ocupar la librería
# lavaan. Ver más información en http://lavaan.ugent.be 

install.packages("lavaan")
??lavaan

# Para modelos multinivel pueden ocupar la librería lme4, específicamente la función
# lmer().

install.packages("lme4")
??lmer
