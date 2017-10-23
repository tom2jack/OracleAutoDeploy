#!/bin/bash
echo "                   o                                          o__ __o      "
echo "                <|>                                        /v     v\       "
echo "                / \                                       />       <\      "
echo "     o__  __o   \o/      __o__    o__ __o/  \o__ __o    o/           \o    "
echo "    /v      |>   |      />  \    /v     |    |     |>  <|             |>   "
echo "   />      //   / \   o/        />     / \  / \   < >   \\           //    "
echo "   \o    o/     \o/  <|         \      \o/  \o/           \         /      "
echo "    v\  /v __o   |    \\         o      |    |             o       o       "
echo "     <\/> __/>  / \    _\o__</   <\__  / \  / \            <\__ __/>       "
echo "                                                                           "
echo "                                                                           "
echo "                                                                           "
echo "                          o                           o                    "
echo "                         <|>                         <|>                   "
echo "                         < >                         / \                   "
echo "              o__ __o     |       o       o        o/   \o                 " 
echo "             /v     v\    o__/_  <|>     <|>      <|__ __|>                "
echo "            />       <\   |      < >     < >      /       \                "
echo "            \         /   |       |       |     o/         \o              "
echo "             o       o    o       o       o    /v           v\             "
echo "             <\__ __/>    <\__    <\__ __/>   />             <\            "
echo "                                                                           "
echo "                                                                           "
echo "                                                                           "
echo "                              o                            o__ __o         "
echo "                             <|>                          <|     v\        "
echo "                             / \                          / \     <\       "
echo "     o      o     o__ __o    \o/  \o_ __o      o__  __o   \o/       \o     "
echo "    <|>    <|>   /v     v\    |    |    v\    /v      |>   |         |>    "
echo "    < >    < >  />       <\  / \  / \    <\  />      //   / \       //     "
echo "     \o    o/   \         /  \o/  \o/     /  \o    o/     \o/      /       "
echo "      v\  /v     o       o    |    |     o    v\  /v __o   |      o        "
echo "       <\/>      <\__ __/>   / \  / \ __/>     <\/> __/>  / \  __/>        "
echo "        /                         \o/                                      "
echo "       o                           |                                       "
echo "    __/>                          / \                                      "
echo "                                                                           "
echo "                                           --Created by G0c0d2r            "
echo "                                             https://0xl00se.wordpress.com "
echo "                                             Version 1.0.0                 "
read -p "Do you decide to execute this script: YES(y)(yes) or NO(n)(no)     " answer
if [ $answer == "YES" ]||[ $answer == "y" ]||[ $answer == "yes" ];then
    echo "#################################"
    echo "# The current system version is #"
    echo "#################################"
    cat /etc/issue;
    echo
    echo "########################################"
    echo "# The current system kernel version is #"
    echo "########################################"
    uname -r;
    echo
    echo "################################"
    echo "# The current system memory is #"
    echo "################################"
    grep MemTotal /proc/meminfo;
    echo
    echo "#####################################"
    echo "# The current system swap memory is #"
    echo "#####################################"
    grep SwapTotal /proc/meminfo;
    echo
    tmp=`grep SwapTotal /proc/meminfo | cut -f 8 -d " " | awk '{print int($0) }'`;
    if [ $tmp -lt 2031608 ]; then
        echo "####################################################################"
        echo "# The swap partition does not meet the minimum requirements.        #"
        echo "# The system is automatically expanding the swap partition size... #"
        echo "####################################################################"
        dd if=/dev/zero of=/swp bs=1G count=4
        mkswap -f /swp
        swapon /swp
        free -m
        echo
    else
        echo "##############################################################################"
        echo "# The swap partition meets the requirements, please proceed to the next step #"
        echo "##############################################################################"
        echo
    fi
    echo "##############################################"
    echo "# Add the native IP to the system hosts file #"
    echo "##############################################"
    unset tmp;
    tmp=`ifconfig|sed -n '/inet addr/s/^[^:]*:\([0-9.]\{7,15\}\) .*/\1/p'|awk 'NR==1{print}'`;
    echo $tmp    `hostname` >> /etc/hosts;
    echo
    echo "#################################"
    echo "# Shut down the system firewall #"
    echo "#################################"
    service iptables stop;
    echo
    echo "#########################"
    echo "# Shut down the SeLinux #"
    echo "#########################"
    setenforce=0;
    sed -i 's/enforcing/disabled/' /etc/selinux/config;
    echo
    echo "####################################"
    echo "# Which jdk exist in the system: #"
    echo "####################################"
    echo "`rpm -qa | grep jdk`";
    echo
    echo "##############################################"
    echo "# These jdk files are being uninstalled... #"
    echo "##############################################"
    for jdk in `rpm -qa | grep jdk`; do
        rpm -e --nodeps $jdk
    done
    echo
    echo "#######################################"
    echo "# The system is installing the jdk... #"
    echo "#######################################"
    rpm -ivh "`pwd`/jdk*";
    echo
    echo "###############################################"
    echo "# The system is installing dependent packages #"
    echo "###############################################"
    yum install -y binutils \
    compat-libcap1 \
    compat-libstdc++-33 \
    compat-libstdc++-33.i686 \
    gcc \
    gcc-c++ \
    glibc.i686 \
    glibc \
    glibc-devel \
    glibc-devel.i686 \
    pdksh \
    libgcc.i686 \
    libgcc \
    libstdc++.i686 \
    libstdc++ \
    libstdc++-devel.i686 \
    libstdc++-devel \
    libaio.i686 \
    libaio \
    libaio-devel.i686 \
    libaio-devel \
    make \
    sysstat \
    unixODBC \
    unixODBC.i686 \
    unixODBC-devel \
    unixODBC-devel.i686 \
    libXext.i686 \
    libXext \
    elfutils-libelf-devel \
    unzip;
    echo
    echo "#######################################"
    echo "# Create Oracle users and user groups #"
    echo "#######################################"
    groupadd oinstall;
    groupadd dba;
    groupadd oper;
    useradd -g oinstall -G dba,oper oracle;
    echo "oracle" | passwd --stdin oracle;
    echo
    echo "#######################################"
    echo "# View the details of the oracle user #"
    echo "#######################################"
    id oracle;
    echo
    echo "################################################################################"
    echo "# Create the Oracle installation directory and set the appropriate permissions #"
    echo "################################################################################"
    mkdir -p /u01/app/oracle/product/11.2.0/db_1;
    mkdir -p /u01/app/oracle/oradata;
    mkdir -p /u01/app/oracle/oraInventory;
    mkdir -p /u01/app/oracle/fast_recovery_area;
    chown -R oracle:oinstall /u01/app;
    chmod -R 755 /u01/app;
    echo
    echo "#######################################"
    echo "# Modify the system kernel parameters #"
    echo "#######################################"
    echo 'kernel.sem = 250 32000 100 128' >> /etc/sysctl.conf;
    echo 'net.core.rmem_default = 4194304' >> /etc/sysctl.conf;
    echo 'net.core.rmem_max = 4194304' >> /etc/sysctl.conf;
    echo 'net.core.wmem_default = 262144' >> /etc/sysctl.conf;
    echo 'fs.file-max = 6815744' >> /etc/sysctl.conf;
    echo 'net.ipv4.ip_local_port_range = 9000 65500' >> /etc/sysctl.conf;
    echo 'net.core.wmem_max = 1048576'  >> /etc/sysctl.conf;
    echo 'fs.aio-max-nr = 1048576' >> /etc/sysctl.conf;
    sysctl -p;
    modprobe bridge;
    lsmod | grep bridge;
    echo 
    echo "#######################################"
    echo "# Modify system security restrictions #"
    echo "#######################################"
    echo 'oracle soft nproc 2047' >> /etc/security/limits.conf;
    echo 'oracle hard nproc 16384' >> /etc/security/limits.conf;
    echo 'oracle soft nofile 1024' >> /etc/security/limits.conf;
    echo 'oracle hard nofile 65536' >> /etc/security/limits.conf;
    echo 'oracle soft core unlimited' >> /etc/security/limits.conf;
    echo 'oracle hard core unlimited' >> /etc/security/limits.conf;
    echo 'oracle soft memlock 50000000' >> /etc/security/limits.conf;
    echo 'oracle hard memlock 50000000' >> /etc/security/limits.conf;
    echo
    echo "######################################"
    echo "# Modify user authentication options #"
    echo "######################################"
    echo 'password   required      /lib64/security/pam_limits.so' >> /etc/pam.d/login;
    echo
    echo "###########################"
    echo "# Modify the user profile #"
    echo "###########################"
    cat << EOF >> /etc/profile
    if [ $USER = "oracle" ]; then
        if [ $SHELL = "/bin/ksh" ]; then
            ulimit -p 16384
            ulimit -n 65536
        else
            ulimit -u 16384 -n 65536
        fi
    fi
    EOF
    sed -i 's/`hostname`/\$USER/g' /etc/profile;
    sed -i 's/\/bin\/bash/\$SHELL/g' /etc/profile;
    sed -i 's/oracle/\"oracle\"/g' /etc/profile;
    sed -i 's/\/bin\/ksh/\"\/bin\/ksh\"/g' /etc/profile;
    echo
    echo "###########################"
    echo "# Ready to install Oracle #"
    echo "###########################"
    chown -R oracle:oinstall `pwd`/p13390677_112040_Linux*;
    mv `pwd`/p13390677_112040_Linux* /tmp;
    echo
    echo "####################################"
    echo "# Set the Linux boot automatically #"
    echo "####################################"
    echo 'su oracle -lc "/u01/app/oracle/product/11.2.0/db_1/bin/lsnrctl start"' >> /etc/rc.d/rc.local;
    echo 'su oracle -lc "/u01/app/oracle/product/11.2.0/db_1/bin/dbstart"' >> /etc/rc.d/rc.local;
    #echo '-A RH-Firewall-1-INPUT -p tcp -m state --state NEW -m tcp --dport 1521 -j ACCEPT' >> /etc/sysconfig/iptables;
    #service iptables save;
    #service iptables restart;
    service iptables stop;
    chmod u+x /etc/rc.d/rc.local;
    echo
else 
    exit 0
fi