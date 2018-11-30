# tareas_pyschtoolbox
Este repositorio sirve para ir subiendo problemas de programación en Psychtoolbox y sus soluciones. Pensado para los estudiantes de @DavLuque. 
¿Cómo subir las respuestas? Simplemente en files con el núnero del problema, la versión, y tu nombre. Por ejemplo, la solución del problema 1 podría ser "Solución_P1_Sara".
La web de Peter Scarfe es una gran fuente de info para empezar a programar con psychtoolbox. http://peterscarfe.com/index.html

PROBLEMA #1. Este problema es el más sencillo posible. El script debe abrir una ventana de psychtoolbox (que ocupe la pantalla completa). La pantalla debe de ser de color gris. Debe mantenerse activa (toda la pantalla gris) durante 5 segundos y luego debe terminar el programa.

PROBLEMA #2. Se abre un pantalla de fondo gris (como en el problema 1). Sobre la misma, dibuja un cuadrado de 400 pixeles de lado de color rojo, que está 2 segundo en el centro, luego desaparece un segundo, y luego aparece en el lado izquierdo de la pantalla otros 2 segundos. 

PROBLEMA #3. En lugar de hacer que el cuadrado rojo tenga 400 pixeles de lado, haz que tenga 1/4 del número de píxeles totales que la pantalla tiene de alto. Este modo de poner los tamaños de los objetos (relativos al tamaño de la pantalla) es muy útil para trabajar en diferentes equipos/labs.

PROBLEMA #4. En lugar de aparacer 5 segundos en la pantalla cada vez, intenta que aparezca por una cantidad de tiempo pseudo-aleatoria, con un mínimo de 3 segundos y un máximo de 7 segundos.

PROBLEMA #5. En experimentos de búsqueda visual es importante que los participantes miren al centro de la pantalla al principio de cada ensayo. Para conseguirlo, se suele incluir un "punto de fijación" antes del ensayo de búsqueda visual. Vamos a poner un punto de fijación para nuestro experimento. Programa un pequeña cruz (+) de color blanco que aparezca en el centro de la pantalla un tiempo variable (mínimo 0.2 segundos, máximo 0.5 segundos). Justo después de la cruz continúa el "ensayo" con la presentación del cuadrado rojo, tal y como estaba en el problema #4.

PROBLEMA #6. Después del punto de fijación debe aparecer un círculo verde a la derecha de la pantalla, y el cuadrado rojo a la izquierda de la pantalla. Ambos estímulos deben de estar alejados del centro de la pantalla 1/4 del alto de la pantalla. Deben de permanecer en pantalla 2 segundos, y luego termina el ensayo.

PROBLEMA #7. Los estímulos (cuadrado y círculo) deben de permanecer en la pantalla hasta que se pulse la tecla con una flecha apuntantado hacia la izquierda. Pulsar esa tecla (y no otra) hace que termine el ensayo. 

PROBLEMA #8. Vamos a definir lo que sería un ensayo en nuestro experimento. El ensayo empieza con la cruz de fijación (mínimo 0.2 segundos, máximo 0.5 segundos), a continuación aparecen los estímulos, que están en la pantalla hasta que se pulsa la tecla correcta (por ahora es la flecha izquierda). La siguiente pantalla va a ser un intervalo entre-ensayos, en el que no aparezca nada en la pantalla (se queda en gris) durante 1 segundo mínimo, 1.5 segundos máximo.

PROBLEMA #9. Haz que se repitan 6 ensayos. No copies y peges el código de un ensayo 6 veces! 
(TIP: Usa un loop 
n = numero de ensayos
for = 1:n
% el ensayo pasa aqui
end
)

PROBLEMA #10. Haz que en la mitad de los ensayos el cuadrado esté en la izquierda y el cículo a la derecha. En la otra mitad la distribución será la opuesta.

PROBLEMA #11. El orden de los ensayos en relación a su distribución (cuadrado-círculo o círculo-cuadrado) debe de ser aleatorio. Intenta que siga habiendo 3 ensayos de cada distribución. 

PROBLEMA #12. Ahora la respuesta "correcta" va a depender de la posición del círculo. Cuando el círculo esté a la izquierda, la respuesta que hace pasar al siguiente ensayo debe de ser la flecha izquierda (<--), pero cuando el círculo esté a la derecha, la respuesta que hace pasar al siguiente ensayo debe de ser la flecha derecha (-->).

PROBLEMA #13. Feedback. En aquellos ensayos en los que se pulse la flecha incorrecta, haz que el ensayo continue con una pantalla sin nada (.2 secs) y luego un mensaje de ERROR! en el centro de la pantalla (1.2 secs). 

PROBLEMA #14. Vamos a ir transformando nuestro programa en una tarea de "dot probe". Usaremos los Tiempos de Respuesta (TR) para medir cómo se distribuye la atención visual cuando presentamos nuestro círculo y nuestro cuadrado. También a partir de ahora los problemas serán menos detallados y puede que impliquen varias tareas de programación. La idea es que vayas tomando decisiones acerca de cómo quieres tu experimento y, al mismo tiempo, te acostumbres a dividir los problemas de programación en problemas más pequeños. ¡Una buena organización es más de la mitad del trabajo!
Vamos con el problema 14. Dibuja un pequeño "dot" (haz que el dot sea un círculo, que sea pequeño...pero visible!) superpuesto en el centro de uno de nuestros dos estímulos. Esto pasa cada ensayo, 250 ms después de que se dibujen los estímulos (cuadrado -  círculo). El dot permacerá en la pantalla, con los estímulos, hasta que se responda. Por ahora, haz que el dot aparezca siempre sobre el círculo.

PROBLEMA #15. Nuestro experimento va a pasar a tener 8 ensayos: 4 con el círculo a la izquierda, 4 con el círculo a la derecha. Ahora el dot aparecerá 6 ensayos sobre el círculo y 2 ensayos sobre el cuadrado. Además, de los 6 ensayos que aparece el dot sobre el círculo, 3 serán ensayos de círculo a la izquierda y 3 ensayos de círculo a la derecha. De modo similar, los dos ensayos de probe sobre el cuadrado, 1 será con el cuadrado a la izquierda y 1 con el cuadrado a la derecha. El orden de presentación de todos estos ensayos será aleatorio, como es habitual.

PROBLEMA #16. La respuesta correcta pasa a depender de la posición del dot, no del círculo.

PROBLEMA #17. Crea una variable llamada DATA en la que se guarde en filas distintas de una misma columna si la respuesta en cada ensayo ha sido la correcta o no. Puedes codificar con un 1 la respuesta correcta y con un 0 la incorrecta. DATA debe tener un numero de filas igual al número de ensayos (8 por ahora).

PROBLEMA #18. Haz que en la variable DATA se guarde también en otra columna si cada ensayo fue "congruente" o "incongruente". Los ensayos congruentes son aquellos en los que el dot aparece en el círculo. Es mejor que codifiques estas condiciones usando números, por ejemplo, un 1 significa que el ensayo fue congruente, un 2 que fue incongruente. Al final del experimento DATA tendría que tener dos columnas y 8 filas, una columna indicando si el ensayo fue in/congruente y otra indicando si la respuesta fue correcta o no.
