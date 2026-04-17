DISPLAYMANAGERS=(
"emptty"
"lemurs"
"ly"
"nodm"
"gdm"
"lightdm"
"lxdm"
"plasma-login-manager"
"sddm"
"slim"
"xorg-xdm"
)
echo "Select the display managers you want to install:"
echo
for i in "${!DISPLAYMANAGERS[@]}"; do
    printf "%2d) %s\n" $((i+1)) "${DISPLAYMANAGERS[$i]}"
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
    echo " - ${DISPLAYMANAGERS[$index]}"
done
echo
read -p "Proceed with installation? (y/n): " confirm
confirm=$(echo "$confirm" | tr '[:upper:]' '[:lower:]')
if [[ "$confirm" != "y" ]]; then
    echo "Installation cancelled."
    exit 0
fi
echo
echo "Installing selected display managers..."
echo
for choice in $choices; do
    index=$((choice-1))
    sudo pacman -S --noconfirm "${DISPLAYMANAGERS[$index]}"
done
echo
echo "Done!"
