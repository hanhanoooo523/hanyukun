Symbio-Shell 概念页 · 独立网页（可分享）
========================================

本文件夹是一个完整的静态「小网站」，别人要用浏览器正常看到配图，必须用下面两种方式之一。

方式 A · 发压缩包（适合微信/邮件/网盘）
------------------------------------
1. 选中整个文件夹 `symbio-shell-concept-standalone`（内含 index.html 与 assets）
2. 打成 zip / 7z
3. 发给对方，对方解压后双击打开 index.html

注意：不要只发 index.html，否则会缺少 assets 里的图片。

方式 B · 网上链接（对方只点链接）
------------------------------------
1. 把整个文件夹上传到支持静态网页的空间，例如：
   - GitHub（本仓库 hanyukun）：已用 Actions 只部署本目录。
     · 仓库 Settings → Pages → Build and deployment → Source 选「GitHub Actions」
     · 推送 main 后，工作流 「Deploy GitHub Pages」会把本文件夹内容作为站点根目录发布
     · 项目站地址一般为：https://hanhanoooo523.github.io/hanyukun/
       （若用户名或仓库名不同，请把两处换成你的）
   - Netlify：拖拽本文件夹到 https://app.netlify.com/drop
2. 把生成的 https 地址发给对方，用任意浏览器打开即可

说明：GitHub 默认的「从分支发布」只能选仓库根或 /docs，不能直接选子文件夹；
因此本仓库用 workflow 上传 symbio-shell-concept-standalone 作为站点根，这样链接打开就是概念页。

技术说明
--------
- 配图路径为相对路径 assets/...，与 index.html 必须在同一相对位置。
- 若要把所有内容塞进「单文件 html」（体积会非常大），需要另做图片内嵌，本包未采用该方案。
