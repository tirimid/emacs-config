# be careful when using this, there is currently no way to uninstall anything.
# backup your existing `.emacs` and `.emacs.d/` files.
# if you are weary of your fonts being overwritten, backup those as well.

cp .emacs ~/.emacs
cp -r lisp ~/.emacs.d/
cp -r themes ~/.emacs.d/
cp -r modes ~/.emacs.d/

sudo mkdir -p /usr/share/fonts/OTF
tar -xzvf fonts/hermit/packages/full-hermit-2.0.tar.gz -C fonts/hermit
sudo mv fonts/hermit/Hermit-*.otf /usr/share/fonts/OTF
