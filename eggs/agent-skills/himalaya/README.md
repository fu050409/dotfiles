# Himalaya Agent Skill

A portable skill for agents that can call a shell. It covers email search, reading, drafting, sending, and mailbox operations through the Himalaya CLI. The package contains instructions only: it does not install the CLI, create an account, or grant mailbox access.

## Install and use

1. Install the [Himalaya CLI](https://github.com/pimalaya/himalaya/releases) for your platform and configure an account yourself if you do not already have one. The examples target 2.x and were checked against 2.2.1. Do not apply a different CLI generation's examples or configuration blindly.
2. Import the entire `himalaya` directory into your agent's skill loader, following the host's instructions. Keep the directory name and references together. The skill uses the [Agent Skills format](https://agentskills.io/specification) and does not require a host-specific plugin or helper.
3. Ask, for example, “Use Himalaya to find the latest status report and draft a reply without sending it.” The skill selects the account and mailbox before accessing messages. Grant only the permissions needed for the task.

## Files

- [SKILL.md](SKILL.md): account selection, read/search, attachments, mailbox operations, and safety rules.
- [Configuration](references/configuration.md): optional setup and troubleshooting.
- [Message composition](references/message-composition.md): preview, save as draft, submit, and verify outcomes.

## Upstream references

The section and reference layout was inspired by the [OpenClaw Himalaya skill](https://github.com/openclaw/openclaw/blob/ba0d3e645de125e6164888f9595b2747ada872f1/skills/himalaya/SKILL.md). The workflows here are written for the [Pimalaya Himalaya 2.2.1 CLI](https://github.com/pimalaya/himalaya/tree/v2.2.1), rather than assuming the OpenClaw examples and configuration match that version. This is a standalone skill, not an official release of either project.