/usr/local/bin/btrbk:
  file.managed:
    - source: https://raw.githubusercontent.com/digint/btrbk/v0.29.1/btrbk
    - source_hash: b302bd6fdef3d8dfe801b5c77fd9d8f461187725c6cccc4495d3c471e6a6b149
    - user: root
    - group: root
    - mode: 755
