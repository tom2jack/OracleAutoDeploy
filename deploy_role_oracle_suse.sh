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
    echo
    echo "#######################################################"
    echo "# The JDK environment variable is being configured... #"
    echo "#######################################################"
    echo 'export JAVA_HOME=/usr/java/jdk1.7.0_79' >> /etc/profile;
    echo 'export PATH=$PATH:$JAVA_HOME/bin:$JAVA_HOME/jre/bin' >> /etc/profile;
    echo 'export CLASSPATH=.:$JAVA_HOME/lib:$JAVA_HOME/jre/lib' >> /etc/profile;
    source /etc/profile;
    echo
    echo "##################################"
    echo "# Modify the oracle user profile #"
    echo "##################################"
    echo 'export TMP=/tmp' >> /etc/profile;
    echo 'export TMPDIR=$TMP' >> /etc/profile; 
    echo 'export ORACLE_HOSTNAME=$(hostname)' >> /etc/profile;
    echo 'export ORACLE_BASE=/u01/app/oracle' >> /etc/profile;
    echo 'export ORACLE_HOME=$ORACLE_BASE/product/11.2.0/db_1' >> /etc/profile;
    echo 'export ORACLE_SID=orcl' >> /etc/profile;
    echo 'export ORACLE_TERM=xterm' >> /etc/profile;
    echo 'export PATH=$ORACLE_HOME/bin:$PATH' >> /etc/profile;
    echo 'export LD_LIBRARY_PATH=$ORACLE_HOME/lib:/lib64:/usr/lib:/usr/lib64:/usr/local/lib64' >> /etc/profile;
    echo 'export CLASSPATH=$ORACLE_HOME/JRE:$ORACLE_HOME/jlib:$ORACLE_HOME/rdbms/jlib' >> /etc/profile;
    echo 'export LD_ASSUME_KERNEL=2.6.18' >> /etc/profile;
    echo 'export NLS_LANG="american_america.UTF8"' >> /etc/profile;
    echo 'export NLS_LANG="AMERICAN_AMERICA.US7ASCII"' >> /etc/profile;
    source /etc/profile;
    echo
    echo "###########################"
    echo "# Ready to install Oracle #"
    echo "###########################"
    unzip /tmp/p13390677_112040_Linux-x86-64_1of7.zip -d /tmp/;
    unzip /tmp/p13390677_112040_Linux-x86-64_2of7.zip -d /tmp/;
    rm -f /tmp/p13390677_112040_Linux-x86-64_1of7.zip;
    rm -f /tmp/p13390677_112040_Linux-x86-64_2of7.zip;
    cp /tmp/database/response/* /home/oracle/;
    echo
    echo "############################"
    echo "# Modify the response file #"
    echo "############################"
    cp /home/oracle/db_install.rsp /home/oracle/db_install.rsp.bak;
    sed -i 's/oracle.install.option=.*/oracle.install.option=INSTALL_DB_SWONLY/' /home/oracle/db_install.rsp;
    sed -i "s/ORACLE_HOSTNAME=.*/ORACLE_HOSTNAME=$(hostname)/" /home/oracle/db_install.rsp;
    sed -i 's/UNIX_GROUP_NAME=.*/UNIX_GROUP_NAME=oinstall/' /home/oracle/db_install.rsp;
    sed -i 's/INVENTORY_LOCATION=.*/INVENTORY_LOCATION=\/u01\/app\/oraInventory/' /home/oracle/db_install.rsp;
    sed -i 's/SELECTED_LANGUAGES=.*/SELECTED_LANGUAGES=en,zh_CN/' /home/oracle/db_install.rsp;
    sed -i 's/ORACLE_HOME=.*/ORACLE_HOME=\/u01\/app\/oracle\/product\/11.2.0\/db_1/' /home/oracle/db_install.rsp;
    sed -i 's/ORACLE_BASE=.*/ORACLE_BASE=\/u01\/app\/oracle/' /home/oracle/db_install.rsp;
    sed -i 's/DECLINE_SECURITY_UPDATES=.*/DECLINE_SECURITY_UPDATES=true/' /home/oracle/db_install.rsp;
    sed -i 's/oracle.install.db.InstallEdition=.*/oracle.install.db.InstallEdition=EE/' /home/oracle/db_install.rsp;
    sed -i 's/oracle.install.db.isCustomInstall=.*/oracle.install.db.isCustomInstall=true/' /home/oracle/db_install.rsp;
    sed -i 's/oracle.install.db.DBA_GROUP=.*/oracle.install.db.DBA_GROUP=dba/' /home/oracle/db_install.rsp;
    sed -i 's/oracle.install.db.OPER_GROUP=.*/oracle.install.db.OPER_GROUP=oinstall/' /home/oracle/db_install.rsp;
    sed -i 's/oracle.install.db.config.starterdb.type=.*/oracle.install.db.config.starterdb.type=GENERAL_PURPOSE/' /home/oracle/db_install.rsp;
    sed -i 's/oracle.install.db.config.starterdb.globalDBName=.*/oracle.install.db.config.starterdb.globalDBName=orcl/' /home/oracle/db_install.rsp;
    sed -i 's/oracle.install.db.config.starterdb.SID=.*/oracle.install.db.config.starterdb.SID=orcl/' /home/oracle/db_install.rsp;
    sed -i 's/oracle.install.db.config.starterdb.characterSet=.*/oracle.install.db.config.starterdb.characterSet=AL32UTF8/' /home/oracle/db_install.rsp;
    sed -i 's/oracle.install.db.config.starterdb.memoryOption=.*/oracle.install.db.config.starterdb.memoryOption=true/' /home/oracle/db_install.rsp;
    sed -i 's/oracle.install.db.config.starterdb.password.ALL=.*/oracle.install.db.config.starterdb.password.ALL=oracle/' /home/oracle/db_install.rsp;
    sed -i 's/oracle.install.db.config.starterdb.control=.*/oracle.install.db.config.starterdb.control=DB_CONTROL/' /home/oracle/db_install.rsp;
    sed -i 's/oracle.install.db.config.starterdb.dbcontrol.enableEmailNotification=.*/oracle.install.db.config.starterdb.dbcontrol.enableEmailNotification=true/' /home/oracle/db_install.rsp;
    sed -i 's/oracle.install.db.config.starterdb.dbcontrol.emailAddress=.*/oracle.install.db.config.starterdb.dbcontrol.emailAddress=xxx@xxx.com/' /home/oracle/db_install.rsp;
    sed -i 's/oracle.install.db.config.starterdb.dbcontrol.SMTPServer=.*/oracle.install.db.config.starterdb.dbcontrol.SMTPServer=mail.xxx.com/' /home/oracle/db_install.rsp;
    chmod 640 /home/oracle/db_install.rsp;
    cp /home/oracle/dbca.rsp /home/oracle/dbca.rsp.bak;
    sed -i 's/#GDBNAME =.*/GDBNAME = "orcl"/' /home/oracle/dbca.rsp;
    sed -i 's/#SID =.*/SID = "orcl"/' /home/oracle/dbca.rsp;
    sed -i 's/#SYSPASSWORD =.*/SYSPASSWORD = "oracle"/' /home/oracle/dbca.rsp;
    sed -i 's/#SYSTEMPASSWORD =.*/SYSTEMPASSWORD = "oracle"/' /home/oracle/dbca.rsp;
    sed -i 's/#EMCONFIGURATION =.*/EMCONFIGURATION = "LOCAL"/' /home/oracle/dbca.rsp;
    sed -i 's/#SYSMANPASSWORD =.*/SYSMANPASSWORD = "oracle"/' /home/oracle/dbca.rsp;
    sed -i 's/#DBSNMPPASSWORD =.*/DBSNMPPASSWORD = "oracle"/' /home/oracle/dbca.rsp;
    cp /home/oracle/netca.rsp /home/oracle/netca.rsp.bak;
    sed -i 's/INSTALL_TYPE=.*/INSTALL_TYPE=""custom""/' /home/oracle/netca.rsp;
    echo
    echo "####################################"
    echo "# Start silently installing Oracle #"
    echo "####################################"
    sh /tmp/database/runInstaller -silent -responseFile /home/oracle/db_install.rsp -ignorePrereq;
    #echo
    #echo "###################################"
    #echo "# Silently configure the listener #"
    #echo "###################################"
    #netca /silent /responsefile /home/oracle/netca.rsp;
    #netstat -tnul | grep 1521;
    #echo
    #echo "#############################"
    #echo "# Silently build a database #"
    #echo "#############################"
    #dbca -silent -createDatabase -templateName General_Purpose.dbc -gdbname orcl -sid orcl -responseFile /home/oracle/dbca.rsp -characterSet AL32UTF8 -memoryPercentage 30 -emConfiguration LOCAL -sysPassword oracle -systemPassword oracle;
    #lsnrctl status;
    #echo
    #echo "####################################"
    #echo "# Set the Linux boot automatically #"
    #echo "####################################"
    #sed -i 's/ORACLE\_HOME\_LISTNER\=\$1/ORACLE\_HOME\_LISTNER\=\$ORCLE\_H OME/g' /u01/app/oracle/product/11.2.0/db_1/bin/dbstart;
    #sed -i 's/ORACLE\_HOME\_LISTNER\=\$1/ORACLE\_HOME\_LISTNER\=\$ORCLE\_H OME/g' /u01/app/oracle/product/11.2.0/db_1/bin/dbshut;
    #echo
else 
    exit 0
fi