# Ansible Collection - witcom.network_aaa

## Installation

Collections & Rollen in das Playbook-Verzeichnis installieren, d.h in ansible.cfg wird folgende Konfiguration benötigt

```
[defaults]

....

# Installs collections into [current dir]/ansible_collections/namespace/collection_name
collections_paths = ./
# Installs roles into [current dir]/roles/namespace.rolename
roles_path = ./roles

....

```

Installieren mit 

`ansible-galaxy collection install https://github.com/witcom-gmbh/ansible-network-aaa-collection/releases/download/vRELEASE/witcom-witcom_mrtg-RELEASE.tar.gz --force`


## Anpassungen
Nicht in main - Branch.

- Neue Branch erstellen
- Anpassen, testen, etc.
- Wenn es passt -> commit (single commit, signed-off), PR erstellen

PR muss genehmigt werden, dann

- Release-Version in Datei release.version anpassen (SemVer)
- CHANGELOG.md anpassen (https://keepachangelog.com/en/1.0.0/),
- `make release_prepare`
- Commit in main
- dann wird automatisch mittels GitHub Action ein Release (.tar.gz) erzeugt. Ein Build erfolgt nur wenn die Datei release.version angepasst wurde.
