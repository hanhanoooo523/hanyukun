小组成员：韩雨坤（MC56909） 杜佳洺（MC）
[StyleShift-设计演示.html](https://github.com/user-attachments/files/26385462/StyleShift-.html)
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>StyleShift：为设计师打造的直观风格转换工具</title>
<style>
*, *::before, *::after { box-sizing: border-box; margin: 0; padding: 0; }
:root {
  --bg: #0c0c14;
  --surface: #16162a;
  --accent: #7c5cfc;
  --accent2: #c084fc;
  --text: #e8e6f0;
  --text2: #9896b0;
  --success: #34d399;
  --warn: #fbbf24;
  --border: #2a2a4a;
}
html {
  min-height: 100%;
}
html, body {
  height: auto;
  max-width: 100%;
  overflow-x: hidden;
}
body {
  min-height: 100vh;
  overflow-y: auto;
  font-family: 'Segoe UI', system-ui, -apple-system, 'PingFang SC', 'Microsoft YaHei', sans-serif;
  background: var(--bg);
  color: var(--text);
}

.deck {
  min-height: 100vh;
  height: auto;
  overflow: visible;
  position: relative;
}

.slide {
  display: none;
  position: relative;
  box-sizing: border-box;
  width: 100%;
  max-width: 920px;
  margin: 0 auto;
  /* 至少一屏高（短页仍垂直居中）；有长图时整页向下伸长，由 body 滚动 */
  min-height: 100vh;
  /* 左右预留宽度，避免标题换行后被固定「翻页」按钮遮挡 */
  padding: clamp(22px, 4vh, 56px) clamp(52px, 5vw, 88px);
  padding-bottom: clamp(56px, 12vh, 120px);
  flex-direction: column;
  justify-content: center;
  align-items: stretch;
  text-align: left;
  overflow: visible;
}
@media not print {
  .slide::before,
  .slide::after {
    content: "";
    flex: 1 1 0;
    min-height: 0;
  }
  /* 封面不用上下占位 flex，避免与渐变字叠加后被截掉最后一行 */
  .slide--cover::before,
  .slide--cover::after {
    display: none;
    content: none;
    flex: 0 0 0;
  }
}
.slide.active {
  display: flex;
  pointer-events: auto;
  z-index: 1;
}

.slide--cover {
  padding-top: clamp(28px, 8vh, 72px);
  padding-bottom: clamp(36px, 10vh, 96px);
  justify-content: center;
}

.slide h1 {
  font-size: clamp(2rem, 5vw, 3rem);
  font-weight: 700;
  line-height: 1.25;
  margin-bottom: 0.35em;
  text-align: left;
  width: 100%;
  background: linear-gradient(135deg, var(--accent), var(--accent2));
  -webkit-background-clip: text;
  background-clip: text;
  -webkit-text-fill-color: transparent;
  -webkit-box-decoration-break: clone;
  box-decoration-break: clone;
}

/* 封面主标题：紫偏粉实色（主标题折行后各行同色，无渐变裁切） */
.slide--cover h1.cover-title-line {
  margin-bottom: 0;
  white-space: normal;
  font-size: clamp(1.15rem, 3.5vw, 2.85rem);
  max-width: 100%;
  word-break: keep-all;
  line-height: 1.65;
  padding: 0.12em 0 0.28em;
  overflow: visible;
  position: relative;
  z-index: 1;
  background: none;
  -webkit-background-clip: border-box;
  background-clip: border-box;
  -webkit-text-fill-color: currentColor;
  color: #cf8fe8;
  -webkit-font-smoothing: antialiased;
}
@media (min-width: 720px) {
  .slide--cover h1.cover-title-line {
    max-width: min(100%, 32rem);
  }
}
@media (min-width: 1100px) {
  .slide--cover h1.cover-title-line {
    max-width: min(100%, 36rem);
  }
}
.slide h2 {
  font-size: clamp(1.35rem, 3.4vw, 1.95rem);
  font-weight: 600;
  margin-bottom: 0.5em;
  color: var(--text);
  text-align: left;
  width: 100%;
}
.slide p, .slide li {
  font-size: clamp(0.92rem, 1.75vw, 1.06rem);
  line-height: 1.62;
  color: var(--text2);
  max-width: 42rem;
}
.slide p + p { margin-top: 0.65em; }
.slide ul {
  margin: 0.5em 0 0;
  max-width: 42rem;
  text-align: left;
  list-style-position: outside;
  padding-left: 1.35em;
}
.slide li { margin-bottom: 0.4em; }
.slide .meta {
  font-size: 0.98rem;
  color: var(--text2);
  margin-bottom: 0.85rem;
  max-width: 42rem;
}
/* 决策二、三：文字与下方整宽配图同宽 */
.slide--wide-copy p,
.slide--wide-copy li {
  max-width: none;
}
.slide--wide-copy ul {
  max-width: none;
  width: 100%;
}
.slide--wide-copy .meta {
  max-width: none;
}
/* wide-copy 正文已占满内容区，宽图不再限 42rem，与上方段落同宽 */
.slide--wide-copy .slide-photo--wide {
  max-width: 100%;
}
.slide strong, .slide .highlight { color: var(--text); }
.slide .tag {
  display: block;
  font-size: clamp(0.8rem, 1.5vw, 0.95rem);
  font-weight: 600;
  letter-spacing: 0.06em;
  color: var(--accent2);
  margin-bottom: 0.5rem;
  text-align: left;
  width: 100%;
}

.slide-photo {
  margin-top: 1rem;
  width: 100%;
  max-width: min(100%, 280px);
  align-self: flex-start;
}
.slide-photo img {
  display: block;
  width: 100%;
  height: auto;
  border-radius: 12px;
  border: 1px solid var(--border);
  box-shadow: 0 8px 32px rgba(0, 0, 0, 0.35);
}
/* 与正文同宽（42rem），用于元素提取与融合、精细化调整等 */
.slide-photo--wide {
  max-width: min(100%, 42rem);
  width: 100%;
}
/* 超宽界面整图（如三栏一体截图） */
.slide-photo--panorama {
  max-width: 100%;
}
/* 附录② 上传区截图：控制宽度，避免误用 wide 时拉满整栏 */
.slide-photo--upload {
  max-width: min(100%, 28rem);
}
.slide-photo-stack {
  margin-top: 1rem;
  display: flex;
  flex-direction: row;
  flex-wrap: wrap;
  gap: 0.75rem;
  width: 100%;
  max-width: 100%;
  align-self: stretch;
}
.slide-photo-stack .slide-photo {
  margin-top: 0;
  flex: 1 1 calc(50% - 0.375rem);
  min-width: min(100%, 240px);
  max-width: 100%;
}
.slide-photo-stack .slide-photo.slide-photo--wide {
  max-width: none;
}
/* 附录③ 双图：同宽同高的展示框，避免一高一矮 */
.slide-photo-stack--equal-pair .slide-photo img {
  width: 100%;
  height: clamp(300px, 50vh, 520px);
  object-fit: contain;
  object-position: center top;
}

.timeline {
  margin-top: 0.75rem;
  padding-left: 0.9rem;
  border-left: 3px solid rgba(124,92,252,0.5);
}
.timeline p { margin: 0.5em 0; }

.ui-hint {
  position: fixed;
  bottom: 14px;
  left: 50%;
  transform: translateX(-50%);
  font-size: 11px;
  color: var(--text2);
  opacity: 0.55;
  z-index: 10;
  pointer-events: none;
}
.progress {
  position: fixed;
  top: 0;
  left: 0;
  height: 3px;
  background: linear-gradient(90deg, var(--accent), var(--accent2));
  z-index: 20;
  transition: width 0.25s ease;
}

.nav-btn {
  position: fixed;
  top: 50%;
  transform: translateY(-50%);
  z-index: 15;
  width: 42px;
  height: 42px;
  border-radius: 12px;
  border: 1px solid #2a2a4a;
  background: rgba(30,30,58,0.92);
  color: var(--text);
  cursor: pointer;
  font-size: 19px;
  display: flex;
  align-items: center;
  justify-content: center;
}
.nav-btn:hover { border-color: var(--accent); background: rgba(124,92,252,0.15); }
.nav-btn.prev { left: 12px; }
.nav-btn.next { right: 12px; }
@media (max-width: 600px) {
  .nav-btn { width: 34px; height: 34px; font-size: 15px; }
}

.lang-float-btn {
  position: fixed;
  top: max(10px, env(safe-area-inset-top, 0px));
  right: max(12px, env(safe-area-inset-right, 0px));
  z-index: 120;
  display: inline-flex;
  align-items: center;
  gap: 8px;
  padding: 9px 16px;
  border-radius: 999px;
  border: 1px solid rgba(192, 132, 252, 0.45);
  background: rgba(22, 22, 42, 0.94);
  backdrop-filter: blur(14px);
  -webkit-backdrop-filter: blur(14px);
  color: var(--text);
  font-size: 13px;
  font-weight: 600;
  cursor: pointer;
  box-shadow: 0 4px 24px rgba(0, 0, 0, 0.4);
  transition: border-color 0.2s, transform 0.15s;
}
.lang-float-btn:hover {
  border-color: var(--accent2);
  transform: translateY(-1px);
}
.lang-float-btn svg { flex-shrink: 0; opacity: 0.9; }

/* 汇报导出：浏览器「打印」→ 另存为 PDF（每页一帧幻灯片） */
@media print {
  html, body { height: auto; overflow: visible !important; background: #fff; }
  .deck { height: auto; overflow: visible; max-width: none; }
  .nav-btn, .progress, .ui-hint, .lang-float-btn { display: none !important; }
  .slide {
    display: flex !important;
    position: relative !important;
    inset: auto !important;
    opacity: 1 !important;
    pointer-events: auto !important;
    max-width: none;
    min-height: 6.8in;
    color: #1a1a24;
    page-break-after: always;
    break-after: page;
    justify-content: center !important;
    align-items: stretch !important;
    text-align: left !important;
  }
  .slide::before,
  .slide::after {
    content: none !important;
    flex: 0 !important;
    display: none !important;
  }
  .slide:last-child { page-break-after: auto; break-after: auto; }
  .slide h1 {
    -webkit-text-fill-color: #4c1d95;
    background: none;
    color: #4c1d95;
  }
  .slide h2, .slide p, .slide li, .slide .meta { color: #333; }
  .slide .tag { color: #6d28d9; }
  .slide-photo img {
    border-color: #ccc;
    box-shadow: none;
  }
  @page { size: 13.333in 7.5in; margin: 0.45in; }
}
</style>
</head>
<body>

<button type="button" class="lang-float-btn" id="deckLangBtn" title="Switch language / 切换语言" aria-live="polite">
  <svg width="17" height="17" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" aria-hidden="true"><circle cx="12" cy="12" r="10"/><path d="M2 12h20M12 2a15.3 15.3 0 014 8 15.3 15.3 0 01-4 8 15.310 15.310 0 01-4-8 15.310 15.310 0 014-8z"/></svg>
  <span class="lang-toggle-label">English</span>
</button>

<div class="progress" id="progress" style="width:0%"></div>
<button type="button" class="nav-btn prev" id="prev" aria-label="上一页">‹</button>
<button type="button" class="nav-btn next" id="next" aria-label="下一页">›</button>
<p class="ui-hint" data-i18n="ui.hint">← → / 空格翻页 · 亦可左右滑动</p>

<div class="deck" id="deck" role="region" aria-label="幻灯片">

  <!-- 0 封面 -->
  <section class="slide slide--cover active" data-slide="0">
    <p class="tag" data-i18n="d0.tag">视觉风格探索 · 设计陈述</p>
    <h1 class="cover-title-line" data-i18n="d0.h1">StyleShift：为设计师打造的直观风格转换工具</h1>
  </section>

  <!-- 一、为什么制作 -->
  <section class="slide" data-slide="1">
    <p class="tag" data-i18n="d1.tag">一、为什么制作这个工具？</p>
    <h2 data-i18n="d1.h2">目标与痛点</h2>
    <p data-i18n-html="d1.p1"><strong class="highlight">目标用户：</strong>视觉传达设计师、插画师、创意工作者。</p>
    <p data-i18n-html="d1.p2"><strong class="highlight">设计痛点：</strong></p>
    <ul>
      <li data-i18n-html="d1.li1">想尝试不同风格时，需要在<strong>多个软件间来回切换</strong>，流程繁琐。</li>
      <li data-i18n-html="d1.li2">风格迁移结果<strong>不可控</strong>，无法便捷地做局部调整。</li>
      <li data-i18n-html="d1.li3"><strong>灵感探索效率低</strong>，难以快速对比多种视觉方向。</li>
    </ul>
    <p data-i18n-html="d1.p3"><strong class="highlight">我们的解决方案：</strong>StyleShift 帮助设计师在设计过程中快速完成风格转换，<strong>一键查看相同元素的不同风格</strong>，节省时间，激发灵感。</p>
  </section>

  <!-- 二、1 风格探索 -->
  <section class="slide" data-slide="2">
    <p class="tag" data-i18n="d2.tag">二、如何在视觉传达设计过程中使用？</p>
    <h2 data-i18n="d2.h2">1. 风格探索</h2>
    <p data-i18n-html="d2.p1">StyleShift 贯穿设计的<strong>探索阶段与深化阶段</strong>。</p>
    <p data-i18n-html="d2.p2">上传设计稿，在油画、水彩、赛博朋克、水墨等多种风格间自由切换，快速预览不同风格的视觉表现，帮助设计师<strong class="highlight">拓宽思路</strong>。</p>
    <figure class="slide-photo">
      <img src="demo-screenshots/style-selection.png" width="313" height="503" data-i18n-alt="d2.alt" alt="风格选择界面：油画风、水彩风、复古风、赛博朋克、波普艺术、水墨风、素描风、霓虹光效等预设" loading="lazy">
    </figure>
  </section>

  <!-- 二、2 元素提取与融合 -->
  <section class="slide" data-slide="3">
    <p class="tag" data-i18n="d2.tag">二、如何在视觉传达设计过程中使用？</p>
    <h2 data-i18n="d3.h2">2. 元素提取与融合</h2>
    <p data-i18n-html="d3.p1">通过<strong>「元素拆解」</strong>功能，自动提取画面中的色块元素；可以对<strong>局部</strong>进行单独风格转换，或将多种风格<strong>融合在同一画面中</strong>，形成新的、复合的设计语言。</p>
    <figure class="slide-photo slide-photo--wide">
      <img src="demo-screenshots/element-extract-fusion.png" width="791" height="699" data-i18n-alt="d3.alt" alt="迁移结果预览与元素拆解与替换面板：主色概括程度、分析刷新元素、选区说明等" loading="lazy">
    </figure>
  </section>

  <!-- 二、3 精细化调整 -->
  <section class="slide" data-slide="4">
    <p class="tag" data-i18n="d2.tag">二、如何在视觉传达设计过程中使用？</p>
    <h2 data-i18n="d4.h2">3. 精细化调整</h2>
    <p data-i18n-html="d4.p1">支持对选区进行<strong>风格强度</strong>等参数微调；可通过<strong>色调叠加</strong>（全局）、<strong>颜色覆盖</strong>等方式调整画面气质，使最终效果更贴合设计意图。</p>
    <figure class="slide-photo slide-photo--wide">
      <img src="demo-screenshots/fine-tune-panel.png" width="795" height="625" data-i18n-alt="d4.alt" alt="区域再迁移与精细化：区域参数滑块、色桶、仅此区域再迁移、拾取色覆盖等" loading="lazy">
    </figure>
  </section>

  <!-- 三、决策一 -->
  <section class="slide" data-slide="5">
    <p class="tag" data-i18n="d5.tag">三、关键的 UI/UX 设计决策与原因</p>
    <h2 data-i18n="d5.h2">决策一：从「整体」到「局部」的功能演进</h2>
    <p data-i18n-html="d5.p1"><strong>初始设想：</strong>仅支持<strong>整张图片</strong>的风格迁移，满足基本的风格探索需求。</p>
    <p data-i18n-html="d5.p2"><strong>发现问题：</strong>设计师往往只需要改变画面中的<strong>某个局部</strong>（如主体物、背景），而非整张图。整体迁移会导致不需要改变的部分也被「改过头」，破坏原有设计。</p>
    <p data-i18n-html="d5.p3"><strong>迭代方向：</strong>将<strong>局部选区与编辑</strong>作为改进版的核心功能，使设计师能够：<strong>精确控制修改范围</strong>、<strong>保留画面核心结构</strong>、实现<strong>多种风格在同一画面中的融合</strong>。</p>
  </section>

  <!-- 三、决策二 -->
  <section class="slide slide--wide-copy" data-slide="6">
    <p class="tag" data-i18n="d5.tag">三、关键的 UI/UX 设计决策与原因</p>
    <h2 data-i18n="d6.h2">决策二：色块智能选区，降低操作门槛</h2>
    <p data-i18n-html="d6.p1"><strong>设计思路：</strong>传统选区工具（如魔棒、套索）参数复杂、操作繁琐。我们利用图像分析<strong>自动提取主色块</strong>，用户只需：</p>
    <ul>
      <li data-i18n-html="d6.li1"><strong>点击色块列表</strong> → 选中全图同色区域；</li>
      <li data-i18n-html="d6.li2"><strong>点击画面上某处</strong> → 智能选中相连的同色区域。</li>
    </ul>
    <p data-i18n-html="d6.p2"><strong>设计原因：</strong>让设计师<strong>无需学习复杂选区工具</strong>，即可快速定位想要修改的区域，把精力集中在创意本身。</p>
    <div class="slide-photo-stack">
      <figure class="slide-photo slide-photo--wide">
        <img src="demo-screenshots/decision2-purple-selection.png" width="786" height="475" data-i18n-alt="d6.img1alt" alt="迁移结果：画面上紫色区域为智能选中的相连色块" loading="lazy">
      </figure>
      <figure class="slide-photo slide-photo--wide">
        <img src="demo-screenshots/decision2-migration-result.png" width="790" height="465" data-i18n-alt="d6.img2alt" alt="迁移结果预览：风格迁移后的画面与选区示意" loading="lazy">
      </figure>
    </div>
  </section>

  <!-- 三、决策三 -->
  <section class="slide slide--wide-copy" data-slide="7">
    <p class="tag" data-i18n="d5.tag">三、关键的 UI/UX 设计决策与原因</p>
    <h2 data-i18n="d7.h2">决策三：三栏布局 + 对比视图</h2>
    <p data-i18n-html="d7.p1"><strong>布局逻辑：</strong><code style="color:var(--accent2)">原始作品 | 风格选择 | 迁移成果</code>——从左到右遵循<strong>「输入 → 处理 → 输出」</strong>的心理模型，所有操作在一个界面完成，无需跳转。</p>
    <p data-i18n-html="d7.p2"><strong>对比视图：</strong>支持<strong>拖动分界线</strong>左右对比原图和效果图，比传统「前后切换」更直观，尤其适合<strong>设计评审与方案汇报</strong>。</p>
    <p style="margin-top:0.75em;font-size:0.92rem" data-i18n-html="d7.p3">补充：界面提供<strong>中英文切换</strong>、右侧<strong>可拖拽分隔条</strong>调节预览区与工具区高度，便于教学演示与小屏设备使用。</p>
    <div class="slide-photo-stack">
      <figure class="slide-photo slide-photo--wide">
        <img src="demo-screenshots/decision3-compare-slider.png" width="788" height="610" data-i18n-alt="d7.img1alt" alt="迁移结果 · 对比模式：拖动中线左右对照原图与风格化结果" loading="lazy">
      </figure>
      <figure class="slide-photo slide-photo--wide">
        <img src="demo-screenshots/decision3-dual-panel.png" width="790" height="610" data-i18n-alt="d7.img2alt" alt="迁移结果 · 分屏模式：左右分栏完整展示原图与结果" loading="lazy">
      </figure>
    </div>
  </section>

  <!-- 三、决策四 -->
  <section class="slide slide--wide-copy" data-slide="8">
    <p class="tag" data-i18n="d5.tag">三、关键的 UI/UX 设计决策与原因</p>
    <h2 data-i18n="d8.h2">决策四：历史记录 + 撤销</h2>
    <p data-i18n-html="d8.p1"><strong>设计原因：</strong>创意过程需要反复尝试。<strong>历史条</strong>让用户可以保存多个版本进行比较；<strong>撤销</strong>降低试错成本，鼓励大胆探索。</p>
    <figure class="slide-photo slide-photo--panorama">
      <img src="demo-screenshots/decision4-top-toolbar.png" width="795" height="76" data-i18n-alt="d8.alt" alt="顶栏操作：语言切换、撤销、重置、导出（与历史与版本管理相关）" loading="lazy">
    </figure>
  </section>

  <!-- 附录：操作 ① 三栏 -->
  <section class="slide slide--wide-copy" data-slide="9">
    <p class="tag" data-i18n="dA.tag">附录 · 操作示意</p>
    <h2 data-i18n="d9.h2">① 整体界面：左图 · 中控 · 右结果</h2>
    <p data-i18n-html="d9.p1">与「设计风格迁移-改进版」一致：<strong>左侧</strong>上传原图，<strong>中间</strong>选风格与参数并生成，<strong>右侧</strong>看结果与后续拆解工具。</p>
    <p class="meta" style="margin-top:0.75rem" data-i18n-html="d9.meta"><strong class="highlight">顶栏另有：</strong>语言切换、撤销、重置、导出。</p>
    <figure class="slide-photo slide-photo--panorama">
      <img src="demo-screenshots/appendix-overall-ui.png" width="1024" height="496" data-i18n-alt="d9.alt" alt="StyleShift 整体界面：原始作品、风格选择、迁移结果三栏布局与顶栏操作" loading="lazy">
    </figure>
  </section>

  <!-- 10 操作：上传 -->
  <section class="slide slide--wide-copy" data-slide="10">
    <p class="tag" data-i18n="dA.tag">附录 · 操作示意</p>
    <h2 data-i18n="d10.h2">② 上传原图</h2>
    <p data-i18n-html="d10.p1">在左侧虚线区域内<strong>点击选择文件</strong>，或将图片<strong>拖入</strong>该区域。支持常见网页图片格式（以工具内说明为准）。</p>
    <p class="meta" style="margin-top:0.75rem" data-i18n-html="d10.meta">上传成功后，中间「生成」按钮会变可用。</p>
    <figure class="slide-photo slide-photo--upload">
      <img src="demo-screenshots/appendix-upload-original.png" width="236" height="205" data-i18n-alt="d10.alt" alt="左侧上传区：拖拽上传或点击选择图片，支持 JPG / PNG / WebP（最大 20MB）" loading="lazy">
    </figure>
  </section>

  <!-- 11 操作：选风格生成 -->
  <section class="slide slide--wide-copy" data-slide="11">
    <p class="tag" data-i18n="dA.tag">附录 · 操作示意</p>
    <h2 data-i18n="d11.h2">③ 选风格、调滑块、点「生成风格迁移」</h2>
    <p data-i18n-html="d11.p1">在中间栏点选一种风格卡片 → 按需拖动强度、饱和度等 → 可选色调叠加（色点）→ 切换「效果图 / 对比 / 分屏」为生成后的查看方式 → 点击紫色主按钮<strong>生成</strong>。</p>
    <div class="slide-photo-stack slide-photo-stack--equal-pair">
      <figure class="slide-photo slide-photo--wide">
        <img src="demo-screenshots/appendix-style-cards.png" width="311" height="487" data-i18n-alt="d11.img1alt" alt="风格选择：八类风格卡片（油画、水彩、复古、赛博朋克等）" loading="lazy">
      </figure>
      <figure class="slide-photo slide-photo--wide">
        <img src="demo-screenshots/appendix-sliders-generate.png" width="313" height="615" data-i18n-alt="d11.img2alt" alt="风格强度等滑块、色调叠加色点、效果图 / 对比 / 分屏与「生成风格迁移」按钮" loading="lazy">
      </figure>
    </div>
  </section>

  <!-- 12 操作：对比分屏 -->
  <section class="slide" data-slide="12">
    <p class="tag" data-i18n="dA.tag">附录 · 操作示意</p>
    <h2 data-i18n="d12.h2">④ 查看结果：效果图 / 对比 / 分屏</h2>
    <p data-i18n-html="d12.p1"><strong>对比</strong>：在<code style="color:var(--accent2)">同一画面</code>内拖动竖线，左为原图侧、右为结果侧。<strong>分屏</strong>：左右两栏分别完整显示原图与结果。</p>
    <p class="meta" style="margin-top:0.75rem" data-i18n-html="d12.meta">右栏大图区悬停可出现缩放与下载。</p>
  </section>

  <!-- 13 操作：元素拆解 -->
  <section class="slide slide--wide-copy" data-slide="13">
    <p class="tag" data-i18n="d13.tag">操作演示</p>
    <h2 data-i18n="d13.h2">⑤ 元素拆解：分析 → 选色块 / 点画面 → 局部再迁移</h2>
    <p data-i18n-html="d13.p1">生成结果后，右下出现面板：先点<strong>分析 / 刷新元素</strong> → 列表中点色块或<strong>在图上点选相连区域</strong>（紫色为选区）→ 为此区域选风格、调区域参数与色桶 → 点<strong>仅此区域再迁移</strong>。</p>
    <figure class="slide-photo slide-photo--wide">
      <img src="demo-screenshots/appendix-element-regional-panel.png" width="780" height="405" data-i18n-alt="d13.alt" alt="元素拆解面板：区域风格、区域参数滑块、色桶占比、与「仅此区域再迁移」按钮" loading="lazy">
    </figure>
  </section>

  <!-- 14 四、总结 -->
  <section class="slide" data-slide="14">
    <p class="tag" data-i18n="d14.tag">四、总结</p>
    <h2 data-i18n="d14.h2">StyleShift 的核心价值</h2>
    <p data-i18n-html="d14.p1">将强大的风格迁移能力，转化为设计师手中<strong class="highlight">直观、可控的创作工具</strong>。</p>
    <p data-i18n-html="d14.p2">我们不是简单地做「一键换风格」，而是从<strong class="highlight">设计工作的真实场景</strong>出发：</p>
    <ul>
      <li data-i18n-html="d14.li1"><strong>从整体到局部：</strong>先满足基础的整图风格探索，再迭代出<strong>色块智能选区 + 局部风格转换</strong>，让设计师可以精准控制修改范围。</li>
      <li data-i18n-html="d14.li2"><strong>服务于创作流程：</strong>覆盖从灵感发散、风格对比，到元素融合、精细化调整的全过程，让工具真正融入设计工作流。</li>
    </ul>
    <p style="margin-top:1em" data-i18n-html="d14.p3">最终，StyleShift 不只是一种技术实现，更是对<strong class="highlight">设计创作自由</strong>的一次回应——让风格不再是一次性的整体套用，而是可以被<strong>拆解、重组、局部打磨</strong>的灵活语言。</p>
  </section>

</div>

<script>
(function () {
  const LS_KEY = 'styleshift-deck-lang';
  let deckLang = localStorage.getItem(LS_KEY) || 'zh';

  const DECK_STR = {
    zh: {
      'doc.title': 'StyleShift：为设计师打造的直观风格转换工具',
      'ui.hint': '← → / 空格翻页 · 亦可左右滑动',
      'ui.navPrev': '上一页',
      'ui.navNext': '下一页',
      'deck.region': '幻灯片',
      'deck.langSwitch': 'English',
      'd0.tag': '视觉风格探索 · 设计陈述',
      'd0.h1': 'StyleShift：为设计师打造的直观风格转换工具',
      'd1.tag': '一、为什么制作这个工具？',
      'd1.h2': '目标与痛点',
      'd1.p1': '<strong class="highlight">目标用户：</strong>视觉传达设计师、插画师、创意工作者。',
      'd1.p2': '<strong class="highlight">设计痛点：</strong>',
      'd1.li1': '想尝试不同风格时，需要在<strong>多个软件间来回切换</strong>，流程繁琐。',
      'd1.li2': '风格迁移结果<strong>不可控</strong>，无法便捷地做局部调整。',
      'd1.li3': '<strong>灵感探索效率低</strong>，难以快速对比多种视觉方向。',
      'd1.p3': '<strong class="highlight">我们的解决方案：</strong>StyleShift 帮助设计师在设计过程中快速完成风格转换，<strong>一键查看相同元素的不同风格</strong>，节省时间，激发灵感。',
      'd2.tag': '二、如何在视觉传达设计过程中使用？',
      'd2.h2': '1. 风格探索',
      'd2.p1': 'StyleShift 贯穿设计的<strong>探索阶段与深化阶段</strong>。',
      'd2.p2': '上传设计稿，在油画、水彩、赛博朋克、水墨等多种风格间自由切换，快速预览不同风格的视觉表现，帮助设计师<strong class="highlight">拓宽思路</strong>。',
      'd2.alt': '风格选择界面：油画风、水彩风、复古风、赛博朋克、波普艺术、水墨风、素描风、霓虹光效等预设',
      'd3.h2': '2. 元素提取与融合',
      'd3.p1': '通过<strong>「元素拆解」</strong>功能，自动提取画面中的色块元素；可以对<strong>局部</strong>进行单独风格转换，或将多种风格<strong>融合在同一画面中</strong>，形成新的、复合的设计语言。',
      'd3.alt': '迁移结果预览与元素拆解与替换面板：主色概括程度、分析刷新元素、选区说明等',
      'd4.h2': '3. 精细化调整',
      'd4.p1': '支持对选区进行<strong>风格强度</strong>等参数微调；可通过<strong>色调叠加</strong>（全局）、<strong>颜色覆盖</strong>等方式调整画面气质，使最终效果更贴合设计意图。',
      'd4.alt': '区域再迁移与精细化：区域参数滑块、色桶、仅此区域再迁移、拾取色覆盖等',
      'd5.tag': '三、关键的 UI/UX 设计决策与原因',
      'd5.h2': '决策一：从「整体」到「局部」的功能演进',
      'd5.p1': '<strong>初始设想：</strong>仅支持<strong>整张图片</strong>的风格迁移，满足基本的风格探索需求。',
      'd5.p2': '<strong>发现问题：</strong>设计师往往只需要改变画面中的<strong>某个局部</strong>（如主体物、背景），而非整张图。整体迁移会导致不需要改变的部分也被「改过头」，破坏原有设计。',
      'd5.p3': '<strong>迭代方向：</strong>将<strong>局部选区与编辑</strong>作为改进版的核心功能，使设计师能够：<strong>精确控制修改范围</strong>、<strong>保留画面核心结构</strong>、实现<strong>多种风格在同一画面中的融合</strong>。',
      'd6.h2': '决策二：色块智能选区，降低操作门槛',
      'd6.p1': '<strong>设计思路：</strong>传统选区工具（如魔棒、套索）参数复杂、操作繁琐。我们利用图像分析<strong>自动提取主色块</strong>，用户只需：</p>',
      'd6.li1': '<strong>点击色块列表</strong> → 选中全图同色区域；',
      'd6.li2': '<strong>点击画面上某处</strong> → 智能选中相连的同色区域。',
      'd6.p2': '<strong>设计原因：</strong>让设计师<strong>无需学习复杂选区工具</strong>，即可快速定位想要修改的区域，把精力集中在创意本身。',
      'd6.img1alt': '迁移结果：画面上紫色区域为智能选中的相连色块',
      'd6.img2alt': '迁移结果预览：风格迁移后的画面与选区示意',
      'd7.h2': '决策三：三栏布局 + 对比视图',
      'd7.p1': '<strong>布局逻辑：</strong><code style="color:var(--accent2)">原始作品 | 风格选择 | 迁移成果</code>——从左到右遵循<strong>「输入 → 处理 → 输出」</strong>的心理模型，所有操作在一个界面完成，无需跳转。',
      'd7.p2': '<strong>对比视图：</strong>支持<strong>拖动分界线</strong>左右对比原图和效果图，比传统「前后切换」更直观，尤其适合<strong>设计评审与方案汇报</strong>。',
      'd7.p3': '补充：界面提供<strong>中英文切换</strong>、右侧<strong>可拖拽分隔条</strong>调节预览区与工具区高度，便于教学演示与小屏设备使用。',
      'd7.img1alt': '迁移结果 · 对比模式：拖动中线左右对照原图与风格化结果',
      'd7.img2alt': '迁移结果 · 分屏模式：左右分栏完整展示原图与结果',
      'd8.h2': '决策四：历史记录 + 撤销',
      'd8.p1': '<strong>设计原因：</strong>创意过程需要反复尝试。<strong>历史条</strong>让用户可以保存多个版本进行比较；<strong>撤销</strong>降低试错成本，鼓励大胆探索。',
      'd8.alt': '顶栏操作：语言切换、撤销、重置、导出（与历史与版本管理相关）',
      'dA.tag': '附录 · 操作示意',
      'd9.h2': '① 整体界面：左图 · 中控 · 右结果',
      'd9.p1': '与「设计风格迁移-改进版」一致：<strong>左侧</strong>上传原图，<strong>中间</strong>选风格与参数并生成，<strong>右侧</strong>看结果与后续拆解工具。',
      'd9.meta': '<strong class="highlight">顶栏另有：</strong>语言切换、撤销、重置、导出。',
      'd9.alt': 'StyleShift 整体界面：原始作品、风格选择、迁移结果三栏布局与顶栏操作',
      'd10.h2': '② 上传原图',
      'd10.p1': '在左侧虚线区域内<strong>点击选择文件</strong>，或将图片<strong>拖入</strong>该区域。支持常见网页图片格式（以工具内说明为准）。',
      'd10.meta': '上传成功后，中间「生成」按钮会变可用。',
      'd10.alt': '左侧上传区：拖拽上传或点击选择图片，支持 JPG / PNG / WebP（最大 20MB）',
      'd11.h2': '③ 选风格、调滑块、点「生成风格迁移」',
      'd11.p1': '在中间栏点选一种风格卡片 → 按需拖动强度、饱和度等 → 可选色调叠加（色点）→ 切换「效果图 / 对比 / 分屏」为生成后的查看方式 → 点击紫色主按钮<strong>生成</strong>。',
      'd11.img1alt': '风格选择：八类风格卡片（油画、水彩、复古、赛博朋克等）',
      'd11.img2alt': '风格强度等滑块、色调叠加色点、效果图 / 对比 / 分屏与「生成风格迁移」按钮',
      'd12.h2': '④ 查看结果：效果图 / 对比 / 分屏',
      'd12.p1': '<strong>对比</strong>：在<code style="color:var(--accent2)">同一画面</code>内拖动竖线，左为原图侧、右为结果侧。<strong>分屏</strong>：左右两栏分别完整显示原图与结果。',
      'd12.meta': '右栏大图区悬停可出现缩放与下载。',
      'd13.tag': '操作演示',
      'd13.h2': '⑤ 元素拆解：分析 → 选色块 / 点画面 → 局部再迁移',
      'd13.p1': '生成结果后，右下出现面板：先点<strong>分析 / 刷新元素</strong> → 列表中点色块或<strong>在图上点选相连区域</strong>（紫色为选区）→ 为此区域选风格、调区域参数与色桶 → 点<strong>仅此区域再迁移</strong>。</p>',
      'd13.alt': '元素拆解面板：区域风格、区域参数滑块、色桶占比、与「仅此区域再迁移」按钮',
      'd14.tag': '四、总结',
      'd14.h2': 'StyleShift 的核心价值',
      'd14.p1': '将强大的风格迁移能力，转化为设计师手中<strong class="highlight">直观、可控的创作工具</strong>。',
      'd14.p2': '我们不是简单地做「一键换风格」，而是从<strong class="highlight">设计工作的真实场景</strong>出发：',
      'd14.li1': '<strong>从整体到局部：</strong>先满足基础的整图风格探索，再迭代出<strong>色块智能选区 + 局部风格转换</strong>，让设计师可以精准控制修改范围。',
      'd14.li2': '<strong>服务于创作流程：</strong>覆盖从灵感发散、风格对比，到元素融合、精细化调整的全过程，让工具真正融入设计工作流。',
      'd14.p3': '最终，StyleShift 不只是一种技术实现，更是对<strong class="highlight">设计创作自由</strong>的一次回应——让风格不再是一次性的整体套用，而是可以被<strong>拆解、重组、局部打磨</strong>的灵活语言。',
    },
    en: {
      'doc.title': 'StyleShift · Design deck',
      'ui.hint': '← → / Space · Swipe to change slide',
      'ui.navPrev': 'Previous slide',
      'ui.navNext': 'Next slide',
      'deck.region': 'Slides',
      'deck.langSwitch': '中文',
      'd0.tag': 'Visual exploration · Design story',
      'd0.h1': 'StyleShift: Intuitive style transfer built for designers',
      'd1.tag': 'Part 1 · Why build this tool?',
      'd1.h2': 'Goals & pain points',
      'd1.p1': '<strong class="highlight">Audience:</strong> visual designers, illustrators, and creative professionals.',
      'd1.p2': '<strong class="highlight">Pain points:</strong>',
      'd1.li1': 'Exploring styles meant <strong>jumping between many apps</strong>—slow and tedious.',
      'd1.li2': 'Outputs felt <strong>uncontrollable</strong>, with no quick way to fix just a part.',
      'd1.li3': '<strong>Directional exploration</strong> was slow; comparing looks took too long.',
      'd1.p3': '<strong class="highlight">Our approach:</strong> StyleShift helps you iterate fast and <strong>see the same elements in different treatments</strong>—save time, spark ideas.',
      'd2.tag': 'Part 2 · In a visual design workflow',
      'd2.h2': '1. Style exploration',
      'd2.p1': 'StyleShift supports both <strong>exploration and refinement</strong>.',
      'd2.p2': 'Upload a design and flip among oil, watercolor, cyberpunk, ink, and more—preview directions and <strong class="highlight">widen your range</strong>.',
      'd2.alt': 'Style presets: oil, watercolor, vintage, cyberpunk, pop, ink, sketch, neon.',
      'd3.h2': '2. Elements: extract & blend',
      'd3.p1': '<strong>“Region” tools</strong> pull dominant color blocks so you can restyle <strong>locally</strong> or <strong>blend several styles in one frame</strong> into a richer language.',
      'd3.alt': 'Result preview with region tools: coarseness, analyze, selection hints.',
      'd4.h2': '3. Fine control',
      'd4.p1': 'Tune <strong>strength</strong> and more per region; use <strong>global tint</strong> or <strong>solid overlays</strong> so the look matches your intent.',
      'd4.alt': 'Regional re-apply: sliders, buckets, re-apply only, color overlay.',
      'd5.tag': 'Part 3 · Key UI/UX decisions',
      'd5.h2': 'Decision 1 · From whole image to local edits',
      'd5.p1': '<strong>First step:</strong> whole-image transfer for quick exploration.',
      'd5.p2': '<strong>What we heard:</strong> people often need only a <strong>subject or background</strong> changed; full-frame passes could “overcook” untouched areas.',
      'd5.p3': '<strong>Direction:</strong> make <strong>local selection & edit</strong> first-class—<strong>control scope</strong>, <strong>keep structure</strong>, <strong>mix styles on one canvas</strong>.',
      'd6.h2': 'Decision 2 · Smart color regions, lower skill floor',
      'd6.p1': '<strong>Approach:</strong> instead of fiddly wands/lassos, analysis <strong>extracts main color blocks</strong>. Users only:',
      'd6.li1': '<strong>Pick from the list</strong> → same color across the whole image;',
      'd6.li2': '<strong>Click the picture</strong> → one connected same-color patch.',
      'd6.p2': '<strong>Why:</strong> fewer mask skills—more time for the idea.',
      'd6.img1alt': 'Styled canvas: purple overlay on a connected color region.',
      'd6.img2alt': 'Result preview with style pass and selection hints.',
      'd7.h2': 'Decision 3 · Three columns + compare',
      'd7.p1': '<strong>Layout:</strong> <code style="color:var(--accent2)">Source | Styles | Result</code> reads as <strong>input → process → output</strong>; one surface, no hops.',
      'd7.p2': '<strong>Compare:</strong> drag a divider for source vs styled—clearer than flip-only slideshows; great for <strong>reviews</strong>.',
      'd7.p3': 'Also: <strong>CN/EN toggle</strong>; drag the bar to resize preview vs tools on the right—for teaching and smaller screens.',
      'd7.img1alt': 'Compare mode with draggable seam.',
      'd7.img2alt': 'Split view: source and result in two columns.',
      'd8.h2': 'Decision 4 · History + undo',
      'd8.p1': '<strong>Why:</strong> creativity is trial-and-error. A <strong>history strip</strong> stores versions; <strong>undo</strong> lowers the cost of trying.',
      'd8.alt': 'Top bar: language, undo, reset, export.',
      'dA.tag': 'Appendix · Walkthrough',
      'd9.h2': '① Layout: source · controls · result',
      'd9.p1': 'Matches the enhanced build: <strong>left</strong> upload, <strong>center</strong> styles & generate, <strong>right</strong> result and region tools.',
      'd9.meta': '<strong class="highlight">Top bar:</strong> language, undo, reset, export.',
      'd9.alt': 'Full StyleShift UI: three columns and top actions.',
      'd10.h2': '② Upload source image',
      'd10.p1': 'In the dashed zone, <strong>click to choose a file</strong> or <strong>drag an image in</strong>. Common web formats (see in-app notes).',
      'd10.meta': 'After upload, the center <strong>Generate</strong> control unlocks.',
      'd10.alt': 'Upload zone: drag or click; JPG / PNG / WebP up to 20MB.',
      'd11.h2': '③ Style, sliders, then “Apply style transfer”',
      'd11.p1': 'Pick a style card → tweak strength, saturation, optional tint chips → choose preview / compare / split → tap the purple primary button to <strong>generate</strong>.',
      'd11.img1alt': 'Eight style cards.',
      'd11.img2alt': 'Sliders, tint dots, view toggles, apply button.',
      'd12.h2': '④ Result: preview / compare / split',
      'd12.p1': '<strong>Compare:</strong> drag in <code style="color:var(--accent2)">one view</code>—left source, right result. <strong>Split:</strong> two full columns.',
      'd12.meta': 'Hover the large preview for zoom and download.',
      'd13.tag': 'Live demo',
      'd13.h2': '⑤ Regions: analyze → pick or click → local re-apply',
      'd13.p1': 'After a result: open the lower-right panel—<strong>Analyze / refresh regions</strong> → tap a swatch or <strong>click connected areas</strong> (purple = selection) → style, buckets, sliders → <strong>Re-apply to this region only</strong>.',
      'd13.alt': 'Regional panel: style, sliders, buckets, re-apply.',
      'd14.tag': 'Part 4 · Closing',
      'd14.h2': 'Core value',
      'd14.p1': 'Turn strong models into a <strong class="highlight">direct, controllable creative tool</strong>.',
      'd14.p2': 'More than a <strong class="highlight">one-click filter</strong>—grounded in <strong class="highlight">real design workflows</strong>:',
      'd14.li1': '<strong>Global to local:</strong> whole-image play, then <strong>smart regions + local restyle</strong> for precise scope.',
      'd14.li2': '<strong>Workflow fit:</strong> ideation, compare, blend, polish—where you already work.',
      'd14.p3': 'StyleShift is also a stance on <strong class="highlight">creative freedom</strong>: style you can <strong>deconstruct, remix, and refine locally</strong>, not a one-off pass.',
    }
  };

  function tDeck(k) {
    const pack = DECK_STR[deckLang] || DECK_STR.zh;
    if (pack[k] !== undefined) return pack[k];
    return DECK_STR.zh[k] !== undefined ? DECK_STR.zh[k] : k;
  }

  function applyDeckI18n() {
    document.documentElement.lang = deckLang === 'zh' ? 'zh-CN' : 'en';
    document.querySelectorAll('[data-i18n]').forEach(function (el) {
      const k = el.getAttribute('data-i18n');
      if (k) el.textContent = tDeck(k);
    });
    document.querySelectorAll('[data-i18n-html]').forEach(function (el) {
      const k = el.getAttribute('data-i18n-html');
      if (k) el.innerHTML = tDeck(k);
    });
    document.querySelectorAll('img[data-i18n-alt]').forEach(function (el) {
      const k = el.getAttribute('data-i18n-alt');
      if (k) el.alt = tDeck(k);
    });
    var ti = document.querySelector('title');
    if (ti) ti.textContent = tDeck('doc.title');
    var prev = document.getElementById('prev');
    var next = document.getElementById('next');
    var deck = document.getElementById('deck');
    if (prev) prev.setAttribute('aria-label', tDeck('ui.navPrev'));
    if (next) next.setAttribute('aria-label', tDeck('ui.navNext'));
    if (deck) deck.setAttribute('aria-label', tDeck('deck.region'));
    var langBtn = document.getElementById('deckLangBtn');
    if (langBtn) {
      var lab = langBtn.querySelector('.lang-toggle-label');
      if (lab) lab.textContent = tDeck('deck.langSwitch');
      langBtn.title = deckLang === 'zh' ? 'Switch to English' : '切换到中文';
      langBtn.setAttribute('aria-label', deckLang === 'zh' ? 'Switch deck to English' : '将演示切换为中文');
    }
  }

  function toggleDeckLang() {
    deckLang = deckLang === 'zh' ? 'en' : 'zh';
    localStorage.setItem(LS_KEY, deckLang);
    applyDeckI18n();
  }

  document.getElementById('deckLangBtn').addEventListener('click', toggleDeckLang);

  const slides = Array.from(document.querySelectorAll('.slide'));
  const n = slides.length;
  let i = 0;

  function show(idx) {
    i = Math.max(0, Math.min(n - 1, idx));
    slides.forEach(function (s, j) { s.classList.toggle('active', j === i); });
    window.scrollTo(0, 0);
    document.getElementById('progress').style.width = ((i + 1) / n * 100) + '%';
  }

  document.getElementById('prev').addEventListener('click', function () { show(i - 1); });
  document.getElementById('next').addEventListener('click', function () { show(i + 1); });

  document.addEventListener('keydown', function (e) {
    if (e.key === 'ArrowRight' || e.key === ' ' || e.key === 'PageDown') {
      e.preventDefault();
      show(i + 1);
    } else if (e.key === 'ArrowLeft' || e.key === 'PageUp') {
      e.preventDefault();
      show(i - 1);
    } else if (e.key === 'Home') show(0);
    else if (e.key === 'End') show(n - 1);
  });

  let startX = 0;
  document.getElementById('deck').addEventListener('touchstart', function (e) {
    startX = e.touches[0].clientX;
  }, { passive: true });
  document.getElementById('deck').addEventListener('touchend', function (e) {
    var endX = e.changedTouches[0].clientX;
    var d = endX - startX;
    if (Math.abs(d) > 50) show(d < 0 ? i + 1 : i - 1);
  }, { passive: true });

  applyDeckI18n();
  show(0);
})();
</script>
</body>
</html>
