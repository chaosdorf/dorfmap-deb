from __future__ import with_statement
from fabric.api import *
from fabric.contrib.files import exists

import os
from StringIO import StringIO

env.hosts = ['root@172.22.26.7']

env.shell = '/bin/sh -c'

def pre_cmd():
    run('mount -o remount,rw /')

def post_cmd():
    run('mount -o remount,ro /')

def etckeeper_check():
    run('etckeeper pre-install')

def etckeeper_commit(message):
    run('if etckeeper unclean; then etckeeper commit "%s"; fi' % message)

def etckeeper_done():
    run('etckeeper post-install')

def deploy(version):
    pre_cmd()
    etckeeper_check()
    put("../dorfmap-deb_%s_all.deb" % version, '/root/', use_sudo=True)
    run("dpkg --install /root/dorfmap-deb_%s_all.deb" % version)
    run("rm /root/dorfmap-deb_%s_all.deb" % version)

    etckeeper_done()
    post_cmd()
