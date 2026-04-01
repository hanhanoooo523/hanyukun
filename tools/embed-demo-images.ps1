# Embeds demo-screenshots/*.png into the HTML deck that references style-selection.png as data URIs.
$ErrorActionPreference = 'Stop'
$base = Resolve-Path (Join-Path $PSScriptRoot '..')

$htmlPath = Get-ChildItem -LiteralPath $base -Filter '*.html' -File | Where-Object {
  $c = [IO.File]::ReadAllText($_.FullName, [Text.Encoding]::UTF8)
  return $c.Contains('demo-screenshots/style-selection.png')
} | Select-Object -First 1 -ExpandProperty FullName

if (-not $htmlPath) { throw 'Could not find presentation HTML with demo-screenshots refs.' }

$html = [IO.File]::ReadAllText($htmlPath, [Text.Encoding]::UTF8)
$dir = Join-Path $base 'demo-screenshots'
Get-ChildItem -LiteralPath $dir -Filter '*.png' -File | ForEach-Object {
  $name = $_.Name
  $old = 'src="demo-screenshots/' + $name + '"'
  if ($html.Contains($old)) {
    $bytes = [IO.File]::ReadAllBytes($_.FullName)
    $b64 = [Convert]::ToBase64String($bytes)
    $new = 'src="data:image/png;base64,' + $b64 + '"'
    $html = $html.Replace($old, $new)
    Write-Host ('embedded ' + $name)
  }
}

[IO.File]::WriteAllText($htmlPath, $html, [Text.UTF8Encoding]::new($false))
Write-Host ('done ' + $htmlPath)
