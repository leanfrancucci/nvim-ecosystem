# Docker file for base Neovim image.
#
# @author Leandro Francucci

# Debian image as base
FROM debian:12

# Set image locale.
ENV LANG=en_US.UTF-8
ENV LANGUAGE=en_US:en
ENV TZ=America/Argentina/Buenos_Aires

# Set terminal
ENV TERM=tmux-256color

# Expose some ports to host by default.
EXPOSE 8080 8081 8082 8083 8084 8085

# Define which Neovim COC extensions should be installed.
ARG COC='coc-word coc-webview coc-terminal coc-tasks coc-syntax coc-symbol-line coc-snippets coc-pairs coc-lists coc-highlight coc-git coc-emoji coc-docker coc-dictionary coc-diagnostic coc-clang-format-style-options coc-yaml coc-sh coc-pyright coc-markdownlint coc-markdown-preview-enhanced coc-lua coc-json coc-cmake coc-clangd'

# Lazygit variables
ARG LG='lazygit'
ARG LG_GITHUB='https://github.com/jesseduffield/lazygit/releases/download/v0.31.4/lazygit_0.31.4_Linux_x86_64.tar.gz'
ARG LG_ARCHIVE='lazygit.tar.gz'

# GIT Flow variables
ARG GIT_FLOW_GITHUB='https://github.com/petervanderdoes/gitflow-avh.git'
ARG GIT_FLOW_DIR='gitflow-avh'

# Update repositories and install software:
RUN apt-get update && \
    apt-get -y install \
    locales \
    locales-all \
    curl \
    fzf \
    ripgrep \
    tree \
    git \
    xclip \
    python3 \
    python3-pip \
    nodejs \
    npm \
    tzdata \
    ninja-build \
    gettext \
    libtool \
    libtool-bin \
    autoconf \
    automake \
    cmake \
    g++ \
    pkg-config \
    zip \
    unzip \
    clangd-19 \
    tmux \
    fish \
    clang-tidy \
    clang-format \
    && rm -rf /var/lib/apt/lists/*

# Install a specific and modern version of clang-format
RUN echo "deb http://apt.llvm.org/bookworm/ llvm-toolchain-bookworm-18 main" >> /etc/apt/sources.list && \
    echo "# deb-src http://apt.llvm.org/bookworm/ llvm-toolchain-bookworm-18 main" >> /etc/apt/sources.list
#RUN echo "deb http://apt.llvm.org/bookworm/ llvm-toolchain-bookworm-19 main" >> /etc/apt/sources.list && \
    #echo "# deb-src http://apt.llvm.org/bookworm/ llvm-toolchain-bookworm-19 main" >> /etc/apt/sources.list
RUN curl -o llvm-snapshot.gpg.key https://apt.llvm.org/llvm-snapshot.gpg.key && \
    apt-key add llvm-snapshot.gpg.key && \
    apt-get update && apt-get install -y clang-format-18 && \
    #clang-19 clang-tools-19 libclang1-19 clang-format-19 clangd-19 clang-tidy-19 && \
    ln -sfn /usr/bin/clang-format-18 /usr/bin/clang-format && \
    ln -sfn /usr/share/vim/addons/syntax/clang-format-18.py /usr/share/vim/addons/syntax/clang-format.py

# Cooperate Neovim with Python 3.
RUN pip3 install pynvim --break-system-packages

# Cooperate NodeJS with Neovim.
RUN npm i -g neovim

# Install Neovim from source.
RUN mkdir -p /root/TMP
RUN cd /root/TMP && git clone --depth 1 --branch stable https://github.com/neovim/neovim.git
RUN cd /root/TMP/neovim && make CMAKE_BUILD_TYPE=RelWithDebInfo -j4 && make install
RUN rm -rf /root/TMP

# Create a custom user with UID 1234 and GID 1234
ARG user=appuser
ARG group=appgroup
RUN groupadd -g 1000 $group && \
    useradd -m -u 1000 -g $group $user
 
# Switch to the custom user
USER $user

# Create directory for Neovim spell check dictionaries.
RUN mkdir -p /home/${user}/.local/share/nvim/site/spell

# Copy Neovim dictionaries.
COPY ./spell/ /home/${user}/.local/share/nvim/site/spell/

# Install Vim Plug.
RUN curl -fLo /home/${user}/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Create directory for Neovim configuration files.
RUN mkdir -p /home/${user}/.config/nvim

# Copy Neovim configuration files.
COPY ./config/ /home/${user}/.config/nvim/

# Install Neovim extensions.
RUN nvim --headless +PlugInstall +qall

# Create directory for Neovim COC extensions.
RUN mkdir -p /home/${user}/.config/coc/extensions

# Install Neovim COC extensions.
USER root
RUN cd /home/${user}/.config/coc/extensions && npm install $COC --global --only=prod
USER $user

# Create TMP directory
#RUN mkdir -p /root/TMP
#RUN mkdir -p /home/${user}/TMP

## Install Lazygit from binary
#RUN cd /root/TMP && curl -L -o $LG_ARCHIVE $LG_GITHUB
#RUN cd /root/TMP && tar xzvf $LG_ARCHIVE && mv $LG /usr/bin/

## Install GIT Flow
#RUN cd /root/TMP && git clone $GIT_FLOW_GITHUB
#RUN cd /root/TMP/$GIT_FLOW_DIR && git checkout master && make install

## Delete TMP directory
#RUN rm -rf /root/TMP
#RUN rm -rf /home/${user}/TMP

# Bash aliases
COPY ./home/ /${user}/

# Change configuration file permissions
USER root
RUN chown -R $user:$group \
    /home/${user}/.config/nvim/ \
    /home/${user}/.config/coc/extensions
USER $user

# Tmux configuration files
COPY --chown=$user:$group ./tmux /home/${user}/

# Git configuration files
COPY --chown=$user:$group ./git /home/${user}/

# Create directory for projects (there should be mounted from host).
RUN mkdir -p /home/${user}/workspace

# Set default location after container startup.
WORKDIR /home/${user}/workspace

# Avoid container exit.
CMD ["tail", "-f", "/dev/null"]
