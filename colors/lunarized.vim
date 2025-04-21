" Name:         lunarized
" Description:  Based on solarized with slightly different colors
" Author:       Andreas Hug
" Maintainer:   Andreas Hug
" Website:      https://github.com/andreashug/vim-lunarized
" License:      OSI approved MIT license
" Last Change:  2025-04-12


augroup lunarized
	au!
	au ColorScheme * call s:OnColorSchemeLoaded()
augroup END

" Update loaded flag
function s:OnColorSchemeLoaded()
	if expand('<amatch>') !=# 'lunarized'
		let g:lunarized_loaded = v:false
	endif
endfunction

" Only reset highligting if switching from another colorscheme
if !exists('g:lunarized_loaded') || g:lunarized_loaded == v:false
	highlight clear
endif

let g:colors_name = 'lunarized'
let g:lunarized_loaded = v:true


" Colors for all schemes: dark, light, dark contrast, light contrast
let s:gui_colors = {
	\ 'fg_se'  : ['#c6c6c6', '#474747', '#e2e2e2', '#000000'],
	\ 'fg_s'   : ['#ababab', '#5e5e5e', '#c6c6c6', '#262626'],
	\ 'fg'     : ['#919191', '#777777', '#ababab', '#474747'],
	\ 'fg_f'   : ['#777777', '#919191', '#919191', '#6a6a6a'],
	\ 'fg_fe'  : ['#5e5e5e', '#ababab', '#777777', '#919191'],
	\ 'bg_s'   : ['#303030', '#e2e2e2', '#262626', '#e2e2e2'],
	\ 'bg'     : ['#1b1b1b', '#f6f6f6', '#000000', '#ffffff'],
	\ 'red'    : ['#dc2e2e', '#d81818', '#dc2e2e', '#d81818'],
	\ 'orange' : ['#d54f0b', '#c74200', '#d54f0b', '#c74200'],
	\ 'yellow' : ['#b39500', '#a38800', '#b39500', '#a38800'],
	\ 'green'  : ['#4d9900', '#408000', '#4d9900', '#408000'],
	\ 'cyan'   : ['#2e9e95', '#1f938a', '#2e9e95', '#1f938a'],
	\ 'blue'   : ['#2b8ed4', '#2280c3', '#2b8ed4', '#2280c3'],
	\ 'purple' : ['#7979d2', '#5454d4', '#7979d2', '#5454d4'],
	\ 'magenta': ['#d33685', '#cc2478', '#d33685', '#cc2478'],
	\ }


let s:background_index = &bg == 'dark' ? 0 : 1
let s:contrast_index = (exists('g:lunarized_contrast') && g:lunarized_contrast == v:true) ? 2 : 0
let s:scheme_index = s:background_index + s:contrast_index

for [s:name, s:colors] in items(s:gui_colors)
	let v:colornames['lunarized_' . s:name] = s:colors[s:scheme_index]
endfor


" Set ANSI colors for vim terminal
if (has('termguicolors') && &termguicolors) || has('gui_running')
	let g:terminal_ansi_colors = [
		\ v:colornames['lunarized_bg'],
		\ v:colornames['lunarized_red'],
		\ v:colornames['lunarized_green'],
		\ v:colornames['lunarized_yellow'],
		\ v:colornames['lunarized_blue'],
		\ v:colornames['lunarized_purple'],
		\ v:colornames['lunarized_cyan'],
		\ v:colornames['lunarized_fg'],
		\ v:colornames['lunarized_bg_s'],
		\ v:colornames['lunarized_red'],
		\ v:colornames['lunarized_green'],
		\ v:colornames['lunarized_yellow'],
		\ v:colornames['lunarized_blue'],
		\ v:colornames['lunarized_purple'],
		\ v:colornames['lunarized_cyan'],
		\ v:colornames['lunarized_fg_s'],
		\ ]
endif


" Basic highlighting
" These are explained in the help section highlight-groups

hi Normal guifg=lunarized_fg guibg=lunarized_bg gui=NONE cterm=NONE

hi Cursor guifg=lunarized_bg guibg=lunarized_fg gui=NONE cterm=NONE
hi Visual guifg=lunarized_fg_fe guibg=lunarized_bg gui=reverse cterm=reverse
hi VisualNOS guifg=NONE guibg=lunarized_bg_s gui=reverse cterm=reverse

hi Pmenu guifg=lunarized_fg guibg=lunarized_bg_s gui=NONE cterm=NONE
hi PmenuSel guifg=lunarized_blue guibg=lunarized_bg_s gui=NONE cterm=NONE
hi PmenuKind guifg=lunarized_fg_fe guibg=lunarized_bg_s gui=italic cterm=italic
hi PmenuKindSel guifg=lunarized_fg guibg=lunarized_bg_s gui=italic cterm=italic
hi PmenuExtra guifg=lunarized_fg_fe guibg=lunarized_bg_s gui=NONE cterm=NONE
hi PmenuExtraSel guifg=lunarized_fg guibg=lunarized_bg_s gui=NONE cterm=NONE
hi PmenuMatch guifg=lunarized_yellow guibg=lunarized_bg_s gui=NONE cterm=NONE
hi PmenuMatchSel guifg=lunarized_blue guibg=lunarized_bg_s gui=NONE cterm=NONE
hi PmenuSbar guifg=NONE guibg=lunarized_fg_fe gui=NONE cterm=NONE
hi PmenuThumb guifg=NONE guibg=lunarized_fg gui=NONE cterm=NONE

hi StatusLine guifg=lunarized_fg guibg=lunarized_bg_s gui=reverse cterm=reverse
hi StatusLineNC guifg=lunarized_fg_f guibg=lunarized_bg_s gui=reverse cterm=reverse

hi TabLine guifg=lunarized_fg guibg=lunarized_bg_s guisp=lunarized_fg gui=underline cterm=underline
hi TabLineFill guifg=lunarized_fg guibg=lunarized_bg_s guisp=lunarized_fg gui=underline cterm=underline
hi TabLineSel guifg=lunarized_fg_fe guibg=lunarized_fg_se guisp=lunarized_fg gui=underline cterm=underline

hi ToolbarLine guifg=lunarized_fg_fe guibg=lunarized_bg_s gui=NONE cterm=NONE
hi ToolbarButton guifg=lunarized_fg_f guibg=lunarized_fg_fe gui=NONE cterm=NONE

hi NonText guifg=lunarized_fg_f guibg=NONE gui=bold cterm=bold
hi SpecialKey guifg=lunarized_fg_fe guibg=lunarized_bg gui=NONE cterm=NONE
hi EndOfBuffer guifg=lunarized_fg_fe guibg=NONE gui=NONE cterm=NONE

hi Folded guifg=lunarized_fg_f guibg=lunarized_bg_s gui=NONE cterm=NONE

hi VertSplit guifg=lunarized_fg_fe guibg=lunarized_bg_s gui=NONE cterm=NONE
hi LineNr guifg=lunarized_fg_fe guibg=lunarized_bg_s gui=NONE cterm=NONE
hi link LineNrAbove LineNr
hi link LineNrBelow LineNr

hi CursorLine guifg=NONE guibg=lunarized_bg_s gui=NONE cterm=NONE
hi CursorColumn guifg=NONE guibg=lunarized_bg_s gui=NONE cterm=NONE
hi CursorLineNr guifg=lunarized_fg guibg=lunarized_bg_s gui=NONE cterm=NONE

hi FoldColumn guifg=lunarized_fg_f guibg=lunarized_bg_s gui=NONE cterm=NONE
hi SignColumn guifg=lunarized_fg guibg=lunarized_bg gui=NONE cterm=NONE
hi ColorColumn guifg=NONE guibg=lunarized_bg_s gui=NONE cterm=NONE

hi ErrorMsg guifg=lunarized_red guibg=NONE gui=reverse cterm=reverse
hi ModeMsg guifg=lunarized_blue guibg=NONE gui=NONE cterm=NONE
hi WarningMsg guifg=lunarized_red guibg=NONE gui=bold cterm=bold
hi MoreMsg guifg=lunarized_blue guibg=NONE gui=NONE cterm=NONE

hi Question guifg=lunarized_cyan guibg=NONE gui=bold cterm=bold

hi MatchParen guifg=lunarized_orange guibg=NONE gui=bold cterm=bold
hi WildMenu guifg=lunarized_fg_se guibg=lunarized_bg_s gui=reverse cterm=reverse

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

hi DiffAdd guifg=lunarized_green guibg=lunarized_bg_s gui=bold cterm=bold
hi DiffChange guifg=lunarized_yellow guibg=lunarized_bg_s gui=bold cterm=bold
hi DiffDelete guifg=lunarized_red guibg=lunarized_bg_s gui=bold cterm=bold
hi DiffText guifg=lunarized_blue guibg=lunarized_bg_s gui=bold cterm=bold

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

hi Comment guifg=lunarized_fg_fe guibg=NONE gui=italic cterm=italic

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
