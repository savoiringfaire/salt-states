/var/opt/bitwarden:
  file.directory:
    - user: root
    - group: root
    - makedirs: true

/var/opt/bitwarden/data:
  file.directory:
    - user: root
    - group: root
    - makedirs: true
    - require:
      - file: /var/opt/bitwarden

/etc/systemd/system/bitwarden.service:
  file.managed:
    - user: root
    - group: root
    - mode: 644
    - source: salt://opensuse/containerhost/bitwarden/bitwarden.service


bitwarden.service:
  service.running:
    - enable: True
    - require:
      - file: /etc/systemd/system/bitwarden.service
      - file: /var/opt/bitwarden/data
