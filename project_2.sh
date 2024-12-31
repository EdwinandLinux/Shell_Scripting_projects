# Check Health of the web server (Apache) hosted on RHEL

# Log file for monitoring
LOG_FILE="/var/log/health.log"
# Email for alerts
EMAIL="cyredwin1@gmail.com"

# Fonction to save messages to log file
log_message() {
echo   "$(date): $1"| tee -a "$LOG_FILE"
}
log_message "Your message"