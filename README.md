# StyleShift · 设计风格迁移（Style Transfer）

纯前端的「设计风格迁移」工具与课程汇报材料。

---

## Course submission（课程要求对照）

| Requirement | Where |
|-------------|--------|
| **Final code on GitHub (`main`)** | Repository: **[hanhanoooo523/hanyukun](https://github.com/hanhanoooo523/hanyukun)** — the **`main`** branch is the final submission. Clone: `git clone https://github.com/hanhanoooo523/hanyukun.git` |
| **README describing the app, presentation, team** | This file: **[README.md on `main`](https://github.com/hanhanoooo523/hanyukun/blob/main/README.md)** |
| **Video presentation** | [Video presentation](#video-presentation) — [YouTube 演示](https://youtu.be/ExiegfsCOZk?si=AL3fVtOVhBubnkFS) |
| **GitHub Pages (site + presentation)** | [GitHub Pages](#github-pages) — link and paths are below; the live site mirrors slides and entry points from the repo |

---

## 设计过程与项目概念

课程陈述如下（与 **[`StyleShift-设计过程与概念.html`](StyleShift-设计过程与概念.html)** 一致；线上：[Pages](https://hanhanoooo523.github.io/hanyukun/StyleShift-%E8%AE%BE%E8%AE%A1%E8%BF%87%E7%A8%8B%E4%B8%8E%E6%A6%82%E5%BF%B5.html)）。

### 设计过程

从「整图风格迁移」起步，根据使用反馈迭代界面与交互，逐步加上色块选区、局部再迁移、三栏工作流与历史撤销，形成当前工具形态。

### 项目设计概念

StyleShift 是一个直接在界面上完成图片风格转换与局部编辑的设计类工具。

它将风格迁移从“整体套用”升级为“可拆解、可融合、可局部打磨”的创作方式，让设计师能够像调色一样自由控制画面风格。

### 设计目的

帮助设计师在设计过程中：

- 快速将作品转换成多种设计风格，节省时间，增加设计灵感；
- 对相同元素尝试不同风格，直观对比，辅助决策；
- 提取画面中的色块元素，将多种风格融合在同一画面中，形成新的设计语言。

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

### 链接

**视频演示：** [YouTube 项目演示](https://youtu.be/ExiegfsCOZk?si=AL3fVtOVhBubnkFS) · [README 视频小节](#video-presentation)

**应用界面：** [本地改进版](设计风格迁移-改进版.html) · [仓库内浏览](https://github.com/hanhanoooo523/hanyukun/blob/main/%E8%AE%BE%E8%AE%A1%E9%A3%8E%E6%A0%BC%E8%BF%81%E7%A7%BB-%E6%94%B9%E8%BF%9B%E7%89%88.html) · [GitHub Pages](https://hanhanoooo523.github.io/hanyukun/%E8%AE%BE%E8%AE%A1%E9%A3%8E%E6%A0%BC%E8%BF%81%E7%A7%BB-%E6%94%B9%E8%BF%9B%E7%89%88.html)

**演示界面：** [`StyleShift-Presentation.html`](StyleShift-Presentation.html) · [`StyleShift-设计演示.html`](StyleShift-设计演示.html) · [HTML Preview · Presentation](https://htmlpreview.github.io/?https://raw.githubusercontent.com/hanhanoooo523/hanyukun/main/StyleShift-Presentation.html)

**GitHub：** [hanhanoooo523/hanyukun](https://github.com/hanhanoooo523/hanyukun)

### 组员

**姓名：** 韩雨坤 HAN YUKUN　杜佳洺 DU JIAMING  

**学号：** MC56909　MC569281  

（与下文 [Group members（小组成员）](#group-members小组成员) 一致。）

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

### 若 `*.github.io/hanyukun/` 整站显示 404（仓库里的代码却能打开）

说明 **Pages 尚未发布成功**，与某个 HTML 是否上传无关。请按顺序检查：

1. **仓库 → Settings → Pages**：**Build and deployment** 里 **Source** 必须选 **GitHub Actions**（不要选 Deploy from a branch 却留空）。
2. **仓库 → Actions**：打开 **Deploy GitHub Pages**，最近一条应为绿色 **success**。失败请点击该次运行查看日志。
3. **Settings → Environments → `github-pages`**：若配置了 **Required reviewers**，首次部署会在 Actions 里 **等待审批**，需手动 **Approve** 后站点才会上线。
4. **访问地址**必须是项目页格式：`https://hanhanoooo523.github.io/hanyukun/`（含仓库名 `hanyukun`）；文件名区分大小写，例如 [`StyleShift-Presentation.html`](https://hanhanoooo523.github.io/hanyukun/StyleShift-Presentation.html)。
5. **临时查看文件（不依赖 Pages）**：在仓库中打开：[`StyleShift-Presentation.html`（`main`）](https://github.com/hanhanoooo523/hanyukun/blob/main/StyleShift-Presentation.html)，或 [Raw](https://github.com/hanhanoooo523/hanyukun/raw/main/StyleShift-Presentation.html)（浏览器可能提示下载，属正常）。

### 不依赖 GitHub Pages、任何人用浏览器就能看的几种方式

| 方式 | 说明 |
|------|------|
| **入口页 + 在线预览** | 代码在 `main` 上公开后，把下面整段链接发给对方即可（小页内有按钮进入完整演示；大图稿首次可能加载十余秒）：`https://htmlpreview.github.io/?https://raw.githubusercontent.com/hanhanoooo523/hanyukun/main/StyleShift-online-view.html` |
| **直接预览某一稿** | Presentation：`https://htmlpreview.github.io/?https://raw.githubusercontent.com/hanhanoooo523/hanyukun/main/StyleShift-Presentation.html` · 逐页 15 张：`https://htmlpreview.github.io/?https://raw.githubusercontent.com/hanhanoooo523/hanyukun/main/StyleShift-%E8%AE%BE%E8%AE%A1%E6%BC%94%E7%A4%BA.html` |
| **单文件（最稳）** | 下载仓库内 [`StyleShift-设计演示.html`](StyleShift-设计演示.html) 或 [`StyleShift-Presentation.html`](StyleShift-Presentation.html)，通过微信 / 网盘发送，对方**双击用浏览器打开**即可（配图已内嵌，无需服务器）。 |
| **免费小站** | 将上述任一 HTML 拖到 [Netlify Drop](https://app.netlify.com/drop)，可获得 `*.netlify.app` 长期外链。 |

本地入口文件：[`StyleShift-online-view.html`](StyleShift-online-view.html)（体积小，也可下载后本地双击使用上面的链接）。

---

## Video presentation

**Project demo video（项目演示视频）：** [https://youtu.be/ExiegfsCOZk?si=AL3fVtOVhBubnkFS](https://youtu.be/ExiegfsCOZk?si=AL3fVtOVhBubnkFS)（YouTube）

建议视频内容：上传图片 → 选择风格 → 生成结果；改进版（元素拆解、区域再迁移等）；设计演示 [`StyleShift-设计演示.html`](StyleShift-设计演示.html) 若干页概览。

---

## Group members（小组成员）

| Name | Student ID |
|------|------------|
| 韩雨坤 | MC56909 |
| 杜佳洺 | MC569281 |

---

## How to use the app（使用方法）

### 改进版（推荐）

1. **本地：** 用浏览器打开 [`设计风格迁移-改进版.html`](设计风格迁移-改进版.html)。  
   **线上：** 打开 [GitHub Pages 首页](https://hanhanoooo523.github.io/hanyukun/)，点击「改进版应用」。
2. 左侧上传图片（拖拽或点击），中间选择风格并调节参数，点击生成，在右侧查看结果。
3. 顶栏：**English / 中文**、撤销、重置、**历史**（已保存缩略图）、导出。
4. 生成后可使用右侧「元素拆解与替换」等区域能力（详见页面内说明）。

### 经典版

- 打开 [`设计风格迁移.html`](设计风格迁移.html)；能力相对精简，内含「汇报演示」入口。

### 运行说明

- **无需构建**：静态 HTML + 资源即可；用 `file://` 或任意静态文件服务器均可。
- 若浏览器限制本地脚本，可用 VS Code Live Server 等在项目根目录启动 HTTP 服务。

---

## Presentation（演讲 / 设计演示）

| 说明 | 文件 |
|------|------|
| **大类同页 · 点击小点展开详情（约 6 屏，推荐汇报）** | [`StyleShift-deck-expand.html`](StyleShift-deck-expand.html) |
| **逐页 15 张（原版翻页）** | [`StyleShift-设计演示.html`](StyleShift-设计演示.html) |
| **逐页 15 张 · 本地副本文档（安全拷贝）** | [`StyleShift-deck-15slides-copy.html`](StyleShift-deck-15slides-copy.html) |
| **从逐页母版生成展开版** | `powershell -NoProfile -ExecutionPolicy Bypass -File .\tools\build-accordion-deck.ps1 -OutFile 'StyleShift-deck-expand.html'`（母版默认 [`StyleShift-设计演示-多页原版备份.html`](StyleShift-设计演示-多页原版备份.html)） |
| **线上同路径** | 见上文 [设计演示 GitHub Pages 链接](https://hanhanoooo523.github.io/hanyukun/StyleShift-%E8%AE%BE%E8%AE%A1%E6%BC%94%E7%A4%BA.html)（部署后若需展开版，请将 `StyleShift-deck-expand.html` 一并推送） |
| 配图目录 | [`demo-screenshots/`](demo-screenshots/) |
| PowerPoint 数据 | [`styleshift-slides.json`](styleshift-slides.json) |
| 生成 PPT（需本机 PowerPoint） | [`build-styleshift-pptx.ps1`](build-styleshift-pptx.ps1) |

**分享说明：** `StyleShift-设计演示.html` 内的配图已 **内嵌为 base64**，只发这一个文件给同学/老师也能正常显示图片（体积约几 MB）。若你更新了 [`demo-screenshots/`](demo-screenshots/)，请在本机运行 `.\tools\embed-demo-images.ps1` 重新内嵌后再分发或推送。

**操作（展开版）：** **← →** / **空格** 切换大类页；**鼠标点击** 每条小点标题展开/收起详细介绍；同一大类内 **手风琴互斥**（同时只展开一条）。**操作（逐页版）：** **← →** 逐张翻页。均支持 **中文 / English**；**打印 → 另存为 PDF** 可导出。

**其他页面：** [`StyleShift-设计过程与概念.html`](StyleShift-设计过程与概念.html)、[`StyleShift-Presentation.html`](StyleShift-Presentation.html)、[`StyleShift-Design-Presentation.html`](StyleShift-Design-Presentation.html)、[`StyleShift-功能介绍.html`](StyleShift-功能介绍.html)

---

## 生成 PPT（可选）

```powershell
.\build-styleshift-pptx.ps1
```

正文以 [`styleshift-slides.json`](styleshift-slides.json) 为准，建议与 HTML 演示稿保持一致。

---

## 许可与说明

课程/演示用途整理；引用或分发前请自行确认素材与第三方协议。
