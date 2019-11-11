" Lunarized - A color scheme based on Solarized with neutral base colors
"
" Author:  Andreas Hug (github.com/andreashug)
" License: MIT
" Credits: Ethan Schoonover <es@ethanschoonover.com>
"
" Export variables and functions so custom highlights can be added
"   let lunarized_export = 1
"
" Force color mode
"   let lunarized_color_mode = "rgb" / "256" / "16"
"
" Force italic support
"   let lunarized_italic = 1

highlight clear

if exists('syntax on')
    syntax reset
endif

set background=dark

let g:colors_name = 'lunarized'


let g:lunarized_color_mode = get(g:, 'lunarized_color_mode', "")
let g:lunarized_export = get(g:, 'lunarized_export', 0)


function! s:SetColor(name, color_rgb, color_256, color_16, color_name)
    if (has("gui_running") || g:lunarized_color_mode == "rgb")
        let s:fg = "guifg"
        let s:bg = "guibg"
        let s:sp = "guisp"
        let s:fmt = "gui"
    else
        let s:fg = "ctermfg"
        let s:bg = "ctermbg"
        let s:sp = 0
        let s:fmt = "cterm"
    endif

    if (has("gui_running") || g:lunarized_color_mode == "rgb")
        exe 'let s:'.a:name.'="'.a:color_rgb.'"'
    elseif (g:lunarized_color_mode != "256" && &t_Co >= 16)
        exe 'let s:'.a:name.'='.a:color_16
    elseif g:lunarized_color_mode == "256"
        exe 'let s:'.a:name.'='.a:color_256
    else
        exe 'let s:'.a:name.'="'.a:color_name.'"'
    endif

    if g:lunarized_export == 1
        exe 'let g:lunarized_'.a:name.'=s:'.a:name
    endif
endfunction


function! s:Highlight(name, fmt, fg, bg, sp)
    let l:args = ['hi', a:name, s:fmt.'='.a:fmt, s:fg.'='.a:fg, s:bg.'='.a:bg]
    if s:sp
        let l:args += ['guisp='.a:sp]
    endif
    exe join(l:args, ' ')
endfunction


function s:ItalicEnabled()
	if get(g:, 'lunarized_italic', 'unset') != 'unset'
		return g:lunarized_italic
	elseif has("gui_running")
		return 1
	else
		return len(filter(["rxvt", "gnome-terminal"], "$TERM =~ v:val"))
	endif
endfunction


let s:none = "NONE"
let s:bold = "bold"
let s:italic = s:ItalicEnabled() ? "italic" : "NONE"
let s:ucurl = "undercurl"
let s:stndout = "standout"
let s:uline = "underline"
let s:reverse = "reverse"


if g:lunarized_export == 1
    function! g:LunarizedHighlight(name, fmt, fg, bg, sp)
        call s:Highlight(a:name, a:fmt, a:fg, a:bg, a:sp)
    endfunction

    let g:lunarized_none = s:none
    let s:lunarized_bold = s:bold
    let s:lunarized_italic = s:italic
    let s:lunarized_ucurl = s:ucurl
    let s:lunarized_stndout = s:stndout
    let s:lunarized_uline = s:uline
    let s:lunarized_reverse = s:reverse
endif


call s:SetColor("base03" , "#1b1b1b", "234", "8" , "DarkGray"    )
call s:SetColor("base02" , "#303030", "235", "0" , "Black"       )
call s:SetColor("base01" , "#6a6a6a", "239", "10", "LightGreen"  )
call s:SetColor("base00" , "#767676", "240", "11", "LightYellow" )
call s:SetColor("base0"  , "#909090", "244", "12", "LightBlue"   )
call s:SetColor("base1"  , "#9d9d9d", "245", "14", "LightCyan"   )
call s:SetColor("base2"  , "#e8e8e8", "187", "7" , "LightGray"   )
call s:SetColor("base3"  , "#f6f6f6", "230", "15", "White"       )
call s:SetColor("yellow" , "#b58900", "136", "3" , "DarkYellow"  )
call s:SetColor("orange" , "#cb4b16", "166", "9" , "LightRed"    )
call s:SetColor("red"    , "#dc322f", "124", "1" , "DarkRed"     )
call s:SetColor("magenta", "#d33682", "125", "5" , "DarkMagenta" )
call s:SetColor("violet" , "#6c71c4", "61" , "13", "LightMagenta")
call s:SetColor("blue"   , "#2b8dd2", "33" , "4" , "DarkBlue"    )
call s:SetColor("cyan"   , "#33a199", "37" , "6" , "DarkCyan"    )
call s:SetColor("green"  , "#749901", "64" , "2" , "DarkGreen"   )
call s:SetColor("back"   , "#1b1b1b", "234", "8" , "DarkGray"    )


call s:Highlight("Normal", s:none, s:base0, s:back, s:none)
call s:Highlight("Comment", s:italic, s:base01, s:none, s:none)
call s:Highlight("Constant", s:none, s:cyan, s:none, s:none)
call s:Highlight("Number", s:none, s:green, s:none, s:none)
call s:Highlight("Float", s:none, s:green, s:none, s:none)
call s:Highlight("Identifier", s:none, s:blue, s:none, s:none)
call s:Highlight("Statement", s:none, s:yellow, s:none, s:none)
call s:Highlight("PreProc", s:none, s:orange, s:none, s:none)
call s:Highlight("Type", s:none, s:yellow, s:none, s:none)
call s:Highlight("Special", s:none, s:red, s:none, s:none)
call s:Highlight("Underlined", s:none, s:violet, s:none, s:none)
call s:Highlight("Ignore", s:none, s:none, s:none, s:none)
call s:Highlight("Error", s:bold, s:red, s:none, s:none)
call s:Highlight("Todo", s:bold, s:magenta, s:none, s:none)

call s:Highlight("SpecialKey", s:bold, s:base00, s:base03, s:none)
call s:Highlight("NonText", s:bold, s:base00, s:none, s:none)
call s:Highlight("StatusLine", s:reverse, s:base1, s:base02, s:none)
call s:Highlight("StatusLineNC", s:reverse, s:base00, s:base02, s:none)
call s:Highlight("Visual", s:reverse, s:base01, s:base03, s:none)
call s:Highlight("Directory", s:none, s:blue, s:none, s:none)
call s:Highlight("ErrorMsg", s:reverse, s:red, s:none, s:none)
call s:Highlight("IncSearch", s:stndout, s:orange, s:none, s:none)
call s:Highlight("Search", s:reverse, s:yellow, s:none, s:none)
call s:Highlight("MoreMsg", s:none, s:blue, s:none, s:none)
call s:Highlight("ModeMsg", s:none, s:blue, s:none, s:none)
call s:Highlight("LineNr", s:none, s:base01, s:base02, s:none)
call s:Highlight("Question", s:bold, s:cyan, s:none, s:none)
call s:Highlight("VertSplit", s:none, s:base01, s:base02, s:none)
call s:Highlight("EndOfBuffer", s:none, s:base01, s:none, s:none)
call s:Highlight("Title", s:bold, s:orange, s:none, s:none)
call s:Highlight("VisualNOS", s:reverse, s:none, s:base02, s:none)
call s:Highlight("WarningMsg", s:bold, s:red, s:none, s:none)
call s:Highlight("WildMenu", s:reverse, s:base2, s:base02, s:none)
call s:Highlight("Folded", s:uline, s:base0, s:base02, s:base03)
call s:Highlight("FoldColumn", s:none, s:base0, s:base02, s:none)
call s:Highlight("DiffAdd", s:bold, s:green, s:base02, s:green)
call s:Highlight("DiffChange", s:bold, s:yellow, s:base02, s:yellow)
call s:Highlight("DiffDelete", s:bold, s:red, s:base02, s:none)
call s:Highlight("DiffText", s:bold, s:blue, s:base02, s:blue)
call s:Highlight("SignColumn", s:none, s:base0, s:none, s:none)
call s:Highlight("Conceal", s:none, s:blue, s:none, s:none)
call s:Highlight("SpellBad", s:ucurl, s:none, s:none, s:red)
call s:Highlight("SpellCap", s:ucurl, s:none, s:none, s:violet)
call s:Highlight("SpellRare", s:ucurl, s:none, s:none, s:cyan)
call s:Highlight("SpellLocal", s:ucurl, s:none, s:none, s:yellow)
call s:Highlight("Pmenu", s:reverse, s:base0, s:base02, s:none)
call s:Highlight("PmenuSel", s:reverse, s:base01, s:base2, s:none)
call s:Highlight("PmenuSbar", s:reverse, s:base2, s:base0, s:none)
call s:Highlight("PmenuThumb", s:reverse, s:base0, s:base03, s:none)
call s:Highlight("TabLine", s:uline, s:base0, s:base02, s:base0)
call s:Highlight("TabLineFill", s:uline, s:base0, s:base02, s:base0)
call s:Highlight("TabLineSel", s:uline, s:base01, s:base2, s:base0)
call s:Highlight("CursorColumn", s:none, s:none, s:base02, s:none)
call s:Highlight("CursorLine", s:uline, s:none, s:base02, s:base1)
call s:Highlight("CursorLine", s:none, s:none, s:base02, s:base1)
call s:Highlight("ColorColumn", s:none, s:none, s:base02, s:none)
call s:Highlight("Cursor", s:none, s:base03, s:base0, s:none)
call s:Highlight("MatchParen", s:bold, s:red, s:base01, s:none)

call s:Highlight("vimCommentString", s:none, s:violet, s:none, s:none)
call s:Highlight("vimCommand", s:none, s:yellow, s:none, s:none)
call s:Highlight("vimCmdSep", s:bold, s:blue, s:none, s:none)
call s:Highlight("helpExample", s:none, s:base1, s:none, s:none)
call s:Highlight("helpOption", s:none, s:cyan, s:none, s:none)
call s:Highlight("helpNote", s:none, s:magenta, s:none, s:none)
call s:Highlight("helpVim", s:none, s:magenta, s:none, s:none)
call s:Highlight("helpHyperTextJump", s:uline, s:blue, s:none, s:none)
call s:Highlight("helpHyperTextEntry", s:none, s:green, s:none, s:none)
call s:Highlight("vimIsCommand", s:none, s:base00, s:none, s:none)
call s:Highlight("vimSynMtchOpt", s:none, s:yellow, s:none, s:none)
call s:Highlight("vimSynType", s:none, s:cyan, s:none, s:none)
call s:Highlight("vimHiLink", s:none, s:blue, s:none, s:none)
call s:Highlight("vimHiGroup", s:none, s:blue, s:none, s:none)
call s:Highlight("vimGroup", s:uline, s:blue, s:none, s:none)

call s:Highlight("gitcommitComment", s:italic, s:base01, s:none, s:none)
call s:Highlight("gitcommitUnmerged", s:bold, s:green, s:none, s:none)
call s:Highlight("gitcommitOnBranch", s:bold, s:base01, s:none, s:none)
call s:Highlight("gitcommitBranch", s:bold, s:magenta, s:none, s:none)
call s:Highlight("gitcommitDiscardedType", s:none, s:red, s:none, s:none)
call s:Highlight("gitcommitSelectedType", s:none, s:green, s:none, s:none)
call s:Highlight("gitcommitHeader", s:none, s:base01, s:none, s:none)
call s:Highlight("gitcommitUntrackedFile", s:bold, s:cyan, s:none, s:none)
call s:Highlight("gitcommitDiscardedFile", s:bold, s:red, s:none, s:none)
call s:Highlight("gitcommitSelectedFile", s:bold, s:green, s:none, s:none)
call s:Highlight("gitcommitUnmergedFile", s:bold, s:yellow, s:none, s:none)
call s:Highlight("gitcommitFile", s:bold, s:base0, s:none, s:none)

call s:Highlight("htmlTag", s:none, s:base01, s:none, s:none)
call s:Highlight("htmlEndTag", s:none, s:base01, s:none, s:none)
call s:Highlight("htmlTagN", s:bold, s:base1, s:none, s:none)
call s:Highlight("htmlTagName", s:bold, s:blue, s:none, s:none)
call s:Highlight("htmlSpecialTagName", s:italic, s:blue, s:none, s:none)
call s:Highlight("htmlArg", s:none, s:base00, s:none, s:none)
call s:Highlight("javaScript", s:none, s:yellow, s:none, s:none)

call s:Highlight("VarId", s:none, s:blue, s:none, s:none)
call s:Highlight("ConId", s:none, s:yellow, s:none, s:none)
call s:Highlight("hsImport", s:none, s:magenta, s:none, s:none)
call s:Highlight("hsString", s:none, s:base00, s:none, s:none)
call s:Highlight("hsStructure", s:none, s:cyan, s:none, s:none)
call s:Highlight("hs_hlFunctionName", s:none, s:blue, s:none, s:none)
call s:Highlight("hsStatement", s:none, s:cyan, s:none, s:none)
call s:Highlight("hsImportLabel", s:none, s:cyan, s:none, s:none)
call s:Highlight("hs_OpFunctionName", s:none, s:yellow, s:none, s:none)
call s:Highlight("hs_DeclareFunction", s:none, s:orange, s:none, s:none)
call s:Highlight("hsVarSym", s:none, s:cyan, s:none, s:none)
call s:Highlight("hsType", s:none, s:yellow, s:none, s:none)
call s:Highlight("hsTypedef", s:none, s:cyan, s:none, s:none)
call s:Highlight("hsModuleName", s:uline, s:green, s:none, s:none)
call s:Highlight("hsModuleStartLabel", s:none, s:magenta, s:none, s:none)
call s:Highlight("hsNiceOperator", s:none, s:cyan, s:none, s:none)
call s:Highlight("hsniceoperator", s:none, s:cyan, s:none, s:none)

hi! link lCursor Cursor
hi! link vimVar Identifier
hi! link vimFunc Function
hi! link vimUserFunc Function
hi! link helpSpecial Special

hi! link diffAdded Statement
hi! link diffLine Identifier
hi! link gitcommitUntracked gitcommitComment
hi! link gitcommitDiscarded gitcommitComment
hi! link gitcommitSelected gitcommitComment
hi! link gitcommitNoBranch gitcommitBranch
hi! link gitcommitDiscardedArrow gitcommitDiscardedFile
hi! link gitcommitSelectedArrow gitcommitSelectedFile
hi! link gitcommitUnmergedArrow gitcommitUnmergedFile

hi! link hsImportParams Delimiter
hi! link hsDelimTypeExport Delimiter
hi! link hsModuleStartLabel hsStructure
hi! link hsModuleWhereLabel hsModuleStartLabel
hi! link vimSet Normal
hi! link vimSetEqual Normal
