/home/savoiringfaire/.bashrc:
  file.managed:
    - user: savoiringfaire
    - group: users
    - mode: 600
    - require:
      - user: savoiringfaire
    - source: salt://opensuse/bashrc
