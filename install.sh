#!/bin/bash
#
# 等保测评 AI Agent Skill 集合 — 一键安装到 Hermes Agent
#
# 用法:
#   bash install.sh              # 安装到默认 profile
#   bash install.sh myprofile    # 安装到指定 profile
#
# 说明:
#   Hermes 通过扫描 SKILL.md 发现技能（rglob），因此每个 Skill 必须
#   放在 <name>/SKILL.md 层级下。平铺的 .md 文件不会被识别。
#   本脚本按各文件 frontmatter 的 name 字段建立目录。
#

set -e

PROFILE="${1:-default}"
HERMES_SKILLS_DIR="${HOME}/.hermes/profiles/${PROFILE}/skills"
TARGET_DIR="${HERMES_SKILLS_DIR}/dengbao-DJCP"
SOURCE_DIR="$(cd "$(dirname "$0")" && pwd)"

echo "📦 等保测评 Skill 集合安装工具"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "源目录: ${SOURCE_DIR}/skills"
echo "目标目录: ${TARGET_DIR}"
echo "Profile: ${PROFILE}"
echo ""

if [ ! -d "${SOURCE_DIR}/skills" ]; then
    echo "❌ 错误: 找不到 skills/ 目录"
    echo "   请确保在 dengbao-DJCP 项目根目录下运行此脚本"
    exit 1
fi

# 文件名 → Skill 目录名（frontmatter name）映射。
# 显式列出可避免在 shell 里解析 YAML 的引号问题，也便于人工核对。
SKILL_NAME_MAP="
等保定级助手.md:dengbao-dingji-zhushou
等保差距分析专家.md:dengbao-chaju-fenxi-zhuanjia
安全整改方案设计师.md:security-remediation-designer
等保测评报告生成器.md:dengbao-assessment-report-generator
等保测评重大风险问题指导 Skill.md:dengbao-major-risk-identification
等保测评专家 AI Skill.md:dengbao-comprehensive-assessment-expert
等保合规配置核查专家.md:dengbao-compliance-configuration-auditor
Linux 等保基线检查 Agent.md:linux-dengbao-baseline-check-agent
数据库安全检查 Agent.md:database-security-check-agent
等保访谈清单专家.md:dengbao-interview-checklist-expert
等保政策解读与培训专家.md:dengbao-policy-training-expert
网络安全等级保护工作事项说明专家.md:dengbao-2025-policy-expert
网络安全等级保护测评高风险判定实施指引（试行）.md:dengbao-high-risk-official-guideline
等保保护工作方案专家.md:dengbao-protection-work-plan
关键信息基础设施保护专家.md:dengbao-cii-protection-expert
等保测评项目管理专家.md:dengbao-assessment-project-manager
渗透测试用例设计专家.md:penetration-test-case-designer
AI 等保定级问卷 Agent.md:ai-dengbao-grading-questionnaire-agent
AI 等保自动定级系统 Prompt.md:ai-dengbao-auto-grading-system-prompt
AI 等保自动问卷主控 Agent.md:ai-dengbao-auto-questionnaire-master-agent
等保主控协调 Agent.md:dengbao-master-coordinator-agent
等保DJCP-AI-Agent-人格与记忆.md:dengbao-personality-memory-foundation
dengbao-SKILL.md:dengbao-csps
"

lookup_skill_name() {
    # $1 = 文件名；输出对应 skill 目录名，找不到则回退为去掉 .md 的原名
    local base="$1"
    local line name
    while IFS= read -r line; do
        [ -z "$line" ] && continue
        if [ "${line%%:*}" = "${base}" ]; then
            name="${line#*:}"
            printf '%s' "$name"
            return 0
        fi
    done <<EOF
${SKILL_NAME_MAP}
EOF
    printf '%s' "${base%.md}"
}

mkdir -p "${TARGET_DIR}"

echo "📄 安装 Skill（按 frontmatter name 建立 <name>/SKILL.md）..."
INSTALLED=0
for src in "${SOURCE_DIR}/skills/"*.md; do
    [ -e "$src" ] || continue
    base="$(basename "$src")"
    skill_name="$(lookup_skill_name "$base")"
    mkdir -p "${TARGET_DIR}/${skill_name}"
    cp "$src" "${TARGET_DIR}/${skill_name}/SKILL.md"
    INSTALLED=$((INSTALLED + 1))
    echo "   ✅ ${skill_name}"
done

# 知识库本身已是 <dir>/SKILL.md 结构，整目录复制
if [ -d "${SOURCE_DIR}/skills/等保测评知识库" ]; then
    echo "📚 安装知识库..."
    cp -r "${SOURCE_DIR}/skills/等保测评知识库" "${TARGET_DIR}/"
    INSTALLED=$((INSTALLED + 1))
    echo "   ✅ 等保测评知识库"
fi

# 清掉可能存在的旧版平铺文件，避免同一 skill 出现两份
find "${TARGET_DIR}" -maxdepth 1 -name "*.md" -type f -delete

SKILL_COUNT=$(find "${TARGET_DIR}" -name "SKILL.md" -type f | wc -l | tr -d ' ')

echo ""
echo "✅ 安装完成！"
echo "   共安装 ${INSTALLED} 项，其中可被 Hermes 识别的 SKILL.md: ${SKILL_COUNT} 个"
echo "   安装位置: ${TARGET_DIR}"
echo ""
echo "🔄 新技能将在 Hermes 下次启动时生效（重启 Hermes 客户端即可）"
echo ""
echo "📖 使用指南: 见 ${SOURCE_DIR}/README.md"
