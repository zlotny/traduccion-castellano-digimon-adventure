# Digimon Adventure (PSP) — Traducción al Castellano

Traducción al español de España del juego **Digimon Adventure** para PSP (2013), basada en el parche inglés v1.2. La terminología, los nombres de personajes y los niveles de evolución siguen los patrones de la localización española emitida originalmente en **La 2**.

> Para saber cómo realizar o contribuir a la traducción, consulta la herramienta que utilizo para la creación de este parche: [digimon-adventure-psp-translation-kit](https://github.com/zlotny/digimon-adventure-psp-translation-kit)

---

## Estado

<!-- progress-start -->
**Progreso total:** `███████████████████░░░░░░░░░░░` **62.5%** (9400/15037 líneas)

### Resumen

| Categoría | Líneas | Progreso |
|-----------|-------:|----------|
| Diálogos  | 8960/12867 | `██████████░░░░░` 69.6% |
| EBOOT     | 238/1695   | `██░░░░░░░░░░░░░` 14.0% |
| Nombres   | 201/201   | `███████████████` 100.0% |
| UI / otros | 1/274 | `░░░░░░░░░░░░░░░` 0.4% |
| **Total** | **9400/15037** | `█████████░░░░░░` **62.5%** |

### Progreso por arco

| Arco | Líneas | Progreso |
|------|-------:|----------|
| Arco Devimon (Eps 1–13) | 3007/3007 | `███████████████` 100.0% |
| Arco Etemon (Eps 14–20) | 1589/1589 | `███████████████` 100.0% |
| Arco Myotismon (Eps 21–39) | 3119/3119 | `███████████████` 100.0% |
| Arco Dark Masters (Eps 40–52) | 1245/2307 | `████████░░░░░░░` 54.0% |
| Arco Apocalymon (Eps 53–54) | 0/726 | `░░░░░░░░░░░░░░░` 0.0% |
| Película: Our War Game! | 0/349 | `░░░░░░░░░░░░░░░` 0.0% |
| Escenas originales / minijuegos | 0/1046 | `░░░░░░░░░░░░░░░` 0.0% |
| Dungeon crossover (otras series Digimon) | 0/724 | `░░░░░░░░░░░░░░░` 0.0% |
<!-- progress-end -->

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
