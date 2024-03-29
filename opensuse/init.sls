root:
  user.present
  
include:
  - opensuse.shell

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

/home/savoiringfaire/.ssh/authorized_keys:
  file.managed:
    - user: savoiringfaire
    - group: users
    - mode: 600
    - makedirs: true
    - contents:
      - ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIBMpDh+3HjaZIlrwlePaACyVpa9z9YyFRWEvC+IXPaJv
      - ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGcRlbfcbna6YXmGV6CFHF17MoveyjIkWv3fZztfcURi
    - require:
      - user: savoiringfaire

/etc/sudoers.d/savoiringfaire:
  file.managed:
    - mode: 600
    - contents:
      - 'savoiringfaire ALL=(ALL) NOPASSWD: ALL'
    - require:
      - user: savoiringfaire

myopensuse.packages:
  pkg.installed:
    - pkgs:
      - htop
      - screen
      - git-core
      - zsh
      - csync
      - libcsync-plugin-sftp
      - scout-command-not-found
      - salt-zsh-completion
      - no-more-secrets
      - screenfetch
