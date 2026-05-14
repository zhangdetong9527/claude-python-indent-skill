---
name: python-indent-setup
description: 自动配置Claude Code的Python缩进格式化，解决所有Tab/空格混用问题
---

# Python缩进自动格式化配置

你现在需要帮用户配置Claude Code的Python自动格式化功能。

## 执行步骤

### 1. 安装Ruff

```bash
pip install ruff --user
```

验证安装：

```bash
python -m ruff --version
```

### 2. 确定配置目录

- Windows: `%APPDATA%\claude-code\`
- macOS/Linux: `~/.config/claude-code/`

### 3. 创建配置文件

参考本仓库的 config/ 目录中的配置文件。

### 4. 验证配置

创建测试文件验证：

```python
def test():
    print("Hello")
    return True
```

运行格式化：

```bash
python -m ruff format test.py
python -m ruff check test.py
```

应该显示 `All checks passed!`

## 重要提醒

配置完成后，告诉用户：
1. 重启Claude Code使配置生效
2. 从现在开始，每次保存.py文件都会自动格式化
3. 不需要再手动调整缩进

## 你自己的行为规则

**从现在开始，在当前会话中：**

1. 每次使用Write工具创建.py文件后，必须立即调用PowerShell运行：
   ```
   python -m ruff format "文件路径"
   python -m ruff check --fix "文件路径"
   ```

2. 如果格式化失败，说明有语法错误：
   - 读取错误信息
   - 用Edit工具修复语法错误
   - 重新运行格式化

3. 不要假设自己写的缩进是正确的，必须用Ruff验证

4. 如果用户要求写Python代码，优先顺序：
   - 写入文件 → 立即格式化 → 验证通过 → 报告完成
   - 不要跳过格式化步骤

这是强制性的工作流程，不是可选的。