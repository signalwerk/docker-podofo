# Use Alpine Linux as the base image
FROM alpine:latest

# Install build dependencies including make, gcc and g++
RUN apk add --no-cache \
    git \
    cmake \
    make \
    gcc \
    g++ \
    lua-dev \
    freetype-dev \
    fontconfig-dev \
    openssl-dev \
    libxml2-dev \
    zlib-dev \
    jpeg-dev \
    tiff-dev \
    libpng-dev \
    libidn-dev

# Clone the PoDoFo repository
RUN git clone https://github.com/podofo/podofo.git

# Create a build directory
RUN mkdir /podofo/build

# Set the working directory to the build directory
WORKDIR /podofo/build

# Configure the build with CMake, including the tools
RUN cmake -DCMAKE_BUILD_TYPE=Release -DPODOFO_BUILD_TOOLS=TRUE ..

# Compile PoDoFo and its tools
RUN cmake --build . --config Release

# Install PoDoFo
RUN make install

# Set the default command
CMD ["sh"]