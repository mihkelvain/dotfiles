date_formatted=$(date "+%a / %H:%M / %d-%m-%y")
audio_volume=$(amixer -M get Master | grep "Front Left:" | awk '{print $6=="[off]" ? $5" 🔇":  $5" 🔉"}' | tr -d [])
battery_status=$(cat /sys/class/power_supply/BAT0/status)
# Emojis and characters for the status bar
# 💎 💻 💡 🔌 ⚡ 📁 \|
echo $audio_volume $battery_status 🔋 $date_formatted
