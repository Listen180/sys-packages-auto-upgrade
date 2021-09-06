APT Auto Upgrade
================



Usage
#####



Clone this repo
---------------

Clone this repo to any location you want. 

.. code-block:: shell

   git clone https://github.com/Listen180/apt-auto-upgrade



Setting in CRONTAB (sudo)
-------------------------

Edit the crontab list in ``sudo`` mode: 

.. code-block:: shell

   sudo crontab -e


Add this line: 

.. code-block:: shell

   0 7 * * 5 cd [PATH-TO-THIS-REPO] && sh apt_auto_upgrade.sh 2>&1 &

which will excute the auto upgrade program every friday at 7AM. You can always change the setting by yourself in crontab. 
