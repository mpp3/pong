# PONG

En esta práctica vas a escribir un programa que produzca el siguiente resultado:

![Pong](pong.mp4)
<video src="pong.mp4"></video>

Los rectángulos se mueven con el teclado. El rectángulo rojo se mueve con las teclas `W` y `S`, el rectángulo verde con las flechas.

Los rectángulos no pueden moverse fuera de la ventana.

## Conceptos usados

- Variables.
- Tipos de datos: `int`, `float`, `bool`, `string`.
- Sentencias condicionales: `if`.
- Bucles: `while`.
- Funciones.

## Conceptos nuevos

- Tipo de datos `struct`.
- Programas gráficos:
  - Fotograma
  - Bucle principal
  - Teclado y ratón

## Clona el proyecto

Abre un terminal y escribe:

``` bash
cd ~
git clone https://gitlab.gototic.com/root/pong.git
cd pong
```

Si tienes una cuenta de GitHub o GitLab, y quieres guardar allí tu copia del proyecto, crea un proyecto nuevo vacío en tu cuenta de GitHub o GitLab, copia la URL del proyecto, y ejecuta:

``` bash
git remote add origin <URL del proyecto en GitHub/GitLab>
git push -u origin main
```

## Escribe el código

### Estructura del programa

En primer lugar tienes que incluir las librerías `"ticlib.h"` y `"raylib.h"`.

Dentro del programa principal (`main`), distinguiremos tres partes:
- Abrir la ventana y crear las variables (sobre todo, las posiciones y velocidades de los objetos).
- Bucle principal
- Finalización (sólo hay que cerrar la ventana).

En el bucle principal distinguiremos tres secciones:
- Detección de las pulsaciones de las teclas o movimiento del ratón.
- Actualización de las posiciones de los objetos.
- Dibujo de los objetos.

```c++
int main()
{
    // Abrir la ventana
    InitWindow(anchura, altura, título);
    // Crear las variables necesarias

    while (!WindowShouldClose())
    {
        // Detectar pulsaciones de teclas
        // Actualizar posiciones de objetos
        // Dibujar objetos
    }

    CloseWindow();
}
```

### Variables necesarias

Como se ve en el vídeo, tenemos que dibujar tres objetos: un círculo y dos rectángulos.

Cada uno de ellos tiene una posición, definida por dos coordenadas (horizontal y vertical), y una velocidad (también con dos componentes, vertical y horizontal). Por lo tanto, necesitaremos cuatro variables para cada objeto. Con el fin de mantener las variables organizadas y el código más legible, vamos a crear un `struct` para cada objeto, cada uno con dos miembros: la posición y la velocidad. Esos dos miembros tienen, a su vez, dos miembros cada uno: la componente horizontal y la vertical. Sin embargo, vamos a aprovechar que la librería tiene un tipo de datos `struct` ya definido, justo para objetos como los que necesitamos (posiciones, velocidades,...), con dos miembros llamados `x` e `y`. Se trata del tipo `Vector2`, que tiene dos miembros de tipo `float`, llamados `x` e `y`.

Además, los rectángulos tienen una anchura y una altura, y la bola un radio. Ambos tienen, además, un color.

Los colores se especifican con su nombre (en inglés, y con las letras mayúsculas, como `YELLOW`).

### Detección de las teclas

Para saber si una tecla está pulsada, usamos una sentencia `if` como la siguiente:

``` c++
if (IsKeyDown(KEY_W))
{
    jugador1.pos.y = jugador1.pos.y - jugador1.vel.y;
}
```

### Actualización de las posiciones

Las posiciones de los rectángulos se actualizan al detectar las teclas. Para ellos, lo único que hay que hacer en esta sección es comprobar que no han llegado a los bordes, ya que no deben poder moverse fuera de la ventana. Eso lo logramos con una sentencia `if` como esta:

``` c++
if (jugador1.pos.y < 0)
{
    jugador1.pos.y = 0;
}
```

Otra opción sería añadir la condición `jugador1.pos.y > 0` a la sentencia `if` que usamos para detectar la tecla `KEY_W` y hacer el movimiento correspondiente. De este modo, la sentencia `if` sólo se ejecutará si, además de estar pulsada la tecla `W`, el rectángulo no ha llegado al borde superior de la ventana.

Para el borde inferior, sería necesaria una comprobación similar.

Para actualizar la posición de la bola hay que sumar la velocidad a cada coordenada. Esto no hay que ponerlo dentro de ninguna sentencia `if`, porque debe realizarse siempre.

``` c++
bola.pos.x = bola.pos.x + bola.vel.x;
bola.pos.y = bola.pos.y + bola.vel.y;
```

Para que la bola rebote, lo que hacemos es cambiar el signo de la velocidad cuando la bola ha llegado a un borde de la ventana. Por ejemplo, para el rebote en los bordes verticales (izquierdo y derecho), podemos hacer esto:

``` c++
if (jugador1.pos.x < bola.radio || jugador1.pos.x > anchura_ventana - bola.radio)
{
    jugador1.vel.x = - jugador1.vel.x;
}
```

### Dibujar los objetos

Recuerda que todas las operaciones de dibujo deben ir precedidas por `BeginDrawing();`, y deben terminar con `EndDrawing();`.

Para dibujar un círculo, usa la operación:

``` c++

DrawCircle(x, y, radio, color);
```

Para dibujar un rectángulo, usa la operación:

``` c++
DrawRectangle(x, y, anchura, altura, color);
```

## Compilar el programa

Puedes compilar el programa para ejecutarlo en el escritorio, o para ejecutarlo en la web.

Para compilar el programa para ejecutarlo en el escritorio, ejecuta:

``` bash
./compile.sh
```

Para compilar el programa para ejecutarlo en la web, escribe:

``` bash
./compile4web.sh
```

Si quieres ejecutar el programa en la web, necesitarás algún lugar donde alojar los archivos generados por el compilador. Puedes hacerlo en /GitHub Pages/ o en /GitLab Pages/, si dispones de cuenta en esas plataformas. En ese caso, con actualizar el repositorio será suficiente.

## Actualizar el repositorio

Cuando quieras actualizar el repositorio con tu versión local, escribe:

``` bash
git commit -a -m "Mensaje que quieras"
git push
```

## Ejecutar el programa

Para ejecutar el programa, escribe en el terminal:

``` bash
bin/pong
```
