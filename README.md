# StyleShift · 设计风格迁移（Style Transfer）

纯前端的「设计风格迁移」工具与课程汇报材料。

**语言 Languages：** 下文为中文说明 · Full **English** text is in the [**English**](#english) section at the bottom of this file.

---

## 课程要求对照

| 课程要求 | 对应说明 |
|----------|----------|
| **GitHub 最终代码（`main` 分支）** | 仓库 **[hanhanoooo523/hanyukun](https://github.com/hanhanoooo523/hanyukun)** — 正式提交以 **`main`** 分支为准。克隆：`git clone https://github.com/hanhanoooo523/hanyukun.git` |
| **README（应用说明、演示、小组信息）** | 本文件：**[`main` 上的 README.md](https://github.com/hanhanoooo523/hanyukun/blob/main/README.md)** |
| **视频演示** | [YouTube 演示](https://youtu.be/ExiegfsCOZk?si=AL3fVtOVhBubnkFS) |
| **GitHub Pages（站点与演示）** | 见下文 **[GitHub Pages](#github-pages)** — 含线上链接与仓库文件路径；线上站点与幻灯、入口与仓库保持一致 |

---

## 设计过程与项目概念


### 设计过程

从「整图风格迁移」起步，根据使用反馈迭代界面与交互，逐步加上色块选区、局部再迁移、三栏工作流与历史撤销，形成当前工具形态。

### 项目设计概念

StyleShift 是一个直接在界面上完成图片风格转换与局部编辑的设计类工具。

它将风格迁移从“整体套用”升级为“可拆解、可融合、可局部打磨”的创作方式，让设计师能够像调色一样自由控制画面风格。

---

### 设计目的

帮助设计师在设计过程中：

- 快速将作品转换成多种设计风格，节省时间，增加设计灵感；
- 对相同元素尝试不同风格，直观对比，辅助决策；
- 提取画面中的色块元素，将多种风格融合在同一画面中，形成新的设计语言。

---

### 核心设计功能

1. **从整图迁移到局部编辑**  
   初始版本仅支持整张图片的风格转换。发现设计师经常只需要改变局部（如主体、背景）后，我们迭代出“色块智能选区 + 局部风格迁移”，让修改范围更精准。

2. **元素拆解 + 点击选区**  
   利用图像分析自动提取主色块，用户点击色块列表或直接点击画面，即可选中相连的同色区域。降低选区学习成本，让操作直观高效。

3. **三栏布局 + 对比视图**  
   “原始｜风格｜结果”从左到右符合输入→处理→输出的心理模型。对比模式支持拖动分界线，比传统前后切换更直观，适合方案汇报。

4. **历史记录与撤销**  
   鼓励大胆尝试，随时回退，提升试错友好度。

5. **中英文切换并记忆**  
   面向全球用户，减少重复设置，关注细节体验。

---

### 链接

| 类型 | 说明 | 链接 |
| --- | --- | --- |
| 视频演示 | 项目演示（YouTube） | [youtu.be/ExiegfsCOZk](https://youtu.be/ExiegfsCOZk?si=AL3fVtOVhBubnkFS) |
| 应用界面 | 改进版 · GitHub Pages | [设计风格迁移-改进版（线上）](https://hanhanoooo523.github.io/hanyukun/%E8%AE%BE%E8%AE%A1%E9%A3%8E%E6%A0%BC%E8%BF%81%E7%A7%BB-%E6%94%B9%E8%BF%9B%E7%89%88.html) |
| 演示界面 | StyleShift-Presentation | [StyleShift-Presentation（线上）](https://hanhanoooo523.github.io/hanyukun/StyleShift-Presentation.html) |
| GitHub | 源码仓库 | [hanhanoooo523/hanyukun](https://github.com/hanhanoooo523/hanyukun) |
| 更多入口 | 功能介绍 · GitHub Pages | [StyleShift-功能介绍（线上）](https://hanhanoooo523.github.io/hanyukun/StyleShift-%E5%8A%9F%E8%83%BD%E4%BB%8B%E7%BB%8D.html) |

---

## GitHub Pages

**Site URL（线上站点，请在 README 中保留此链接供评分使用）：**  
**https://hanhanoooo523.github.io/hanyukun/**

| Page | GitHub Pages URL | Repo file (`main`) |
|------|------------------|-------------------|
| **Landing（首页，汇总入口）** | [hanhanoooo523.github.io/hanyukun/](https://hanhanoooo523.github.io/hanyukun/) | [`index.html`](index.html) |
| **设计过程与概念（课程陈述页）** | […/StyleShift-设计过程与概念.html](https://hanhanoooo523.github.io/hanyukun/StyleShift-%E8%AE%BE%E8%AE%A1%E8%BF%87%E7%A8%8B%E4%B8%8E%E6%A6%82%E5%BF%B5.html) | [`StyleShift-设计过程与概念.html`](StyleShift-设计过程与概念.html) |
| **设计演示幻灯（与汇报内容一致）** | […/StyleShift-设计演示.html](https://hanhanoooo523.github.io/hanyukun/StyleShift-%E8%AE%BE%E8%AE%A1%E6%BC%94%E7%A4%BA.html) | [`StyleShift-设计演示.html`](StyleShift-设计演示.html) |
| **改进版应用** | […/设计风格迁移-改进版.html](https://hanhanoooo523.github.io/hanyukun/%E8%AE%BE%E8%AE%A1%E9%A3%8E%E6%A0%BC%E8%BF%81%E7%A7%BB-%E6%94%B9%E8%BF%9B%E7%89%88.html) | [`设计风格迁移-改进版.html`](设计风格迁移-改进版.html) |

首次部署：**Settings → Pages → Build and deployment → Source: GitHub Actions**，工作流见 [`.github/workflows/pages.yml`](.github/workflows/pages.yml)；向 **`main`** 推送后会自动发布。

**不依赖 Pages 的预览：** [`StyleShift-online-view.html`](StyleShift-online-view.html)（htmlpreview：[入口](https://htmlpreview.github.io/?https://raw.githubusercontent.com/hanhanoooo523/hanyukun/main/StyleShift-online-view.html)）；单文件亦可下载后本地双击打开 [`StyleShift-Presentation.html`](StyleShift-Presentation.html)、[`StyleShift-设计演示.html`](StyleShift-设计演示.html)。

本地入口文件：[`StyleShift-online-view.html`](StyleShift-online-view.html)（体积小，也可下载后本地双击使用上面的链接）。

---

## Video presentation

**Project demo video（项目演示视频）：** [YouTube](https://youtu.be/ExiegfsCOZk?si=AL3fVtOVhBubnkFS)

---

## Group members（小组成员）

| 姓名 | Student ID |
|------|------------|
| 韩雨坤 HAN YUKUN | MC56909 |
| 杜佳洺 DU JIAMING | MC569281 |

---

## How to use the app（使用方法）

### 打开应用

- **本地：** 用浏览器打开 [`设计风格迁移-改进版.html`](设计风格迁移-改进版.html)。  
- **线上：** 打开 [GitHub Pages 首页](https://hanhanoooo523.github.io/hanyukun/)，在「快速入口」中点击 **「改进版应用」**（与仓库根目录该 HTML 文件对应）。

**建议环境：** 使用较新版本 **Chrome / Edge / Firefox** 等桌面浏览器；图片一般为常见 **位图**（如 JPG、PNG），分辨率过高时处理时间会更长，可先缩小再试。

### 推荐操作顺序（从整张图到局部精修）

1. **上传原图 → 选风格 → 调参数 → 首次「生成」**  
   先得到一张整体满意或接近满意的迁移结果，再去拆解色块；若只调滑块未点生成，右侧结果不会更新。  
2. **用对比 / 分屏确认**  
   对齐构图后再决定要不要加强风格强度或微调色彩。  
3. **满意后「加入历史」**  
   多方案并存时便于对照，避免只依赖浏览器后退。  
4. **再进入「元素拆解」做局部**  
   对天空、墙面、主体等分别换风格或还原，实现「一图多风格」混搭。

### 基本流程（三栏）

1. **左侧「原始作品」**  
   - 将图片**拖到上传区**，或**点击区域**选择文件；已载图后可点 **「更换图片」**。  
   - 下方会出现本次会话内的**缩略图条**（便于回看当前图源）。

2. **中间「风格选择」**  
   - 点选一张**风格卡片**（共 8 种：油画、水彩、复古、赛博朋克、波普艺术、水墨、素描、霓虹光效）。  
   - 用滑块调节 **风格强度、色彩饱和度、对比度、亮度、模糊程度**；可选 **「色调叠加」** 色点（或保持「无叠加」），用于在风格化之上再叠一层整体色相倾向。  
   - **查看方式：**  
     - **效果图** — 主要看右侧成品；  
     - **对比** — 适合快速并排心智对比（具体布局以页面为准）；  
     - **分屏** — 可**拖动中间分割线**，在同一画面内滑动对比原图与结果，适合汇报或截屏说明。  
   - 点击 **「生成风格迁移」**；处理时右侧有进度条，完成后在 **「迁移结果」** 中显示。强度与风格差异大时，等待时间会略长，属正常现象。

3. **右侧结果与导出**  
   - 生成后可用结果区按钮 **下载** 当前图，或 **加入历史**（将缩略图记入「历史记录」）。  
   - 顶栏 **「导出」** 也可下载当前结果（与结果区内下载一致场景下）。

### 顶栏与历史

- 右上角 **语言**：在 **中文 / English** 间切换（偏好会存在浏览器本地）。  
- **撤销**：回退**上一步**对结果图的操作（例如局部再迁移、区域还原等会改变画布时）；若连续做了多步局部编辑，可多次撤销直到达到想要的状态。  
- **重置**：清空当前会话，回到初始状态（与「历史记录」里已保存的条目无关，历史不会被自动清空）。  
- **历史记录**：打开弹层查看已 **加入历史** 的缩略图棋盘格；适合罗列多版方案，与当前画布上的「撤销」配合使用。

### 元素拆解与局部调整（生成结果后）

- 先完成至少一次全局生成，右下方会出现 **「元素拆解与替换」**。  
- **「主色概括程度」**（粗 / 中 / 细）决定画面被分成多少主色块：**粗** 块少、大块面编辑快；**细** 块多、适合细节抠换。调整后需再点 **「分析 / 刷新元素」** 刷新列表。  
- **列表中选一块** 表示按该主色在**全图范围**选中所有相近区域；**在结果图上直接单击** 则通常对应 **与你点击处相连的同色区域**（选区会以高亮标示，具体颜色与提示以页内为准）。二者结合可快速选中「整块天空」或「单条衣袖」等不同粒度。  
- 可选 **「对此区域使用的风格」** 与全局不同，并用 **「与中间栏同步」** 把中间栏的滑块一键抄到本区域；然后 **「仅此区域再迁移」** 只改选中区域，或 **「将此区域还原为原图」** 从原图贴回该区域（用于保留脸、文字或产品外形）。  
- **「提取此区域主色」** 后可 **用拾取色覆盖该区域** 或 **叠加强调到该区域**，适合统一品牌色或做海报级色块整理。

**局部编辑小结：** 典型用法是「大面用全局风格 + 个别区域换另一种风格或还原原图」，多轮 **仅此区域再迁移** 与 **撤销** 可渐进逼近目标。

更细的图文说明见双语页面：[StyleShift-功能介绍](StyleShift-功能介绍.html) · [GitHub Pages 功能介绍](https://hanhanoooo523.github.io/hanyukun/StyleShift-%E5%8A%9F%E8%83%BD%E4%BB%8B%E7%BB%8D.html)。

**运行说明：** 无需构建；`file://` 或任意静态服务均可。若本地以 `file://` 打开时脚本被策略拦截，可用 **VS Code Live Server** 或 `npx serve` 等起一个简单的本地静态服务再访问同一 HTML。

---

## English

Static, front-end **design style transfer** tools and course submission materials (same repository as above).

---

### 课程要求对照 · Course submission

| 课程要求 | 对应说明 |
|----------|----------|
| **GitHub 最终代码（`main` 分支）** | **[hanhanoooo523/hanyukun](https://github.com/hanhanoooo523/hanyukun)** — 正式提交以 **`main`** 为准。Clone：`git clone https://github.com/hanhanoooo523/hanyukun.git` |
| **README（应用说明、演示、小组信息）** | **[README.md](https://github.com/hanhanoooo523/hanyukun/blob/main/README.md)**（`main` 分支） |
| **视频演示** | **[YouTube 演示](https://youtu.be/ExiegfsCOZk?si=AL3fVtOVhBubnkFS)** |
| **GitHub Pages（站点与演示）** | **[GitHub Pages](#github-pages)** — 下表为 URL 与 `main` 分支文件对照 |

---

### Design process & project concept

#### Design process

We started from whole-image style transfer, then iterated the UI and interactions from feedback—adding color-region picking, local re-transfer, a three-column workflow, and history/undo.

#### Project concept

**StyleShift** is a design-oriented tool for **in-browser image style transfer and local editing**.

It moves from a single “apply to everything” model to a workflow that is **decomposable, blendable, and locally refinable**, similar to grading a picture’s look.

---

#### Goals

- Quickly explore multiple design styles to save time and spark ideas;  
- Compare styles on the same elements to support decisions;  
- Extract color regions and blend several styles in one frame for a new visual language.

---

#### Core features

1. **Whole image → local editing** — Early builds only supported full-image transfer; we added smart regions + local transfer for subjects/backgrounds.  
2. **Element split + click to select** — Main color regions are detected; pick from a list or click the canvas.  
3. **Three columns + compare** — “Original | Style | Result”; compare mode uses a draggable divider.  
4. **History & undo** — Encourages trying ideas with easy rollback.  
5. **English / 中文 with persistence** — Preference is stored in the browser.

---

#### Links

| Type | Description | Link |
| --- | --- | --- |
| Video | Project demo (YouTube) | [youtu.be/ExiegfsCOZk](https://youtu.be/ExiegfsCOZk?si=AL3fVtOVhBubnkFS) |
| App | Improved build · GitHub Pages | [Open on Pages](https://hanhanoooo523.github.io/hanyukun/%E8%AE%BE%E8%AE%A1%E9%A3%8E%E6%A0%BC%E8%BF%81%E7%A7%BB-%E6%94%B9%E8%BF%9B%E7%89%88.html) |
| Deck | StyleShift-Presentation | [Open on Pages](https://hanhanoooo523.github.io/hanyukun/StyleShift-Presentation.html) |
| User guide | Feature how-to (bilingual page) | [StyleShift feature guide](https://hanhanoooo523.github.io/hanyukun/StyleShift-%E5%8A%9F%E8%83%BD%E4%BB%8B%E7%BB%8D.html) |
| GitHub | Source | [hanhanoooo523/hanyukun](https://github.com/hanhanoooo523/hanyukun) |

---

### GitHub Pages

**Live site (keep this URL in the README for grading):**  
**https://hanhanoooo523.github.io/hanyukun/**

| Page | GitHub Pages URL | File on `main` |
|------|------------------|----------------|
| **Landing** | [hanhanoooo523.github.io/hanyukun/](https://hanhanoooo523.github.io/hanyukun/) | [`index.html`](index.html) |
| **Design process & concept** | […/StyleShift-设计过程与概念.html](https://hanhanoooo523.github.io/hanyukun/StyleShift-%E8%AE%BE%E8%AE%A1%E8%BF%87%E7%A8%8B%E4%B8%8E%E6%A6%82%E5%BF%B5.html) | [`StyleShift-设计过程与概念.html`](StyleShift-设计过程与概念.html) |
| **Slide deck (15 pages)** | […/StyleShift-设计演示.html](https://hanhanoooo523.github.io/hanyukun/StyleShift-%E8%AE%BE%E8%AE%A1%E6%BC%94%E7%A4%BA.html) | [`StyleShift-设计演示.html`](StyleShift-设计演示.html) |
| **Improved app** | […/设计风格迁移-改进版.html](https://hanhanoooo523.github.io/hanyukun/%E8%AE%BE%E8%AE%A1%E9%A3%8E%E6%A0%BC%E8%BF%81%E7%A7%BB-%E6%94%B9%E8%BF%9B%E7%89%88.html) | [`设计风格迁移-改进版.html`](设计风格迁移-改进版.html) |

**First-time deploy:** **Settings → Pages → Build and deployment → Source: GitHub Actions**, workflow in [`.github/workflows/pages.yml`](.github/workflows/pages.yml); pushes to **`main`** publish the site.

**Preview without Pages:** [`StyleShift-online-view.html`](StyleShift-online-view.html) · [htmlpreview entry](https://htmlpreview.github.io/?https://raw.githubusercontent.com/hanhanoooo523/hanyukun/main/StyleShift-online-view.html). You can also open [`StyleShift-Presentation.html`](StyleShift-Presentation.html) or [`StyleShift-设计演示.html`](StyleShift-设计演示.html) locally.

---

### Video presentation

**Demo video:** [YouTube](https://youtu.be/ExiegfsCOZk?si=AL3fVtOVhBubnkFS)

---

### Group members

| Name | Student ID |
|------|------------|
| Han Yukun 韩雨坤 | MC56909 |
| Du Jiaming 杜佳洺 | MC569281 |

---

### How to use the app

#### Open the app

- **Local:** open [`设计风格迁移-改进版.html`](设计风格迁移-改进版.html) in a browser.  
- **Online:** go to the [Pages home](https://hanhanoooo523.github.io/hanyukun/), under **Quick links** click **「改进版应用」** (Improved app) — same file as in the repo root.

**Recommended setup:** a recent desktop browser (**Chrome / Edge / Firefox**, etc.). Use common **raster** images (e.g. JPG, PNG). Very large resolutions take longer to process; downscale first if needed.

#### Suggested order (whole image → local polish)

1. **Upload → pick a style → tune sliders → first Generate**  
   The right-hand result only updates after you run generation; moving sliders alone does not refresh the output.  
2. **Use Compare / Split to judge**  
   Check composition and detail before pushing style intensity or color harder.  
3. **Add to history for variants**  
   Keeps multiple attempts easy to compare without relying on the back button alone.  
4. **Open Element split**  
   Apply different styles or restores to sky, walls, subject, etc., for a mixed look in one frame.

#### Basic workflow (three columns)

1. **Left — Source**  
   - **Drag** an image onto the upload zone or **click** to pick a file. After an image is loaded, use **Replace image** if needed.  
   - A **thumbnail strip** under the zone shows sources in the current session.

2. **Center — Styles & controls**  
   - Choose one **style card** (8 presets: oil, watercolor, vintage, cyberpunk, pop art, ink, sketch, neon).  
   - Adjust sliders: **style intensity, saturation, contrast, brightness, blur**; optionally pick a **tint** swatch (or leave “none”) to layer a global color cast on top of the stylized look.  
   - **View modes:** **Result** focuses on the final look; **Compare** helps quick A/B judgment (exact layout follows the UI); **Split** lets you **drag a divider** to wipe between original and result—good for demos and screenshots.  
   - Click **Generate style transfer**. A **progress** indicator runs; the **Result** panel on the right shows the output. Strong styles / large images may take a bit longer.

3. **Right — Result & export**  
   - After generation, use **Download** on the result card or **Add to history** to save a thumbnail into **History**.  
   - The header **Export** button also downloads the current result (same use case).

#### Header & history

- **Language (top-right float):** toggle **English / 中文**; preference is stored in the browser.  
- **Undo:** steps back the **last** change to the result canvas (e.g. after local remix or region restore). Repeat **Undo** for multi-step local edits until you reach a good state.  
- **Reset:** clears the session back to the start. It does **not** automatically clear entries already saved in **History**.  
- **History:** opens a modal grid of thumbnails you **added to history**; use it alongside **Undo** for comparing variants.

#### Element split & local edits (after a first result)

- The **Element split & replace** block appears below the result once you have an output.  
- **Color-region granularity** (coarse / medium / fine) controls how many dominant regions exist: **coarse** = fewer, faster broad edits; **fine** = more regions for detail work. Click **Analyze / refresh elements** after changing this setting.  
- **Picking from the list** selects that color **everywhere** it appears; **clicking the result canvas** selects a **connected region** at the pointer (overlay and hints are in the UI). Combine both to target “the whole sky” vs “one sleeve,” for example.  
- Optionally set **style for this region** different from the global style; use **Sync from center panel** to copy the middle sliders, then **Remix this region only** or **Restore this region to original** (paste back from the source for faces, text, products, etc.).  
- **Extract dominant color** enables **fill region with picked color** or **apply tint emphasis** for brand colors or poster-like flats.

**Local workflow tip:** a common pattern is **one global pass**, then **different styles or restores on separate regions**, iterating with **Remix this region only** and **Undo**.

For a longer bilingual guide: [`StyleShift-功能介绍.html`](StyleShift-功能介绍.html) · [feature guide on Pages](https://hanhanoooo523.github.io/hanyukun/StyleShift-%E5%8A%9F%E8%83%BD%E4%BB%8B%E7%BB%8D.html).

**Runtime:** no build step; `file://` or any static server works. If `file://` is blocked by browser policies, use **VS Code Live Server** or e.g. `npx serve` and open the same HTML over `http://localhost`.

---
