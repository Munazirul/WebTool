#!/bin/bash
if [[ `command -v net-tools` ]];
    then
      apt install net-tools
    else
        echo ''
        fi
function dirb_search(){
    echo -e "http or https ? >"
                read method
                case $method in
                    "http")
                dirb http://$ip
                    ;;
                    "https")
                dirb https://$ip
                    ;;
                    * )
                    echo "specify http / https !"
                    exit 0
                    ;;
                esac
}
function go_buster(){
                echo -e "Enter the path for your wordlist> "
                read wordlist 
                gobuster dir -u $ip -w $wordlist
} 
echo "######################################"
echo "#               WebTool              #"
echo "#                                    #"
echo "# Developed by Munazir          v1.0 #"
echo "# github: github.com/Munazirul       #"
echo "######################################"
printf "\n[1] Basic Information Gathering\n"
printf "\n[2] Target vulnerability scanning\n"
printf "\n[3] Website Directory listing\n\n"
echo -e "Enter your choice>\c"
read option
if [[ $option == 1 ]]
   then 
echo "###############################"
echo "#        InfoGather           #"
echo "###############################"
printf "Basic Information gathering:\n"
printf "   [1] Ping\n"
printf "   [2] Dig\n"
printf "   [3] Whatweb\n"
printf "   [4] Whois Lookup\n"
printf "   [5] nslookup\n"
printf "   [6] Traceroute\n"
printf "   [7] Dnsenum\n"
printf "   [8] Dnsrecon\n"
printf "   [9] TheHarvester\n"
elif [[ $option == 2 ]]
    then
        echo "#########################"
        echo "#    website scanning   #"
        echo "#########################"
      printf "\n[1] Nikto\n"
      printf "\n[2] Uniscan\n"
      echo -e "\nEnter the option>\c"
      read option2
      echo -e "\nEnter the target: \c"
            read ip
      if [[ $option2 == 1 ]]
        then
        if [[ `command -v nikto` ]]; then
         echo "<<<<<<<< Running Nikto >>>>>>>>"
            nikto -host $ip
            exit 0
            else
                printf "\nNikto is not installed, Installing it for you.\n"
                sleep 1
                echo "Installing Nikto"
                apt-get install nikto -y
                echo "<<<<<<<< Running Nikto >>>>>>>>"
                nikto -host $ip
                fi
            elif [[ $option2 == 2 ]]
            then
            if [[ `command -v uniscan` ]]; then
            echo "<<<<<<<< Running uniscan >>>>>>>>"
            uniscan -u $ip -qweds
            exit 0
            else
                printf "\nUniscan is not installed, Installing it for you.\n"
                sleep 1
                echo "Installing Uniscan"
                apt-get install uniscan -y
                echo "<<<<<<<< Running Uniscan >>>>>>>>"
                uniscan -u $ip -qweds
                fi
            exit 0
            else
                echo "Invalid choice!"
                exit 0
        fi
        elif [[ $option == 3 ]]
        then 
            echo "################################"
            echo "#       Directory listing      #"
            echo "################################"
            printf "  [1] dirsearch\n"
            printf "  [2] dirb\n"
            printf "  [3] gobuster\n"
            echo -e "Enter your choice> \c"
            read option3
            echo -e "Enter the target> \c"
            read ip
            if [[ $option3 == 1 ]]
            then 
            if [[ `command -v dirsearch` ]]; then
            echo "<<<<<<<< Running dirsearch >>>>>>>>"
                dirsearch -u $ip
                else
                    printf "\n Dirsearch is not installed, Installing it for you."
                    apt install dirsearch -y
                    sleep 1
                    echo "<<<<<<<< Running dirsearch >>>>>>>>"
                    sleep 1
                    dirsearch -u $ip
                    fi
                exit 0
                elif [[ $option3 == 2 ]]
                    then
                    if [[ `command -v dirb` ]]; then
                        echo "<<<<<<<< Running dirb >>>>>>>>"
                    dirb_search
                    else
                        echo "dirb not installed, Installing it for you."
                        sleep 1
                        apt install dirb -y
                        echo "<<<<<<<< Running dirb >>>>>>>>"
                        dirb_search
                        fi
                elif [[ $option3 == 3 ]]
                    then
                    if [[ `command -v gobuster` ]]; then
                    go_buster
                    else
                        echo "Gobuster is not installed, Installing it for you."
                        sleep 1
                        apt install gobuster -y
                        sleep 2
                        echo "Successfully installed gobuster!"
                        sleep 1
                        go_buster
                        fi
            else 
                echo "Invalid choice!"
                exit 0
            fi
else  
    echo "Invalid choice!"
    exit 0
    fi
echo -e "\nEnter the choice>\c\n"
read option1
echo -e "\nEnter the target:\c\n"
        read ip
    if [[ $option1 == 1 ]]
    then 
        printf "\n<<<<<<<< Running Ping >>>>>>>>\n"
        ping $ip
        elif [[ $option1 == 2 ]]
        then  
        printf "\n<<<<<<<< Running Dig >>>>>>>>\n"
        dig $ip
        elif [[ $option1 == 3 ]]
        then  
        if [[ `command -v whatweb` ]]; then
        printf "\n<<<<<<<< Running whatweb >>>>>>>>\n"
        whatweb -v $ip
            else
            echo "Whatweb is not installed, Installing it for you."
            sleep 2
            echo "Installing whatweb"
            sleep 1
            apt install whatweb -y
            sleep 2
            echo "<<<<<<<< Running whatweb >>>>>>>>"
        whatweb -v $ip
        fi
        elif [[ $option1 == 4 ]]
        then
        if [[ `command -v whois` ]]; then
        printf "\n<<<<<<<< Running WhoisLookup >>>>>>>>\n"
        whois $ip
            else
            echo "WhoisLookup is not installed, Installing it for you."
            sleep 2
            echo "Installing Whois"
            sleep 1
            apt install whois -y
            sleep 2
            echo "<<<<<<<< Running WhoisLookup >>>>>>>>"
        whois $ip
        fi
        elif [[ $option1 == 5 ]]
        then
        printf "\n<<<<<<<< Running nslookup >>>>>>>>\n"
        sleep 1
        nslookup $ip
        elif [[ $option1 == 6 ]]
        then
        if [[ `command -v traceroute` ]]; then
        printf "\n<<<<<<<< Running Traceroute >>>>>>>>\n"
        traceroute $ip
            else
            echo "traceroute is not installed, Installing it for you."
            sleep 2
            echo "Installing Traceroute"
            sleep 1
            apt install traceroute -y
            sleep 2
            echo "<<<<<<<< Running traceroute >>>>>>>>"
        traceroute $ip
        fi
        elif [[ $option1 == 7 ]]
        then
        if [[ `command -v dnsenum` ]]; then
        printf "\n<<<<<<<< Running Dnsenum >>>>>>>>\n"
        dnsenum $ip
            else
            echo "dnsenum is not installed, Installing it for you."
            sleep 2
            echo "Installing dnsenum"
            sleep 1
            apt install dnsenum -y
            sleep 2
            echo "<<<<<<<< Running dnsenum >>>>>>>>"
        dnsenum $ip
        fi
        elif [[ $option1 == 8 ]]
        then
        if [[ `command -v dnsrecon` ]]; then
        printf "\n<<<<<<<< Running dnsrecon >>>>>>>>\n"
        dnsrecon -d $ip
            else
            echo "dnsrecon is not installed, Installing it for you."
            sleep 2
            echo "Installing dnsrecon"
            sleep 1
            apt install dnsrecon -y
            sleep 2
            echo "<<<<<<<< Running dnsrecon >>>>>>>>"
        dnsrecon -d $ip
        fi
        elif [[ $option1 == 9 ]]
        then
        if [[ `command -v theharvester` ]]; then
        printf "\n<<<<<<<< Running theHarvester >>>>>>>>\n"
        theHarvester -d $ip -d all
            else
            echo "theHarvester is not installed, Installing it for you."
            sleep 2
            echo "Installing theHarvester"
            sleep 1
            apt install theharvester -y
            sleep 2
            echo "<<<<<<<< Running theHarvester >>>>>>>>"
        theHarvester -d $ip -d all
        fi
        else
            echo "Invalid choice!"
fi