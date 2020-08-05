/var/opt/salt-master:
  file.directory:
    - user: root
    - group: 485
    - makedirs: true

/etc/systemd/system/salt-master.service:
  file.managed:
    - user: root
    - group: root
    - mode: 644
    - source: salt://hhra/containerhost/darlene/salt-master.service

salt-master.service:
  service.running:
    - enable: True
    - require:
      - file: /etc/systemd/system/salt-master.service
