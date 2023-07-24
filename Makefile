# based on https://tech.davis-hansson.com/p/make

# use bash as the shell, as sh could be bound to a variety of shells
SHELL := bash
# run all recipes in a single shell
.ONESHELL:

# based on http://redsymbol.net/articles/unofficial-bash-strict-mode/
# flags for more sane shell scripts and clearer errors
.SHELLFLAGS := -eu -o pipefail -c

# delete target if recipe fails
.DELETE_ON_ERROR:

MAKEFLAGS += --warn-undefined-variables
MAKEFLAGS += --no-builtin-rules

# use '>' instead of '\t' to denote a recipe
ifeq ($(origin .RECIPEPREFIX), undefined)
  $(error This Make does not support .RECIPEPREFIX. Please use GNU Make 4.0 or later)
endif
.RECIPEPREFIX = >

