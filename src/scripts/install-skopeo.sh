sudo sh -c "echo 'deb http://download.opensuse.org/repositories/devel:/kubic:/libcontainers:/stable/xUbuntu_"$(lsb_release -rs)"/ /' > /etc/apt/sources.list.d/devel:kubic:libcontainers:stable.list"
curl -L https://download.opensuse.org/repositories/devel:kubic:libcontainers:stable/xUbuntu_"$(lsb_release -rs)"/Release.key | sudo apt-key add -
sudo apt-get update
sudo apt-get install skopeo