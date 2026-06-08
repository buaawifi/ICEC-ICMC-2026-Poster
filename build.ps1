$ErrorActionPreference = "Stop"

$posterRoot = Split-Path -Parent $MyInvocation.MyCommand.Path
$buildDir = Join-Path $posterRoot "build"
$oldTexInputs = $env:TEXINPUTS

New-Item -ItemType Directory -Path $buildDir -Force | Out-Null
Push-Location $posterRoot
try {
    $env:TEXINPUTS = ".;vendor/beamerposter//;vendor/gemini-local//;" + $oldTexInputs
    xelatex --disable-installer -interaction=nonstopmode -halt-on-error -output-directory=build poster.tex
    xelatex --disable-installer -interaction=nonstopmode -halt-on-error -output-directory=build poster.tex
    Copy-Item -LiteralPath (Join-Path $buildDir "poster.pdf") -Destination (Join-Path $posterRoot "poster.pdf") -Force
}
finally {
    $env:TEXINPUTS = $oldTexInputs
    Pop-Location
}
