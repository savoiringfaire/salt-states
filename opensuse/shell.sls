/home/savoiringfaire/.bashrc:
  file.managed:
    - user: savoiringfaire
    - group: users
    - mode: 644
    - require:
      - user: savoiringfaire
    - source: salt://opensuse/bashrc

/home/savoiringfaire/.alias:
  file.managed:
    - user: savoiringfaire
    - group: users
    - mode: 644
    - require:
      - user: savoiringfaire
    - source: salt://opensuse/alias
