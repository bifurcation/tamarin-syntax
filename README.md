Tamarin Syntax for `vim`
========================

The file in this repo provides syntax highlighting for
[Tamarin](https://tamarin-prover.github.io/) "security protocol theory" files.

To install:

```
> cp spthy.vim ~/.vim/syntax/
```

To use:

```
:set filetype=spthy

" Or add to your .vimrc
au BufRead,BufNewFile *.spthy set filetype=spthy
```
