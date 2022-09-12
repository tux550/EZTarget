SCRIPTS := interface_ip.5s.sh target_ping.5s.sh
ARGOS = ~/.config/argos

install:
	cp ./bin/ezt_* $(ARGOS)
uninstall:
	rm $(ARGOS)/ezt_*

