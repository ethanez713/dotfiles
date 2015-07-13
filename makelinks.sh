# User must be in dotfiles directory
if [[ $(pwd) != *'dotfiles' ]]; then
    echo "You're not in the dotfiles directory!"
    exit 1
fi

# Links dotfiles to home directory
for f in $(find .* -maxdepth 0 -type f); do
    if ln $f ~/$f; then
	echo "Successfully linked $f!"
    fi
done

# Exit successfully
echo "Done!"
exit 0
