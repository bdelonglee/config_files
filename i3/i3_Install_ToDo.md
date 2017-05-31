
xprop = click sur application et renvoie les infos/Class de l'app

# permet de setter le clavier en US international
# exec dans i3 .config  
# sans exec dans un terminal
exec setxkbmap -layout us -variant altgr-intl -option nodeadkeys

# download font System Safransisco 
https://github.com/supermarin/YosemiteSanFranciscoFont

# unzip 
cp *ttf ~/.fonts

# linker les fonts aux applis. Ne sert qu'a verifier que tout est bon.
# Optionnel
sudo apt-get install lxappearance

# Taper la font : System San Fransisco Display 13
vim ~/.gtkrc-2.0
vim ~/.config/gtk-3.0/settings.ini 

# Better font Rendering
sudo add-apt-repository ppa:no1wantdthisname/ppa
sudo apt-get update
sudo apt-get upgrade
sudo apt-get install fontconfig-infinality

# Choisir le Style (OSX)
sudo bash /etc/fonts/infinality/infctl.sh setstyle

sudo -H vim /etc/profile.d/infinality-settings.sh
# search for USE_STYLE (it should be USE_STYLE="DEFAULT" by default)

# Pour corriger certains probleme dícones  pour gtk
sudo apt-get install gnome-icon-theme-full

# Jeux dícones
https://snwh.org/moka/download
sudo add-apt-repository ppa:moka/daily
sudo apt-get update
sudo apt-get install moka-icon-theme

definir le jeux avec lxappearance

# Custom Dmenu
sudo apt-get install rofi

# Custom bar
sudo apt-get install i3blocks

# Custom icone dans la bar
http://fontawesome.io/cheatsheet/

# Pour faire clignoter la fenetre courante
# utilisation d'un script sh utilisant
# ne marche pas, deprecated
# sudo apt-get install xcompmgr


# Icone pour bar:
http://fontawesome.io/cheatsheet/
