# 本项目Python代码强制规则

## 缩进规范

1. 严格遵循PEP 8规范，使用4个空格缩进
2. 所有代码修改必须通过Ruff格式化
3. 禁止使用Tab字符
4. 禁止输出代码块让用户复制粘贴
5. 每次编辑后自动运行格式化命令

## 代码质量

- 使用Ruff进行代码检查和格式化
- 遵循PEP 8命名规范
- 保持代码简洁可读

## 自动化

Claude Code会在每次保存.py文件后自动运行：
```bash
python -m ruff format <file>
python -m ruff check --fix <file>
```

无需手动干预，所有格式问题自动修复。
