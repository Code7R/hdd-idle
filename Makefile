PREFIX ?= /usr/local

install:
	install hdd-idle $(PREFIX)/sbin/
	install -m 644 -D hdd-idle.service $(PREFIX)/lib/systemd/system/hdd-idle.service
	sed -e s,/usr/local,$(PREFIX),g -i $(PREFIX)/lib/systemd/system/hdd-idle.service
	-systemctl daemon-reload
	-systemctl enable hdd-idle
	-systemctl restart hdd-idle
	-systemctl --no-pager status hdd-idle
