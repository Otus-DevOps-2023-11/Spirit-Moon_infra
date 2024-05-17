# Spirit-Moon_infra
Spirit-Moon Infra repository

HW 3
1. Для подключения одной командой можно использовать jump сервер пример: ssh -A -J appuser@public_ip appuser@internal_ip
2. Чтобы подключаться короткой командой ssh someinternalhost необходимо внести в файл ~/.ssh/config следующие строки
Host someinternalhost
    HostName private_ip
    User appuser
    ProxyJump appuser@public_ip
    IdentityFile ~/.ssh/appuser

Данные для подключения
bastion_IP = 130.193.38.29
someinternalhost_IP = 10.128.0.5
