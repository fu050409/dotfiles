export let eggs = #{
    alacritty: #{
        targets: "~/.config/alacritty",
        templates: ["alacritty.toml"],
        enabled: true,
        strategy: "merge",
    },
    helix: #{
        targets: "~/.config/helix",
        templates: ["config.toml"],
        enabled: true,
        strategy: "merge",
    },
    yazi: #{
        targets: "~/.config/yazi",
        templates: ["theme.toml", "yazi.toml"],
        enabled: true,
        strategy: "merge",
    },
    herdr: #{
        targets: "~/.config/herdr",
        templates: ["config.toml"],
        enabled: true,
        strategy: "merge",
    },
    rio: #{
        targets: "~/.config/rio",
        templates: ["config.toml"],
        enabled: true,
        strategy: "merge"
    }
}
