# Lightline-StatuslineTabs

A very small plugin to add tabs to status line for users of the **lighline**
plugin.

## Installation

* You can install this plugin using the plugin manager of your choice.
    
### Example:
    ```vim
    Plug 'itchyny/lightline.vim'
    Plug 'Akin909/lightline-statuslinetabs'
    ```
## Integration
1. Register the component
```vim
let g:lightline = {}

let g:lightline.component_expand = {
\  'statuslinetabs': 'lightline#statuslinetabs',
\ }
```

2. Add the component to lightline, e.g. to add to the left side of the
statusline use -
```vim
let g:lightline = {
    \ 'active': {
    \   'left': [ ['statuslinetabs'] ],
    \}
```
## Motivation

I wanted to split out potentially useful things from my `init.vim` that might be of use to other
people. That being said if you'd like to make a change consider, forking this repo or making a PR
rather than raising an issue.
