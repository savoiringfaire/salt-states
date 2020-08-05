/usr/bin/btrbk:
  file.managed:
    - source: https://raw.githubusercontent.com/digint/btrbk/master/btrbk
    - user: root
    - group: root
    - mode: 755
