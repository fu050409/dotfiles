# 共享 Agent Skills

`agent-skills` egg 只部署 `yolk.rhai` 里 `targets` 明确列出的技能。每个目标都是 `~/.agents/skills` 下一个独立的技能目录，而不是整个 `skills` 目录。当前仅管理 `himalaya`，其他技能仍由原安装方式管理。

## 加入一个技能

1. 先审查要共享的版本。把技能放在 [`eggs/agent-skills`](../eggs/agent-skills) 下，目录名与 `SKILL.md` 中的 `name` 保持一致。只存分发所需的说明、脚本和资源；账号、凭据、私有数据、设备专用路径与运行时文件留在仓库之外。
2. 在 [`yolk.rhai`](../yolk.rhai) 的 `agent-skills.targets` 下新增一条 `"skill-name": "~/.agents/skills/skill-name"`。只复制目录而不添加映射，不会部署它。
3. 如果目标位置已有同名目录或链接，先核对来源和内容，并把旧副本备份到技能扫描目录之外。`put` 不会直接覆盖一个不受 Yolk 管理的同名目录或链接。
4. 运行 `yolk sync`，确认目标目录下的 `SKILL.md` 可读。`yolk sync` 只部署本机链接；Git 提交和推送是独立的步骤。

更新已接管的技能时直接修改仓库中的源目录，无需维护第二份副本。下架某个技能且还有其他目标时，删除对应映射并运行 `yolk sync`；下架最后一个技能时，先把 `agent-skills.enabled` 设为 `false` 并运行 `yolk sync`，再删除映射。不要直接清空 `targets` 或删掉整个 egg，否则 Yolk 1.3.0 会留下原链接。外部安装的技能不会被接管。
