---
name: dengbao-ceping-zhishiku
description: "Use when the user needs a comprehensive 等保2.0 knowledge base — laws, security baselines, vulnerability references, or rectification cases. Serves as the supporting reference for 等保定级助手 and 等保差距分析专家."
version: 1.0.0
author: Hermes Agent
license: MIT
metadata:
  hermes:
    tags: [security, compliance, dengbao, knowledge-base, baseline, laws, standards, 等保, 知识库]
    related_skills: [dengbao-dingji-zhushou, dengbao-chaju-fenxi-zhuanjia]
---

# 等保测评知识库

## Overview

一套完整的等保 2.0 知识库，涵盖法律法规、等保标准、安全基线（Linux/Windows/数据库/云安全）、漏洞速查、安全事件案例和等保整改案例。可作为等保定级助手和差距分析专家的后台知识支撑，也可独立用于安全运维、基线加固、应急响应等场景。

> 详细内容见 `references/全部内容.md`，本文档是快速导航入口。

---

## When to Use

- 用户需要查阅等保相关法律法规（网络安全法、数据安全法、个保法）
- 用户需要等保标准（GB/T 22239、28448、25070）条款速查
- 用户需要操作系统安全基线配置步骤（CentOS 7 / Ubuntu 22 / Rocky 9 / Windows Server 2019）
- 用户需要数据库安全加固（MySQL / Redis / Oracle）
- 用户需要云安全/容器安全配置指南（Docker / Kubernetes / 阿里云）
- 用户需要漏洞速查（OWASP Top 10 / 常见CVE / 修复方案）
- 用户需要等保整改案例和投入估算参考
- 用户需要安全事件案例用于培训和应急演练

**不适合用于：**
- 初次定级（应使用 **等保定级助手**）
- 差距量化分析（应使用 **等保差距分析专家**）
- 替代官方标准文本（应以正式发布的 GB/T 标准文件为准）

---

## Knowledge Base Structure

```
等保测评知识库/
├── SKILL.md                          # 本文档 — 快速导航入口
├── references/
│   └── 全部内容.md                   # 完整知识库（35+ 文档）
│
├── laws/                              # 法律法规
│   ├── 网络安全法                     # 2017.6.1 施行，等保制度法律依据
│   ├── 数据安全法                     # 2021.9.1 施行，数据分类分级+重要数据保护
│   └── 个保法                         # 2021.11.1 施行，个人信息保护全链条
│
├── 等保标准/                           # 等保2.0 核心标准
│   ├── GB_T_22239                    # 基本要求（10个安全类）
│   ├── GB_T_28448                    # 测评要求 — 访谈/检查/测试方法
│   └── GB_T_25070                    # 安全设计技术要求 — 三重防护体系
│
├── linux_baseline/                    # Linux 安全基线
│   ├── centos7                       # CentOS 7 / RHEL 7
│   ├── ubuntu22                      # Ubuntu 22.04 LTS
│   └── rocky9                        # Rocky Linux 9 / RHEL 9
│
├── windows_baseline/                  # Windows 安全基线
│   ├── win10                         # 桌面版 + BitLocker
│   ├── win11                         # 桌面版 + Windows Hello
│   ├── win_server_2016               # 同 2019 但无 WSL
│   ├── win_server_2019               # 完整版 — 账户/审计/防火墙/Defender
│   └── win_server_2022               # 安全核心服务器 + Secured-core
│
├── database/                          # 数据库安全基线
│   ├── mysql                         # 5.7 / 8.0 — 密码/审计/权限/备份
│   ├── redis                         # 6.x / 7.x — ACL/命令禁用/未授权防护
│   └── oracle                        # 19c / 21c — 密码/审计/RMAN备份
│
├── cloud_security/                    # 云安全与容器安全
│   ├── docker                        # Docker 24/26 — daemon/容器/Compose/镜像
│   ├── kubernetes                    # K8s 1.28+ — Pod安全/NetworkPolicy/RBAC
│   └── aliyun                        # 阿里云 — RAM/安全组/WAF/OSS/RDS
│
├── security_cases/                    # 安全事件案例
│   ├── 数据泄露案例                   # 真实数据泄露事件分析
│   ├── 勒索病毒案例                   # WannaCry / GlobeImposter 全流程还原
│   ├── APT攻击案例                    # APT 攻击链和检测方法
│   ├── 内部威胁案例                   # 内部人员违规事件
│   └── 云安全事件                     # 云配置错误导致的安全事件
│
├── vulnerability/                     # 漏洞库与修复
│   ├── OWASP_Top10                   # 2021 版十大风险 + SQL/XSS 示例
│   ├── CVE漏洞库                      # Log4Shell/Spring4Shell 等高危CVE
│   ├── 常见漏洞复现                   # 漏洞复现步骤
│   └── 漏洞修复方案                   # 系统性修复方案
│
└── rectification_cases/              # 等保整改案例
    ├── 政府单位                       # 政务系统整改
    ├── 金融行业                       # 金融合规整改
    ├── 医疗行业                       # HIS/电子病历整改
    └── 企业通用                       # 通用三级系统整改（含投入估算）
```

---

## 快速速查表

### 法律法规处罚上限

| 法规 | 单位罚金上限 | 关键条款 |
|------|------------|---------|
| 网络安全法 | 100万元（停业整顿） | 第21条等保制度、第37条数据境内存储 |
| 数据安全法 | 1000万元（吊销执照） | 第21条分类分级、第30条风险评估 |
| 个保法 | 5000万元或上年营收5% | 第51条安全义务、数据出境规则 |

### 各等级关键差异

| 控制项 | 二级 | 三级 | 四级 |
|--------|------|------|------|
| 身份鉴别 | 唯一标识+口令 | **双因子认证** | 多重鉴别 |
| 访问控制 | 自主访问控制 | **强制访问控制** | 结构化保护 |
| 安全审计 | 审计重要操作 | **审计全部操作** | 实时报警 |
| 集中管控 | — | **必须（三级新增强制项）** | 自动响应 |
| 测评项总数（GB/T 28448） | **135项** | **211项** | — |

### 三级系统关键控制点（一票否决）

| # | 控制点 | 要求概要 |
|---|--------|---------|
| 1 | **边界防护** | 跨边界访问须通过受控接口 |
| 2 | **访问控制** | 身份标识唯一性+双因子认证 |
| 3 | **安全审计** | 全面审计覆盖每个用户 |
| 4 | **入侵防范** | 最小安装原则 |
| 5 | **集中管控** | 划分管理网段+统一安全管理中心 |

### Linux/Windows 基线常见命令速查

| 系统 | 检查项 | 命令 |
|------|--------|------|
| CentOS 7 | 密码策略 | `cat /etc/security/pwquality.conf` |
| CentOS 7 | 审计状态 | `systemctl is-active auditd` |
| Ubuntu 22 | 密码策略 | `grep minlen /etc/security/pwquality.conf` |
| Rocky 9 | SELinux | `getenforce` |
| Win Server | 密码长度 | `net accounts` |
| Win Server | 审计策略 | `auditpol /get /category:*` |
| MySQL | 密码策略 | `SHOW VARIABLES LIKE 'validate_password%'` |
| Redis | 绑定的IP | `redis-cli CONFIG GET bind` |
| Docker | 只读文件系统 | `docker inspect <容器> \| grep ReadonlyRootfs` |

### OWASP Top 10 速查

| 排名 | 风险 | 核心修复 |
|------|------|---------|
| A01 | 访问控制失效 | 服务端验证+最小权限 |
| A03 | 注入 | **参数化查询**（SQL注入克星） |
| A07 | 身份认证失效 | 双因子认证+强密码策略 |
| A09 | 日志监控失效 | SIEM部署+告警配置 |

### 整改投入参考（三级系统 / 50台服务器）

| 项目 | 费用（万元） |
|------|-------------|
| 防火墙+IPS | 20 |
| 日志审计系统 | 15 |
| 堡垒机 | 10 |
| 数据库加密 | 8 |
| 测评费 | 5 |
| 咨询费 | 8 |
| **合计** | **~66** |

---

## 使用方式

### 作为等保流程的后台知识支撑

```
等保定级助手 ──→ 等保差距分析专家 ──→ 等保测评知识库（本文档）
   (定级)              (对标找差 + 整改)         (基线加固 + 案例参考)
```

1. **定级助手** 完成系统定级后 → **差距分析专家** 输出整改清单
2. 整改过程中，通过本知识库查阅操作系统/数据库/云安全的**具体配置步骤**
3. 参考 **整改案例** 估算投入和时间线
4. 参考 **安全事件案例** 用于培训或汇报

### 独立使用

- **安全运维**：直接查找 Linux/Windows/数据库安全基线的一键加固脚本和检查命令
- **应急响应**：查阅勒索病毒应急响应速查 + CVE修复方案
- **合规管理**：法律法规速查 + 等保标准条款速查
- **安全培训**：安全事件案例用于意识培训

---

# Common Pitfalls

1. **将知识库当成交互式工具使用**：本知识库是参考材料，不是对话式工具。如果用户需要交互式定级或差距分析，应切换到对应 skill。
2. **基线脚本未验证兼容性**：CentOS 7 的 audit 规则和 Rocky 9 有差异；Windows Server 2019 的审计策略和其他版本不完全一致。使用时须核对版本。
3. **直接使用案例中的投入估算**：案例中的投入为参考值，实际费用因单位规模、设备选型、厂商不同而差异很大。
4. **整改案例不等于完整方案**：整改案例仅展示典型场景，实际整改需要结合差距分析报告和系统具体情况定制。
5. **法律法规引用需确认最新版本**：网络安全法等可能已有修订或配套细则出台，使用前应确认最新版本。
6. **OWASP Top 10 版本时效**：当前内容为 2021 版，新版发布后应及时更新。

# Verification Checklist

- [ ] 用户需求是否属于知识库查询（而非定级或差距分析）
- [ ] 查到的基线脚本版本与目标系统一致
- [ ] 法律法规引用标注了施行日期
- [ ] 整改案例投入估算是参考值（已标注非精确值）
- [ ] CVE漏洞标注了CVSS评分和修复版本
- [ ] 需要更详细内容时引导用户查看 `references/全部内容.md`

# Linked References

- `references/全部内容.md` — 完整知识库（35+ 文件），包含所有安全基线、法律法规全文、案例全流程等
- 配套 skill：[等保定级助手](./等保定级助手.md)、[等保差距分析专家](./等保差距分析专家.md)
