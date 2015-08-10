[![Build Status](https://travis-ci.org/ezeteze/ansible-cuckoo.svg?branch=master)](https://travis-ci.org/ezeteze/ansible-cuckoo)


# **Ansible Playbook to install and configure [Cuckoo Sandbox](http://www.cuckoosandbox.org/)**

This playbook was created for the support of [ENISA CERT Trainings](https://www.enisa.europa.eu/activities/cert).

The playbook is tested on **Ubuntu 14.04 x64**.
Based on ansible playbook structure three distinct roles, as described below, are defined:

-	**Cuckoo**: This role downloads cuckoo version 1.2 from official github repository and installs required dependencies. 
-	**Virtualbox**: This role adds the official virtualbox ppa repository for Ubuntu and installs virtualbox. 
-	**Web**: This role configures  nginx  web server and gunicorn  in order to serve the cuckoo web application.

To install cuckoo on a local virtual machine clone this repo and issue the following commands:

    sudo apt-add-repository ppa:ansible/ansible && apt-get update
    sudo apt-get –y install git ansible 
    git clone https://github.com/ezeteze/ansible-cuckoo
    cd ansible-cuckoo
    sudo ansible-playbook -i hosts site.yml --connection=local

Windows XP guest machine is used to analyse malware samples. The installation is done automatically using [VMCloak](https://github.com/jbremer/vmcloak) .

The following configuration changes are needed before starting up cuckoo for analysis:

-	**Windows XP x86 ISO image**: Place the windows XP image under /home/cuckoo/winxp3.iso. Naming and path are case sensitive and defined in file /usr/local/bin/cuckoo at line 41. 
-	**winxp3.conf**: This is the VMCloak configuration file. It is placed under /home/cuckoo/cuckoo-1.2/conf/winxp3.conf. Edit the file and provide a valid serial key for the Windows XP installation. Additionally depending on the host machine edit the hostonly-adapter accordingly.

When finished copying the ISO image and have done the required changes on the configuration file you need to start cuckoo for the first time in order to automatically create the Windows XP guest machine. This can take up to an hour depending on your host machine. To start cuckoo change to user cuckoo and issue the following command:

    cuckoo start

When the process has finished you should see a message similar to the following:

    cuckoo@ubuntu:~$ cuckoo start
    Since this is the first run, will now create the VM..
    Warning: creating filesystem that does not conform to ISO-9660.
    0%...10%...20%...30%...40%...50%...60%...70%...80%...90%...100%
    INFO:vmcloak:Starting the Virtual Machine 'winxp' to install Windows.
    INFO:vmcloak:Waiting for the Virtual Machine 'winxp' to connect back, this may take up to 30 minutes.
    INFO:vmcloak:Virtual Machine 'winxp' created successfully.

     Cuckoo Sandbox 1.2
     www.cuckoosandbox.org
     Copyright (c) 2010-2015
    
    2015-07-02 11:00:29,066 [lib.cuckoo.core.scheduler] INFO: Using "virtualbox" machine manager
    2015-07-02 11:00:29,240 [lib.cuckoo.core.scheduler] INFO: Loaded 1 machine/s
    2015-07-02 11:00:29,248 [lib.cuckoo.core.scheduler] INFO: Waiting for analysis tasks.

You can now browse to http://192.168.57.1 to submit files for analysis.

For more information check out the ENISA CERT resources at:
http://www.enisa.europa.eu/activities/cert/training/training-resources/

----------

