#puppet-vim

####Table of Contents

1. [Overview](#overview)
2. [Module Description](#module-description)
3. [Setup](#setup)
    * [What Vim affects](#what-vim-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with Vim](#beginning-with-Vim)
4. [Usage](#usage)
5. [Limitations](#limitations)
6. [TODOs](#TODOs)

##Overview

This small vim module installs and configures vim.

Written for Puppet >= 3.4.0.

##Module Description

See [Overview](#overview) for now.

##Setup

###What Vim affects

* vim :-) 

###Setup Requirements

Nothing special.
	
###Beginning with Vim	

Simply include it.

##Usage

Just include the module by 

```puppet
include vim
```

##Limitations:

Debian like systems. 
Tested on:

* Debian 7
* CentOs 6

Puppet Version >= 3.4.0, due to specific hiera usage.

##TODOs:

* make it work with puppet pre 3.4 
