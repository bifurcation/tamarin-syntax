" Vim syntax file
" Language: Tamarin security protocol theories
" Maintainer: Richard Barnes
" Latest Revision: September 2017

if exists("b:current_syntax")
  finish
endif

syn case match

" Top-level keywords
syn match       spBegin             /^begin/
syn match       spEnd               /^end/
syn match       spBuiltins          /^builtins/

hi def link     spBegin             Label
hi def link     spEnd               Label
hi def link     spBuiltins          Label


" Declarations 
syn match       spDecl              /theory\|rule\|lemma\|restriction/ nextgroup=spDeclName skipwhite
syn match       spDeclName          contained /\w\+/ 

hi def link     spDecl              Keyword
hi def link     spDeclName          Function


" Lemma Bodies (which are contained in rule bodies)
syn keyword     spLemmaTraceQuant   contained all-traces exists-trace
syn match       spLemmaArrow        contained /==>/
syn keyword     spLemmaNot          contained not
syn match       spLemmaVars         contained /#\?\w\+/ nextgroup=spLemmaVars skipwhite
syn keyword     spLemmaQuantifier   contained All Ex nextgroup=spLemmaVars skipwhite
syn region      spLemmaBody         contained start="\"" end="\"" keepend contains=spLemmaArrow,spLemmaSymbol,spLemmaQuantifier,spLemmaNot,spComment

hi def link     spLemmaTraceQuant   Keyword
hi def link     spLemmaArrow        Keyword
hi def link     spLemmaSymbol       Keyword
hi def link     spLemmaQuantifier   Keyword
hi def link     spLemmaVars         Type
hi def link     spLemmaNot          Keyword


" Rule  Bodies
syn match       spRuleArrow         contained /-->/
syn match       spRuleArrowStart    contained /--\[/
syn match       spRuleArrowEnd      contained /\]->/
syn match       spRuleBrackets      contained /\[\]/
syn keyword     spRuleWord          contained let in 
syn region      spRuleBody          start=":" end="^\s*$" keepend contains=spRuleWord,spRuleArrow,spRuleArrowStart,spRuleArrowEnd,spLemmaBody,spLemmaTraceQuant,spComment

hi def link     spRuleArrow         Keyword
hi def link     spRuleArrowStart    Keyword
hi def link     spRuleArrowEnd      Keyword
hi def link     spRuleBrackets      Keyword
hi def link     spRuleWord          Keyword


" Comments and their contents
syn keyword     spTodo              contained TODO FIXME XXX BUG
syn cluster     spCommentGroup      contains=spTodo
syn region      spComment           start="/\*" end="\*/" contains=@spCommentGroup,@Spell
syn region      spComment           start="//" end="$" contains=@spCommentGroup,@Spell

hi def link     spComment           Comment
hi def link     spTodo              Todo
