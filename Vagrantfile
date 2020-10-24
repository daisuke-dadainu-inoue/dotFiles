Vagrant.configure("2") do |config|
  config.vm.box = "centos/7"

  config.vm.network "forwarded_port", guest: 80, host: 10080
  config.vm.network "forwarded_port", guest: 3306, host: 13306
  config.vm.network "forwarded_port", guest: 5000, host: 10500

  config.vm.network "private_network", ip: "192.168.33.10"

  config.vm.synced_folder "./data", "/vagrant/data"

  config.vm.provider "virtualbox" do |vb|
    vb.name = "devcentos"
    vb.memory = "4096"

    vb.customize [
      "modifyvm" , :id,
      "--cpus", "2",
      "--chipset", "ich9",
      "--vram", "256",
      "--accelerate3d", "on",
      "--hwvirtex", "on",
      "--nestedpaging", "on",
      "--largepages", "on",
      "--ioapic", "on",
      "--pae", "on",
      "--paravirtprovider", "kvm",
      "--clipboard-mode", "bidirectional",
      "--draganddrop", "bidirectional",
      "--monitorcount", "1",
      "--nictype1", "virtio",
      "--nictype2", "virtio",
    ]
  end

  if Vagrant.has_plugin?("vagrant-vbguest")
    config.vbguest.auto_update = true
  end

  config.vm.provision "docker" do |d|
    d.pull_images "mariadb/server:10.1"
    d.run "mariadb/server:10.1", args: "--name=dev-db -d -p 3306:3306 -v /vagrant/db/mariadb:/etc/mysql/conf.d -eMARIADB_ROOT_PASSWORD=password -eMARIADB_USER=hoge -eMARIADB_PASSWORD=hoge -eMARIADB_DATABASE=hoge"
    d.pull_images "mysql"
    d.run "mysql", args: "--name=dev-db-fuga -d -p 3307:3306 -v /vagrant/db/mysql/:/etc/mysql/conf.d -e MYSQL_ROOT_PASSWORD=password -e MYSQL_USER=fuga -e MYSQL_PASSWORD=fuga -e MYSQL_DATABASE=fuga"
  end

  config.vm.provision "shell", path: "init.sh", privileged: false

end
