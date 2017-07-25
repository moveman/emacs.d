# Introduction

A clone of https://github.com/syl20bnr/spacemacs.

# Usage

See full configuration [here](core.org).

## Global Key Bindings

### Buffer
Key Binding | Description
----------- | -----------
`SPC b b`   | find buffer
`SPC b d`   | delete buffer
`SPC b l`   | list buffers
`SPC b o`   | find the other buffer

### File
Key Binding | Description
----------- | -----------
`SPC f f`   | find file
`SPC f h`   | find help
`SPC f i`   | jump within file
`SPC f j`   | jump to the directory of file
`SPC f s`   | save file

### Project
Key Binding | Description
----------- | -----------
`SPC p p`   | find project
`SPC p a`   | find alternate file in project
`SPC p b`   | find buffer in project
`SPC p d`   | find directory in project
`SPC p f`   | find file in project
`SPC p h`   | find home of project
`SPC p o`   | find the other buffer in project
`SPC p k`   | kill all buffers of project
`SPC p s`   | search in project
`SPC p c`   | compile project
`SPC p e`   | create an eshell at project home

### Window
Key Binding | Description
----------- | ----------
`SPC w w`   | find window
`SPC w o`   | switch to last window
`SPC w h/l` | move point to the left/right window
`SPC w j/k` | move point to the down/up window
`SPC w H/L` | move window to the far-left/far-right
`SPC w J/K` | move window to the bottom/top
`SPC w s`   | split window horizontally
`SPC w v`   | split window vertically
`SPC w d`   | delete window
`SPC w m`   | maximize window
`SPC w u`   | undo window layout
`SPC w r`   | redo window layout
`SPC w .`   | resize current window
`SPC w =`   | balance the sizes of windows

### Git
Key Binding | Description
----------- | -----------
`SPC g b`   | git blame
`SPC g d`   | git diff
`SPC g f`   | git file operations
`SPC g l`   | git log
`SPC g s`   | git status

### Misc
Key Binding | Description
----------- | -----------
`SPC q e`   | kill emacs daemon
`SPC q q`   | quit
`SPC r`     | resume last interaction
`SPC s`     | search in current directory
`SPC u`     | universal argument
`SPC !`     | execute external command
`SPC SPC`   | execute internal command

## Major Mode Key Bindings

### C++
Key Binding | Description
----------- | -----------
`, g g`     | go to definition
`, g u`     | go to references
`, g v`     | go to virtual functions
`, g b`     | go back
`, g f`     | go forward
