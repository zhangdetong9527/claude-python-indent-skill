# 如何让Claude严格执行Python格式化规则

## 问题：为什么Claude会犯缩进错误？

即使配置了格式化工具，Claude在写入Python文件时仍可能产生缩进错误，因为：

1. **配置延迟生效**：`system-prompt.md` 只在新会话启动时加载
2. **缺少强制执行**：没有机制强制Claude在写入后立即格式化
3. **依赖自觉性**：Claude可能"忘记"执行格式化步骤

## 解决方案：三层防护

### 第1层：项目级CLAUDE.md（立即生效）

在项目根目录创建 `CLAUDE.md`，Claude会在当前会话中立即读取：

```markdown
# Python代码强制规则

## 🚨 强制执行的工作流程

每次写入Python文件时必须执行：

1. 写入文件（Write/Edit工具）
2. 立即格式化（强制性）：
   python -m ruff format "文件路径"
   python -m ruff check --fix "文件路径"
3. 检查结果：All checks passed! = 成功
4. 报告完成

禁止写入Python文件后不运行格式化！
```

**优点**：当前会话立即生效，不需要重启

### 第2层：全局system-prompt.md（新会话生效）

配置全局规则，对所有未来会话生效：

**位置**：
- Windows: `%APPDATA%\claude-code\system-prompt.md`
- macOS/Linux: `~/.config/claude-code/system-prompt.md`

**内容**：
```markdown
# 🚨 最高优先级Python代码规则

1. 所有Python代码必须使用4个空格缩进
2. 每次写入.py文件后，必须立即运行：
   python -m ruff format "文件名.py"
   python -m ruff check --fix "文件名.py"
3. 如果格式化失败，先修复语法再重新格式化
4. 永远不要手动调整缩进，100%交给Ruff处理
```

**优点**：对所有项目生效，一次配置永久有效

### 第3层：自动化hooks（终极方案）

配置 `commands.json` 实现保存时自动格式化：

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

**优点**：完全自动化，无需人工干预

## 实施步骤

### 立即生效（当前会话）

1. 在项目根目录创建 `CLAUDE.md`
2. 复制"第1层"的内容
3. 告诉Claude："请严格遵守CLAUDE.md中的规则"

### 永久生效（所有会话）

1. 运行本仓库的配置脚本，或手动复制配置文件
2. 重启Claude Code
3. 从此所有Python文件都会自动格式化

## 验证是否生效

让Claude写一个Python函数：

```
写一个快速排序函数，保存到quicksort.py
```

观察Claude是否：
1. ✅ 写入文件
2. ✅ 立即运行 `python -m ruff format quicksort.py`
3. ✅ 运行 `python -m ruff check quicksort.py`
4. ✅ 报告 "All checks passed!"

如果Claude跳过了步骤2-3，说明规则没有生效，需要重新配置。

## 常见问题

### Q: 为什么CLAUDE.md比system-prompt.md优先级高？

A: Claude在每次会话中会先读取当前项目的CLAUDE.md，然后才应用全局配置。项目级规则可以覆盖全局规则。

### Q: 如果Claude还是不执行格式化怎么办？

A: 手动提醒："请按照CLAUDE.md的规则，立即格式化刚才写入的Python文件"

### Q: 这些规则会影响其他语言吗？

A: 不会，规则只针对 `.py` 文件。其他语言不受影响。

## 总结

- **最快方案**：创建项目级 `CLAUDE.md`（立即生效）
- **最佳方案**：配置全局 `system-prompt.md` + `commands.json`（永久有效）
- **终极方案**：三层防护全部配置（万无一失）

---

**重要**：配置不是可选的，是必需的。没有这些规则，Claude会像之前一样犯缩进错误。
