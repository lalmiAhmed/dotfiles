.PHONY: all
all: debian

.PHONY: debian
debian: apt

# Packages to be installed using apt
apt =	awesome \
		compton \
		rofi \
		gnome-tweaks \
		gnome-clocks \
		blueman \
		xvfb

apt:
	sudo apt-get install $(apt)