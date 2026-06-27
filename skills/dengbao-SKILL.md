---
name: dengbao-csps
description: "Master skill for 等保测评 (Chinese Cybersecurity Level Protection). Entry point to a comprehensive skill ecosystem covering classification, gap analysis, report generation, interview checklists, penetration testing, remediation design, and compliance knowledge base."
version: 2.0.0
author: Hermes Agent
license: MIT
metadata:
  hermes:
    tags: [security, dengbao, 等保, 等级保护, compliance, cybersecurity, 网络安全]
    related_skills: [dengbao-dingji-zhushou, dengbao-chaju-fenxi-zhuanjia, dengbao-ceping-zhishiku, dengbao-assessment-report-generator, dengbao-interview-checklist-expert, penetration-test-case-designer, security-remediation-designer, dengbao-comprehensive-assessment-expert, dengbao-policy-training-expert, dengbao-compliance-configuration-auditor, dengbao-assessment-project-manager, linux-dengbao-baseline-check-agent, database-security-check-agent, dengbao-major-risk-identification, dengbao-2025-policy-expert, dengbao-high-risk-official-guideline]
---

# 等保测评 AI Agent Skill 集合

## Overview

基于中国网络安全等级保护制度 2.0（等保 2.0）的完整 AI Agent Skill 集合，覆盖从**定级 → 差距分析 → 整改设计 → 测评实施 → 报告生成**全流程，以及配套的**知识库、政策培训、项目管理**支撑。

## 技能地图（按等保流程排序）

### 🎯 定级阶段
| Skill | 文件名 | 用途 |
|-------|--------|------|
| **等保定级助手** | `等保定级助手.md` | 辅助定级 + 生成定级报告 |
| AI 等保定级问卷 Agent | `AI 等保定级问卷 Agent.md` | 自动问卷采集定级信息 |
| AI 等保自动定级系统 | `AI 等保自动定级系统 Prompt.md` | 自动识别等级 |
| AI 等保自动问卷主控 | `AI 等保自动问卷主控 Agent.md` | 问卷流程主控 |
| 等保主控协调 Agent | `等保主控协调 Agent.md` | 中央路由分发 |

### 🔍 差距分析阶段
| Skill | 文件名 | 用途 |
|-------|--------|------|
| **等保差距分析专家** | `等保差距分析专家.md` | 对标 GB/T 22239 找出差距 + 整改路线 |
| 等保合规配置核查专家 | `等保合规配置核查专家.md` | 系统配置基线核查 |
| Linux 等保基线检查 Agent | `Linux 等保基线检查 Agent.md` | Linux 系统专项基线检查 |
| 数据库安全检查 Agent | `数据库安全检查 Agent.md` | 数据库专项安全检查 |
| 等保访谈清单专家 | `等保访谈清单专家.md` | 现场测评访谈提纲 + 检查清单 |

| 🛠 整改阶段
| Skill | 文件名 | 用途 |
|-------|--------|------|
| **安全整改方案设计师** | `安全整改方案设计师.md` | 差距→可落地整改方案（含预算、时间线） |

### 📋 测评实施与报告
| Skill | 文件名 | 用途 |
|-------|--------|------|
| **等保测评报告生成器** | `等保测评报告生成器.md` | 生成公安部格式正式测评报告 |
| 渗透测试用例设计专家 | `渗透测试用例设计专家.md` | 等保合规渗透测试用例设计 |
| **等保测评专家（全栈）** | `等保测评专家 AI Skill.md` | 全栈测评能力融合 |
| 等保测评重大风险问题指导 | `等保测评重大风险问题指导 Skill.md` | 32 项重大风险触发项判定（A-01~A-32） |

### 📚 知识支撑
| Skill | 文件名 | 用途 |
|-------|--------|------|
| **等保测评知识库** | `等保测评知识库/` | 35+ 文档完整知识库（法规/基线/案例/漏洞） |
| 等保政策解读与培训专家 | `等保政策解读与培训专家.md` | 法规解读 + 培训材料 |
| 等保2025政策释疑 | `网络安全等级保护工作事项说明专家.md` | 公网安〔2025〕1846号 24项政策问答 |
| 等保高风险判定实施指引 | `网络安全等级保护测评高风险判定实施指引（试行）.md` | 官方高风险判例规则 |

### 📊 管理
| Skill | 文件名 | 用途 |
|-------|--------|------|
| 等保测评项目管理专家 | `等保测评项目管理专家.md` | 全流程项目管理 |

## 安装

```bash
# 一键安装所有 skill 到 Hermes
bash install.sh
```

详见项目根目录 `README.md` 和 `install.sh`。

## 核心标准

| 标准号 | 用途 | 说明 |
|--------|------|------|
| GB/T 22239-2019 | 安全要求 | 规定测什么 |
| GB/T 28448-2019 | 测评方法 | 规定怎么测 |
| GB/T 22240-2020 | 定级指南 | 定级方法 |
| GB/T 25070-2019 | 安全设计技术要求 | 三重防护体系 |

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
