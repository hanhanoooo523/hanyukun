# Builds StyleShift-presentation.pptx from styleshift-slides.json via PowerPoint COM.
$ErrorActionPreference = 'Stop'
$root = $PSScriptRoot
$jsonPath = Join-Path $root 'styleshift-slides.json'
$outPath = Join-Path $root 'StyleShift-presentation.pptx'

if (-not (Test-Path -LiteralPath $jsonPath)) {
  Write-Error "Missing $jsonPath"
}

$raw = Get-Content -LiteralPath $jsonPath -Raw -Encoding UTF8
$ades = $raw | ConvertFrom-Json

$ppt = $null
$pres = $null
try {
  $ppt = New-Object -ComObject PowerPoint.Application
  # Some installs reject Hidden automation; brief visible window is OK.
  $ppt.Visible = -1
  $ppt.DisplayAlerts = 2
  $pres = $ppt.Presentations.Add()

  $pres.PageSetup.SlideWidth = 960
  $pres.PageSetup.SlideHeight = 540

  $yi = [char]0x5FAE + [char]0x8F6F + [char]0x96C5 + [char]0x9ED1

  foreach ($item in $ades) {
    $layout = [int]$item.layout
    $slide = $pres.Slides.Add($pres.Slides.Count + 1, $layout)

    try {
      $slide.Shapes.Title.TextFrame.TextRange.Text = [string]$item.title
      $slide.Shapes.Title.TextFrame.TextRange.Font.Name = $yi
      $slide.Shapes.Title.TextFrame.TextRange.Font.Size = $(if ($layout -eq 1) { 26 } else { 24 })
    } catch { }

    $body = [string]$item.body
    if ($layout -eq 2 -and $body) {
      try {
        $ph = $slide.Shapes.Placeholders.Item(2)
        $ph.TextFrame.TextRange.Text = $body.Replace('\r\n', "`r`n").Replace('\n', "`r`n")
        $ph.TextFrame.TextRange.Font.Name = $yi
        $ph.TextFrame.TextRange.Font.Size = 14
        $ph.TextFrame.WordWrap = -1
      } catch {
        foreach ($sh in $slide.Shapes) {
          if ($sh.HasTextFrame -ne -1) { continue }
          try { if ($sh.Id -eq $slide.Shapes.Title.Id) { continue } } catch { }
          $sh.TextFrame.TextRange.Text = $body.Replace('\r\n', "`r`n").Replace('\n', "`r`n")
          $sh.TextFrame.TextRange.Font.Name = $yi
          $sh.TextFrame.TextRange.Font.Size = 14
          break
        }
      }
    }
    elseif ($layout -eq 1 -and $body) {
      try {
        $ph = $slide.Shapes.Placeholders.Item(2)
        $ph.TextFrame.TextRange.Text = $body.Replace('\r\n', "`r`n").Replace('\n', "`r`n")
        $ph.TextFrame.TextRange.Font.Name = $yi
        $ph.TextFrame.TextRange.Font.Size = 13
      } catch { }
    }
  }

  if (Test-Path -LiteralPath $outPath) { Remove-Item -LiteralPath $outPath -Force }
  $pres.SaveAs($outPath)
}
finally {
  if ($pres) { $pres.Close() }
  if ($ppt) { $ppt.Quit() }
  [System.GC]::Collect()
  [System.GC]::WaitForPendingFinalizers()
}

Write-Host ('Done: ' + $outPath)
