@echo off
chcp 65001 >nul

echo.
echo ========================================
echo   Cloudflare Pages 部署脚本
echo   蔡文杰个人网页
echo ========================================
echo.

cd /d "%~dp0"

echo 📁 当前目录：%CD%
echo.

echo 📦 正在部署...
echo    项目名称：caiwenjie-portfolio
echo    分支：main
echo.

wrangler pages deploy . --project-name=caiwenjie-portfolio --branch=main

if %errorlevel% equ 0 (
    echo.
    echo ✅ 部署成功！
    echo.
    echo 🌐 你的网站地址：
    echo    https://caiwenjie-portfolio.pages.dev
    echo.
    echo 💡 提示：
    echo    - 首次部署需要登录 Cloudflare 账号
    echo    - 后续更新代码后重新运行此脚本即可
    echo    - 可以在 Cloudflare Dashboard 中查看部署状态
) else (
    echo.
    echo ❌ 部署失败，请检查错误信息
)

echo.
pause
