# 🚨 最高优先级Python代码规则（永远不要违反）

1. 所有Python代码必须严格使用4个空格缩进，**绝对禁止使用任何Tab字符**
2. 永远不要生成混合缩进的代码
3. 每次写入任何.py文件后，**必须立即运行`python -m ruff format "文件名.py" && python -m ruff check --fix "文件名.py"`**
4. 如果格式化后出现语法错误，先修复语法错误再重新格式化
5. 永远不要在终端输出代码块让用户复制粘贴，**所有代码必须直接写入文件**
6. 永远不要手动调整缩进，所有缩进问题100%交给Ruff解决
7. 写入新的Python文件时，第一行必须是空行，然后再写代码
8. 处理多行字符串时，使用`textwrap.dedent`来避免多余的缩进

## 为什么需要这些规则？

Python对缩进极其敏感，Tab和空格混用会导致`IndentationError`。Ruff是现代化的Python格式化工具，比Black快100倍，能自动修复所有PEP 8违规问题。

## 工作流程

1. Claude生成Python代码并写入文件
2. 自动触发Ruff格式化（通过commands.json配置）
3. Ruff修复所有缩进和格式问题
4. 确保代码符合PEP 8规范

## 配置文件位置

- **Windows**: `%APPDATA%\claude-code\system-prompt.md`
- **macOS**: `~/.config/claude-code/system-prompt.md`
- **Linux**: `~/.config/claude-code/system-prompt.md`

## 相关配置

- `commands.json`: 自动格式化命令
- `config.json`: 编辑器缩进设置
- `CLAUDE.md`: 项目级规则（可选）
