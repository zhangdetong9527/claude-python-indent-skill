# 更新日志

所有重要的项目变更都会记录在此文件中。

格式基于 [Keep a Changelog](https://keepachangelog.com/zh-CN/1.0.0/)，
本项目遵循 [语义化版本](https://semver.org/lang/zh-CN/)。

## [1.0.0] - 2026-05-15

### 新增
- 🎉 首次发布
- ✨ 自动格式化配置（commands.json）
- ⚙️ 编辑器缩进设置（config.json）
- 📝 全局系统提示词（system-prompt.md）
- 📋 项目级规则模板（CLAUDE.md）
- 🔧 PowerShell别名配置（profile.ps1）
- 📚 Ruff配置模板（ruff.toml）
- 📖 详细安装指南（INSTALL.md）
- 🔍 故障排除文档（TROUBLESHOOTING.md）
- 🌍 中英文README

### 特性
- 支持Windows、macOS、Linux三大平台
- 自动在保存.py文件后运行Ruff格式化
- 强制使用4个空格缩进
- 禁止Tab字符
- 符合PEP 8规范
- 比Black快100倍的格式化速度

### 文档
- 完整的安装指南
- 常见问题解答
- 故障排除步骤
- 配置文件详解
- 使用示例

## [未来计划]

### 计划中
- [ ] 添加pre-commit hook配置
- [ ] 支持更多IDE集成
- [ ] 添加CI/CD配置示例
- [ ] 创建视频教程
- [ ] 添加更多语言支持（JavaScript、TypeScript等）
- [ ] 开发Claude Code skill插件
- [ ] 添加自动化测试

### 考虑中
- [ ] VSCode扩展
- [ ] JetBrains插件
- [ ] Docker镜像
- [ ] 在线配置生成器
- [ ] 团队配置同步工具

## 版本说明

### 版本号规则

- **主版本号（Major）**：不兼容的API变更
- **次版本号（Minor）**：向下兼容的功能新增
- **修订号（Patch）**：向下兼容的问题修复

### 发布周期

- **稳定版**：经过充分测试的正式版本
- **测试版**：功能完整但需要更多测试
- **开发版**：最新功能，可能不稳定

## 贡献者

感谢所有为本项目做出贡献的人！

- [@zhangdetong9527](https://github.com/zhangdetong9527) - 项目创建者和维护者

## 反馈

如果你有任何建议或发现bug，请：

1. 查看 [Issues](https://github.com/zhangdetong9527/claude-python-indent-skill/issues)
2. 提交新的Issue
3. 发起Pull Request

---

**格式说明**：

- `新增`：新功能
- `变更`：现有功能的变更
- `弃用`：即将移除的功能
- `移除`：已移除的功能
- `修复`：bug修复
- `安全`：安全相关的修复
