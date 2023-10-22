#!/bin/bash

welcome(){
    echo "

     ██╗ ██████╗ ███████╗██╗  ██╗███████╗    ██╗  ██╗███████╗██╗   ██╗
     ██║██╔═══██╗██╔════╝██║  ██║██╔════╝    ██║ ██╔╝██╔════╝╚██╗ ██╔╝
     ██║██║   ██║███████╗███████║███████╗    █████╔╝ █████╗   ╚████╔╝ 
██   ██║██║   ██║╚════██║██╔══██║╚════██║    ██╔═██╗ ██╔══╝    ╚██╔╝  
╚█████╔╝╚██████╔╝███████║██║  ██║███████║    ██║  ██╗███████╗   ██║   
 ╚════╝  ╚═════╝ ╚══════╝╚═╝  ╚═╝╚══════╝    ╚═╝  ╚═╝╚══════╝   ╚═╝   
                                                                      
    "
    echo "Welcome to my script. This script installs and uninstalls my SSH key"
    echo "You should only run this script when you need to give me access to your server"
    echo "As soon as I am finished working on your server you should uninstall the key"
    echo "THIS SCRIPT EFFECTS ONLY THE LOGGED IN USER"
}

break(){
    echo ""
    echo ""
}

options(){
    echo "Please select from one of the following options"
    echo ""
    echo "1| Install key"
    echo "2| Remove key"
    read option
}

installkey(){
    cd
    mkdir -p .ssh
    if grep -q "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDSh4RHK3Ft1GlvhwScB43wwjMSK9guPWZaMa4z5+3Wz+zIFI9OCRdgzrJF0h8cEDPm480og5+A1TnO5aNpL6pjQI+Ho/hMZvTj8obujGgWxgmkidTHaNafButFAX46EGsvTxp2yBYVp8YA133VIRo3efIvMYmdrrKESlTz1FkXTS2vdurtn6dtIJUygpS4pyV5y3zinU7+9ed2c57srMeqQBNQ7Yh6d2tM1qKMD0eiTbQds3GGkFA5aG/w10kYAvcPbnQ3FR0uoh6X8ifRFrN1D+irzyGMtal3oiJ0YqrLkaY52H8cZkVaNjSoWaf1gGlg2BJrX+A0RE4Q2zbVTi49 me@joshsevero.dev" ".ssh/authorized_keys" -s ; then
    echo "ERROR: Key is already installed, please contact me if this is not the expected output."
    else 
    echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDSh4RHK3Ft1GlvhwScB43wwjMSK9guPWZaMa4z5+3Wz+zIFI9OCRdgzrJF0h8cEDPm480og5+A1TnO5aNpL6pjQI+Ho/hMZvTj8obujGgWxgmkidTHaNafButFAX46EGsvTxp2yBYVp8YA133VIRo3efIvMYmdrrKESlTz1FkXTS2vdurtn6dtIJUygpS4pyV5y3zinU7+9ed2c57srMeqQBNQ7Yh6d2tM1qKMD0eiTbQds3GGkFA5aG/w10kYAvcPbnQ3FR0uoh6X8ifRFrN1D+irzyGMtal3oiJ0YqrLkaY52H8cZkVaNjSoWaf1gGlg2BJrX+A0RE4Q2zbVTi49 me@joshsevero.dev" >> ~/.ssh/authorized_keys
    echo "Key sucessfully installed"
    fi
}

removekey(){
    cd
    mkdir -p .ssh
    if grep -q "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDSh4RHK3Ft1GlvhwScB43wwjMSK9guPWZaMa4z5+3Wz+zIFI9OCRdgzrJF0h8cEDPm480og5+A1TnO5aNpL6pjQI+Ho/hMZvTj8obujGgWxgmkidTHaNafButFAX46EGsvTxp2yBYVp8YA133VIRo3efIvMYmdrrKESlTz1FkXTS2vdurtn6dtIJUygpS4pyV5y3zinU7+9ed2c57srMeqQBNQ7Yh6d2tM1qKMD0eiTbQds3GGkFA5aG/w10kYAvcPbnQ3FR0uoh6X8ifRFrN1D+irzyGMtal3oiJ0YqrLkaY52H8cZkVaNjSoWaf1gGlg2BJrX+A0RE4Q2zbVTi49 me@joshsevero.dev" ".ssh/authorized_keys" -s ; then
    sed -i '/me@joshsevero.dev/d' .ssh/authorized_keys
    echo "Key sucessfully removed"
    else 
    echo "ERROR: Key not installed, please contact me if this is not the expected output."
    fi
}

welcome
break
options
case $option in 
    1)  installkey
    ;;
    2)  removekey
    ;;
    *)  echo "Your selection was not valid. Please try again:"
    options
esac
