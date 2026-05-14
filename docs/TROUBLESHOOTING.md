# 故障排除指南

本文档列出了常见问题及其解决方案。

## 目录

- [安装问题](#安装问题)
- [配置问题](#配置问题)
- [运行时问题](#运行时问题)
- [格式化问题](#格式化问题)
- [平台特定问题](#平台特定问题)

## 安装问题

### ❌ pip install ruff 失败

**症状**：
```
ERROR: Could not install packages due to an OSError
```

**解决方案**：

1. 使用 `--user` 参数：
   ```bash
   pip install ruff --user
   ```

2. 升级pip：
   ```bash
   python -m pip install --upgrade pip
   ```

3. 使用虚拟环境：
   ```bash
   python -m venv venv
   source venv/bin/activate  # Linux/macOS
   venv\Scripts\activate     # Windows
   pip install ruff
   ```

### ❌ ruff命令找不到

**症状**：
```
'ruff' is not recognized as an internal or external command
```

**解决方案**：

使用Python模块方式调用：
```bash
python -m ruff --version
```

或者将Ruff添加到PATH：

**Windows**：
1. 找到Ruff安装位置：
   ```powershell
   python -m pip show ruff
   ```
2. 将 `Scripts` 目录添加到系统PATH

**macOS/Linux**：
```bash
export PATH="$HOME/.local/bin:$PATH"
echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.bashrc
```

## 配置问题

### ❌ 配置文件不生效

**症状**：Claude Code仍然生成有缩进问题的代码

**解决方案**：

1. **检查配置文件位置**：
   ```bash
   # Windows
   dir %APPDATA%\claude-code\

   # macOS/Linux
   ls -la ~/.config/claude-code/
   ```

   应该看到：
   - `commands.json`
   - `config.json`
   - `system-prompt.md`

2. **验证JSON格式**：
   使用在线JSON验证器检查 `commands.json` 和 `config.json` 是否有语法错误。

3. **重启Claude Code**：
   完全关闭并重新打开Claude Code。

4. **检查文件权限**：
   ```bash
   # macOS/Linux
   chmod 644 ~/.config/claude-code/*.json
   ```

### ❌ commands.json中的autoRun不工作

**症状**：保存.py文件后没有自动格式化

**解决方案**：

1. **检查命令语法**：
   确保 `commands.json` 中的命令正确：
   ```json
   {
     "command": "python -m ruff format \"${file}\" && python -m ruff check --fix \"${file}\""
   }
   ```

2. **手动测试命令**：
   ```bash
   python -m ruff format test.py
   python -m ruff check --fix test.py
   ```

3. **检查Claude Code版本**：
   确保使用最新版本的Claude Code。

### ❌ system-prompt.md被忽略

**症状**：Claude仍然生成不符合规范的代码

**解决方案**：

1. **确认文件位置正确**：
   ```bash
   # Windows
   type %APPDATA%\claude-code\system-prompt.md

   # macOS/Linux
   cat ~/.config/claude-code/system-prompt.md
   ```

2. **检查文件编码**：
   确保文件使用UTF-8编码。

3. **清除Claude缓存**（如果适用）：
   重启Claude Code并开始新对话。

## 运行时问题

### ❌ IndentationError: unexpected indent

**症状**：
```python
IndentationError: unexpected indent
```

**解决方案**：

1. **立即运行Ruff修复**：
   ```bash
   python -m ruff format 文件名.py
   python -m ruff check --fix 文件名.py
   ```

2. **检查Tab字符**：
   ```bash
   # 显示Tab字符
   cat -A 文件名.py  # Linux/macOS
   ```

3. **转换Tab为空格**：
   ```python
   # 使用Python脚本
   with open('file.py', 'r') as f:
       content = f.read().replace('\t', '    ')
   with open('file.py', 'w') as f:
       f.write(content)
   ```

### ❌ SyntaxError after formatting

**症状**：格式化后出现语法错误

**解决方案**：

1. **先修复语法错误**：
   Ruff无法格式化有语法错误的代码。先修复语法问题。

2. **检查字符串引号**：
   确保字符串引号正确闭合。

3. **检查括号匹配**：
   确保所有括号、方括号、花括号正确匹配。

### ❌ Ruff格式化后代码行为改变

**症状**：格式化后代码逻辑错误

**解决方案**：

这通常不会发生，因为Ruff只改变格式，不改变逻辑。如果发生：

1. **检查原始代码**：
   可能原始代码就有逻辑错误，只是格式问题掩盖了。

2. **使用git diff查看变化**：
   ```bash
   git diff 文件名.py
   ```

3. **报告bug**：
   如果确认是Ruff的问题，向Ruff项目报告。

## 格式化问题

### ❌ 格式化速度慢

**症状**：格式化大文件需要很长时间

**解决方案**：

1. **检查Ruff版本**：
   ```bash
   python -m ruff --version
   ```
   确保使用最新版本。

2. **排除不必要的文件**：
   在项目根目录创建 `ruff.toml`：
   ```toml
   exclude = [
       ".git",
       ".venv",
       "__pycache__",
       "build",
       "dist",
   ]
   ```

3. **分批格式化**：
   ```bash
   # 只格式化特定目录
   python -m ruff format src/
   ```

### ❌ 格式化结果不符合预期

**症状**：格式化后的代码风格不是你想要的

**解决方案**：

自定义Ruff配置，在项目根目录创建 `ruff.toml`：

```toml
[format]
line-length = 100  # 修改行长度
quote-style = "single"  # 使用单引号
indent-style = "space"
```

参考 `templates/ruff.toml` 获取更多配置选项。

## 平台特定问题

### Windows

#### ❌ PowerShell脚本无法运行

**症状**：
```
cannot be loaded because running scripts is disabled
```

**解决方案**：

以管理员身份运行PowerShell：
```powershell
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
```

## ❌ 路径中的空格导致问题

**症状**：命令在包含空格的路径中失败

**解决方案**：

使用引号包裹路径：
```powershell
python -m ruff format "C:\My Projects\test.py"
```

### macOS

#### ❌ python命令找不到

**症状**：
```
command not found: python
```

**解决方案**：

macOS使用 `python3`：
```bash
python3 -m ruff --version
```

或创建别名：
```bash
echo 'alias python=python3' >> ~/.zshrc
source ~/.zshrc
```

#### ❌ 权限被拒绝

**症状**：
```
Permission denied
```

**解决方案**：

```bash
chmod +x 文件名
# 或
sudo pip3 install ruff
```

### Linux

#### ❌ pip安装到系统目录失败

**症状**：
```
error: externally-managed-environment
```

**解决方案**：

使用 `--user` 参数：
```bash
pip3 install ruff --user
```

或使用虚拟环境：
```bash
python3 -m venv
source venv/bin/activate
pip install ruff
```

## 调试技巧

### 启用详细输出

```bash
# 查看Ruff详细输出
python -m ruff check --verbose 文件名.py

# 查看格式化差异
python -m ruff format --diff 文件名.py
```

### 检查配置

```bash
# 显示Ruff使用的配置
python -m ruff check --show-settings
```

### 测试单个文件

```bash
# 创建最小测试用例
echo "def test():
    pass" > test.py

python -m ruff format test.py
python -m ruff check test.py
```

## 仍然无法解决？

1. **查看Ruff文档**：https://docs.astral.sh/ruff/
2. **提交Issue**：https://github.com/zhangdetong9527/claude-python-indent-skill/issues
3. **检查Claude Code文档**：https://claude.ai/code/docs

## 常见错误代码

| 错误代码 | 含义 | 解决方案 |
|------|------|---------|
| E101 | 缩进包含Tab和空格混用 | 运行 `ruff format` |
| E111 | 缩进不是4的倍数 | 运行 `ruff format` |
| E501 | 行太长 | 运行 `ruff format` 或增加 `line-length` |
| F401 | 导入但未使用 | 运行 `ruff check --fix` |
| F841 | 变量赋值但未使用 | 删除未使用的变量 |

## 预防措施

1. **始终使用虚拟环境**
2. **定期更新Ruff**：`pip install --upgrade ruff`
3. **提交前检查**：`ruff check .`
4. **使用pre-commit hook**（可选）
5. **团队统一配置**：共享 `ruff.toml`

---

**最后更新**：2026-05-15
