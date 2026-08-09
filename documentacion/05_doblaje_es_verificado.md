# Doblaje ES España — Nombres verificados

> Consolida y corrige `01_personajes.md` y `03_lugares_terminologia.md` cruzando dos
> bases de datos de doblaje independientes: `eldoblaje.com` y la Doblaje España Wiki.
> Cualquier nombre de Digimon marcado aquí como confirmado prevalece sobre lo que diga
> cualquier otro documento del proyecto.

## Fuentes

| Fuente | URL | Método |
|--------|-----|--------|
| eldoblaje.com | `https://eldoblaje.com/datos/FichaPelicula.asp?id=929` | `curl` directo + parseo propio de la tabla HTML (196 personajes/intervenciones) |
| Doblaje España Wiki (Fandom) | `https://doblaje-espana.fandom.com/es/wiki/Digimon` | Volcado HTML de la página + parseo propio de las 4 tablas de reparto. `WebFetch` devuelve 402 Payment Required en este dominio; no es accesible directamente, hace falta un `.html`/`.htm` local de la página |

El resumen automático de una página vía `WebFetch` puede transcribir mal nombres
propios (ha ocurrido con "Kokatorimon", transcrito como "Kokatoremon") — para grafías
exactas, `curl` directo + parseo del HTML es más fiable.

La ficha de eldoblaje.com tilda sistemáticamente la sílaba final de los nombres
transliterados ("Myotismón", "Gatomón", "Etemón", "Puppetmón"...); es una convención de
esa base de datos, no la grafía a usar en el juego, que se escribe sin esa tilde
("Myotismon", "Gatomon"), igual que ya hace `names/names.json` para los nombres que
tenía bien.

## El doblaje ES España usa mayoritariamente los nombres del doblaje americano (Saban), no los nombres japoneses

Para los antagonistas principales y varios Digimon secundarios, ambas fuentes coinciden
en un patrón claro: el doblaje español no tradujo el nombre japonés original, sino que
heredó (con muy poca adaptación) el nombre ya angilizado por Saban para EE.UU.

## Tabla de correcciones

| Nombre japonés/interno del juego | Nombre de doblaje ES | Entradas en `dialog/*.json` (campo `translation`) | `names/names.json` |
|---|---|---|---|
| Vamdemon / VenomVamdemon | **Myotismon** / **VenomMyotismon** | 76 entradas, 17 ficheros | `"Myotism."` / `"VenomMyotism."` |
| Tailmon | **Gatomon** | 39 entradas, 14 ficheros | `"Gatomon"` |
| Piemon | **Piedmon** | 17 entradas, 7 ficheros | `"Piedm."` (abreviado, no cabe entero en el límite de 6 bytes de esa entrada) |
| Mugendramon | **Machinedramon** | 13 entradas, 5 ficheros | `"Machinedra."` (abreviado, no cabe entero en el límite de 11 bytes de esa entrada) |
| Pinochimon (el juego trae "Pinocchimon" en inglés) | **Puppetmon** | 27 entradas, 7 ficheros | `"Puppetmon"` |
| Wizarmon | **Wizardmon** | 12 entradas, 4 ficheros | `"Wizardm."` (abreviado, no cabe entero en el límite de 8 bytes de esa entrada) |
| PicoDevimon | **DemiDevimon** | 21 entradas, 7 ficheros | `"DemiDevimon"` |
| Cockatrimon | **Kokatorimon** | 3 entradas, 1 fichero | `"Kokatorimon"` |
| Vadermon (errata del propio parche EN) | **Vademon** | 6 entradas | `"Vademon"` |

Las tres abreviaturas de `names/names.json` que no caben con el nombre completo siguen
el mismo patrón que ya usaba el fichero para Myotismon: cortar el sufijo final "-on"/
"-mon" y añadir un punto.

El texto fuente en inglés del propio juego usa "Mugendramon" en vez de "Machinedramon"
— el límite de bytes de cada línea de diálogo que menciona a este villano está
calculado sobre el nombre corto japonés, 2 caracteres más corto que el nombre de
doblaje. Cualquier línea que mencione a este personaje y tenga poco margen puede
necesitar un recorte de texto para que quepa "Machinedramon".

`01_personajes.md` usa Myotismon, VenomMyotismon, Puppetmon, Machinedramon, Piedmon,
Gatomon y Wizardmon. `03_lugares_terminologia.md` refleja los mismos nombres.

## Reparto verificado — Niños Elegidos y sus Digimon

| Personaje | Actor ES (eldoblaje.com) | Actor ES (wiki) | Coincide |
|-----------|--------------------------|------------------|----------|
| Taichi "Tai" Yagami | Blanca Rada | Blanca Rada | ✅ |
| Yamato "Matt" Ishida | Mariano García | Mariano García | ✅ |
| Sora Takenouchi | Marta Sainz | Marta Sainz | ✅ |
| Koshiro "Izzy" Izumi | Raquel Martín | Raquel Martín | ✅ |
| Mimi Tachikawa | Pepa Agudo | Pepa Agudo | ✅ |
| Joe Kido | José María Carrero | José María Carrero | ✅ |
| Takeru "T.K." Takaishi | Diana Torres | Diana Torres | ✅ |
| Hikari "Kari" (1x21) | Marta Sainz | Marta Sainz (1x21) | ✅ |
| Hikari "Kari" (resto) | Rocío Azofra | Rocío Azofra | ✅ |

El resto del elenco de Digimon recogido en `01_personajes.md` ("Actores de los
Digimon") coincide con ambas fuentes.

## Villanos principales confirmados (ambas fuentes)

| Personaje | Actor ES |
|-----------|----------|
| Devimon | Rais David Báscones |
| Etemon | Juan Carlos Lozano |
| MetalEtemon | Francisco Andrés Valdivia |
| **Myotismon** | Francisco Andrés Valdivia |
| **VenomMyotismon** | Francisco Andrés Valdivia (interior: José María Carrero) |
| MetalSeadramon | Francisco Andrés Valdivia |
| **Puppetmon** | Blanca Rada |
| **Machinedramon** | José María Carrero |
| **Piedmon** | Rais David Báscones |
| Apocalymon | Jorge Teixeira |

## Digimon secundarios confirmados (correcciones relevantes)

| Personaje | Actor ES | Nota |
|-----------|----------|------|
| **Gatomon** | Marta Sainz | No "Tailmon" |
| **DemiDevimon** | Blanca Rada | No "PicoDevimon" |
| **Wizardmon** | Rais David Báscones | No "Wizarmon" |
| **Kokatorimon** | José María Carrero | No "Cockatrimon"/"Kokatoremon" |
| Vademon | Francisco Andrés Valdivia | Digimon distinto de Vegiemon; en el juego aparece mal escrito "Vadermon" |
| **Amo Bakemon** | Juan Carlos Lozano | Bakemon con crédito propio que lidera al resto en el Cementerio Overdel, distinto de los Bakemon genéricos |

## Tratamiento de Myotismon en diálogo

En diálogo se dirige a Myotismon como **"Amo Myotismon"** ("Amo VenomMyotismon" en su
forma evolucionada), no "Myotismon" a secas ni "Señor Myotismon". Las fichas de reparto
acreditan solo el nombre base "Myotismon" porque acreditan personajes, no fórmulas de
tratamiento usadas dentro de un diálogo — hay precedente del patrón "Amo ___" en esta
misma ficha con "Amo Bakemon".

## Apellido de la familia de Tai/Kari: Yagami

Las dos fichas de reparto se contradicen entre sí:

- **eldoblaje.com**: "Yagami" — 6/6 apariciones (Taichi, Hikari ×2, Yuuko ×2, Susumu).
- **Doblaje España Wiki**: "Kamiya" — todas las apariciones de esta familia (Tai Kamiya,
  Kari Kamiya, Susumu Kamiya). Es el apellido que aparece en los guiones de Saban para
  EE.UU. (una romanización distinta de 八神, arrastrada luego a otros doblajes).

Confirmado revisando la serie original: es **"Yagami"**. Coincide con lo que ya usaba
el texto fuente en inglés del juego (`names/names.json`) y el 100% del diálogo
traducido.

## Topónimos y terminología de niveles, confirmados con la serie original

- **Hikarigaoka → Hikarioka**: el guion escrito trae a veces "Hikarigaoka" (y el propio
  texto fuente del juego usa "Karigaoka" en varios ficheros), pero los actores de
  doblaje dicen siempre "Hikarioka". Se usa esta forma en todo el proyecto.
- **Village of Beginnings → Ciudad de los Bebés**, no "Aldea del Comienzo".
- **Niveles de digievolución**: Bebé, Novato, Campeón, Cuerpo Perfecto, Cuerpo Supremo
  (tabla completa y mapeo contra Rookie/Champion/Ultimate/Mega en
  `03_lugares_terminologia.md`).

## Ficheros fuente

El HTML crudo de ambas fuentes no está versionado en el repositorio. Para repetir el
análisis: `curl` directo a la URL de eldoblaje.com (es de acceso público); para la
wiki, un volcado HTML nuevo de la página, ya que `WebFetch` no puede acceder
directamente a ese dominio.
