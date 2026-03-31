# StyleShift · 设计风格迁移（Style Transfer）

纯前端的「设计风格迁移」工具与课程汇报材料。

---

## Course submission（课程要求对照）

| Requirement | Where |
|-------------|--------|
| **Final code on GitHub (`main`)** | Repository: **[hanhanoooo523/hanyukun](https://github.com/hanhanoooo523/hanyukun)** — the **`main`** branch is the final submission. Clone: `git clone https://github.com/hanhanoooo523/hanyukun.git` |
| **README describing the app, presentation, team** | This file: **[README.md on `main`](https://github.com/hanhanoooo523/hanyukun/blob/main/README.md)** |
| **Video presentation** | [Video presentation](#video-presentation) — replace the placeholder URL after you upload the demo video |
| **GitHub Pages (site + presentation)** | [GitHub Pages](#github-pages) — link and paths are below; the live site mirrors slides and entry points from the repo |

---

## GitHub Pages

**Site URL（线上站点，请在 README 中保留此链接供评分使用）：**  
**https://hanhanoooo523.github.io/hanyukun/**

| Page | GitHub Pages URL | Repo file (`main`) |
|------|------------------|-------------------|
| **Landing（首页，汇总入口）** | [hanhanoooo523.github.io/hanyukun/](https://hanhanoooo523.github.io/hanyukun/) | [`index.html`](index.html) |
| **设计演示幻灯（与汇报内容一致）** | […/StyleShift-设计演示.html](https://hanhanoooo523.github.io/hanyukun/StyleShift-%E8%AE%BE%E8%AE%A1%E6%BC%94%E7%A4%BA.html) | [`StyleShift-设计演示.html`](StyleShift-设计演示.html) |
| **改进版应用** | […/设计风格迁移-改进版.html](https://hanhanoooo523.github.io/hanyukun/%E8%AE%BE%E8%AE%A1%E9%A3%8E%E6%A0%BC%E8%BF%81%E7%A7%BB-%E6%94%B9%E8%BF%9B%E7%89%88.html) | [`设计风格迁移-改进版.html`](设计风格迁移-改进版.html) |

首次部署：**Settings → Pages → Build and deployment → Source: GitHub Actions**，工作流见 [`.github/workflows/pages.yml`](.github/workflows/pages.yml)；向 **`main`** 推送后会自动发布。若首页 404，请到 Actions / Pages 查看最近一次部署是否成功。

---

## Video presentation

**Project demo video（项目演示视频）：**  
**https://YOUR_VIDEO_LINK** ← *Replace with your YouTube / bilibili / cloud public link after publishing.*

建议视频内容：上传图片 → 选择风格 → 生成结果；改进版（元素拆解、区域再迁移等）；设计演示 [`StyleShift-设计演示.html`](StyleShift-设计演示.html) 若干页概览。

---

## Group members（小组成员）

| Name | Student ID |
|------|------------|
| 韩雨坤 | MC56909 |
| 杜佳洺 | MC（若教务学号不同，请改为完整学号后提交） |

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
| **HTML 幻灯（与课程演示一致）** | [`StyleShift-设计演示.html`](StyleShift-设计演示.html) |
| **线上同路径** | 见上文 [设计演示 GitHub Pages 链接](https://hanhanoooo523.github.io/hanyukun/StyleShift-%E8%AE%BE%E8%AE%A1%E6%BC%94%E7%A4%BA.html) |
| 配图目录 | [`demo-screenshots/`](demo-screenshots/) |
| PowerPoint 数据 | [`styleshift-slides.json`](styleshift-slides.json) |
| 生成 PPT（需本机 PowerPoint） | [`build-styleshift-pptx.ps1`](build-styleshift-pptx.ps1) |

**操作：** **← →** / **空格** 翻页；支持 **中文 / English**；**打印 → 另存为 PDF** 可导出。

**其他页面：** [`StyleShift-Design-Presentation.html`](StyleShift-Design-Presentation.html)、[`StyleShift-功能介绍.html`](StyleShift-功能介绍.html)

---

## 生成 PPT（可选）

```powershell
.\build-styleshift-pptx.ps1
```

正文以 [`styleshift-slides.json`](styleshift-slides.json) 为准，建议与 HTML 演示稿保持一致。

---

## 许可与说明

课程/演示用途整理；引用或分发前请自行确认素材与第三方协议。
