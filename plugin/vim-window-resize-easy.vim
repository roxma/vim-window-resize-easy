
nnoremap <expr> <Plug>(vim-window-resize-easy) <SID>resize_mode()

nnoremap <Plug>(vim-window-resize-lt)			<c-w><
nnoremap <Plug>(vim-window-resize-gt)			<c-w>>
nnoremap <Plug>(vim-window-resize-p)			<c-w>+
nnoremap <Plug>(vim-window-resize-m)			<c-w>-
nnoremap <Plug>(vim-window-resize-underscore)	<c-w>_
nnoremap <Plug>(vim-window-resize-equal)		<c-w>=

nmap  <c-w><  <Plug>(vim-window-resize-lt)<Plug>(vim-window-resize-easy)
nmap  <c-w>>  <Plug>(vim-window-resize-gt)<Plug>(vim-window-resize-easy)
nmap  <c-w>+  <Plug>(vim-window-resize-p)<Plug>(vim-window-resize-easy)
nmap  <c-w>-  <Plug>(vim-window-resize-m)<Plug>(vim-window-resize-easy)
nmap  <c-w>_  <Plug>(vim-window-resize-underscore)<Plug>(vim-window-resize-easy)
nmap  <c-w>=  <Plug>(vim-window-resize-equal)<Plug>(vim-window-resize-easy)

func! s:getchar_timeout(timer)
	if s:char_getted
	let s:char_getted = 0
		return
	endif
	call feedkeys(" ",'n')
endfunc

func! s:resize_mode()

	let s:char_getted = 0
	let l:timer = timer_start(2000, function('s:getchar_timeout'), {'repeat': 1})

	echo 'window resizing... horizontal smaller [<], horizontal greater [>], vertical decrease [-], vertical increase [+], others [_] [=] '

	let l:ch = getchar()
	call timer_stop(l:timer)
	let s:char_getted = 1

	" hack for key holding
	while getchar(0) != 0
		let s:char_getted = 1
	endwhile

	if l:ch == char2nr('<')
		call feedkeys("\<c-w><")
	elseif l:ch == char2nr('>')
		call feedkeys("\<c-w>>")
	elseif l:ch == char2nr('+')
		call feedkeys("\<c-w>+")
	elseif l:ch == char2nr('-')
		call feedkeys("\<c-w>-")
	elseif l:ch == char2nr('_')
		call feedkeys("\<c-w>_")
	elseif l:ch == char2nr('=')
		call feedkeys("\<c-w>=")
	else
		" clear the prompt
		echo ''
		" not sure this is a good behavior
		call feedkeys(nr2char(l:ch))
	endif

	return ''
endfunc

