# Troubleshooting Guide

## WSL Integration Issue (Ubuntu-20.04)
If you encounter the following error:

```
WSL integration with distro 'Ubuntu-20.04' unexpectedly stopped. Do you want to restart it?
```

Follow these steps:

### Fix Steps
1. **Shutdown WSL**
```bash
wsl --shutdown
```

2. **Ensure WSL Version is Correct**
```bash
wsl --set-version Ubuntu-20.04 2
```

3. **Restart Docker Desktop**
- Open Task Manager
- End task for **Docker Desktop**
- Relaunch Docker Desktop manually

4. **WSL Integration Settings**
- Go to: **Settings** → **Resources** → **WSL Integration**
- Uncheck **Ubuntu-20.04** from the list of distributions

5. **Reopen Docker**
- After adjusting the settings, start Docker again and try rerunning the container setup.

---

## Notes
- This issue may not occur on every machine.
- If it persists, try reinstalling WSL or Docker.

Feel free to update this file with other errors and resolutions as the project evolves.

