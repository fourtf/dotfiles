function confirm([String] $query) {
	return (Read-Host "${query}? [y/N]") -match 'y|Y'
}

function link ($link, $target) {
	New-Item -Path $link -ItemType SymbolicLink -Value $target -Force
}

if (confirm "Link powershell profile") { link $PROFILE                  "$env:USERPROFILE/profile.ps1" }
if (confirm "Link vimrc")              { link "$env:USERPROFILE/.vimrc" "$PSScriptRoot/vimrc"          }

if (confirm "Load concfg config") { concfg import "$PSScriptRoot/" }
