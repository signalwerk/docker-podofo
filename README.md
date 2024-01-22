# PoDoFo Docker Container

This Docker container provides an environment for building and using the PoDoFo library and its tools on Alpine Linux. PoDoFo is a free, portable C++ library that allows you to manipulate PDF files.

## Prerequisites

Docker installed on your system.

### Building the Docker Image

To build the Docker image with PoDoFo and its tools, follow these steps:

1. Ensure you have the provided Dockerfile in your working directory.
2. Open a terminal and navigate to the directory containing the Dockerfile.
3. Build the Docker image using the following command:

```sh
docker build -t podofo-alpine .
```

This command builds the Docker image and tags it as `podofo-alpine`.

## Running PoDoFo Tools

To run a PoDoFo tool on a file from your current working directory, use the following command structure:

```sh
docker run -v "$(pwd):/data" podofo-alpine [podofo-tool] /data/[filename]
```

Replace `[podofo-tool]` with the name of the PoDoFo tool you want to use.
Replace `[filename]` with the name of the file you want to process.

For example, to run `podofoimgextract` on a file named `example.pdf`, use:

```sh
docker run -v "$(pwd):/data" podofo-alpine podofoimgextract /data/example.pdf
```

This command mounts your current working directory to `/data` in the container, making example.pdf accessible to the PoDoFo tool.

### Running a Shell in the Container

```sh
docker run -v "$(pwd):/data" -it podofo-alpine /bin/sh
```

This command mounts your current working directory to `/data` in the container, making it accessible to the shell.

## Available Tools

PoDoFo includes several command-line tools for various PDF manipulations. Refer to the [PoDoFo documentation](https://github.com/podofo/podofo/tree/master/tools) for a complete list of tools and their usage.

### Examples of Using PoDoFo Tools

#### Uncompressing a PDF

```sh
docker run -v "$(pwd):/data" podofo-alpine podofouncompress /data/example.pdf /data/example_uncompress.pdf
```

#### Extracting Images from a PDF

for debugging pdfs

```sh
docker run -v "$(pwd):/data" podofo-alpine podofoimgextract /data/example.pdf
```

#### Converting color spaces by using Lua scripts

```sh
docker run -v "$(pwd):/data" podofo-alpine podofocolor lua convert.lua /data/example.pdf /data/example_convert.pdf
```
