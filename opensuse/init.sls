root:
  user.present

savoiringfaire:
  user.present:
    - fullname: Savoir Faire
    - home: /home/savoiringfaire

/home/savoiringfaire/.ssh/config:
  file.managed:
    - user: savoiringfaire
    - group: users
    - mode: 600
    - makedirs: true
    - contents:
      - Host darlene.hhra.uk
      - Port 8282
    - require:
      - user: savoiringfaire

/etc/sudoers.d/savoiringfaire:
  file.managed:
    - mode: 600
    - contents:
      - 'savoiringfaire ALL=(ALL) NOPASSWD: ALL'
    - require:
      - user: savoiringfaire
