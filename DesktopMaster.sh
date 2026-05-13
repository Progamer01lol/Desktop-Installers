DESKTOPS=(
"budgie"
"cinnamon"
"cosmic"
"deepin"
"enlightenment"
"gnome"
"gnome-flashback"
"plasma"
"plasma-mobile"
"lxde"
"lxqt"
"mate"
"pantheon"
"phosh"
"sugar"
"xfce4"
"blackbox"
"ctwm"
"e16"
"enlightenment"
"fluxbox"
"fvwm3"
"gala"
"icewm"
"jwm"
"kwin-x11"
"marco"
"metacity"
"muffin"
"openmotif"
"openbox"
"pekwm"
"xorg-twm"
"windowmaker"
"xfwm4"
"bspwm"
"herbstluftwm"
"i3-wm"
"notion"
"stumpwm"
"awesome"
"qtile"
)
echo "Select the desktop environments you want to install:"
echo
for i in "${!DESKTOPS[@]}"; do
    printf "%2d) %s\n" $((i+1)) "${DESKTOPS[$i]}"
done
echo
read -p "Enter numbers separated by spaces (e.g., 1 3 5): " choices
if [[ -z "$choices" ]]; then
    echo "No choices entered. Exiting."
    exit 1
fi
unique_choices=($(echo "$choices" | tr ' ' '\n' | sort -n | uniq))
echo
echo "You selected:"
for choice in "${unique_choices[@]}"; do
    index=$((choice-1))
    echo " - ${DESKTOPS[$index]}"
done
echo
read -p "Proceed with installation? (y/n): " confirm
confirm=$(echo "$confirm" | tr '[:upper:]' '[:lower:]')
if [[ "$confirm" != "y" ]]; then
    echo "Installation cancelled."
    exit 0
fi
echo
echo "Installing selected desktop environments..."
echo
for choice in "${unique_choices[@]}"; do
    index=$((choice-1))
    sudo pacman -S --noconfirm "${DESKTOPS[$index]}"
done
echo
echo "Done"
