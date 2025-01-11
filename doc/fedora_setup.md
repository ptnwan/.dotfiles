# Fedora WSL setup

> #! info
> I would like to use Windows Powershell 7 in tandem with Windows Terminal but you could use Command Prompt for this.

## 1. Install WSL 2

To check if you are running WSL 2, try :
```
wsl --set-default-version 2
```
The command will set the default version to WSL 2, or fail if you still on the WSL 1.

## 2. Get a rootfs image of Fedora

### 2.1 From Fedora Container base

The `rootfs` embedded in the [Fedora Container Base](https://koji.fedoraproject.org/koji/packageinfo?packageID=26387) project. To get the rootfs, follow:

1. Pick the Fedora version that you want.
2. Find the right `.xz` file corresponding to your platform (such as `x84_64`). The file would look like `Fedora-Container-Base-<version>.<platform>.tar.xz`.
3. Unpack the `Fedora-Container-Base-*.tar.xz` file to get `.tar` file (you might try 7-zip for this).
4. Extract the content of `.tar` file, you would find a folder with a long hexadecimal name.
5. A `layer.tar` file would locates within that folder. This would be the **rootfs**.

## 2.2 From docker-brew-fedora project

Another source is the [docker-brew-fedora](https://github.com/fedora-cloud/docker-brew-fedora) project.

To download the `rootfs`:

1. Select your desired Fedora version from the active branches. For example, for the Fedora 40, you should looking for branch `40`.
2. You can find the `.tar` file inside the corresponding platform folder. This file would be your `rootfs`. If your find the `.tar.xz`, you might extract it the get the `.tar` file.

## 3. Make a folder for your WSL distro

First, let create a folder your WSL distro. I would like to use `wsl` in my home directory, so I would create a sub-folder inside `wsl` called `fedora`.
```powershell
mkdir $HOME\wsl\fedora
```
for your reference
```powershell
mkdir <path-to-your-directory>
```
replace `<path-to-your-directory>` with the path your desired directory.

## 4. Install a new WSL Fedora distro

In Powershell, assume that you name the distro "fedora", the installing folder is `$HOME\wsl\fedora` and the `rootfs` file named `fedora-rootfs.tar` is in Downloads, then:
```powershell
wsl --import fedora $HOME\wsl\fedora $HOME\Downloads\fedora-rootfs.tar
```
In general, it would be:
```powershell
wsl --import <distro-name> <installing-directory> <path-to-rootfs>
```

## 5. View installed distros

To view what distros have been installed, you could use:
```powershell
wsl -l
```

## 6. Laucnh Fedora as `root`

As default, when you run Fedora for the first time, you would be sign in as root. To run Fedora, try:
```powershell
wsl -d fedora
```
or 
```powershell
wsl
```
if Fedora is the default.

If you have multiple distros installed, you might want to set Fedora as the default with
```powershell
wsl -s fedora
```

## 7. Configure DNS (skip this section if network is working well)

Let try to upgrade the system package to if it work
```powershell
dnf upgrade
```
if it work, then you can skip this section.

If it run into some problem, let try to configure the DNS manually.

1. Create a new `wsl.conf` file and disable auto-generation of `resolv.conf`
```powershell
echo -e "[network]\ngenerateResolvConf = false" > /etc/wsl.conf
```
2. Exit WSL and then terminate it
```powershell
exit
wsl -t fedora
```
3. Then enter WSL again
```powershell
wsl -d fedora
```
4. Unlink the `/etc/resolv.conf` file and create a new one
```powershell
unlink /etc/resolv.conf
echo nameserver 1.1.1.1 > /etc/resolv.conf
```
5. Let try to upgrade the system
```powershell
dnf upgrade
```

## 8. Missing the `mount command`

If at the entry to your new Fedora, you are greeted with `An error occurred mounting one of your file systems`, then you are missing 'util-linux' package which contain `mount` and other essential commands.

If your need to mount, then install `util-linu` (or if you want minimal system, just install `util-linux-core`)
```powershell
dnf install -y util-linux
```
Then exit and terminate Fedora before launch again (restart)
```powershell
exit
wsl -t fedora
```

## 9. Launch Fedora as an unprivileged user

`root` user should never be the default user so let's create a normal user.

We would need `passwd` and `cracklib-dicts` for password checking so you have to install both after you launched Fedora.
```powershell
dnf install -y passwd cracklib-dicts
```

Now, create a new user, add them to the `wheel` group so that the user can use `sudo`:
```powershell
useradd -G whell <username>
```
replace `<username>` with your user name.

Then create password for that user:
```powershell
passwd <username>
```

Now, exit Fedora and launch it with the new username:
```powershell
wsl -d fedora -u <username>
```

Let check if you log in with new username
```
whoami
```

Check if `sudo` work
```
sudo cat /etc/shadow
```

## 10. Set the default user

It would be convinient to enter your Fedora as user you just created
```
printf "\n[user]\ndefault = <username>\n" | sudo tee -a /etc/wsl.conf
```
then exit and terminate Fedora
```
exit
wsl -t fedora
```

Launch WSL again without specifying a user, you should be that user, not root
```
wsl -d fedora
```

Basically, you are done installing new Fedora and it is ready to use.
