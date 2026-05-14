# Claude Code Python缩进问题终极解决方案

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Claude Code](https://img.shields.io/badge/Claude%20Code-Compatible-blue.svg)](https://claude.ai/code)

一键解决Claude Code终端版生成Python代码时的所有缩进问题（Tab/空格混用、缩进漂移、PEP 8违规等）。

## 🎯 解决的问题

- ❌ Tab和空格混用导致的IndentationError
- ❌ 缩进层级不一致
- ❌ 违反PEP 8规范（非4空格缩进）
- ❌ 多行字符串缩进错误
- ❌ 手动调整缩进费时费力

## ✨ 特性

- 🚀 **全自动格式化**：每次保存.py文件后自动运行Ruff格式化
- 🔧 **零配置**：一条命令完成所有设置
- 📦 **跨平台**：支持Windows、macOS、Linux
- ⚡ **极速**：Ruff比Black快100倍
- 🎓 **符合规范**：严格遵循PEP 8标准

## 📋 系统要求

- Claude Code（终端版/桌面版）
- Python 3.7+
- pip

## 🚀 快速开始

### 方法1：直接使用（推荐）

在Claude Code中输入以下命令：

```
请按照这个GitHub仓库的说明配置Python缩进自动格式化：
https://github.com/zhangdetong9527/claude-python-indent-skill

并且严格遵守CLAUDE.md中的规则，每次写入Python文件后必须立即运行格式化。
```

Claude会自动执行所有配置步骤。

**重要**：如果Claude写入Python文件后没有立即运行格式化，请提醒它："请按照CLAUDE.md规则立即格式化"。详见 [HOW_TO_ENFORCE.md](HOW_TO_ENFORCE.md)。

### 方法2：手动安装

#### 1. 安装Ruff

```bash
# Windows
pip install ruff --user

# macOS/Linux
pip3 install ruff --user
```

#### 2. 配置Claude Code

根据你的操作系统，找到配置目录：

- **Windows**: `%APPDATA%\claude-code\`
- **macOS**: `~/.config/claude-code/`
- **Linux**: `~/.config/claude-code/`

#### 3. 复制配置文件

将本仓库中的以下文件复制到配置目录：

- `config/commands.json` → `claude-code/commands.json`
- `config/config.json` → `claude-code/config.json`
- `config/system-prompt.md` → `claude-code/system-prompt.md`

#### 4. 项目级配置（可选）

将 `config/CLAUDE.md` 复制到你的Python项目根目录。

## 📁 文件说明

```
claude-python-indent-skill/
├── README.md                 # 本文件
├── README_EN.md               # English version
├── config/
│   ├── commands.json         # 自动格式化命令配置
│   ├── config.json           # 编辑器设置
│   ├── system-prompt.md         # 全局系统提示词
│   ├── CLAUDE.md                # 项目级规则（可选）
│   └── profile.ps1              # PowerShell别名（Windows）
├── templates/
│   └── ruff.toml                # Ruff配置模板（可选）
└── docs/
    ├── INSTALL.md         # 详细安装指南
    ├── TROUBLESHOOTING.md       # 故障排除
    └── CHANGELOG.md             # 更新日志
```

## 🔧 配置详解

### commands.json

自动在每次保存.py文件后运行Ruff格式化：

```json
{
  "commands": [
    {
      "name": "format-python",
      "description": "Auto-format Python files with Ruff",
      "command": "python -m ruff format \"${file}\" && python -m ruff check --fix \"${file}\"",
      "runIn": "terminal",
      "silent": true,
      "autoRun": {
        "on": "fileSaved",
        "pattern": "*.py"
      }
    }
  ]
}
```

### config.json

强制使用4个空格缩进：

```json
{
  "editor": {
    "detectIndentation": false,
    "defaultIndentSize": 4,
    "defaultIndentType": "space"
  }
}
```

### system-prompt.md

最高优先级规则，确保Claude从源头遵守Python规范。

## 🎮 使用方法

配置完成后，Claude Code会自动处理所有缩进问题：

```
# 在Claude Code中输入
写一个快速排序算法，保存到quicksort.py
```

Claude会：
1. ✅ 生成代码并写入文件
2. ✅ 自动运行Ruff格式化
3. ✅ 修复所有缩进和格式问题
4. ✅ 确保符合PEP 8规范

## 🛠️ 手动格式化命令

### Windows (PowerShell)

```powershell
# 格式化当前目录所有Python文件
python -m ruff format .
python -m ruff check --fix .

# 检查格式问题
python -m ruff check .
```

### macOS/Linux

```bash
# 格式化当前目录所有Python文件
ruff format .
ruff check --fix .

# 检查格式问题
ruff check .
```

## 📚 常见问题

### Q: Ruff命令找不到？

**A**: 使用 `python -m ruff` 代替 `ruff`：

```bash
python -m ruff --version
```

### Q: PowerShell脚本无法运行？

**A**: 以管理员身份运行PowerShell，执行：
```powershell
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
```

### Q: 配置后仍有缩进问题？

**A**: 检查以下几点：

1. 确认Ruff已正确安装：`python -m ruff --version`
2. 检查配置文件路径是否正确
3. 重启Claude Code
4. 查看详细故障排除：[TROUBLESHOOTING.md](docs/TROUBLESHOOTING.md)

### Q: 如何自定义格式化规则？

**A**: 在项目根目录创建 `ruff.toml` 或 `pyproject.toml`：

```toml
[tool.ruff]
line-length = 88
indent-width = 4

[tool.ruff.format]
quote-style = "double"
indent-style = "space"
```

## 🔄 更新

```bash
# 更新Ruff到最新版本
pip install --upgrade ruff
```

## 🤝 贡献

欢迎提交Issue和Pull Request！

1. Fork本仓库
2. 创建特性分支 (`git checkout -b feature/AmazingFeature`)
3. 提交更改 (`git commit -m 'Add some AmazingFeature'`)
4. 推送到分支 (`git push origin feature/AmazingFeature`)
5. 开启Pull Request

## 📄 许可证

本项目采用 MIT 许可证 - 查看 [LICENSE](LICENSE) 文件了解详情。

## 🙏 致谢

- [Ruff](https://github.com/astral-sh/ruff) - 极速Python代码检查和格式化工具
- [Claude Code](https://claude.ai/code) - Anthropic的AI编程助手
- 所有贡献者和用户

## 📞 联系方式

- GitHub: [@zhangdetong9527](https://github.com/zhangdetong9527)
- Issues: [提交问题](https://github.com/zhangdetong9527/claude-python-indent-skill/issues)

## ⭐ Star History

如果这个项目帮到了你，请给个Star⭐！

---

**Made with ❤️ by zhangdetong9527**
