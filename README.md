# dorfmap backend

The [dorfmap](https://wiki.chaosdorf.de/Lichtsteuerung) backend runs on [Raspbian 9](https://www.raspbian.org/) and can be installed with a debian package that contains all necessary binaries, scripts and configuration files.

## Development environment

Vagrant and VirtualBox required, then run

    $ vagrant up

To build the package

    $ vagrant ssh
    $ cd /vagrant
    $ gbp buildpackage -us -uc

When the build has finished, the package can be found at `/`.
