" Name:         lunarized
" Description:  Based on solarized with slightly different colors
" Author:       Andreas Hug
" Maintainer:   Andreas Hug
" Website:      https://github.com/andreashug/vim-lunarized
" License:      OSI approved MIT license
" Last Change:  2025-04-12


set background=dark

highlight clear

let g:colors_name = 'lunarized'
let g:lunarized_loaded = v:true

let s:gui_colors = {
	\ 'bright4': '#ffffff',
	\ 'bright3': '#f6f6f6',
	\ 'bright2': '#e8e8e8',
	\ 'bright1': '#9d9d9d',
	\ 'base': '#909090',
	\ 'faint1': '#767676',
	\ 'faint2': '#6a6a6a',
	\ 'faint3': '#303030',
	\ 'faint4': '#1b1b1b',
	\ 'faint5': '#000000',
	\ 'black': '#000000',
	\ 'red': '#dc322f',
	\ 'green': '#749901',
	\ 'yellow': '#b58900',
	\ 'blue': '#2b8dd2',
	\ 'purple': '#6c71c4',
	\ 'cyan': '#33a199',
	\ 'white': '#ffffff',
	\ 'magenta': '#d33682',
	\ 'orange': '#cb4b16',
	\ 'bright_red': '#ff5448',
	\ 'bright_green': '#91b52c',
	\ 'bright_yellow': '#d7a72e',
	\ 'bright_blue': '#54a9f1',
	\ 'bright_purple': '#8b8ee4',
	\ 'bright_cyan': '#58c1b8',
	\ 'bright_magenta': '#f95ca2',
	\ 'bright_orange': '#f06a34',
	\ }

function! s:SetColorNames(colors)
	for [name, value] in items(a:colors)
		let v:colornames['lunarized_' . name] = value
	endfor
endfunction

call s:SetColorNames(s:gui_colors)

if (has('termguicolors') && &termguicolors) || has('gui_running')
	let g:terminal_ansi_colors = [
		\ s:gui_colors['faint5'],
		\ s:gui_colors['red'],
		\ s:gui_colors['green'],
		\ s:gui_colors['yellow'],
		\ s:gui_colors['blue'],
		\ s:gui_colors['purple'],
		\ s:gui_colors['cyan'],
		\ s:gui_colors['bright3'],
		\ s:gui_colors['faint4'],
		\ s:gui_colors['bright_red'],
		\ s:gui_colors['bright_green'],
		\ s:gui_colors['bright_yellow'],
		\ s:gui_colors['bright_blue'],
		\ s:gui_colors['bright_purple'],
		\ s:gui_colors['bright_cyan'],
		\ s:gui_colors['bright4'],
		\ ]
endif

" Basic highlighting
" These are explained in the help section highlight-groups

hi Normal guifg=lunarized_base guibg=lunarized_faint4 gui=NONE cterm=NONE

hi Cursor guifg=lunarized_faint4 guibg=lunarized_base gui=NONE cterm=NONE
hi Visual guifg=lunarized_faint2 guibg=lunarized_faint4 gui=reverse cterm=reverse
hi VisualNOS guifg=NONE guibg=lunarized_faint3 gui=reverse cterm=reverse

hi Pmenu guifg=lunarized_base guibg=lunarized_faint3 gui=NONE cterm=NONE
hi PmenuSel guifg=lunarized_blue guibg=lunarized_faint3 gui=NONE cterm=NONE
hi PmenuKind guifg=lunarized_faint1 guibg=lunarized_faint3 gui=NONE cterm=NONE
hi PmenuKindSel guifg=lunarized_base guibg=lunarized_faint3 gui=NONE cterm=NONE
hi PmenuExtra guifg=lunarized_faint1 guibg=lunarized_faint3 gui=NONE cterm=NONE
hi PmenuExtraSel guifg=lunarized_base guibg=lunarized_faint3 gui=NONE cterm=NONE
hi PmenuMatch guifg=lunarized_yellow guibg=lunarized_faint3 gui=NONE cterm=NONE
hi PmenuMatchSel guifg=lunarized_yellow guibg=lunarized_faint3 gui=NONE cterm=NONE
hi PmenuSbar guifg=NONE guibg=lunarized_faint2 gui=NONE cterm=NONE
hi PmenuThumb guifg=NONE guibg=lunarized_base gui=NONE cterm=NONE

hi StatusLine guifg=lunarized_bright1 guibg=lunarized_faint3 gui=reverse cterm=reverse
hi StatusLineNC guifg=lunarized_faint1 guibg=lunarized_faint3 gui=reverse cterm=reverse

hi TabLine guifg=lunarized_base guibg=lunarized_faint3 guisp=lunarized_base gui=underline cterm=underline
hi TabLineFill guifg=lunarized_base guibg=lunarized_faint3 guisp=lunarized_base gui=underline cterm=underline
hi TabLineSel guifg=lunarized_faint2 guibg=lunarized_bright2 guisp=lunarized_base gui=underline cterm=underline

hi ToolbarLine guifg=lunarized_faint2 guibg=lunarized_faint3 gui=NONE cterm=NONE
hi ToolbarButton guifg=lunarized_faint1 guibg=lunarized_faint2 gui=NONE cterm=NONE

hi NonText guifg=lunarized_faint1 guibg=NONE gui=bold cterm=bold
hi SpecialKey guifg=lunarized_faint1 guibg=lunarized_faint3 gui=bold cterm=bold
hi EndOfBuffer guifg=lunarized_faint2 guibg=NONE gui=NONE cterm=NONE

hi Folded guifg=lunarized_faint1 guibg=lunarized_faint3 gui=NONE cterm=NONE

hi VertSplit guifg=lunarized_faint2 guibg=lunarized_faint3 gui=NONE cterm=NONE
hi LineNr guifg=lunarized_faint2 guibg=lunarized_faint3 gui=NONE cterm=NONE
hi link LineNrAbove LineNr
hi link LineNrBelow LineNr

hi CursorLine guifg=NONE guibg=lunarized_faint3 gui=NONE cterm=NONE
hi CursorColumn guifg=NONE guibg=lunarized_faint3 gui=NONE cterm=NONE
hi CursorLineNr guifg=lunarized_bright1 guibg=lunarized_faint3 gui=NONE cterm=NONE

hi FoldColumn guifg=lunarized_faint1 guibg=lunarized_faint3 gui=NONE cterm=NONE
hi SignColumn guifg=lunarized_base guibg=lunarized_faint4 gui=NONE cterm=NONE
hi ColorColumn guifg=NONE guibg=lunarized_faint3 gui=NONE cterm=NONE

hi ErrorMsg guifg=lunarized_red guibg=NONE gui=reverse cterm=reverse
hi ModeMsg guifg=lunarized_blue guibg=NONE gui=NONE cterm=NONE
hi WarningMsg guifg=lunarized_red guibg=NONE gui=bold cterm=bold
hi MoreMsg guifg=lunarized_blue guibg=NONE gui=NONE cterm=NONE

hi Question guifg=lunarized_cyan guibg=NONE gui=bold cterm=bold

hi MatchParen guifg=lunarized_orange guibg=NONE gui=bold cterm=bold
hi WildMenu guifg=lunarized_bright2 guibg=lunarized_faint3 gui=reverse cterm=reverse

hi Search guifg=lunarized_yellow guibg=NONE gui=reverse cterm=reverse
hi IncSearch guifg=lunarized_orange guibg=NONE gui=reverse cterm=reverse
hi link CurSearch Search

hi SpellBad guifg=NONE guibg=NONE ctermbg=NONE guisp=lunarized_red gui=undercurl ctermul=red cterm=undercurl
hi SpellCap guifg=NONE guibg=NONE ctermbg=NONE guisp=lunarized_purple gui=undercurl ctermul=blue cterm=undercurl
hi SpellRare guifg=NONE guibg=NONE ctermbg=NONE guisp=lunarized_cyan gui=undercurl ctermul=cyan cterm=undercurl
hi SpellLocal guifg=NONE guibg=NONE ctermbg=NONE guisp=lunarized_yellow gui=undercurl ctermul=yellow cterm=undercurl

hi Directory guifg=lunarized_blue guibg=NONE gui=NONE cterm=NONE
hi Conceal guifg=lunarized_blue guibg=NONE gui=NONE cterm=NONE
hi Title guifg=lunarized_orange guibg=NONE gui=bold cterm=bold

hi DiffAdd guifg=lunarized_green guibg=lunarized_faint3 gui=bold cterm=bold
hi DiffChange guifg=lunarized_yellow guibg=lunarized_faint3 gui=bold cterm=bold
hi DiffDelete guifg=lunarized_red guibg=lunarized_faint3 gui=bold cterm=bold
hi DiffText guifg=lunarized_blue guibg=lunarized_faint3 gui=bold cterm=bold

hi link Terminal Normal
hi link StatusLineTerm StatusLine
hi link StatusLineTermNC StatusLineNC

" Vim highlighting (i.e. this file)
hi vimHiLink guifg=lunarized_blue guibg=NONE gui=NONE cterm=NONE
hi vimHiGroup guifg=lunarized_blue guibg=NONE gui=NONE cterm=NONE
hi vimHiKeyList guifg=lunarized_purple guibg=NONE gui=NONE cterm=NONE
hi vimGroup guifg=lunarized_blue guibg=NONE gui=underline cterm=underline


" Syntax groups
" These are explained in the help section group-name

hi Comment guifg=lunarized_faint2 guibg=NONE gui=italic cterm=italic

hi Constant guifg=lunarized_cyan guibg=NONE gui=NONE cterm=NONE
"  String
"  Character
"  Boolean
"  Number
"  Float
hi Boolean guifg=lunarized_green guibg=NONE gui=NONE cterm=NONE
hi Number guifg=lunarized_green guibg=NONE gui=NONE cterm=NONE
hi Float guifg=lunarized_green guibg=NONE gui=NONE cterm=NONE

hi Identifier guifg=lunarized_blue guibg=NONE gui=NONE cterm=NONE
"  Identifier (variable names)
"  Function (and class methods)

hi Statement guifg=lunarized_yellow guibg=NONE gui=NONE cterm=NONE
"  Conditional (if, then, else, ...)
"  Repeat (for, while, ...)
"  Label (case, default, ...)
"  Operator (+, -, ...)
"  Keyword
"  Exception (try, catch, ...)

hi PreProc guifg=lunarized_orange guibg=NONE gui=NONE cterm=NONE
"  Include (include, import, ...)
"  Define
"  Macro
"  Precondit

hi Type guifg=lunarized_yellow guibg=NONE gui=NONE cterm=NONE
"  Type (int, long, char, ...)
"  StorageClass (static, register, ...)
"  Structure (struct, union, enum, ...)
"  Typedef

hi Special guifg=lunarized_red guibg=NONE gui=NONE cterm=NONE
"  SpecialChar
"  Tag
"  Delimter
"  SpecialComment
"  Debug

hi Underlined guifg=lunarized_purple guibg=NONE gui=NONE cterm=NONE
hi Ignore guifg=NONE guibg=NONE gui=NONE cterm=NONE
hi Error guifg=lunarized_red guibg=NONE gui=bold cterm=bold
hi Todo guifg=lunarized_magenta guibg=NONE gui=bold cterm=bold

"  Diff
hi Added guifg=lunarized_green guibg=NONE gui=NOnE cterm=NOnE
hi Changed guifg=lunarized_yellow guibg=NONE gui=NOnE cterm=NOnE
hi Removed guifg=lunarized_red guibg=NONE gui=NOnE cterm=NOnE
