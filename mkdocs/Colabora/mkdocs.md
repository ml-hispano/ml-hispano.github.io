# MkDocs-DIY

A [Docker](http://docker.com) file to build images for AMD & ARM devices with a installation of [MkDocs](https://www.mkdocs.org/) that is a fast, simple and downright gorgeous static site generator that's geared towards building project documentation. Documentation source files are written in Markdown, and configured with a single YAML configuration file. [Documentation](https://deftwork.github.io/mkdocs-diy/) for this container is written using itself.

!!! warning
    Be aware! You should read carefully the usage documentation of every tool!

## Thanks to

- [MkDocs](https://www.mkdocs.org/)
- [Material for MkDocs](https://squidfunk.github.io/mkdocs-material/)
- All the extensions and packages that made this possible.

## Details

- [GitHub](https://github.com/DeftWork/mkdocs-diy)
- [Deft.Work my personal blog](http://deft.work)

| Docker Hub | Docker Pulls | Docker Stars | Docker Build | Size/Layers |
| --- | --- | --- | --- | --- |
| [mkdocs-diy](https://hub.docker.com/r/elswork/mkdocs-diy "elswork/mkdocs-diy on Docker Hub") | [![](https://img.shields.io/docker/pulls/elswork/mkdocs-diy.svg)](https://hub.docker.com/r/elswork/mkdocs-diy "mkdocs-diy on Docker Hub") | [![](https://img.shields.io/docker/stars/elswork/mkdocs-diy.svg)](https://hub.docker.com/r/elswork/mkdocs-diy "mkdocs-diy on Docker Hub") | [![](https://img.shields.io/docker/build/elswork/mkdocs-diy.svg)](https://hub.docker.com/r/elswork/mkdocs-diy "mkdocs-diy on Docker Hub") | [![](https://images.microbadger.com/badges/image/elswork/mkdocs-diy.svg)](https://microbadger.com/images/elswork/mkdocs-diy "mkdocs-diy on microbadger.com") |

## Docker Image Build Instructions

Build for amd64 or armv7l architecture (thanks to its [Multi-Arch](https://blog.docker.com/2017/11/multi-arch-all-the-things/) base image)

``` sh
docker build -t elswork/mkdocs-diy .
```

## Usage

The most interesting commands of MkDocs are **serve** and **build**, depending on your development environment you can use Make (Makefile) commands that are easier to remember, otherwise you must use docker standard commands. 

### Serve 

Start the live-reloading docs server to preview site while perform changes.

``` sh
make serve
``` 
Or
``` sh
docker run -it --rm -v $(CURDIR):/mkdocs -p 7777:7777 elswork/mkdocs-diy mkdocs serve -a 0.0.0.0:7777
``` 
Point your browser to `http://host-ip:7777` to preview site.

### Build

It generates all the website static files inside **/docs** subfolder.

``` sh
make build
``` 
Or
``` sh
docker run -it --rm -v $(CURDIR):/mkdocs -p 7777:7777 elswork/mkdocs-diy mkdocs build
``` 

## Use of mermaid diagrams

This image is also configured to use [Mermaid Diagrams](https://mermaidjs.github.io) that allow the generation of diagrams and flowcharts from text in a similar manner as markdown.
You can use its official [Live editor](https://mermaidjs.github.io/mermaid-live-editor) to develop your diagrams (Flowchart, Sequence diagram, Gantt diagram, Class diagram, Git graph)

Example:

```` markdown
``` mermaid
graph TD;
    A-->B;
    A-->C;
    B-->D;
    C-->D;
```
````

Result:

``` mermaid
graph TD;
    A-->B;
    A-->C;
    B-->D;
    C-->D;
```