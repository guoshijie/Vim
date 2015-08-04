"===================================================================
" CRiption: 适合自己使用的vimrc文件，for Linux/Windows, GUI/Console
"
" Last Change: 2010年08月02日 15时13分 
"
" Version:     1.80
"=========================================================================

"set guifont=Bitstream_Vera_Sans_Mono:h9:cANSI "记住空格用下划线代替哦
"set gfw=幼圆:h10:cGB2312
syntax on                   " 自动语法高亮
filetype plugin indent on   " 开启插件
set nocompatible            " 关闭 vi 兼容模式
set t_Co=256
set number                  " 显示行号
set autoindent
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,cucs-bom,p936,gb18030,big5,euc-jp,euc-kr,latin1
set nowrap					" 不自动换行
set cursorline              " 突出显示当前行
set showcmd					" 在状态栏显示正在输入的命令
set ruler                   " 打开状态栏标尺
set shiftwidth=4            " 设定 << 和 >> 命令移动时的宽度为 4
set softtabstop=4           " 使得按退格键时可以一次删掉 4 个空格
set tabstop=4               " 设定 tab 长度为 4
set nobackup                " 覆盖文件时不备份
"set autochdir               " 自动切换当前目录为当前文件所在的目录
set backupcopy=yes          " 设置备份时的行为为覆盖
set ignorecase smartcase    " 搜索时忽略大小写，但在有一个或以上大写字母时仍保持对大小写敏感
"set nowrapscan              " 禁止在搜索到文件两端时重新搜索
set incsearch               " 输入搜索内容时就显示搜索结果
set hlsearch                " 搜索时高亮显示被找到的文本
set noerrorbells            " 关闭错误信息响铃
set novisualbell            " 关闭使用可视响铃代替呼叫
set t_vb=                   " 置空错误铃声的终端代码
set magic                   " 设置魔术
set hidden                  " 允许在有未保存的修改时切换缓冲区，此时的修改由 vim 负责保存
set guioptions-=T           " 隐藏工具栏
set guioptions-=m           " 隐藏菜单栏
set smartindent             " 开启新行时使用智能自动缩进
set backspace=indent,eol,start " 不设定在插入状态无法用退格键和 Delete
" set cmdheight=1             " 设定命令行的行数为 1
"set laststatus=2           " 显示状态栏 (默认值为 1, 无法显示状态栏)
"set statusline=\ %<%F[%1*%M%*%n%R%H]%=\ %y\%0(%{&fileformat}\ %{&encoding}\ %c:%l/%L%)\ "设置在状态行显示的信息
"set foldenable				" 开始折叠
"set foldmethod=syntax		" 设置语法折叠
"set foldcolumn=0			" 设置折叠区域的宽度
"setlocal foldlevel=1		" 设置折叠层数为

"let PHP_autoformatcomment=1 " php 缩进
" 打开javascript对dom、html和css的支持
"let javascript_enable_domhtmlcss=1

autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
"autocmd FileType c set omnifunc=ccomplete#Complete

"---------- taglist -----------
"let Tlist_Ctags_Cmd = '/myapp/ctags58/bin/ctags'
"let Tlist_Show_One_File = 1                         " 不同时显示多个文件的tag，只显示当前文件的
"let Tlist_Exit_OnlyWindow = 1                       " 如果taglist窗口是最后一个窗口，则退出vim
"let Tlist_File_Fold_Auto_Close=1					" 让当前不被编辑的文件的方法列表自动折叠起来
"let Tlist_Show_Menu=1								" 显示taglist菜单

"---------- end.

"---------- 文件式管理 WinManager ----------
"let g:winManagerWindowLayout='BufExplorer,FileExplorer|TagList'	" 
"let g:winManagerWindowLayout='NERDTree|TagList,BufExplorer'			
"let g:winManagerWidth = 30											" 设置winmanager的宽度，默认为25
"nmap <silent> <F8> :WMToggle<cr>									" winmanager开关键,默认WMToggle ，下面wm 也是自定义
"nmap wm :WMToggle<cr>
"let g:AutoOpenWinManager = 1										" 进入vim时自动打开winmanager 

"---------- end.


"---------- 括号自动补全 -----------
":inoremap ( ()<ESC>i
":inoremap ) <c-r>=ClosePair(')')<CR>
:inoremap { {}<ESC>i
:inoremap } <c-r>=ClosePair('}')<CR>
:inoremap [ []<ESC>i
:inoremap ] <c-r>=ClosePair(']')<CR>
":inoremap < <><ESC>i
":inoremap > <c-r>=ClosePair('>')<CR>

function ClosePair(char)
	if getline('.')[col('.') - 1] == a:char
		return "\<Right>"
	else
		return a:char
	endif
endf
"---------- end.

"---------- php 自动补全 ----------
if !exists('g:AutoComplPop_Behavior')
	let g:AutoComplPop_Behavior = {}
	let g:AutoComplPop_Behavior['php'] = []
	 call add(g:AutoComplPop_Behavior['php'], {
			\   'command'   : "\<C-x>\<C-o>",
			\   'pattern'   : printf('\(->\|::\|\$\)\k\{%d,}$', 0),
			\   'repeat'    : 0,
			\})
endif

au FileType php call PHPFuncList()
function PHPFuncList()
	set dictionary-=~/.vim/php_funclist.txt
	set dictionary+=~/.vim/php_funclist.txt
	set complete-=k complete+=k
endfunction
"---------- end.

"---------- python 自动补全 ----------
au FileType python call PyDict()
function PyDict()
	set dictionary-=~/.vim/py-dict
	set dictionary+=~/.vim/py-dict
	set complete-=k complete+=k
endfunction
"---------- end.

"---------- 注释 ----------
let NERDSpaceDelims=1       " 让注释符与语句之间留一个空格
let NERDCompactSexyComs=1   " 多行注释时样子更好看
"---------- end.

"---------- cscope ----------
"set cscopequickfix=s-,c-,d-,i-,t-,e-
"---------- end.

"---------- less ----------
au BufNewFile,BufRead *.less set filetype=less
" ----------nerd_tree
let NERDTreeWinSize=22
nmap <C-n> ::NERDTreeToggle<CR>
"nmap <C-n> ::NERDTreeMirror<CR>
"powerline{
 set guifont=PowerlineSymbols\ for\ Powerline
 set nocompatible
 set t_Co=256
 let g:Powerline_symbols = 'fancy'
"}


