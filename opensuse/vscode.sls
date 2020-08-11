vscode.repo:
  pkgrepo.managed:
    - humanname: VSCode Repository
    - baseurl: https://packages.microsoft.com/yumrepos/vscode
    - gpgcheck: 0


vscode.packages:
  pkg.installed:
    - pkgs:
      - code
