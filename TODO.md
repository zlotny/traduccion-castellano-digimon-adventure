# TODO — decisiones pendientes de revisión

- [ ] Cambiar Vamdemon por Myotismon (revisar si debe ser "Myotismon" a secas o "Amo
      Myotismon", como se decía a menudo en el doblaje ES España — pendiente de
      confirmar con subtítulos oficiales; también revisar la abreviatura de
      `names/names.json`, actualmente "Myotism.")
- [ ] Revisar Karigaoka/Hikarigaoka (el texto fuente del propio juego usa "Karigaoka"
      de forma sistemática en muchos ficheros — 3555-3557, 3560-3561, 3566, 3574,
      3576, 3586, 3610 — frente a "Hikarigaoka", que es el nombre canónico según
      `documentacion/03_lugares_terminologia.md`; decidir cuál usar en todo el proyecto)
- [ ] Revisar localización de nombres de Digimon en Castellano
- [ ] Revisar nombres de ataques/habilidades inventados en diálogo que aún no tienen
      traducción oficial en `eboot/skills_attacks.json` (p. ej. "Love Serenade"→
      "Serenata de Amor" en 3543, "Cat Kick!/Cat Punch!"→"Patada!/Zarpazo!" en 3554),
      para que cuando se traduzca ese fichero no queden dos nombres distintos para
      el mismo ataque
- [ ] Revisar los `speaker_id` de los ficheros de diálogo — llevan mal desde el
      principio (varios ficheros traen `speaker_id: 0` en todas las entradas, sin
      variación, obligando a atribuir personajes por contexto narrativo)
