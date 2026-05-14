# Claude Code Python Indent Fix - Auto Setup Skill

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Claude Code](https://img.shields.io/badge/Claude%20Code-Compatible-blue.svg)](https://claude.ai/code)

The ultimate solution for Python indentation issues in Claude Code terminal version. One command to fix all Tab/Space mixing, indentation drift, and PEP 8 violations.

## 🎯 Problems Solved

- ❌ IndentationError from Tab/Space mixing
- ❌ Inconsistent indentation levels
- ❌ PEP 8 violations (non-4-space indentation)
- ❌ Multi-line string indentation errors
- ❌ Time-consuming manual indentation fixes

## ✨ Features

- 🚀 **Fully Automatic**: Auto-format on every .py file save
- 🔧 **Zero Configuration**: One command completes all setup
- 📦 **Cross-Platform**: Windows, macOS, Linux support
- ⚡ **Lightning Fast**: Ruff is 100x faster than Black
- 🎓 **Standards Compliant**: Strict PEP 8 adherence

## 📋 Requirements

- Claude Code (Terminal/Desktop version)
- Python 3.7+
- pip

## 🚀 Quick Start

### Method 1: Direct Use (Recommended)

In Claude Code, type:

```
Please configure Python indentation auto-formatting according to this GitHub repository:
https://github.com/zhangdetong9527/claude-python-indent-skill
```

Claude will automatically execute all configuration steps.

### Method 2: Manual Installation

See [INSTALL.md](docs/INSTALL.md) for detailed instructions.

## 📁 File Structure

```
claude-python-indent-skill/
├── README.md                    # This file
├── README_EN.md              # English version
├── config/
│   ├── commands.json            # Auto-format command config
│   ├── config.json            # Editor settings
│   ├── system-prompt.md         # Global system prompt
│   ├── CLAUDE.md                # Project-level rules (optional)
│   └── profile.ps1              # PowerShell aliases (Windows)
├── templates/
│   └── ruff.toml           # Ruff config template (optional)
└── docs/
    ├── INSTALL.md         # Detailed installation guide
    ├── TROUBLESHOOTING.md       # Troubleshooting
    └── CHANGELOG.md           # Changelog
```

## 🎮 Usage

After configuration, Claude Code automatically handles all indentation issues:

```
# In Claude Code, type:
Write a quicksort algorithm and save to quicksort.py
```

Claude will:
1. ✅ Generate code and write to file
2. ✅ Auto-run Ruff formatting
3. ✅ Fix all indentation and format issues
4. ✅ Ensure PEP 8 compliance

## 📚 Documentation

- [Installation Guide](docs/INSTALL.md)
- [Troubleshooting](docs/TROUBLESHOOTING.md)
- [Changelog](docs/CHANGELOG.md)

## 🤝 Contributing

Issues and Pull Requests are welcome!

1. Fork this repository
2. Create feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to branch (`git push origin feature/AmazingFeature`)
5. Open Pull Request

## 📄 License

This project is licensed under the MIT License - see [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- [Ruff](https://github.com/astral-sh/ruff) - Lightning-fast Python linter and formatter
- [Claude Code](https://claude.ai/code) - Anthropic's AI coding assistant
- All contributors and users

## 📞 Contact

- GitHub: [@zhangdetong9527](https://github.com/zhangdetong9527)
- Issues: [Submit Issue](https://github.com/zhangdetong9527/claude-python-indent-skill/issues)

## ⭐ Star History

If this project helped you, please give it a Star⭐!

---

**Made with ❤️ by zhangdetong9527**
