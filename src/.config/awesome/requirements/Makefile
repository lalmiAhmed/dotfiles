.PHONY: all
all: debian

.PHONY: debian
debian: apt fonts

required = 	awesome \
			compton \
			rofi \
			xbacklight \

optional = 	kde-spectacle \
			xclip \
			lxappearance \
			papirus-icon-theme \

apt:
	sudo apt-get install $(required) $(opitonal)

fonts:
	cp -r fonts/* ~/.local/share/fonts
	fc-cache -f -v