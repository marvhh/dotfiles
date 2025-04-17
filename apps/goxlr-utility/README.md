# Autostart over XDG Autostart
As upstream [mentioned](https://github.com/GoXLR-on-Linux/goxlr-utility/pull/218) XDG Autostart should be used instead of systemd.
To use XDG Autostart [goxlr-daemon.desktop](../../dot_config/autostart/goxlr-daemon.desktop) needs to be placed here: `$HOME/.config/autostart/goxlr-daemon.desktop`


# Autostart with systemd (user context)

On Linux systems, you can autostart the `goxlr-daemon` using **systemd in user context**. Just follow the steps below:

## 1. Create a systemd unit file

Create a file at:

```
$HOME/.config/systemd/user/goxlr-daemon.service
```

Paste the following content into it:

```ini
[Unit]
Description=GoXLR Daemon
After=network.target

[Service]
ExecStart=/usr/bin/goxlr-daemon
Restart=on-failure
RestartSec=3
StandardOutput=journal
StandardError=journal

[Install]
WantedBy=default.target
```

## 2. Reload systemd (user daemon)

```bash
systemctl --user daemon-reexec
systemctl --user daemon-reload
```

## 3. Enable and start the service

```bash
systemctl --user enable goxlr-daemon
systemctl --user start goxlr-daemon
```

## 4. Check the status

```bash
systemctl --user status goxlr-daemon
```
