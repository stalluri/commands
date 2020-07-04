# Navigation

```
<C-f> <C-b> : Page up or down
       w, e : To begining and end of word
          b : To navigate backward
       {  } : Navigage by paragraph
       [  ] : Navigage by paragraph
       (  ) : Navigage by lines
      H M L : Top, middle and end of page view
       gg G : To start and end of file
 10 or 10gg : To a particular line number
       gg=G : Indents entire file
         == : Indent current line
```

## Shifting screen
```
   zz : Current line to middle
   zt : Current line to top
   zb : Current line to bottom
<C-e> : Scroll one line up
<C-y> : Scroll one line down
<C-d> : Scroll half page
<C-f> : Scroll half page down
```

# Word replacement
```
            ciw : Replace a word under cursor
             cw : if cursor is at the beginnning of the line
   e <filename> : Open new files in same window
tabe <filename> : in a new tab
  sp <filename> : split screen
         g/^$/d : Delete all empty lines in a file
            yiw : copy a word with another word at the first word
           viwp : at the second word
         viw"0p : at the third word
             yy : replace a line with another line at the first line
             Vp : at the second line
           V"0p : at the third line
           #"0p : means we are using the copied text in first register 0
```

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


