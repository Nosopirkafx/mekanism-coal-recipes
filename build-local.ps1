param(
    [string]$LibraryRoot = "$env:USERPROFILE/.minecraftx/libraries",
    [string]$Jdk = "$env:USERPROFILE/.gradle/jdks/jetbrains_s_r_o_-21-amd64-windows.2",
    [switch]$ResourcesOnly
)
$ErrorActionPreference = 'Stop'
Push-Location $PSScriptRoot
try {
    New-Item -ItemType Directory -Force 'build/classes/java/main', 'build/libs' | Out-Null
    if (-not $ResourcesOnly) {
    $jars = Get-ChildItem $LibraryRoot -Recurse -Filter '*.jar' | Where-Object {
        $_.FullName -notmatch 'net\\minecraftforge\\|net\\fabricmc\\|net\\neoforged\\neoforge\\21.1.250\\|installer|net\\minecraft\\client\\'
    }
    if (-not ($jars.Name -contains 'neoforge-21.1.251-client.jar')) {
        throw 'Missing installed NeoForge 21.1.251 client libraries.'
    }
    $classpath = ($jars.FullName -join ';').Replace('\', '/')
    $compilerArgs = @('--release', '21', '-encoding', 'UTF-8', '-proc:none',
        '-classpath', ('"' + $classpath + '"'), '-d', 'build/classes/java/main',
        'src/main/java/dev/coalsynthesis/CoalSynthesis.java')
    [IO.File]::WriteAllLines((Join-Path $PSScriptRoot 'build/javac.args'), $compilerArgs, [Text.UTF8Encoding]::new($false))
    & "$Jdk/bin/javac.exe" '@build/javac.args'
    if ($LASTEXITCODE -ne 0) { throw "Compilation failed: $LASTEXITCODE" }
    } elseif (-not (Test-Path 'build/classes/java/main/dev/coalsynthesis/CoalSynthesis.class')) {
        throw 'Compiled classes are missing; run a full build first.'
    }
    & "$Jdk/bin/jar.exe" --create --file 'build/libs/mekanism-coal-recipes-1.0.3.jar' -C 'build/classes/java/main' . -C 'src/main/resources' .
    if ($LASTEXITCODE -ne 0) { throw "Packaging failed: $LASTEXITCODE" }
    Write-Output 'Built build/libs/mekanism-coal-recipes-1.0.3.jar'
} finally {
    Pop-Location
}
