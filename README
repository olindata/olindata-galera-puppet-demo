## Managing MySQL with Puppet

this repository contains the demo files for my presentation on managing MyQSL with Puppet at Percona Live 2014: http://www.percona.com/live/mysql-conference-2014/sessions/managing-mysql-using-puppet

## Setup

In order to set up the machines with vagrant, you'll need a few things:

### VirtualBox
Make sure that in your VirtualBox preferences you have two host-only networks defined, with the following settings (these are set in the Virtualbox preferences, not per-machine. The snippets are a copy paste out fo the global VirtualBox.xml config file on my Mac:

#### Networks

From ~/Library/VirtualBox/VirtualBox.xml:
      <ExtraDataItem name="HostOnly/vboxnet0/IPAddress" value="192.168.56.1"/>
      <ExtraDataItem name="HostOnly/vboxnet0/IPNetMask" value="255.255.255.0"/>
      <ExtraDataItem name="HostOnly/vboxnet0/IPV6NetMask" value="64"/>
      <ExtraDataItem name="HostOnly/vboxnet1/IPAddress" value="192.168.57.1"/>
      <ExtraDataItem name="HostOnly/vboxnet1/IPNetMask" value="255.255.255.0"/>
      <ExtraDataItem name="HostOnly/vboxnet1/IPV6NetMask" value="64"/>

Each of these networks shoudl also have DHCP server enabled. From the config file:

From ~/Library/VirtualBox/VirtualBox.xml:
      <DHCPServers>
        <DHCPServer networkName="HostInterfaceNetworking-vboxnet0" IPAddress="192.168.56.100" networkMask="255.255.255.0" lowerIP="192.168.56.101" upperIP="192.168.56.254" enabled="1"/>
        <DHCPServer networkName="HostInterfaceNetworking-vboxnet1" IPAddress="192.168.57.100" networkMask="255.255.255.0" lowerIP="192.168.57.101" upperIP="192.168.57.254" enabled="1"/>
      </DHCPServers>

#### Puppet master

I didn't create a vagrant setup for the puppet master. Instead:
* Create a vm in VirtualBox (I used CentOS 6.4)
* Install Puppet Enterprise (Puppet Open Source works too, but it lives in a different path so you might need to tweak things here and there). Puppet Enterprise is free for up to 10 nodes.
* clone this repository into /etc/puppetlabs/puppet.



