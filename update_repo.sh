#!/bin/bash

# 确保脚本在错误时退出
set -e

echo "🔄 开始从 Xcode 提取最新生产力工具并同步回本地仓库..."

# 1. 定义 Xcode 系统的源路径
XCODE_SNIPPETS_DIR="$HOME/Library/Developer/Xcode/UserData/CodeSnippets"
XCODE_TEMPLATES_DIR="$HOME/Library/Developer/Xcode/Templates/File Templates/Custom"

# 2. 寻找当前脚本所在的 Git 仓库目录，并定义仓库内的目标路径
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
REPO_SNIPPETS_DIR="$SCRIPT_DIR/CodeSnippets"
REPO_TEMPLATES_DIR="$SCRIPT_DIR/Templates"

# 3. 动态创建仓库目录（确保骨架健全）
mkdir -p "$REPO_SNIPPETS_DIR"
mkdir -p "$REPO_TEMPLATES_DIR"

# ========================================================
# 🏗 步骤 A：同步文件架构模板 (Xcode Templates)
# ========================================================
if [ -d "$XCODE_TEMPLATES_DIR" ]; then
    echo "🏗 检测到本地本地自研模板，正在同步回仓库..."
    # 使用 rsync 干净同步，--delete 会自动删除仓库里过时、但在本地已经被你删掉的模板文件
    rsync -av --delete "$XCODE_TEMPLATES_DIR/" "$REPO_TEMPLATES_DIR/"
else
    echo "⚠️ 未在系统路径发现 Custom 模板目录，跳过模板同步。"
fi

# ========================================================
# 💾 步骤 B：同步并智能化重命名代码片段 (Code Snippets)
# ========================================================
if [ -d "$XCODE_SNIPPETS_DIR" ] && [ "$(ls -A "$XCODE_SNIPPETS_DIR")" ]; then
    echo "💾 检测到本地代码片段，正在进行【语义化智能重命名】并转存..."
    
    # 清空旧的仓库 Snippets 目录，防止旧的垃圾 UUID 文件堆积
    rm -rf "$REPO_SNIPPETS_DIR"/*
    
    # 循环遍历 Xcode 目录下的所有代码片段
    for snippet in "$XCODE_SNIPPETS_DIR"/*.codesnippet; do
        # 确保文件存在（防止通配符匹配失败）
        [ -e "$snippet" ] || continue
        
        # 🎯 黑魔法：从编译生成的 plist 文件中，精准抠出你在 Xcode 里填写的 IDEUserSnippetTitle（片段标题）
        TITLE=$(plutil -extract IDEUserSnippetTitle xml1 -o - "$snippet" | sed -n 's/.*<string>\(.*\)<\/string>.*/\1/p' | head -n 1)
        
        # 如果提取到了标题，就把空格和特殊字符换成下划线，作为纯净的文件名
        if [ -not -z "$TITLE" ]; then
            # 过滤掉文件名里不合法的特殊字符
            CLEAN_TITLE=$(echo "$TITLE" | tr ' /\\:?*"<>|' '_')
            NEW_NAME="${CLEAN_TITLE}.codesnippet"
        else
            # 如果没拿到标题，降级使用原有的 UUID 文件名
            NEW_NAME=$(basename "$snippet")
        fi
        
        # 拷贝到仓库，换上人类能看懂的高级名字
        cp "$snippet" "$REPO_SNIPPETS_DIR/$NEW_NAME"
        echo "   ✅ 已同步: [$TITLE] -> $NEW_NAME"
    done
else
    echo "⚠️ 未在系统路径发现任何代码片段，跳过 Snippets 同步。"
fi

# ========================================================
# 🚀 步骤 C：自动检测 Git 状态
# ========================================================
echo "--------------------------------------------------"
echo "✨ 恭喜老哥！本地 Xcode 资产已完美逆向同步到仓库！"
echo "--------------------------------------------------"

cd "$SCRIPT_DIR"
if [ -d ".git" ]; then
    CHANGES=$(git status --porcelain)
    if [ -not -z "$CHANGES" ]; then
        echo "⚡️ 检测到本地仓库有文件变更，底牌如下："
        git status -s
        echo ""
        echo "💡 提示：你可以直接执行以下命令提交并推给团队："
        echo "   git add ."
        echo "   git commit -m \"style: 更新团队专属自研状态机与常用工具片段\""
        echo "   git push"
    else
        echo "😎 仓库内容与本地 Xcode 完全一致，暂无任何新改动，无需提交。"
    fi
fi
