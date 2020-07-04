## Navigation

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

## Word replacement
```
            ciw : Replace a word under cursor
             cw : if cursor is at the beginnning of the line
             V  : Select a line visually
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

## Indenting
```
   > : Indent current line
  == : Indent current line
  4> : Indent 4 lines
  >% : Cursor on block paranthesis to indent entire block
V5j> : Indent 5 lines in visual mode
]p   : Carry indention of copied block
```

## Other miscellaneous vim tips and links
[Vim Tips] (https://gist.github.com/m3nd3s/3959966)
[Vim text objects] (http://blog.carbonfive.com/2011/10/17/vim-text-objects-the-definitive-guide/)
[Vim QRC] (http://tnerual.eriogerg.free.fr/vimqrc.html)
