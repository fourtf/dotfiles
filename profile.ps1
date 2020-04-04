Remove-Alias ls
Remove-Alias cp
Remove-Alias cat
Remove-Alias mv
Remove-Alias rm
function ls { ls.exe --color $args }
function mkdir { mkdir.exe $args }
