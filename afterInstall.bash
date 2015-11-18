#!/bin/bash
#By: Cristian Baruch Gonzalez
#updating linux 14.04 after fresh install

#################################################################################
#First edit /etc/apt/sources.lists file to include Canonical Partners repository#
#################################################################################

sudo cp /etc/apt/sources.lists /etc/apt/sources.lists.bck
cat << END > /etc/apt/sources.lists
#deb cdrom:[Ubuntu 14.04.1 LTS _Trusty Tahr_ - Release amd64 (20140722.2)]/ trusty main restricted

# See http://help.ubuntu.com/community/UpgradeNotes for how to upgrade to
# newer versions of the distribution.
deb http://us.archive.ubuntu.com/ubuntu/ trusty main restricted
deb-src http://us.archive.ubuntu.com/ubuntu/ trusty main restricted

## Major bug fix updates produced after the final release of the
## distribution.
deb http://us.archive.ubuntu.com/ubuntu/ trusty-updates main restricted
deb-src http://us.archive.ubuntu.com/ubuntu/ trusty-updates main restricted

## N.B. software from this repository is ENTIRELY UNSUPPORTED by the Ubuntu
## team. Also, please note that software in universe WILL NOT receive any
## review or updates from the Ubuntu security team.
deb http://us.archive.ubuntu.com/ubuntu/ trusty universe
deb-src http://us.archive.ubuntu.com/ubuntu/ trusty universe
deb http://us.archive.ubuntu.com/ubuntu/ trusty-updates universe
deb-src http://us.archive.ubuntu.com/ubuntu/ trusty-updates universe

## N.B. software from this repository is ENTIRELY UNSUPPORTED by the Ubuntu 
## team, and may not be under a free licence. Please satisfy yourself as to 
## your rights to use the software. Also, please note that software in 
## multiverse WILL NOT receive any review or updates from the Ubuntu
## security team.
deb http://us.archive.ubuntu.com/ubuntu/ trusty multiverse
deb-src http://us.archive.ubuntu.com/ubuntu/ trusty multiverse
deb http://us.archive.ubuntu.com/ubuntu/ trusty-updates multiverse
deb-src http://us.archive.ubuntu.com/ubuntu/ trusty-updates multiverse

## N.B. software from this repository may not have been tested as
## extensively as that contained in the main release, although it includes
## newer versions of some applications which may provide useful features.
## Also, please note that software in backports WILL NOT receive any review
## or updates from the Ubuntu security team.
deb http://us.archive.ubuntu.com/ubuntu/ trusty-backports main restricted universe multiverse
deb-src http://us.archive.ubuntu.com/ubuntu/ trusty-backports main restricted universe multiverse

deb http://security.ubuntu.com/ubuntu trusty-security main restricted
deb-src http://security.ubuntu.com/ubuntu trusty-security main restricted
deb http://security.ubuntu.com/ubuntu trusty-security universe
deb-src http://security.ubuntu.com/ubuntu trusty-security universe
deb http://security.ubuntu.com/ubuntu trusty-security multiverse
deb-src http://security.ubuntu.com/ubuntu trusty-security multiverse

## Uncomment the following two lines to add software from Canonical's
## 'partner' repository.
## This software is not part of Ubuntu, but is offered by Canonical and the
## respective vendors as a service to Ubuntu users.
# deb http://archive.canonical.com/ubuntu trusty partner
# deb-src http://archive.canonical.com/ubuntu trusty partner

## This software is not part of Ubuntu, but is offered by third-party
## developers who want to ship their latest software.
deb http://extras.ubuntu.com/ubuntu trusty main
deb-src http://extras.ubuntu.com/ubuntu trusty main
END

###############
#Update system#
###############

sudo apt-get update && sudo apt-get -y upgrade

##########################################
#Disable Unity Dash Online Search feature#
##########################################

gsettings set com.canonical.Unity.Lenses remote-content-search ‘none’

##########################################################
#add ppa for unbuntu tweak, VLC, handbrake, Y PPA Manager#
##########################################################

sudo add-apt-repository ppa:tualatrix/ppa -y
sudo add-apt-repository ppa:videolan/stable-daily -y
sudo add-apt-repository ppa:stebbins/handbrake-releases -y
sudo add-apt-repository ppa:webupd8team/y-ppa-manager -y

#############################
#update after adding the ppa#
#############################

sudo apt-get update

##############################################################################
#install git, unbuntu tweak, gnome shell, vlc, handbrake, common codecs and  #
#enable dvd playback, deluge, skype, steam, wine, Archive Management Apps,   #
#Y PPA Manager, Java, Web Cam Software (Cheese),                             #
#digital photo management application(digiKam), Gimp, Compiz                 #
##############################################################################

sudo apt-get -y install git ubuntu-tweak gnome-shell ubuntu-gnome-desktop vlc handbrake-gtk gstreamer0.10-plugins-ugly gxine libdvdread4 totem-mozilla icedax tagtool easytag id3tool lame nautilus-script-audio-convert libmad0 mpg321 gstreamer1.0-libav deluge skype steam wine unace unrar zip unzip p7zip-full p7zip-rar sharutils rar uudeview mpack arj cabextract file-roller openjdk-7-jdk cheese digikam gimp gimp-data gimp-plugin-registry gimp-data-extras compiz compizconfig-settings-manager compiz-plugins

######################
#enable encrypted dvd#
######################

sudo /usr/share/doc/libdvdread4/./install-css.sh

#######################################
# Battery performance for laptop (TLP)#
#######################################
sudo apt-get remove laptop-mode-tools
sudo add-apt-repository ppa:linrunner/tlp -y
sudo apt-get update && sudo apt-get -y install tlp tlp-rdw smartmontools ethtool
sudo tlp start
sudo tlp stat
