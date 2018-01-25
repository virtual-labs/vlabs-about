SHELL := /bin/bash

CODE_DIR=build/code
DOC_DIR=build/docs
SRC_DIR=src/runtime
PWD=$(shell pwd)
LINT_FILE=${PWD}/${CODE_DIR}/lint_output
EXIT_FILE=${PWD}/exit.txt
STATUS=0

all:  build movejs

init: 
	./init.sh

build: init
	make -f tangle-make -k readtheorg=true all

movejs: build
	rsync -a ${CODE_DIR}/js/newtab.js ${DOC_DIR}/style/js/

clean:	
	make -f tangle-make clean

