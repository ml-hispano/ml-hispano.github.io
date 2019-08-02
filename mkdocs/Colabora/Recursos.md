# Colabora

Cualquiera con cuenta en GitHub puede modificar la documentación, pinchando en el lápiz y modificando directamente en GitHub los ficheros .md que se alojan bajo la carpeta /mkdocs, una vez aprobado el cambio se procederá a generar el site.

## Instrucciones para generar el site (Administradores)

Con el objetivo de agilizar el desarrollo y facilitar la colaboración utilizaremos la siguiente herramienta [MkDocs-DIY](https://deftwork.github.io/mkdocs-diy/), un proyecto derivado de [Mkdocs](https://www.mkdocs.org/), cuyo objetivo es generar y publicar de forma rápida y sencilla los cambios en el proyecto. Esta decisión no es inamovible, es un punto de partida inicial que puede ser sustituido a decisión de los integrantes.

El proceso a seguir es el siguiente:

### Clonar el repositorio

``` sh
git clone https://github.com/DeftWork/DiyBCI
cd DiyBCI
```

### Servir el site (opcional)

Esto sirve para ver una vista previa de como quedarían los cambios introducidos vía GitHub o para hacer modificaciones y ver el resultado en tiempo real.

``` sh
docker run -it --rm -v `pwd`:/mkdocs -p 7777:7777 elswork/mkdocs-diy mkdocs serve -a 0.0.0.0:7777
```

### Generar el site

En este paso se generan los archivos web (html, css, ...) en la carpeta /docs que forman la página de visualización gh-page .

``` sh
docker run -it --rm -v `pwd`:/mkdocs -p 7777:7777 elswork/mkdocs-diy mkdocs build
```

### Publicar en Github

Los miembros con permiso podrán subir el sitio directamente a GitHub, el resto puede hacer un pull request que se someterá a la revisión y aprobación de los administradores.