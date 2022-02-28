# themes
Import-Module oh-my-posh
Set-PoshPrompt -Theme ys
# git autosugest
Import-Module posh-git
# scoop
Import-Module "$($(Get-Item $(Get-Command scoop).Path).Directory.Parent.FullName)\modules\scoop-completion"
# auto suggest
Import-Module PSReadLine
Set-PSReadlineKeyHandler -Key Tab -Function Complete
Set-PSReadLineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadLineKeyHandler -Key DownArrow -Function HistorySearchForward
# color for dir
Import-Module Get-ChildItemColor

# alias for git
Function gss {git status -s}
function gcob {
    $cmd = "git checkout -b " + $args[0]
    Invoke-Expression $cmd
}
Function gb {git branch}

# Env Variable
$Env:Path += ";G:\Software\anaconda;G:\Software\anaconda\condabin"
$Env:ANDROID_NDK = "C:\Users\zongfeijing\AppData\Local\Android\Sdk\ndk\21.1.6352462"
$Env:CUDACXX = "G:\CUDA-11.4\bin\nvcc.exe"
$Env:Path += ";C:\Program Files (x86)\Microsoft Visual Studio\2019\Professional\Common7\IDE\CommonExtensions\Microsoft\CMake\CMake\bin;C:\Program Files (x86)\Microsoft Visual Studio\2019\Professional\Common7\IDE\CommonExtensions\Microsoft\CMake\Ninja"

