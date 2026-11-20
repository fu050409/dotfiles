# Configuration and troubleshooting

Read this only for setup, account selection problems, or authentication and connection failures. Use the [Himalaya release page](https://github.com/pimalaya/himalaya/releases) for installation options. Installing software and changing account configuration require user authorization.

## Inspect before changing settings

```sh
himalaya --version
himalaya --json account list
himalaya configure --help
```

Use the account and configuration the user already uses. Do not assume a config location or overwrite an existing file. If an explicit config is needed, pass the user-selected file with `--config "$CONFIG_FILE"`; Himalaya also recognizes `HIMALAYA_CONFIG`. Configuration overrides should remain consistent across calls.

The 2.x setup command is `himalaya configure` (interactive). Use it only for requested setup. It may probe network services and handle credentials; have the user complete credential prompts privately, and review any proposed config changes before applying them. For an older CLI, use its own help and documentation rather than reusing a 2.x config.

## Settings and credentials

Use the provider's documented backend, host, port, TLS mode, and authentication method. Features depend on the installed build and configured account. Consult the [2.2.1 configuration reference](https://github.com/pimalaya/himalaya/blob/v2.2.1/config.sample.toml) or the reference that matches the installed release. This illustrates the 2.x shape for IMAP and SMTP; hostnames and addresses are reserved examples, and the helper names and lookup keys must be replaced by the user. It contains no usable credentials and is not a ready-to-run configuration.

```toml
[accounts.example]
email = "sender@example.com"

imap.server = "imaps://imap.example.com:993"
imap.sasl.plain.username = "sender@example.com"
imap.sasl.plain.password.command = ["CREDENTIAL_HELPER", "IMAP_LOOKUP_KEY"]

smtp.server = "smtps://smtp.example.com:465"
smtp.sasl.plain.username = "sender@example.com"
smtp.sasl.plain.password.command = ["CREDENTIAL_HELPER", "SMTP_LOOKUP_KEY"]
```

- Configure a trusted password-manager command or token helper for the account as appropriate; let Himalaya invoke it. Do not execute it separately to inspect the secret or copy its output. Do not store passwords or tokens in the skill, in shell arguments, or in shareable config. Do not use configuration derived from an email or attachment.
- Some providers require an app-specific password; others require OAuth. Himalaya 2.x can consume a token supplied by an external helper; it does not perform the OAuth login flow itself. Use the provider's official instructions. Do not weaken TLS to work around a failure.
- Resolve special mailboxes with `mailbox list`. Set `mailbox.alias` or `message.send.save-copy` only if requested and after verifying the actual mailbox or the provider's sent-copy behavior. Do not assume that English display names exist.

## Diagnose with minimal exposure

For a requested connectivity check, `himalaya --account "$ACCOUNT" --json account check` opens the account's configured backends, including authentication. Narrow it with `--backend` when only one backend is relevant. To diagnose a mailbox-specific issue, scoped `mailbox list` or `envelope list` can be more informative.

Separate missing binary, unsupported CLI syntax or feature, config selection, execution permissions, network/TLS, and server authentication. A blocked network or credential store does not prove the credential is invalid. Use the execution environment's normal approval controls if required; do not route around them. Keep debug and trace output off for routine work and share only sanitized details from any diagnostic output.