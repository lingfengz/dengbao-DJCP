# 等保测评技能图谱 & AI Agent Skill 集合

Github 开源项目地址：**[https://github.com/lingfengz/dengbao-csps](https://github.com/lingfengz/dengbao-csps)**，欢迎 **Star** :)。

[![Stars](https://img.shields.io/github/stars/lingfengz/dengbao-csps?style=social)](https://github.com/lingfengz/dengbao-csps/stargazers)
[![Forks](https://img.shields.io/github/forks/lingfengz/dengbao-csps?style=social)](https://github.com/lingfengz/dengbao-csps/network/members)
[![Last Commit](https://img.shields.io/github/last-commit/lingfengz/dengbao-csps)](https://github.com/lingfengz/dengbao-csps/commits/main)
[![License](https://img.shields.io/badge/license-MIT-blue)](LICENSE)
[![Skills](https://img.shields.io/badge/skills-19-green?style=flat-square)](skills/)
[![Skill Maps](https://img.shields.io/badge/skill--maps-3-orange?style=flat-square)](skill-maps/)
[![Knowledge Base](https://img.shields.io/badge/knowledge--base-35%2B%20docs-brightgreen?style=flat-square)](skills/等保测评知识库/)

---

> ⚠️ **免责声明**
> 本项目所有内容仅供**网络安全学习、合规评估和授权测试**参考。渗透测试相关用例仅限于在**已获得明确书面授权**的目标上执行。任何未经授权的测试行为均属违法，使用者需自行承担法律责任。本项目不对任何滥用行为承担责任。

## 简介

基于中国网络安全等级保护制度 2.0（等保 2.0）国家标准，汇集、整理等保测评领域**技能图谱**（Skill Map）和**AI Agent Skill**，覆盖等保全流程——**定级备案 → 差距分析 → 安全整改 → 等级测评 → 持续监督**，以及配套知识库、政策培训、项目管理。

本项目包含两部分：

1. **skill-maps/** — 技能图谱（参考 [TeamStuQ/skill-map](https://github.com/TeamStuQ/skill-map) 格式），以树状知识结构梳理各角色的能力要求，帮助从业者系统化学习。
2. **skills/** — 可直接部署到 Hermes Agent 或其他 AI Agent 的 Skill 文件，每个文件包含完整的角色定义和 YAML 元数据，供 AI Agent 直接调用。

除非特别声明，本开源项目所有内容均只代表贡献者个人立场，与其公司背景无关。有任何不同意见和反馈，请提交 [Issue](https://github.com/lingfengz/dengbao-csps/issues) 讨论。

## 🚀 快速开始

### 1. 克隆仓库

```bash
git clone https://github.com/lingfengz/dengbao-csps.git
cd dengbao-csps
```

### 2. 安装方法

根据你的 AI Agent 环境选择一种：

---

#### 方法 A：Hermes Agent（桌面版）

```bash
# 一键安装所有 Skill
bash install.sh

# 输出示例：
# 📦 等保测评 Skill 集合安装工具
# 源目录: /path/to/dengbao-csps/skills
# 目标目录: ~/.hermes/profiles/default/skills/dengbao-csps
# ✅ 安装完成！共 19 个 skill 文件
```

安装后**重启 Hermes 桌面版**，下次对话即可自动触发。

> 如果使用自定义 profile：`bash install.sh <profile-name>`

#### 方法 B：Hermes Agent（命令行）

```bash
# 手动复制到 profile 的 skills 目录
mkdir -p ~/.hermes/profiles/default/skills/dengbao-csps
cp -r skills/* ~/.hermes/profiles/default/skills/dengbao-csps/
# 删除 archive（已合并的备份文件）
rm -rf ~/.hermes/profiles/default/skills/dengbao-csps/archive

# 重启 Hermes 使生效
hermes restart
```

#### 方法 C：Codex CLI（OpenAI）

[Codex CLI](https://github.com/openai/codex) 是 OpenAI 的终端编程 Agent。将 Skill 作为系统指令注入：

```bash
# 方式1：启动时加载
codex --system "$(cat skills/等保定级助手.md)"

# 方式2：对话中引用文件（Codex 支持 @ 引用）
# 在对话中输入：@skills/等保定级助手.md  请帮我做等保定级

# 方式3：添加到项目根目录的 CLAUDE.md（Codex 自动读取）
cp skills/等保定级助手.md .codex.md
```

#### 方法 D：Claude Code（Anthropic）

[Claude Code](https://docs.anthropic.com/en/docs/claude-code/overview) 是 Anthropic 的终端编程 Agent。将 Skill 添加到项目规则文件：

```bash
# 方式1：追加到 CLAUDE.md（Claude Code 自动读取）
cat skills/等保定级助手.md >> CLAUDE.md

# 方式2：启动时加载
claude --prompt "$(cat skills/等保定级助手.md)"

# 方式3：对话中引用
# 在 CLAUDE.md 中写入：
# > 参考 skills/等保定级助手.md 的规则执行等保定级任务
```

#### 方法 E：其他 AI Agent（GPT / DeepSeek / 通义千问 / Kimi 等）

无需安装，直接复制文件内容作为 **System Prompt** 使用：

```bash
# macOS/Linux：复制到剪贴板
cat skills/等保定级助手.md | pbcopy

# 或输出到文件
cat skills/等保定级助手.md > my-prompt.md
```

然后在 AI 对话中粘贴即可。每个 Skill 文件包含：
- ✅ 角色定义（你是谁）
- ✅ 核心能力（你能做什么）
- ✅ 工作流程（怎么做）
- ✅ 交互规则（怎么问用户）
- ✅ 示例对话（参考）

#### 方法 F：VS Code / Cursor / 其他编辑器 AI 插件

将 Skill 文件添加到项目的 `.clinerules` 或 `.cursorrules`：

```bash
# 以等保定级助手为例，追加到规则文件
echo "" >> .clinerules
cat skills/等保定级助手.md >> .clinerules
```

### 3. 验证安装

安装后，在 Hermes 或其他 AI Agent 中输入以下任意一句，确认对应 Skill 被触发：

| 你想做什么 | 说这句话 | 触发 Skill |
|-----------|---------|-----------|
| 🎯 给系统定级 | "帮我做个等保定级" | `等保定级助手` |
| 🔍 检查差距 | "看看我系统差多少" | `等保差距分析专家` |
| 🛠 设计整改 | "帮我设计等保整改方案" | `安全整改方案设计师` |
| 📋 生成报告 | "生成一份等保测评报告" | `等保测评报告生成器` |
| 🐧 Linux 基线 | "检查 Linux 服务器安全基线" | `Linux 等保基线检查 Agent` |
| 💾 数据库安全 | "检查 MySQL 数据库安全" | `数据库安全检查 Agent` |
| 📚 查法规 | "等保三级有哪些要求" | `等保政策解读与培训专家` |
| 📊 项目管理 | "帮我规划等保测评项目" | `等保测评项目管理专家` |
| ⚠️ 风险判定 | "这个漏洞算重大风险吗" | `等保测评重大风险问题指导` |
| 🔐 渗透测试 | "设计渗透测试用例" | `渗透测试用例设计专家` |

### 4. 浏览技能图谱

```bash
# 查看所有技能图谱
ls skill-maps/

# 查看具体图谱
cat skill-maps/map-等保测评工程师.md

# 或在浏览器中打开 GitHub 查看渲染效果
```

### 5. 查看完整知识库

知识库位于 `skills/等保测评知识库/`，包含 **35+ 文档**：

```bash
# 查看知识库导航
cat skills/等保测评知识库/SKILL.md

# 查看完整内容（83K，3200+ 行）
less skills/等保测评知识库/references/全部内容.md
```

## 技能图谱

技能图谱以分层 Markdown 形式梳理等保领域各角色的知识体系，点击标题预览：

| 领域 | 适用角色 | 核心内容 |
|------|---------|---------|
| [等保测评工程师](skill-maps/map-等保测评工程师.md) | 测评机构人员、安全评估人员 | 法律法规、标准体系、定级方法、十大安全类、测评技术、工具链、项目管理 |
| [等保安全工程师](skill-maps/map-等保安全工程师.md) | 安全运维、系统管理员 | 操作系统安全、数据库安全、网络安全、应用安全、容器云安全、安全设备运维、应急响应 |
| [等保合规经理](skill-maps/map-等保合规经理.md) | 合规管理人员、安全负责人 | 政策法规体系、合规管理框架、制度体系、预算采购、风险管理、培训体系、行业对标 |

以及**正在建设中**的领域：

- 等保测评项目经理技能图谱
- 等保渗透测试工程师技能图谱
- 密评（商用密码应用安全评估）技能图谱
- 关保（关键信息基础设施保护）技能图谱

欢迎贡献新领域技能图谱 ~

## AI Agent Skill 集合

以下 Skill 文件可直接部署到 Hermes Agent 或其他兼容 AI Agent 中。每个文件包含标准 YAML frontmatter 和完整的角色定义 Prompt，AI Agent 可根据用户输入自动匹配调用。

### 🎯 定级

| Skill | 文件名 | 一句话描述 |
|-------|--------|-----------|
| **等保定级助手** | `skills/等保定级助手.md` | 辅助系统定级，生成符合 GB/T 22240-2020 的定级报告 |
| AI 等保定级问卷 Agent | `skills/AI 等保定级问卷 Agent.md` | 动态问卷采集定级所需信息 |
| AI 等保自动定级系统 | `skills/AI 等保自动定级系统 Prompt.md` | 自动识别业务属性并推荐等保等级 |
| AI 等保自动问卷主控 | `skills/AI 等保自动问卷主控 Agent.md` | 定级问卷流程主控与调度 |
| 等保主控协调 Agent | `skills/等保主控协调 Agent.md` | 用户请求的中央路由与任务分发 |

### 🔍 差距分析

| Skill | 文件名 | 一句话描述 |
|-------|--------|-----------|
| **等保差距分析专家** | `skills/等保差距分析专家.md` | 对标 GB/T 22239-2019，逐条差距分析 + 整改路线 |
| 等保合规配置核查专家 | `skills/等保合规配置核查专家.md` | 系统配置基线合规核查 |
| Linux 等保基线检查 Agent | `skills/Linux 等保基线检查 Agent.md` | Linux 系统等保 2.0 + CIS 双标准基线检查 |
| 数据库安全检查 Agent | `skills/数据库安全检查 Agent.md` | 多数据库安全基线检查 |
| 等保访谈清单专家 | `skills/等保访谈清单专家.md` | 现场测评分角色访谈提纲 + 检查清单 |

### 🛠 整改

| Skill | 文件名 | 一句话描述 |
|-------|--------|-----------|
| **安全整改方案设计师** | `skills/安全整改方案设计师.md` | 差距→可落地的整改方案（含产品选型、预算、时间线） |
| 等保整改专家 Agent | `skills/等保整改专家 Agent.md` | 自动生成整改路径与实施建议 |

### 📋 测评实施与报告

| Skill | 文件名 | 一句话描述 |
|-------|--------|-----------|
| **等保测评报告生成器** | `skills/等保测评报告生成器.md` | 生成公安部格式的正式测评报告 |
| 渗透测试用例设计专家 | `skills/渗透测试用例设计专家.md` | 等保合规的渗透测试用例设计 |
| **等保测评专家（全栈）** | `skills/等保测评专家 AI Skill.md` | 融合架构、渗透、运维、合规的全栈测评能力 |

### 📚 知识支撑

| Skill | 文件名 | 一句话描述 |
|-------|--------|-----------|
| **等保测评知识库** | `skills/等保测评知识库/` | 35+ 文档完整知识库（法规 / 基线 / 案例 / 漏洞 / 整改） |
| 等保政策解读与培训专家 | `skills/等保政策解读与培训专家.md` | 法规标准解读 + 培训材料生成 |

### 📊 管理

| Skill | 文件名 | 一句话描述 |
|-------|--------|-----------|
| 等保测评项目管理专家 | `skills/等保测评项目管理专家.md` | 全流程项目管理与计划编排 |

## 快速安装

```bash
cd dengbao-csps
bash install.sh
```

这会将所有 Skill 文件安装到 `~/.hermes/profiles/default/skills/dengbao-csps/` 目录下，Hermes 下次启动即可使用。也可手动将 `skills/` 中任意 `.md` 文件作为 system prompt 加载到其他 AI Agent。

## 等保流程全景

```
定级备案 ──→ 差距分析 ──→ 安全整改 ──→ 等级测评 ──→ 持续监督
   │             │             │             │
   ├ 定级助手     ├ 差距分析专家 ├ 整改设计师   ├ 报告生成器
   ├ 问卷 Agent   ├ 配置核查专家 ├ 整改专家     ├ 渗透测试专家
   └ 主控协调     ├ 基线检查     │             └ 全栈测评专家
                  ├ 访谈清单     └ 知识库支撑
                  └ 知识库支撑
```

## 改进目标

1. 继续细化各技能图谱的知识节点和深度
2. 为每个技能节点提供推荐学习资源和路径
3. 持续完善 AI Agent Skill 的角色定义和交互逻辑
4. 增加密评、关保等延伸领域图谱
5. 提供可视化的 XMind / PNG 版本技能图谱

## MarkDown 分级规范

为便于编辑和审阅，统一技能图谱 MarkDown 文件分级规范如下：

1. **#,##,###** 依次表示高级别主干分级
2. **-,*,+** 三种符号区分次级别分支，优先级依次递减

## 目录结构

```
dengbao-csps/
├── README.md                        # 本文件
├── install.sh                       # 一键安装到 Hermes Agent
├── .gitignore
├── skill-maps/                      # 技能图谱
│   ├── map-等保测评工程师.md
│   ├── map-等保安全工程师.md
│   └── map-等保合规经理.md
└── skills/                          # 19 个 AI Agent Skill + 1 个知识库
    ├── dengbao-SKILL.md             # [入口] 技能总览
    ├── 等保定级助手.md               # ★ 核心
    ├── 等保差距分析专家.md            # ★ 核心
    ├── 安全整改方案设计师.md          # ★ 核心
    ├── 等保测评报告生成器.md          # ★ 核心
    ├── 等保测评知识库/               # 35+ 文档
    ├── ... (14 个配套 Agent)
    └── archive/                      # 已合并的原始文件
```

## 加入我们

- 提交技能图谱或 AI Agent Skill：直接提交 Pull Request
- 改进建议 / Bug 反馈：提交 [Issue](https://github.com/lingfengz/dengbao-csps/issues)
- 新增领域：欢迎贡献新的等保相关技能图谱

## 版本信息

### v 1.0
- 首个稳定版本
- 3 份技能图谱（测评工程师 / 安全工程师 / 合规经理）
- 19 个 Hermes AI Agent Skill（覆盖定级 / 差距 / 整改 / 报告 / 知识库 / 管理）
- 35+ 文档完整知识库

## License

MIT License

2026 等保测评 Skill 项目贡献者 @lingfengz
