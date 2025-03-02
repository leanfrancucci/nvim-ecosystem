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

This project is partially inspired by [nvim-ide](https://github.com/MashMB/nvim-ide).
