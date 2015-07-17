# User must be in dotfiles directory
if [[ $(pwd) != *'dotfiles' ]]; then
    echo "You're not in the dotfiles directory!"
    exit 1
fi

# Rename old dotfiles by appending '-OLD'
for f in $(find .* -maxdepth 0 -type f); do
    if mv ~/$f ~/$f-OLD; then
	echo "$f moved to $f-OLD!"
    fi
done

# Exit successfully
echo "Done!"
exit 0
