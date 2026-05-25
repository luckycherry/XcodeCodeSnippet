#!/bin/bash

# 确保脚本在错误时退出
set -e

echo "🚀 开始配置 iBeat 团队专属 Xcode 生产力工具..."

# 1. 定义系统目标路径
XCODE_SNIPPETS_DIR="$HOME/Library/Developer/Xcode/UserData/CodeSnippets"
XCODE_TEMPLATES_DIR="$HOME/Library/Developer/Xcode/Templates/File Templates/Custom"

# 2. 动态创建系统所需的依赖目录（如果不存在的话）
mkdir -p "$XCODE_SNIPPETS_DIR"
mkdir -p "$XCODE_TEMPLATES_DIR"

# 3. 寻找当前脚本所在的 Git 目录
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# 4. 同步代码片段 (Code Snippets)
if [ -d "$SCRIPT_DIR/CodeSnippets" ]; then
    echo "💾 正在注入代码片段 (Code Snippets)..."
    cp -R "$SCRIPT_DIR/CodeSnippets/"* "$XCODE_SNIPPETS_DIR/"
fi

# 5. 同步文件架构模板 (Templates)
if [ -d "$SCRIPT_DIR/Templates" ]; then
    echo "🏗 正在注入文件架构模板 (Xcode Templates)..."
    cp -R "$SCRIPT_DIR/Templates/"* "$XCODE_TEMPLATES_DIR/"
fi

echo "✨ 恭喜！全套自研状态机与 MVVM 模板注入成功！"
echo "💡 请彻底重启一下你的 Xcode 以便刷新缓存。"
