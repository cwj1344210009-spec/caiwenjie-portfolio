#!/bin/bash

# Cloudflare Pages 部署脚本
# 用于部署蔡文杰个人网页

echo "🚀 开始部署到 Cloudflare Pages..."
echo ""

# 检查是否安装了 wrangler
if ! command -v wrangler &> /dev/null; then
    echo "❌ 未检测到 wrangler，请先安装："
    echo "   npm install -g wrangler"
    exit 1
fi

# 进入项目目录
cd "$(dirname "$0")"

echo "📁 当前目录：$(pwd)"
echo ""

# 部署命令
echo "📦 正在部署..."
echo "   项目名称：caiwenjie-portfolio"
echo "   分支：main"
echo ""

# 使用 direct upload 方式部署
wrangler pages deploy . --project-name=caiwenjie-portfolio --branch=main

if [ $? -eq 0 ]; then
    echo ""
    echo "✅ 部署成功！"
    echo ""
    echo "🌐 你的网站地址："
    echo "   https://caiwenjie-portfolio.pages.dev"
    echo ""
    echo "💡 提示："
    echo "   - 首次部署需要登录 Cloudflare 账号"
    echo "   - 后续更新代码后重新运行此脚本即可"
    echo "   - 可以在 Cloudflare Dashboard 中查看部署状态"
else
    echo ""
    echo "❌ 部署失败，请检查错误信息"
    exit 1
fi
