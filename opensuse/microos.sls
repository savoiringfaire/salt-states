include:
  - opensuse

/etc/salt/minion.d/transactional_update:
  file.managed:
    - user: root
    - group: root
    - mode: 600
    - makedirs: true
    - source: salt://opensuse/transactional_update
