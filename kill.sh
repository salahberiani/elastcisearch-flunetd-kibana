#!/usr/bin/env bash

# Error example: 
# ERROR: for redis cannot stop container: 16028f9: 
# Cannot kill container 16028f9: unknown error after kill: docker-runc did not terminate sucessfully: 
# container_linux.go:393: signaling init process caused "permission denied"
#
# This error was caused by AppArmor service in Ubuntu
# It was not working normally due to some unknown issues.
# Run following commands to fix it.

# Check AppArmor status
sudo aa-status

# Shutdown apparmor and prevent it from restarting
sudo systemctl disable apparmor.service --now

# Unload AppArmor profiles
sudo service apparmor teardown

# Re-check AppArmor status
sudo aa-status

# Try to re-stop containers
docker-compose down
