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
- [ ] Revisar "Aldea del Comienzo" (así aparece en `documentacion/03_lugares_terminologia.md`
      y así se usa en 3577 y ahora también en 3540) vs "Ciudad de los Bebés" — recuerdo
      haber visto un capítulo de la serie doblado donde se llamaba "Ciudad de los Bebés".
      Revisar cuál es el término real del doblaje ES España.
- [ ] Revisar toda la nomenclatura de niveles de evolución de los Digimon (Cuerpo
      Novato/Maduro/Perfecto/Supremo, etc.) — hay una discrepancia real: `documentacion/
      03_lugares_terminologia.md` mapea Champion→Cuerpo Maduro, Ultimate→Cuerpo Perfecto,
      Mega→Cuerpo Supremo (asumiendo la nomenclatura del doblaje/Bandai USA), pero el
      texto fuente del propio juego (confirmado en 3571 y 3573) usa "Ultimate" para
      referirse a formas que son de nivel Mega (WarGreymon, MetalGarurumon) — como si
      siguiera la nomenclatura japonesa/original en vez de la de Bandai USA, donde los
      niveles en inglés son: Baby I/II → Child → **Adult** → **Perfect** → **Ultimate**
      (JP) en vez de Fresh → In-Training → Rookie → **Champion** → **Ultimate** → **Mega**
      (dub USA) — la colisión está en que el "Perfect" japonés equivale al "Ultimate" del
      dub USA, y el "Ultimate" japonés equivale al "Mega" del dub USA. Para buscar
      referencias, los términos en inglés a tener en cuenta son: Champion/Adult,
      Ultimate/Perfect, Mega/Ultimate (según qué nomenclatura use la fuente que se consulte).
