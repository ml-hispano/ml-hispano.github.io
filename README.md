# Portal for ML-Hispano @ GitHub

Este repositorio se representa en línea en [http://ml-hispano.github.io](http://ml-hispano.github.io), contiene una lista de repositorios que son de código abierto y mantenidos por equipos de ML-Hispano.

### Añadiendo un nuevo repositorio a la lista

Para que su repositorio se muestre en [http://ml-hispano.github.io](http://ml-hispano.github.io), un cambio menor a [orgs.js](js/orgs.js) es obligatorio.

* Para agregar un solo repositorio, agregue una nueva entrada a [orgs.js](js/orgs.js), especifique el nombre de la organización Github y el nombre del repositorio (sepárelos con `/`), y configure el `type` en `repo`, un ejemplo se puede ver a continuación:

```
  {
      "name": "RuntimeTools/appmetrics",
      "type": "repo"
  }
```

* Para agregar todos los repositorios en una organización Github, agregue una nueva entrada a [orgs.js](js/orgs.js), especifique el nombre de la organización Github, y configure el 'type' a `org`, se puede ver un ejemplo abajo:

```
  {
      "name": "IBMResilient",
      "type": "org"
  }
```

### Para probar cambios localmente

Desde dentro de la carpeta de nivel superior del repositorio clonado ejecute:

```
$ python -m http.server {port}
```

Por ejemplo: `python -m http.server 8000` -> Abra la siguiente URL en un navegador:

```
http://localhost:8000/
```

### Tutorial rápido de Git

1. Clona el repositorio y crea una nueva rama.

```
$ git clone https://github.com/ml-hispano/ml-hispano.github.io
$ git checkout -b branch_name
```

2. Actualiza los archivos que te gustaría cambiar.
3. Suba los cambios al repositorio

```
$ git add file1 file2
$ git commit -m "add your commit message here"
$ git push origin branch_name
```

4. Vea su rama en Github y cree una Solicitud de Cambio
