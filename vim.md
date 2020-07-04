# Navigation

## Page up or down
`<c-f> <c-b>`

## To begining and end of word
`w, e`
b to navigate backward

## Navigage by paragraph
`{  }`
`[  ]`

## Navigage by lines
`(  )`

## Top, middle and end of page view
`H M L`

## Shifting screen
`zz`:    Current line to middle
`zt`:    Current line to top
`zb`:    Current line to bottom
`<C-e>`: Scroll one line up
`<C-y>`: Scroll one line down
`<C-d>`: Scroll half page
`<C-f>`: Scroll half page down

## To start and end of file
`gg G`

## To a particular line number
`:10`
`10gg`

## Indents entire file
`gg=G`

## Indent current line
`==`

# Vim text objects great tutorial to take VIM editing to a whole new level
http://blog.carbonfive.com/2011/10/17/vim-text-objects-the-definitive-guide/

## Indenting
Use the > command. To indent 5 lines, 5>>. To mark a block of lines and indent it, Vjj> to indent 3 lines (vim only). To indent a curly-braces block, put your cursor on one of the curly braces and use >%.

If you’re copying blocks of text around and need to align the indent of a block in its new location, use ]p instead of just p. This aligns the pasted block with the surrounding text.dent by 5 tabs
5>>

<shift>-v also works to select a line in Vim

# Other tips
http://tnerual.eriogerg.free.fr/vimqrc.html
https://sites.google.com/site/chrelad/notes-1/vimtips
https://gist.github.com/m3nd3s/3959966

# Replace a word under cursor
ciw
cw # if cursor is at the beginnning of the line

#Open new files
# in same window
:e <filename>

# in a new tab
:tabe <filename>
# split screen
:sp <filename>

# Delete all empty lines in a file
:g/^$/d

# copy a word with another word
# at the first word
yiw
# at the second word
viwp
# at the third word
viw"0p

#replace a line with another line
#at the first line
yy
#at the second line
Vp
#at the third line
V"0p
#"0p means we are using the copied text in first register 0


