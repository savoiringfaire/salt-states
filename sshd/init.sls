/etc/ssh/sshd_config:
  file.managed:
    - source: salt://sshd/sshd_config

sshd:
  service.running:
    - enable: True
    - reload: True
    - watch:
      - file: /etc/ssh/sshd_config
   
# MicroOS Doesn't have firewalld.
{% if grains['oscodename'] != "openSUSE MicroOS" %}
custom_ssh:
  firewalld.service:
    - name: custom_ssh
    - ports:
      - 8282/tcp
      
public:
  firewalld.present:
    - name: public
    - services:
      - custom_ssh
    - require:
      - user: savoiringfaire
      - firewalld: custom_ssh
{% endif %}

? AAAAB3NzaC1yc2EAAAADAQABAAACAQDItyt81qjWT6FpKBuewQAavXZZC9bAM1f5jcwq54cccrF5kPgqeHqj/XcmlJuAagcJWhKXFMDjs68IYucKjFnt94/c1OCx9U5lQyo0CZsMAUi36Qex77P59hjAGYTwuUsTlnqg4KrGRsof2g+RawT/PbSJ9H9SSMQZlMMRywKGgXQzjehZ5NZDEV6w3juwvU50ZtsRfq2LaMa9jrbZ7ssu22vzHfmYm1sWzXuSz9axyDSrw6Fx770yoHEc01CohvztjDiTeDDJvi8fFCNPlcZU34YqGxT1W5Aii05IOpOTsL+5thjgfBuo38+hIkPrIi3Wm4rPQwFMpRrarYsFxFCm20sf11dZA9mkKqMQLZ3sYed57fvYs/EAd5W1YTVMzGWAqObJ7cLJJSJ52FskSqv9AhWrs5FHQSB0FGLMF791/6UxmJ1Ro0y0tJxqo25E1SbfhS+CAAGXMKC2e4hR45Wydoo2K2ASzvtEimHvCkFrWk6KTgi1TLbOnAO6NUwBFbUzvpMr8waov0PxRLkV/BNIsGWLuJ5JVRN//oUJ4TWamOkXL0KHtuXgpDmd1UTwuLs5LoMa1nsolajKIcZ7Vjz8b4lW2ISHswFAmjakdFvINQPoP+iTb/87BhuF17PufSp4ic6QcRxTy0O3kzBR6iWGPwmAl3ngP0P0hG8ToNiezw==
:
  ssh_auth.present:
    - user: savoiringfaire
    - enc: ssh-rsa
    - comment: marcus@hhra.uk
