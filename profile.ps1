# remove defaults
Remove-Alias ls
Remove-Alias cp
Remove-Alias cat
Remove-Alias mv
Remove-Alias rm
function ls { ls.exe --color $args }
function mkdir { mkdir.exe $args }

# helpers
function _color($id) {
    return "$([char]27)[${id}m";
}

function Get-GitBranch {
    $dir = (Get-Item .)
    while ($dir -ne $null) {
        $head = $dir.FullName + "\.git\HEAD"
        if (Test-Path $head) {
            return (Get-Content $head) -replace ".+/",""
        }

        $dir = $dir.Parent
    }
    return ""
}

# custom prompt
function Prompt {
    $a = (Get-Location).ToString().Split("\")

    for ($i = 1; $i -lt $a.Length - 1; $i++) {
        $a[$i] = $a[$i][0].ToString()
    }

    $branch = Get-GitBranch
    if ($branch -ne "") {
        $branch = " " + $branch
    }

    return "$(_color 32)$($a -Join "\")$(_color 36)$branch$(_color 0)$(_color 0)> "
}