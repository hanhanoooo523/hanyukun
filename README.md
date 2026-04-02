# StyleShift · 设计风格迁移（Style Transfer）

纯前端的「设计风格迁移」工具与课程汇报材料。

**语言 Languages：** 下文为中文说明 · Full **English** text is in the [**English**](#english) section at the bottom of this file.

---

## Course submission（课程要求对照）

| Requirement | Where |
|-------------|--------|
| **Final code on GitHub (`main`)** | Repository: **[hanhanoooo523/hanyukun](https://github.com/hanhanoooo523/hanyukun)** — the **`main`** branch is the final submission. Clone: `git clone https://github.com/hanhanoooo523/hanyukun.git` |
| **README describing the app, presentation, team** | This file: **[README.md on `main`](https://github.com/hanhanoooo523/hanyukun/blob/main/README.md)** |
| **Video presentation** | [YouTube 演示](https://youtu.be/ExiegfsCOZk?si=AL3fVtOVhBubnkFS) |
| **GitHub Pages (site + presentation)** | [GitHub Pages](#github-pages) — link and paths are below; the live site mirrors slides and entry points from the repo |

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


1. **本地：** 用浏览器打开 [`设计风格迁移-改进版.html`](设计风格迁移-改进版.html)。  
   **线上：** 打开 [GitHub Pages 首页](https://hanhanoooo523.github.io/hanyukun/)，点击「改进版应用」。
2. 左侧上传图片（拖拽或点击），中间选择风格并调节参数，点击生成，在右侧查看结果。
3. 顶栏：**English / 中文**、撤销、重置、**历史**（已保存缩略图）、导出。
4. 生成后可使用右侧「元素拆解与替换」等区域能力（详见页面内说明）。

**运行说明：** 无需构建；`file://` 或任意静态服务均可。若本地脚本受限，可用 VS Code Live Server。

---

## English

Static, front-end **design style transfer** tools and course submission materials (same repository as above).

---

### Course submission

| Requirement | Where |
|-------------|--------|
| **Final code on GitHub (`main`)** | **[hanhanoooo523/hanyukun](https://github.com/hanhanoooo523/hanyukun)** on **`main`**. Clone: `git clone https://github.com/hanhanoooo523/hanyukun.git` |
| **README (app, presentation, team)** | **[README.md](https://github.com/hanhanoooo523/hanyukun/blob/main/README.md)** on `main` |
| **Video presentation** | **[YouTube demo](https://youtu.be/ExiegfsCOZk?si=AL3fVtOVhBubnkFS)** |
| **GitHub Pages** | **[GitHub Pages](#github-pages)** — URLs and file mapping are in the table below |

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

1. **Local:** open [`设计风格迁移-改进版.html`](设计风格迁移-改进版.html). **Online:** open the [Pages home](https://hanhanoooo523.github.io/hanyukun/) and choose the improved app.  
2. Upload on the left (drag or click), pick a style and parameters in the center, click generate, view on the right.  
3. Top bar: **English / 中文**, undo, reset, **history**, export.  
4. After generating, use **element split & replace** and related panels (see in-app copy).

**Runtime:** no build step; `file://` or any static server works. If scripts are blocked locally, use e.g. VS Code Live Server.

---
