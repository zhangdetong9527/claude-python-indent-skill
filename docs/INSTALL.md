# 详细安装指南

本指南将逐步引导你完成Claude Code Python缩进自动格式化的完整配置。

## 目录

- [前置要求](#前置要求)
- [Windows安装](#windows安装)
- [macOS安装](#macos安装)
- [Linux安装](#linux安装)
- [验证安装](#验证安装)
- [故障排除](#故障排除)

## 前置要求

1. **Claude Code**（终端版或桌面版）
2. **Python 3.7+**
3. **pip**（Python包管理器）

### 检查Python版本

```bash
python --version
# 或
python3 --version
```

应该显示 `Python 3.7.0` 或更高版本。

## Windows安装

### 步骤1：安装Ruff

打开PowerShell或命令提示符：

```powershell
pip install ruff --user
```

### 步骤2：验证安装

```powershell
python -m ruff --version
```

应该显示类似 `ruff 0.15.13` 的版本号。

### 步骤3：找到配置目录

配置目录位于：`%APPDATA%\claude-code\`

完整路径通常是：`C:\Users\你的用户名\AppData\Roaming\claude-code\`

### 步骤4：复制配置文件

1. 下载本仓库的所有文件
2. 将以下文件复制到 `%APPDATA%\claude-code\`：
   - `config/commands.json`
   - `config/config.json`
   - `config/system-prompt.md`

### 步骤5：配置PowerShell别名（可选）

1. 找到PowerShell配置文件位置：
   ```powershell
   echo $PROFILE
   ```

2. 如果文件不存在，创建它：
   ```powershell
   New-Item -Path $PROFILE -Type File -Force
   ```

3. 将 `config/profile.ps1` 的内容添加到 `$PROFILE` 文件中

4. 启用脚本执行（以管理员身份运行）：
   ```powershell
   Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
   ```

5. 重新加载配置：
   ```powershell
   . $PROFILE
   ```

### 步骤6：重启Claude Code

关闭并重新打开Claude Code，使配置生效。

## macOS安装

### 步骤1：安装Ruff

打开终端：

```bash
pip3 install ruff --user
```
### 步骤2：验证安装

```bash
ruff --version
```

如果提示找不到命令，使用：

```bash
python3 -m ruff --version
```

### 步骤3：找到配置目录

配置目录位于：`~/.config/claude-code/`

### 步骤4：复制配置文件

```bash
# 创建配置目录（如果不存在）
mkdir -p ~/.config/claude-code

# 复制配置文件
cp config/commands.json ~/.config/claude-code/
cp config/config.json ~/.config/claude-code/
cp config/system-prompt.md ~/.config/claude-code/
```

### 步骤5：配置Shell别名（可选）

#### 对于zsh（macOS默认）：

```bash
# 编辑 ~/.zshrc
nano ~/.zshrc

# 添加以下内容：
alias cf='ruff format . && ruff check --fix .'
alias cc='ruff check .'

# 保存并重新加载
source ~/.zshrc
```

#### 对于bash：

```bash
# 编辑 ~/.bashrc
nano ~/.bashrc

# 添加以下内容：
alias cf='ruff format . && ruff check --fix .'
alias cc='ruff check .'

# 保存并重新加载
source ~/.bashrc
```

### 步骤6：重启Claude Code

## Linux安装

### 步骤1：安装Ruff

```bash
pip3 install ruff --user
```

### 步骤2：验证安装

```bash
ruff --version
```

如果提示找不到命令：

```bash
python3 -m ruff --version
```

### 步骤3：找到配置目录

配置目录位于：`~/.config/claude-code/`

### 步骤4：复制配置文件

```bash
# 创建配置目录
mkdir -p ~/.config/claude-code

# 复制配置文件
cp config/commands.json ~/.config/claude-code/
cp config/config.json ~/.config/claude-code/
cp config/system-prompt.md ~/.config/claude-code/
```

### 步骤5：配置Shell别名（可选）

根据你使用的Shell：

#### bash：

```bash
echo 'alias cf="ruff format . && ruff check --fix ."' >> ~/.bashrc
echo 'alias cc="ruff check ."' >> ~/.bashrc
source ~/.bashrc
```

#### zsh：

```bash
echo 'alias cf="ruff format . && ruff check --fix ."' >> ~/.zshrc
echo 'alias cc="ruff check ."' >> ~/.zshrc
source ~/.zshrc
```

### 步骤6：重启Claude Code

## 验证安装

### 测试1：检查Ruff

```bash
# Windows
python -m ruff --version

# macOS/Linux
ruff --version
```

### 测试2：创建测试文件

在Claude Code中输入：

```
写一个简单的Python函数计算两个数的和，保存到test_sum.py
```

Claude应该：
1. 创建文件
2. 自动运行Ruff格式化
3. 确保代码使用4个空格缩进

### 测试3：检查格式

```bash
# Windows
python -m ruff check test_sum.py

# macOS/Linux
ruff check test_sum.py
```

应该显示：`All checks passed!`

## 项目级配置（可选）

如果你想为特定项目添加规则：

1. 将 `config/CLAUDE.md` 复制到项目根目录
2. 可选：将 `templates/ruff.toml` 复制到项目根目录并自定义

## 故障排除

如果遇到问题，请查看 [TROUBLESHOOTING.md](TROUBLESHOOTING.md)。
## 下一步

- 阅读 [README.md](../README.md) 了解使用方法
- 查看 [TROUBLESHOOTING.md](TROUBLESHOOTING.md) 解决常见问题
- 自定义 `templates/ruff.toml` 以满足项目需求

## 需要帮助？

- 提交Issue：https://github.com/zhangdetong9527/claude-python-indent-skill/issues
- 查看文档：https://docs.astral.sh/ruff/
