" Plugin:      https://github.com/Akin909/lightline-statuslinetabs
" Description: A very small plugin to show tabs (minimal representation) in the
" statusline
" Maintainer:  Akin Sowemimo <https://github.com/Akin909>
"
augroup StatuslineTabs
  au!
  autocmd BufEnter,TabNew,TabEnter,TabClosed * lightline#update()
augroup END
