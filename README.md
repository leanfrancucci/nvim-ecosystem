# Neovim Ecosystem

As we know, achieving a comfortable Vim or Neovim configuration is a painful
and tedious task, especially when changing our host machine, experimenting
with a new plugin or Neovim version, or updating all plugins at once.
This project allows us to deal with those issues running Neovim and our
desired configurations inside a Docker container.

This project contains two Dockerfiles, located in the nvim and nvim-c
directories. The first allows building a Docker image with Neovim and basic
tools and configurations, while the second provides a Docker image, based on
the previous one, with specific tools for C/C++ development.

The Dockerfile in the nvim directory is intended to be used as a base image.
It installs tools such as Cmake, tmux, fish, and Git, as well as Neovim
plugins like CoC and other AI-related ones.

The Dockerfile in the nvim-c directory, based on the nvim image, installs
specific tools for C/C++ development such as Clang, Gdb, Gcov, Lcov, Ceedling,
and Codechecker, among others.

This project was partially inspired by [nvim-ide](https://github.com/MashMB/nvim-ide).

## Build Docker base image

```sh
cd nvim
docker build -t nvim-ide \
             --build-arg user=$(id -un) \
             --build-arg group=$(id -gn) \
             -f Dockerfile \
             .
```

## Build Docker image for C/C++ development

```sh
cd nvim-c
docker build -t nvim-ide:c \
    --build-arg user=$(id -un) \
    --build-arg group=$(id -gn) \
    -f Dockerfile \
    .
```

## Usage

1. Basic use.

   ```sh
   cd <your-repository>
   docker run -it --rm \
       -v $PWD:/home/$(id -un)/workspace \
       -u $(id -un):$(id -gn) \
       --name nvim-ide \
       nvim-ide:c \
       nvim
   ```

2. Pass host environment variables to use AI plugins

   ```sh
   cd <your-repository>
   docker run -it --rm \
       -v $PWD:/home/$(id -un)/workspace \
       -u $(id -un):$(id -gn) \
       -e <LLM>_API_KEY:$<LLM>_API_KEY \
       --name nvim-ide \
       nvim-ide:c \
       nvim
   ```

3. Interact with nvim-ide mouting some dotfiles from the host machine.

   ```sh
   cd <your-repository>
   docker run -it --rm \
       -v ~/.bashrc:/$(id -un)/.bashrc \
       -v ~/.gitconfig:/home/$(id -un)/.gitconfig \
       -v ~/.tmux.conf:/home/$(id -un)/.tmux.conf \
       -v $PWD:/home/$(id -un)/workspace \
       -u $(id -un):$(id -gn) \
       --name nvim-ide \
       nvim-ide:c \
       fish
   ```

## Utilizing the clipboard from within a Docker container

To do it is necessary to handle X server authentication and establish a 
connection between the container and the host's X server. The $XAUTHORITY 
variable plays a crucial role in this process. It specifies the location 
of the X authority file, which contains the security credentials used to 
authorize connections to the X server.

Here's how to access the host's clipboard from a Docker container:

### Alternative 1: using `xhost`

Run the following command on the host before running the container.

```bash
xhost +local:$(id -un)
```

### Alternative 2: using `xauth`

1. Obtain X authentication token
    1. On the host machine, run `xauth list`
    2. Identify the line corresponding to your display (e.g., <hostname>/unix:0)
    3. Copy the entire line, which represents the X authentication token
2. Prepare the container
    1. Run the container

    ```bash
    docker run -it --rm \
        -v ~/.bashrc:/$(id -un)/.bashrc \
        -v ~/.gitconfig:/home/$(id -un)/.gitconfig \
        -v ~/.tmux.conf:/home/$(id -un)/.tmux.conf \
        -v $PWD:/home/$(id -un)/workspace \
        -e DISPLAY \
        -e GEMINI_API_KEY=$GEMINI_API_KEY \
        -e ANTHROPIC_API_KEY=$ANTHROPIC_API_KEY \
        -u $(id -un):$(id -gn) \
        --name nvim-ide \
        nvim-ide:c \
        fish
    ```

    2. Inside the Docker container, create the X authority file

    ```bash
    touch ~/.Xauthority
    ```

    3. Add the copied X authentication token to the container's X authority

    ```bash
    bash
    HEXKEY=<copy from host>
    xauth add $HOSTNAME/unix$DISPLAY MIT-MAGIC-COOKIE-1 $HEXKEY
    ```
