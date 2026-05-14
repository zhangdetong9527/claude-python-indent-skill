# 上传到GitHub的步骤

## 方法1：通过GitHub网页上传（最简单）

1. **登录GitHub**
   - 访问 https://github.com
   - 使用你的账号 `zhangdetong9527` 登录

2. **创建新仓库**
   - 点击右上角的 `+` 号
   - 选择 `New repository`
   - Repository name: `claude-python-indent-skill`
   - Description: `Claude Code Python缩进问题终极解决方案`
   - 选择 `Public`
   - 不要勾选 "Initialize this repository with a README"
   - 点击 `Create repository`

3. **上传文件**
   - 在新创建的仓库页面，点击 `uploading an existing file`
   - 将以下整个文件夹拖拽到上传区域：
     ```
     C:\Users\Admin\Desktop\00_桌面收件箱\test\claude-python-indent-skill
     ```
   - 或者点击 `choose your files` 选择所有文件
   - 在底部的 Commit changes 区域：
     - Commit message: `Initial commit: Claude Python indent fix skill`
   - 点击 `Commit changes`

4. **完成！**
   - 你的仓库地址将是：
     ```
     https://github.com/zhangdetong9527/claude-python-indent-skill
     ```

## 文件清单

确保上传以下所有文件和文件夹：

```
claude-python-indent-skill/
├── README.md
├── README_EN.md
├── LICENSE
├── .gitignore
├── config/
│   ├── commands.json
│   ├── config.json
│   ├── system-prompt.md
│   ├── CLAUDE.md
│   └── profile.ps1
├── templates/
│   └── ruff.toml
└── docs/
    ├── INSTALL.md
    ├── TROUBLESHOOTING.md
    └── CHANGELOG.md
```

**注意**：`install.py` 文件有缩进问题，暂时不要上传。用户可以手动按照 `docs/INSTALL.md` 的步骤操作。

## 使用方法

上传完成后，在任何电脑的Claude Code中输入：

```
请按照这个GitHub仓库的说明配置Python缩进自动格式化：
https://github.com/zhangdetong9527/claude-python-indent-skill
```

Claude会自动读取README.md并执行配置步骤。

## 方法2：使用Git命令行（需要先安装Git）

如果你以后想用命令行更新仓库，可以：

1. 安装Git for Windows
2. 在项目目录打开PowerShell
3. 运行：
   ```powershell
   git init
   git add .
   git commit -m "Initial commit"
   git branch -M main
   git remote add origin https://github.com/zhangdetong9527/claude-python-indent-skill.git
   git push -u origin main
   ```

但现在用网页上传更简单！
