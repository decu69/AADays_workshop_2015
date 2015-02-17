# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "win7IE10_with_winRM"
  # config.vm.box_url = "http://aka.ms/vagrant-win7-ie10"
  config.vm.box_url = "file:////morpheus/pub-Transfer/t/twierzchowski/vagrant_box/package.box"
  config.vm.guest = :windows
  config.vm.communicator = "winrm"
  config.winrm.username = "IEUser"
  config.winrm.password = "Passw0rd!"
  config.vm.boot_timeout = 300
  
  config.vm.network :forwarded_port, guest: 5985, host: 55985, id: "winrm", auto_correct: true
  #config.vm.network "private_network"
  
  config.vm.provider "virtualbox" do |vb|
    vb.gui = true
    vb.memory = "1024"
    vb.cpus = 2
    vb.customize ["modifyvm", :id, "--clipboard", "bidirectional"]
  end
  
  config.vm.provision "shell", inline: "choco install ruby1.9 -y"
  config.vm.provision "shell", inline: "choco install ruby.devkit -y"
  config.vm.provision "shell", inline: "choco install nodejs -y"
  config.vm.provision "shell", inline: "choco install cmder -y"
  config.vm.provision "shell", inline: "choco install firefox -version 35.0.1 -y"
  config.vm.provision "shell", inline: "choco install sublimetext2 -y"
  config.vm.provision "shell", inline: "Restart-Computer -Force"
  config.vm.provision "shell", inline: "C:\\tools\\cmder\\vendor\\msysgit\\bin\\git.exe clone git://github.com/drewda/cucumber-sublime-bundle.git 'C:\\Users\\IEUser\\AppData\\Roaming\\Sublime Text 2\\Packages\\Cucumber'"
  config.vm.provision "shell", inline: "C:\\tools\\cmder\\vendor\\msysgit\\bin\\git.exe clone https://github.com/twierzchowski/sublime-cucumber-step-finder 'C:\\Users\\IEUser\\AppData\\Roaming\\Sublime Text 2\\Packages\\Cucumber-step-finder'"
  config.vm.provision "shell", inline: "npm install bower -g"
  config.vm.provision "shell", inline: "gem install bundler"
  config.vm.provision "shell", inline: "gem update --system 2.3.0"
  config.vm.provision "shell", inline: "NET USE z:  \\\\vboxsrv\\vagrant"
end
