files=(/home/lucifer/Downloads/wallpaper/*)

random_wallpaper="${files[RANDOM % ${#files[@]}]}"

feh --bg-fill "$random_wallpaper"
