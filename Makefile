ALL_FILES	:= $(wildcard .??*)
IGNORE_FILES	:= .DS_Store .git .gitmodules
DOT_FILES	:= $(filter-out $(IGNORE_FILES),$(ALL_FILES))

all: check install

check:
	@$(foreach dotfile, $(DOT_FILES), /bin/ls -dF $(dotfile);)

install:
	@$(foreach dotfile, $(DOT_FILES), ln -sfnv $(abspath $(dotfile)) "$(HOME)/$(dotfile)";)

.PHONY: emacs
emacs:
	emacs --batch -f batch-byte-compile ~/.emacs.d/init.el

.PHONY: skk
skk:
	curl -o ${HOME}/.eskk/SKK-JISYO.L --create-dirs http://openlab.jp/skk/skk/dic/SKK-JISYO.L
	touch ${HOME}/.eskk/USER.L

clean:
	@-$(foreach dotfile, $(DOT_FILES), rm -vrf $(HOME)/$(dotfile);)
