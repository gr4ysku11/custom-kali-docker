FROM kasmweb/core-kali-rolling:1.11.0-rolling
USER root

ENV HOME /home/kasm-default-profile
ENV STARTUPDIR /dockerstartup
ENV INST_SCRIPTS $STARTUPDIR/install
WORKDIR $HOME

### Envrionment config
#ENV DEBIAN_FRONTEND noninteractive
#ENV KASM_RX_HOME $STARTUPDIR/kasmrx
#ENV INST_SCRIPTS $STARTUPDIR/install

#WORKDIR $HOME

######### Customize Container Here ###########

# install sudo
#RUN apt-get update \
#    && apt-get install -y sudo \
#    && echo 'kasm-user ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers \
#    && rm -rf /var/lib/apt/list/*

# install brave
#COPY ./install/brave $INST_SCRIPTS/brave/
#RUN bash $INST_SCRIPTS/brave/install_brave.sh  && rm -rf $INST_SCRIPTS/brave/


### Install Tools
#COPY ./install/tools $INST_SCRIPTS/tools/
#RUN bash $INST_SCRIPTS/tools/install_tools_deluxe.sh  && rm -rf $INST_SCRIPTS/tools/

# Install Utilities
#COPY ./install/misc $INST_SCRIPTS/misc/
#RUN bash $INST_SCRIPTS/misc/install_tools.sh && rm -rf $INST_SCRIPTS/misc/

# Install Google Chrome
COPY ./install/chrome $INST_SCRIPTS/chrome/
RUN bash $INST_SCRIPTS/chrome/install_chrome.sh  && rm -rf $INST_SCRIPTS/chrome/

# Install Chromium
#COPY ./install/chromium $INST_SCRIPTS/chromium/
#RUN if [ "$(uname -m)" = "aarch64" ]; then bash $INST_SCRIPTS/chromium/install_chromium.sh; fi && rm -rf $INST_SCRIPTS/chromium/

# Install Firefox
#COPY ./install/firefox/ $INST_SCRIPTS/firefox/
#COPY ./install/firefox/firefox.desktop $HOME/Desktop/
#RUN bash $INST_SCRIPTS/firefox/install_firefox.sh && rm -rf $INST_SCRIPTS/firefox/

### Install Sublime Text
#COPY ./install/sublime_text $INST_SCRIPTS/sublime_text/
#RUN bash $INST_SCRIPTS/sublime_text/install_sublime_text.sh  && rm -rf $INST_SCRIPTS/sublime_text/


### Install Visual Studio Code
#COPY ./install/vs_code $INST_SCRIPTS/vs_code/
#RUN bash $INST_SCRIPTS/vs_code/install_vs_code.sh  && rm -rf $INST_SCRIPTS/vs_code/


### Install NextCloud
#COPY ./install/nextcloud $INST_SCRIPTS/nextcloud/
#RUN bash $INST_SCRIPTS/nextcloud/install_nextcloud.sh  && rm -rf $INST_SCRIPTS/nextcloud/


### Install Remmina
#COPY ./install/remmina $INST_SCRIPTS/remmina/
#RUN bash $INST_SCRIPTS/remmina/install_remmina.sh  && rm -rf $INST_SCRIPTS/remmina/

### Install Teams
#COPY ./install/teams $INST_SCRIPTS/teams/
#RUN bash $INST_SCRIPTS/teams/install_teams.sh  && rm -rf $INST_SCRIPTS/teams/

### Install Only Office
#COPY ./install/only_office $INST_SCRIPTS/only_office/
#RUN bash $INST_SCRIPTS/only_office/install_only_office.sh  && rm -rf $INST_SCRIPTS/only_office/

### Install Signal
#COPY ./install/signal $INST_SCRIPTS/signal/
#RUN bash $INST_SCRIPTS/signal/install_signal.sh  && rm -rf $INST_SCRIPTS/signal/

### Install GIMP
#COPY ./install/gimp $INST_SCRIPTS/gimp/
#RUN bash $INST_SCRIPTS/gimp/install_gimp.sh  && rm -rf $INST_SCRIPTS/gimp/

### Install Zoom
#COPY ./install/zoom $INST_SCRIPTS/zoom/
#RUN bash $INST_SCRIPTS/zoom/install_zoom.sh  && rm -rf $INST_SCRIPTS/zoom/

### Install OBS Studio
#COPY ./install/obs $INST_SCRIPTS/obs/
#RUN bash $INST_SCRIPTS/obs/install_obs.sh  && rm -rf $INST_SCRIPTS/obs/

### Install Ansible
#COPY ./install/ansible $INST_SCRIPTS/ansible/
#RUN bash $INST_SCRIPTS/ansible/install_ansible.sh  && rm -rf $INST_SCRIPTS/ansible/

### Install Terraform
#COPY ./install/terraform $INST_SCRIPTS/terraform/
#RUN bash $INST_SCRIPTS/terraform/install_terraform.sh  && rm -rf $INST_SCRIPTS/terraform/

### Install Telegram
#COPY ./install/telegram $INST_SCRIPTS/telegram/
#RUN bash $INST_SCRIPTS/telegram/install_telegram.sh  && rm -rf $INST_SCRIPTS/telegram/

### Install Thunderbird
#COPY ./install/thunderbird $INST_SCRIPTS/thunderbird/
#RUN bash $INST_SCRIPTS/thunderbird/install_thunderbird.sh  && rm -rf $INST_SCRIPTS/thunderbird/

# Install Gamepad Testing Utils
#COPY ./install/gamepad_utils $INST_SCRIPTS/gamepad_utils/
#RUN bash $INST_SCRIPTS/gamepad_utils/install_gamepad_utils.sh  && rm -rf $INST_SCRIPTS/gamepad_utils/

# install vscode
#COPY ./install/vs_code $INST_SCRIPTS/vs_code/
#RUN bash $INST_SCRIPTS/vs_code/install_vs_code.sh  && rm -rf $INST_SCRIPTS/vs_code/

#USER 1000

# install plugins

#RUN code --install-extension vscodevim.vim && code --install-extension ms-python.python && \
#	code --install-extension dendron.dendron-paste-image

#USER root

# install autorecon
#COPY ./install/autorecon $INST_SCRIPTS/autorecon/
#RUN bash $INST_SCRIPTS/autorecon/install_autorecon.sh && rm -rf $INST_SCRIPTS/autorecon/

## install keepassxc
#RUN apt-get install -y keepassxc


RUN touch $HOME/Desktop/hello.txt


######### End Customizations ###########

RUN chown 1000:0 $HOME
RUN $STARTUPDIR/set_user_permission.sh $HOME

ENV HOME /home/kasm-user
WORKDIR $HOME
RUN mkdir -p $HOME && chown -R 1000:0 $HOME

USER 1000

CMD ["--tail-log"]
