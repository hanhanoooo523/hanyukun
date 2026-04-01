# Merges multi-slide deck into category pages with <details> accordion blocks.
# Run:
#   .\tools\build-accordion-deck.ps1
#   .\tools\build-accordion-deck.ps1 -OutFile 'StyleShift-设计演示-大类小点展开.html'
param(
  [string]$OutFile = 'StyleShift-设计演示.html',
  [string]$BackupFile = 'StyleShift-设计演示-多页原版备份.html'
)
$ErrorActionPreference = 'Stop'
$root = Resolve-Path (Join-Path $PSScriptRoot '..')
$utf8 = New-Object System.Text.UTF8Encoding $false
$backup = Join-Path $root $BackupFile
$outFile = if ([System.IO.Path]::IsPathRooted($OutFile)) { $OutFile } else { Join-Path $root $OutFile }
$live = @(Get-ChildItem -LiteralPath $root -Filter 'StyleShift*.html' -File |
  Where-Object { $_.Length -gt 500000 -and $_.Name -notlike '*备份*' })[0]

if (-not (Test-Path -LiteralPath $backup)) {
  if (-not $live) { throw '需要 StyleShift-设计演示.html 以创建首次备份，或手动放入 StyleShift-设计演示-多页原版备份.html' }
  Copy-Item -LiteralPath $live.FullName -Destination $backup
  Write-Host "Created backup: StyleShift-设计演示-多页原版备份.html"
}

$content = [IO.File]::ReadAllText($backup, $utf8)
$deckOpen = '<div class="deck" id="deck"'
$ix = $content.IndexOf($deckOpen)
if ($ix -lt 0) { throw 'deck div not found' }
$ixGt = $content.IndexOf('>', $ix)
if ($ixGt -lt 0) { throw 'deck opening tag not closed' }
$deckOpen = $content.Substring($ix, $ixGt - $ix + 1)
$mm = [regex]::Match($content, '</div>\s*\r?\n\s*<script>')
if (-not $mm.Success) { throw 'Could not find deck closing </div> before <script>' }
$closeDiv = $mm.Index
$post = $content.Substring($closeDiv)
$pre = $content.Substring(0, $ix + $deckOpen.Length)
$oldInner = $content.Substring($ix + $deckOpen.Length, $closeDiv - ($ix + $deckOpen.Length)).Trim()

$slideRx = [regex]::new('(?s)<section class="slide[^"]*" data-slide="(\d+)">(.*?)</section>')
$slides = @{}
foreach ($m in $slideRx.Matches($oldInner)) {
  $slides[$m.Groups[1].Value] = $m.Groups[2].Value.Trim()
}

function Strip-TagLine([string]$html) {
  return ($html -replace '(?s)^\s*<p class="tag"[^>]*>.*?</p>\s*', '').Trim()
}
function Strip-TagAndH2([string]$html) {
  $x = Strip-TagLine $html
  return ($x -replace '(?s)^\s*<h2[^>]*>.*?</h2>\s*', '').Trim()
}
function Tag-Only([string]$html) {
  if ($html -match '(?s)^(\s*<p class="tag"[^>]*>.*?</p>)') { return $Matches[1].Trim() }
  return ''
}

function DetailsBlock([string]$summaryInner, [string]$bodyHtml) {
  return @"
    <details class="acc-item">
      <summary class="acc-summary">$summaryInner</summary>
      <div class="acc-body">
        $bodyHtml
      </div>
    </details>
"@
}

$s0 = @"
  <section class="slide slide--cover active" data-slide="0">
$($slides['0'])
  </section>
"@

$s1raw = $slides['1']
$s1head = ''
if ($s1raw -match '(?s)^(.*?)<ul>') { $s1head = $Matches[1].Trim() }
$s1tail = ''
if ($s1raw -match '(?s)</ul>\s*(<p.*)$') { $s1tail = $Matches[1].Trim() }
$s1lis = [regex]::Matches($s1raw, '(?s)<li[^>]*>.*?</li>')
$acc1 = ''
$idx = 1
foreach ($li in $s1lis) {
  $bodyLi = "      <ul class=`"acc-ul`">`n        $($li.Value)`n      </ul>"
  $acc1 += (DetailsBlock "<span class=""acc-ix"">$idx</span><span data-i18n=""acc.d1.s$idx""></span>" $bodyLi)
  $idx++
}
$s1 = @"
  <section class="slide" data-slide="1">
    $s1head
    <div class="accordion">
$acc1
    </div>
    $s1tail
  </section>
"@

$s2tag = Tag-Only $slides['2']
$b2 = Strip-TagAndH2 $slides['2']
$b3 = Strip-TagAndH2 $slides['3']
$b4 = Strip-TagAndH2 $slides['4']
$s2 = @"
  <section class="slide slide--wide-copy" data-slide="2">
    $s2tag
    <div class="accordion">
$( DetailsBlock '<span data-i18n="d2.h2"></span>' $b2 )
$( DetailsBlock '<span data-i18n="d3.h2"></span>' $b3 )
$( DetailsBlock '<span data-i18n="d4.h2"></span>' $b4 )
    </div>
  </section>
"@

$s3tag = Tag-Only $slides['5']
$b5 = Strip-TagAndH2 $slides['5']
$b6 = Strip-TagAndH2 $slides['6']
$b7 = Strip-TagAndH2 $slides['7']
$b8 = Strip-TagAndH2 $slides['8']
$s3 = @"
  <section class="slide slide--wide-copy" data-slide="3">
    $s3tag
    <div class="accordion">
$( DetailsBlock '<span data-i18n="d5.h2"></span>' $b5 )
$( DetailsBlock '<span data-i18n="d6.h2"></span>' $b6 )
$( DetailsBlock '<span data-i18n="d7.h2"></span>' $b7 )
$( DetailsBlock '<span data-i18n="d8.h2"></span>' $b8 )
    </div>
  </section>
"@

$sAtag = Tag-Only $slides['9']
$b9 = Strip-TagAndH2 $slides['9']
$b10 = Strip-TagAndH2 $slides['10']
$b11 = Strip-TagAndH2 $slides['11']
$b12 = Strip-TagAndH2 $slides['12']
$b13 = Strip-TagAndH2 $slides['13']
$s4 = @"
  <section class="slide slide--wide-copy" data-slide="4">
    $sAtag
    <div class="accordion">
$( DetailsBlock '<span data-i18n="d9.h2"></span>' $b9 )
$( DetailsBlock '<span data-i18n="d10.h2"></span>' $b10 )
$( DetailsBlock '<span data-i18n="d11.h2"></span>' $b11 )
$( DetailsBlock '<span data-i18n="d12.h2"></span>' $b12 )
$( DetailsBlock '<span data-i18n="d13.h2"></span>' $b13 )
    </div>
  </section>
"@

$s5 = @"
  <section class="slide" data-slide="5">
$($slides['14'])
  </section>
"@

$newInner = "`n$s0`n$s1`n$s2`n$s3`n$s4`n$s5`n"

$accCss = @'

/* Accordion: major section on one page, click to expand */
.slide .accordion {
  margin-top: 0.75rem;
  width: 100%;
  max-width: 100%;
  display: flex;
  flex-direction: column;
  gap: 0.5rem;
}
.acc-item {
  border: 1px solid var(--border);
  border-radius: 12px;
  background: rgba(22, 22, 42, 0.55);
  overflow: hidden;
}
.acc-summary {
  cursor: pointer;
  list-style: none;
  padding: 0.75rem 1rem;
  font-size: clamp(0.95rem, 2vw, 1.1rem);
  font-weight: 600;
  color: var(--text);
  display: flex;
  align-items: center;
  gap: 0.5rem;
  user-select: none;
}
.acc-summary::-webkit-details-marker { display: none; }
.acc-summary::after {
  content: "+";
  margin-left: auto;
  font-weight: 400;
  color: var(--accent2);
}
.acc-item[open] > .acc-summary::after { content: "\2212"; }
.acc-body {
  padding: 0 1rem 1rem;
  border-top: 1px solid rgba(42, 42, 74, 0.6);
}
.acc-body p, .acc-body li { max-width: none; }
.acc-ul { margin: 0.35em 0 0; padding-left: 1.25em; list-style-position: outside; }
.acc-body .slide-photo,
.acc-body .slide-photo-stack { margin-top: 0.75rem; }
.acc-ix {
  display: inline-flex;
  align-items: center;
  justify-content: center;
  min-width: 1.5em;
  height: 1.5em;
  margin-right: 0.35rem;
  border-radius: 6px;
  background: rgba(124, 92, 252, 0.2);
  color: var(--accent2);
  font-size: 0.85em;
  font-weight: 700;
}
.slide--wide-copy .acc-summary { max-width: none; }
'@

if ($pre -notmatch '\.acc-item\s*\{') {
  $pre = $pre -replace '</style>', "$accCss`n</style>"
}

$out = $pre + $newInner + $post
$__sec = ([regex]::Matches($out, '<section class="slide')).Count
if ($__sec -ne 6) { throw "Expected 6 slides in output, got $__sec. Check 多页原版备份." }

$bannerCss = @'

.deck-top-hint {
  position: fixed;
  top: max(48px, env(safe-area-inset-top, 0px));
  left: 50%;
  transform: translateX(-50%);
  z-index: 110;
  max-width: min(720px, 94vw);
  padding: 8px 14px;
  border-radius: 10px;
  border: 1px solid rgba(124, 92, 252, 0.45);
  background: rgba(22, 22, 42, 0.96);
  color: var(--text2);
  font-size: 12px;
  line-height: 1.45;
  text-align: center;
  box-shadow: 0 4px 20px rgba(0, 0, 0, 0.35);
  pointer-events: none;
}
@media print {
  .deck-top-hint { display: none !important; }
}
'@
if ($out -notmatch 'id="deckTopHint"') {
  $out = $out -replace '(\r?\n)(\.ui-hint \{)', "`$1$bannerCss`r`n`$2"
  $bannerPath = Join-Path $PSScriptRoot 'deck-top-banner.html'
  $bannerP = [IO.File]::ReadAllText($bannerPath, $utf8) + [Environment]::NewLine + [Environment]::NewLine
  $out = $out -replace '(<body>\r?\n)', "`$1$bannerP"
}

$out = $out -replace "'ui\.hint': '← → / 空格翻页 · 亦可左右滑动',", "'ui.hint': '← → / 空格翻页 · 亦可用 ↑↓ 展开条目；左右翻大类页',"
$out = $out -replace "'ui\.hint': '← → / Space · Swipe to change slide',", "'ui.hint': '← → / Space or ↑↓ expand rows; arrows change section',"

$zhAcc = "      'acc.d1.s1': '痛点一：多软件切换',`r`n      'acc.d1.s2': '痛点二：结果不可控',`r`n      'acc.d1.s3': '痛点三：探索效率',`r`n"
$enAcc = "      'acc.d1.s1': 'Pain 1 · Too many apps',`r`n      'acc.d1.s2': 'Pain 2 · Hard to control',`r`n      'acc.d1.s3': 'Pain 3 · Slow exploration',`r`n"
$script:li3Pass = 0
$zhAccLocal = $zhAcc
$enAccLocal = $enAcc
$evalLi3 = {
  param([System.Text.RegularExpressions.Match]$m)
  $script:li3Pass++
  if ($script:li3Pass -eq 1) { return $m.Groups[1].Value + $zhAccLocal }
  if ($script:li3Pass -eq 2) { return $m.Groups[1].Value + $enAccLocal }
  return $m.Groups[1].Value
}
$out = [regex]::Replace($out, '(?m)^(\s+''d1\.li3'': [^\r\n]+\r?\n)', $evalLi3)

$printJs = @"

  window.addEventListener(`"beforeprint`", function () {
    document.querySelectorAll(`"details.acc-item`").forEach(function (d) {
      d.dataset.wasClosed = d.open ? `"`" : `"1`";
      d.setAttribute(`"open`", `"`");
    });
  });
  window.addEventListener(`"afterprint`", function () {
    document.querySelectorAll(`"details.acc-item`").forEach(function (d) {
      if (d.dataset.wasClosed === `"1`") { d.removeAttribute(`"open`"); }
      delete d.dataset.wasClosed;
    });
  });
"@

if ($out -notmatch 'beforeprint') {
  $out = $out -replace '(\s+applyDeckI18n\(\);\s+show\(0\);)', ($printJs + "`$1")
}

# 同一「大类」内只展开一条小点（须插在脚本末尾 init 处，勿匹配到 toggleDeckLang 内的 applyDeckI18n）
$accExclusive = @"

  /* exclusive-open: one bullet per category */
  document.getElementById('deck').addEventListener('toggle', function (e) {
    var el = e.target;
    if (!el || el.tagName !== 'DETAILS' || !el.classList.contains('acc-item') || !el.open) return;
    var root = el.closest('.accordion');
    if (!root) return;
    root.querySelectorAll('details.acc-item').forEach(function (d) {
      if (d !== el) d.removeAttribute('open');
    });
  }, true);
"@
if ($out -notmatch 'exclusive-open: one bullet') {
  $out = [regex]::Replace($out, '(?m)^  applyDeckI18n\(\);\r?\n  show\(0\);', ($accExclusive + "`r`n  applyDeckI18n();`r`n  show(0);"), 1)
}

$printCss = @'

  .acc-item { border-color: #ccc; background: #fafafa; }
  .acc-summary { color: #1a1a24; }
  .acc-body { border-top-color: #ddd; }
  .acc-ix { background: #ede9fe; color: #5b21b6; }
'@
if ($out -notmatch 'acc-item \{ border-color: #ccc') {
  $out = $out -replace '(  @page \{ size: 13\.333in 7\.5in; margin: 0\.45in; \})', ($printCss.TrimEnd() + "`n  `$1")
}

# 若备份仍为 touchstart/touchend，换成 Pointer + 触控板横向滚轮（与 StyleShift-deck-expand 主路径一致）
$swipeRx = [regex]::new('(?s)  let startX = 0;\s*document\.getElementById\(''deck''\)\.addEventListener\(''touchstart'',.*?passive: true \}\);\s*document\.getElementById\(''deck''\)\.addEventListener\(''touchend'',.*?passive: true \}\);\s*')
$swipeNew = @'
  var deckEl = document.getElementById('deck');
  var swipePtrId = null;
  var startX = 0;
  var startY = 0;

  deckEl.addEventListener('pointerdown', function (e) {
    if (e.pointerType === 'mouse' && e.button !== 0) return;
    swipePtrId = e.pointerId;
    startX = e.clientX;
    startY = e.clientY;
    try { deckEl.setPointerCapture(e.pointerId); } catch (err) {}
  });

  function finishSwipe(e) {
    if (swipePtrId !== e.pointerId) return;
    swipePtrId = null;
    try { deckEl.releasePointerCapture(e.pointerId); } catch (err) {}
    var d = e.clientX - startX;
    var dy = e.clientY - startY;
    if (Math.abs(d) < 50 || Math.abs(d) < Math.abs(dy)) return;
    show(d < 0 ? i + 1 : i - 1);
  }

  deckEl.addEventListener('pointerup', finishSwipe);
  deckEl.addEventListener('pointercancel', function (e) {
    if (swipePtrId === e.pointerId) swipePtrId = null;
    try { deckEl.releasePointerCapture(e.pointerId); } catch (err) {}
  });
  deckEl.addEventListener('lostpointercapture', function (e) {
    if (swipePtrId === e.pointerId) swipePtrId = null;
  });

  var wheelAccum = 0;
  var wheelTimer = null;
  var WHEEL_TH = 65;
  deckEl.addEventListener('wheel', function (e) {
    var dx = e.deltaX;
    var dy = e.deltaY;
    var horizontal = Math.abs(dx) >= Math.abs(dy);
    var amount = horizontal ? dx : (e.shiftKey ? dy : 0);
    if (!amount) return;
    if (wheelTimer) clearTimeout(wheelTimer);
    wheelAccum += amount;
    if (Math.abs(wheelAccum) >= WHEEL_TH) {
      var goNext = wheelAccum < 0;
      wheelAccum = 0;
      e.preventDefault();
      show(goNext ? i + 1 : i - 1);
      return;
    }
    wheelTimer = setTimeout(function () { wheelAccum = 0; }, 220);
    if (horizontal || e.shiftKey) e.preventDefault();
  }, { passive: false });

'@
if ($swipeRx.IsMatch($out)) {
  $out = $swipeRx.Replace($out, $swipeNew, 1)
}
if ($out -notmatch 'touch-action:\s*pan-y pinch-zoom') {
  $out = $out -replace '(\.deck\s*\{\s*\r?\n  min-height:\s*100vh;\s*\r?\n  height:\s*auto;\s*\r?\n  overflow:\s*visible;\s*\r?\n  position:\s*relative;)(\s*\r?\n)', "`$1`r`n  touch-action: pan-y pinch-zoom;`$2"
}

[IO.File]::WriteAllText($outFile, $out, $utf8)
Write-Host "Wrote accordion deck:" $outFile "(chars $($out.Length)) from" $backup
