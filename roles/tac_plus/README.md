Role Name
=========

Deploys tac_plus () on hosts. Currently the only supported deployment model is deployment as podman container

Requirements
------------

* podman
* access to tac_plus image (https://github.com/witcom-gmbh/tac_plus)

Role Variables
--------------

Currentyl available variables and their defaults (see `defaults/main.yml`) are listed here

    tac_plus_instance:

Name of deployed tac_plus instance (required !). Running multiple instances is possible - every instance has to listen to a different port. 

    tac_plus_deployment: "podman"

Deployment mode, current only `podman` is supported

    tac_plus_config_dir: "/etc/tac_plus"

Base directory where tac_plus config is stored on host. The effective configuration directory will be `tac_plus_config_dir/tac_plus_instance` 

    tac_plus_user_config_src: ""

Absolute location of the user-configuration-part of tac_plus (see https://github.com/witcom-gmbh/tac_plus#configuration)


    tac_plus_container_repo: "some-repo.com/org"
    tac_plus_container_image: "tac_plus"
    tac_plus_container_image_version: "alpine-202205051820"

Image-Repository    

    
    tac_plus_listen_port: 49

The port where tac_plus is listening on

    tac_plus_debug_flags: []

String array of debug-flags

tac_plus_ldap_enabled: False
tac_plus_ldap_hosts: []
tac_plus_ldap_base: "dc=some,dc=net"
tac_plus_ldap_bind_user: "lookup@some.net"
tac_plus_ldap_bind_password: "verysecret"
tac_plus_ldap_type: "microsoft"
tac_plus_ldap_ad_group_prefix: "tac123"
tac_plus_ldap_require_ad_group_prefix: True
tac_plus_ldap_use_tls: false

LDAP-Configuration - has been tested with Microsoft Active-Directory. Using TLS with Microsoft AD does not work

Dependencies
------------

* podman_container

Example Playbook
----------------


```
---
---
- name: Test 01
  hosts: all 
  remote_user: "conductor"
  # make sure that not all inctances go offline at the same time ;-)
  serial: 1
  become: yes
  become_method: sudo  
  gather_facts: true
  vars:
    tac_plus_user_config_src: "/workspaces/ansible-network-aaa-collection/tests/tac_user.cfg"
    tac_plus_container_repo: "my-private-repo.org/aaa"
    tac_plus_listen_port: "49"
    tac_plus_instance: prod
    tac_plus_ldap_enabled: True
    tac_plus_ldap_base: "dc=some,dc=org"
    tac_plus_ldap_bind_user: "user@some.org"
    tac_plus_ldap_bind_password: "verysecret"
    tac_plus_ldap_ad_group_prefix: tacacs
    tac_plus_ldap_require_ad_group_prefix: True
    tac_plus_ldap_use_tls: False
    tac_plus_ldap_hosts:
      - x.x.x.y:3268
      - x.x.x.z:3268
  roles:
  - witcom.network_aaa.tac_plus
````

License
-------

BSD

Author Information
------------------

An optional section for the role authors to include contact information, or a website (HTML is not allowed).
