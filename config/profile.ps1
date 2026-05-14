# Claude Code Python格式化别名
# 适用于Windows PowerShell

# 一键格式化当前目录所有Python文件
function cf {
    python -m ruff format .
    python -m ruff check --fix .
}

# 检查当前目录所有格式问题
function cc {
    python -m ruff check .
}

# 格式化单个文件
function cffile {
    param([string]$file)
    python -m ruff format $file
    python -m ruff check --fix $file
}

# 显示Ruff版本
function ruff-version {
  python -m ruff --version
}

Write-Host "Claude Code Python格式化别名已加载！" -ForegroundColor Green
Write-Host "可用命令：" -ForegroundColor Cyan
Write-Host "  cf      - 格式化当前目录所有.py文件" -ForegroundColor Yellow
Write-Host "  cc        - 检查当前目录格式问题" -ForegroundColor Yellow
Write-Host "  cffile <文件> - 格式化指定文件" -ForegroundColor Yellow
Write-Host "  ruff-version - 显示Ruff版本" -ForegroundColor Yellow
