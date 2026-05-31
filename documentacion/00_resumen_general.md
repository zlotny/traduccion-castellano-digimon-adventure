# Digimon Adventure — Visión General para Traducción (es_ES)

## Información General

| Campo | Dato |
|-------|------|
| Título original | Digimon Adventure (デジモンアドベンチャー) |
| Título (España) | Digimon |
| Título (LA) | Digimon: Digital Monsters |
| Estudio | Toei Animation |
| Cadena | Fuji TV |
| Episodios | 54 |
| Estreno (Japón) | 7 de marzo de 1999 - 26 de marzo de 2000 |
| Estreno (España) | 28 de febrero de 2000 |
| Estreno (LA) | 1 de julio de 2000 (preestreno 25 de junio) |
| Dirección | Hiroyuki Kakudo |
| Guion | Satoru Nishizono |
| Música | Takanori Arisawa |

## Películas

1. **Digimon Adventure (OVA)** — Precuela. Primer encuentro de Taichi y Hikari con Digimon (4 años antes).
2. **Our War Game!** (¡Nuestro juego de guerra!) — Secuela post-serie, con Diaboromon y Omegamon.

## Videojuego para PSP

| Campo | Dato |
|-------|------|
| Título | Digimon Adventure RPG |
| Lanzamiento | 17 de enero de 2013 |
| Género | RPG por turnos |
| Basado en | El anime + película Our War Game! |
| Novedades | Argumento expandido, decisiones del jugador, relaciones entre personajes |

Este es el juego que estamos parcheando al castellano. El parche original (v1.2) es inglés EN.

## Sobre el parche de traducción es_ES

El parche original en inglés (v1.2) modificó:
1. **FILEDATA.CPK** — Archivos de diálogo en formato ESDF
2. **EBOOT.BIN** — Ejecutable (soporte de texto en inglés)
3. **PARAM.SFO** — Título del juego
4. **OPNSSMP.BIN** — Script de la cinemática de apertura
5. **PNGs** — ICON0.PNG, PIC1.PNG (sin texto)

Para la traducción al español (es_ES):
- Los textos extraídos están en `translations/` en formato JSON
- Hay que traducir el campo "translation" de cada entrada
- Los archivos de diálogo principales son los IDs 3520-3548
- Los archivos se pueden modificar in-place (mismo tamaño o menor, con relleno de ceros)
- No hay que tocar el EBOOT.BIN si ya funciona con caracteres latinos
- No hay que tocar imágenes si no contienen texto

## Voces del doblaje (España)

| Personaje | Actor/Actriz de doblaje |
|-----------|------------------------|
| Taichi Yagami | Blanca Rada |
| Yamato Ishida | Mariano García |
| Sora Takenouchi | Marta Sainz |
| Koshiro Izumi | Raquel Martín |
| Mimi Tachikawa | Pepa Agudo |
| Joe Kido | José María Carrero |
| Takeru Takaishi | Diana Torres |
| Hikari Yagami | Rocío Azofra |
| Agumon | Rafael Calvo |
| Gabumon | Eugenio Barona |
| Piyomon | Diana Torres |
| Tentomon | José María Carrero |
| Palmon | Raquel Martín |
| Gomamon | Rais David Bascones |
| Patamon | Pepa Agudo |
| Tailmon | Marta Sainz |

## Notas culturales para la traducción
- La serie usa nombres japoneses completos (apellido + nombre). ES España mantuvo los nombres japoneses.
- En EP25 Mimi canta "I Wish" (el ending real interpretado por su actriz de voz).
- "Odaiba" es un distrito real de Tokyo donde viven los personajes.
- "Hikarigaoka" es otro barrio de Tokyo donde vivían cuando eran pequeños.
- La profecía de las "6 horas, 6 minutos, 6 segundos" (EP38) hace referencia al número de la bestia.
- Los niveles de digievolución tienen traducción distinta en ES España respecto a LA.