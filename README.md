# 等保测评技能图谱 & AI Agent Skill 集合

Github 开源项目地址：**[https://github.com/lingfengz/dengbao-csps](https://github.com/lingfengz/dengbao-csps)**，欢迎 **Star** :)。

[![Stars](https://img.shields.io/github/stars/lingfengz/dengbao-csps?style=social)](https://github.com/lingfengz/dengbao-csps/stargazers)
[![Forks](https://img.shields.io/github/forks/lingfengz/dengbao-csps?style=social)](https://github.com/lingfengz/dengbao-csps/network/members)
[![Last Commit](https://img.shields.io/github/last-commit/lingfengz/dengbao-csps)](https://github.com/lingfengz/dengbao-csps/commits/main)
[![License](https://img.shields.io/badge/license-MIT-blue)](LICENSE)
[![Skills](https://img.shields.io/badge/skills-19-green?style=flat-square)](skills/)
[![Skill Maps](https://img.shields.io/badge/skill--maps-3-orange?style=flat-square)](skill-maps/)
[![Knowledge Base](https://img.shields.io/badge/knowledge--base-35%2B%20docs-brightgreen?style=flat-square)](skills/等保测评知识库/)

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

### 2. 一键安装到 Hermes Agent

```bash
bash install.sh
```

安装完成后，重启 Hermes Agent，所有 19 个 Skill 即自动加载，下次对话即可使用。

### 3. 快速体验

安装后在对话中输入以下任意一句即可触发对应 Skill：

| 你想做什么 | 说这句话 |
|-----------|---------|
| 🎯 给系统定级 | "帮我的系统做等保定级" |
| 🔍 做差距分析 | "看看我系统差多少" |
| 🛠 设计整改方案 | "帮我设计等保整改方案" |
| 📋 生成测评报告 | "生成一份等保测评报告" |
| 🐧 检查 Linux 基线 | "检查 Linux 服务器安全基线" |
| 📚 查法规要求 | "等保三级有哪些要求" |
| 📊 项目管理 | "帮我规划等保测评项目" |

### 4. 在其他 AI Agent 中使用

无需安装，直接将 `skills/` 中任意 `.md` 文件作为 **system prompt** 加载即可。每个文件包含完整的角色定义、工作流程和交互规则，兼容 Claude、GPT、DeepSeek 等主流模型。

```bash
# 示例：使用等保定级助手
cat skills/等保定级助手.md  # 复制内容作为 system prompt
```

### 5. 浏览技能图谱

```bash
# 查看所有技能图谱
ls skill-maps/

# 查看具体图谱
cat skill-maps/map-等保测评工程师.md
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

Copyright (c) 2026 等保测评 Skill 项目贡献者
