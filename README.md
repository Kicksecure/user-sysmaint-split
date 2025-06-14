# Role-Based Boot Modes - user versus sysmaint #

Adds a GRUB boot menu entry:
"PERSISTENT Mode | SYSMAINT Session | system maintenance tasks"

Makes Privilege Escalation Tools (such as 'sudo', 'su', 'pkexec')
inaccessible to limited user accounts such as account "user".

Adds kernel parameter "boot-role=sysmaint" and
"systemd.unit=sysmaint-boot.target".

## How to install `user-sysmaint-split` using apt-get ##

1\. Download the APT Signing Key.

```
wget https://www.kicksecure.com/keys/derivative.asc
```

Users can [check the Signing Key](https://www.kicksecure.com/wiki/Signing_Key) for better security.

2\. Add the APT Signing Key.

```
sudo cp ~/derivative.asc /usr/share/keyrings/derivative.asc
```

3\. Add the derivative repository.

```
echo "deb [signed-by=/usr/share/keyrings/derivative.asc] https://deb.kicksecure.com bookworm main contrib non-free" | sudo tee /etc/apt/sources.list.d/derivative.list
```

4\. Update your package lists.

```
sudo apt-get update
```

5\. Install `user-sysmaint-split`.

```
sudo apt-get install user-sysmaint-split
```

## How to Build deb Package from Source Code ##

Can be build using standard Debian package build tools such as:

```
dpkg-buildpackage -b
```

See instructions.

NOTE: Replace `generic-package` with the actual name of this package `user-sysmaint-split`.

* **A)** [easy](https://www.kicksecure.com/wiki/Dev/Build_Documentation/generic-package/easy), _OR_
* **B)** [including verifying software signatures](https://www.kicksecure.com/wiki/Dev/Build_Documentation/generic-package)

## Contact ##

* [Free Forum Support](https://forums.kicksecure.com)
* [Premium Support](https://www.kicksecure.com/wiki/Premium_Support)

## Donate ##

`user-sysmaint-split` requires [donations](https://www.kicksecure.com/wiki/Donate) to stay alive!
