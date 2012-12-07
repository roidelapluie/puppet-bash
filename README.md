Puppet module to manage PS1 prompt
===

The initial goal of this module is to manage PS1 prompt of bash shell, in order to change the hostname by the FQDN.

How it works
---

This module adds a '/etc/profile.d/PS1.sh' script wich contains the right PS1.

Supported platforms
---

* Centos
* Debian (partial support, see below)

Problems
---

\H in the PS1 prompt prints the hostname instead of the FQDN on some hosts. This is due to /etc/hostname or /etc/sysconfig/network configuration.

We use $::fqdn instead.

Tricks about Debian
---

The PS1 is defined inside each user's bashrc. I don't want to overwrite the bashrc in the skeleton directory, so until I find a beter solution, the FQDN is printed only for the root user.

Usage
---

```puppet
class{
  'bash':
    show_fqdn => true,
}
```
