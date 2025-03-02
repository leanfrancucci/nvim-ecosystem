# Makefile for Neovim Ecosystem.
#
# @author Leandro Francucci

nvim = mashmb/nvim:dev
nvim-python3 = mashmb/nvim-python3:dev

all-build = build-nvim build-nvim-python3
all-push = push-nvim push-nvim-python3
all-clean = clean-nvim clean-nvim-python3

all: $(all-build) $(all-push) $(all-clean)

login:
	docker login

build-nvim:
	echo "--- Building $(nvim) image ---"
	cd nvim && docker build -t $(nvim) .

build-nvim-python3:
	echo "--- Building $(nvim-python3) image ---"
	cd nvim-python3 && docker build -t $(nvim-python3) .

push-nvim: login
	echo "--- Pushing $(nvim) image ---"
	docker push $(nvim)

push-nvim-python3: login
	echo "--- Pushing $(nvim-python3) image ---"
	docker push $(nvim-python3)

clean-nvim:
	echo "--- Removing $(nvim) image ---"
	docker image rm -f $(nvim)

clean-nvim-python3:
	echo "--- Removing $(nvim-python3) image ---"
	docker image rm -f $(nvim-python3)
