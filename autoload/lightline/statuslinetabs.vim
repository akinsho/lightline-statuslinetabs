if !has('lambda')
  finish
endif

if empty('g:lightline')
  echohl WarningMsg
  echom 'lightline variable not detected, this plugin does not work if lightline is not setup' 
  echohl clear
endif
" unicode source: http://jrgraphix.net/r/Unicode/2700-27BF
let s:minimal = get(g:, 'lightline#statuslinetabs#minimal', 0)
let s:left_separator = get(g:, 'lightline#statuslinetabs#left_separator', '❲') 
let s:right_separator = get(g:, 'lightline#statuslinetabs#right_separator', '❳') 
let s:tab_number_icons = get(g:, 'lightline#statuslinetabs#tab_number_icons', {
      \ 1: "❶",
      \ 2: "❷",
      \ 3: "❸",
      \ 4: "❹",
      \ 5: "❺",
      \ 6: "❻",
      \ 7: "❼",
      \ 8: "❽",
      \ 9: "❾",
      \ 10: "❿",
      \})

let s:add_tabname_prefix = { selected, nr -> s:left_separator . s:tab_number_icons[nr] . selected . s:right_separator}

function! s:render_tab(tabnr) abort
  " Prefix the selected tab
  if tabpagenr() == a:tabnr 
    let l:full_filename =   " " . lightline#tab#filename(a:tabnr)
    let l:formatted_name =  winwidth(0) <= 70 || s:minimal ? '' : l:full_filename
    let l:tab_name = s:add_tabname_prefix(l:formatted_name, a:tabnr)
    return l:tab_name
  endif
  return s:tab_number_icons[a:tabnr]
endfunction

function! lightline#statuslinetabs#show() abort
  let l:total_number_of_tabs = tabpagenr('$')
  " Don't render anything if there is only one tab
  if l:total_number_of_tabs == 1
    return ''
  endif
  "Map the range of tabs from 1 to the last and for each,
  "call the render_tab function, then join the result into a string.
  return join(map(range(1, l:total_number_of_tabs), { -> s:render_tab(v:val) }))
endfunction
