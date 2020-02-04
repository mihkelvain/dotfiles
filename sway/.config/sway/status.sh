date_formatted=$(date "+%a / %H:%M / %d-%m-%y")
audio_volume=$(amixer -M get Master | grep "Front Left:" | awk '{print $6=="[off]" ? $5" 🔇":  $5" 🔉"}' | tr -d [])
battery_info=$(upower --show-info $(upower --enumerate | grep 'BAT') | egrep "state|percentage" | awk '{print $2}')
time_to_empty=$(upower --show-info $(upower --enumerate | grep 'BAT') | egrep "time to empty" | awk '{print $4,$5}')
# Emojis and characters for the status bar
# 💎 💻 💡 🔌 ⚡ 📁
echo $audio_volume $battery_info 🔋$time_to_empty ⏰ $date_formatted
