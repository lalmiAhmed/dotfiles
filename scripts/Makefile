all: apt snap snap-classic

apt = 	chromium-browser \
		compton \
		fonts-font-awesome \
		rofi \
		konsole \
		vlc \
		peek \
		obs-studio \
		gnome-tweaks \
		htop \
		vim \
		awesome \
		python3-pip \
		python3-venv \
		fonts-powerline \
		npm \
		nodejs \
		papirus-icon-theme \
		xbacklight \
		lxappearance \
		kde-spectacle \
		xclip \
		kitty

apt:
	sudo apt-get install $(apt)

snap = discord

snap:
	sudo snap install $(snap)

snap-classic = 	sublime-text \
				code \
				postman

snap-classic:
	for package in $(snap-classic) ; do \
		sudo snap install $$package --classic ; \
	done