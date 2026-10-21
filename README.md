# Digimon Adventure (PSP) — Traducción al Castellano

Traducción al español de España del juego **Digimon Adventure** para PSP (2013), basada en el parche inglés v1.2. La terminología, los nombres de personajes y los niveles de evolución siguen los patrones de la localización española emitida originalmente en **La 2**.

> Para saber cómo realizar o contribuir a la traducción, consulta la herramienta que utilizo para la creación de este parche: [digimon-adventure-psp-translation-kit](https://github.com/zlotny/digimon-adventure-psp-translation-kit)

---

## Estado

<!-- progress-start -->
**Progreso total:** `██████████████████████████████` **100.0%** (17031/17031 líneas)

### Resumen

| Categoría | Líneas | Progreso |
|-----------|-------:|----------|
| Diálogos  | 14028/14028 | `███████████████` 100.0% |
| EBOOT     | 2524/2524   | `███████████████` 100.0% |
| Nombres   | 201/201   | `███████████████` 100.0% |
| UI / otros | 58/58 | `███████████████` 100.0% |
| Imágenes (texto en banners/UI) | 220/220 | `███████████████` 100.0% |
| **Total** | **17031/17031** | `███████████████` **100.0%** |

### Progreso por arco

| Arco | Líneas | Progreso |
|------|-------:|----------|
| Arco Devimon (Eps 1–13) | 3097/3097 | `███████████████` 100.0% |
| Arco Etemon (Eps 14–20) | 1618/1618 | `███████████████` 100.0% |
| Arco Myotismon (Eps 21–39) | 3373/3373 | `███████████████` 100.0% |
| Arco Dark Masters (Eps 40–52) | 2418/2418 | `███████████████` 100.0% |
| Arco Apocalymon (Eps 53–54) | 762/762 | `███████████████` 100.0% |
| Película: Our War Game! | 349/349 | `███████████████` 100.0% |
| Escenas originales / minijuegos | 1647/1647 | `███████████████` 100.0% |
| Dungeon crossover (otras series Digimon) | 764/764 | `███████████████` 100.0% |
<!-- progress-end -->

---

## Audio y vídeo

El **vídeo de apertura** (opening de la serie) y el **tema musical del menú
principal** llevan también audio doblado al castellano, extraído, traducido
y recodificado a ATRAC3+ con el propio toolkit.

---

## Cómo aplicar el parche

El parche distribuible (`translation_patch.xdelta`) se aplica sobre la **ISO original japonesa** del juego. Necesitas:

- La ROM original: `3161 - Digimon Adventure (Japan).iso` (dump No-Intro)
- El fichero de parche: `translation_patch.xdelta`
- [xdelta3](https://github.com/jmacd/xdelta-gpl/releases) para aplicarlo

```bash
xdelta3 -d -s "3161 - Digimon Adventure (Japan).iso" \
    translation_patch.xdelta \
    "Digimon Adventure (Castellano).iso"
```

La ISO resultante se puede cargar directamente en **PPSSPP** u otros emuladores de PSP.

> El parche modifica el archivo `FILEDATA.CPK` (un contenedor CRI con todos los textos del juego) y el ejecutable `EBOOT.BIN`. La herramienta de traducción se encarga de desempaquetar el CPK, inyectar los textos traducidos y reempaquetarlo, generando tanto la ISO completa como el xdelta automáticamente.

---

## Cobertura de episodios

| Rango de ficheros | Contenido |
|-------------------|-----------|
| 3520–3533 | Episodios 1–13 (arco Devimon) |
| 3534–3540 | Episodios 14–20 (arco Etemon) |
| 3541–3561 | Episodios 21–39 (arco Myotismon) |
| 3562–3574 | Episodios 40–52 (arco Dark Masters) |
| 3575–3580 | Episodios 53–54 (arco Apocalymon) |
| 3581–3622 | Escenas originales del juego y batallas |
