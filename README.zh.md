# Allergos

**过敏与免疫专科 AI Agent Skill** — 结构化病史、检查解读、交叉过敏、过敏性休克、免疫治疗、儿科与行动计划。

与全科技能 [clinical-skills (Hippocrates)](https://github.com/kimogrant/clinical-skills) 同系列。

---

## 安装

### 方式 A：脚本（推荐）

```bash
git clone https://github.com/kimogrant/allergos.git
cd allergos
chmod +x skill.sh
./skill.sh install /path/to/your/project
```

安装到：`your-project/.cursor/skills/allergos/`（含 `SKILL.md`、`references/`、`examples/`）

### 方式 B：手动

复制整个仓库内容到 `~/.cursor/skills/allergos/` 或项目的 `.cursor/skills/allergos/`。

### 方式 C：仅全局 SKILL（不推荐）

只复制 `SKILL.md` 会**缺少**模块模板；务必带上 `references/` 目录。

---

## 使用

在 Cursor 中 `/allergos` 或描述过敏相关问题，例如：

```text
8 个月婴儿，母乳喂养，母亲吃奶制品后大便带血，是否 CMPA？
```

Agent 会先跑 **Pre-Action 清单**；若疑似过敏性休克，则**先输出肾上腺素 + 120/911**，再谈其他。

---

## 模块

| # | 内容 |
|---|------|
| 1 | 过敏病史与 Gell-Coombs / WAO 分级 |
| 2 | SPT、sIgE、组分诊断 CRD、OFC |
| 3 | 交叉过敏百科 |
| 4 | 过敏性休克急救 |
| 5 | 药物与免疫治疗 |
| 6 | 儿科（奶梯、蛋梯、LEAP、FPIES） |
| 7 | 患者行动计划 |
| 8 | 环境与职业过敏 |

详见 `SKILL.md` 中的模块索引；临床模板在 `references/` 下按模块加载。

---

## 安全架构

```text
用户输入
  → 是否过敏性休克？ → 是 → 仅 Module 4 急救块（先肾上腺素）
  → 否 → Pre-Action 清单是否齐全？ → 否 → 暂停并索要信息
  → 是 → 加载对应 references 模块并输出
```

---

## 版本

当前：**1.1.0**（见 `VERSION`）

1.1.0 变更：符合 Agent Skills 规范的 YAML frontmatter；模块拆分到 `references/`；强化「急救优先」硬规则。

---

## 免责声明

Allergos 为临床决策**辅助**工具，不能替代执业医师判断。急症请立即使用肾上腺素并呼叫急救，勿依赖 AI。

MIT 许可证 · 见 [LICENSE](LICENSE)
