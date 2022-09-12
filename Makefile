SCRIPTS := interface_ip.5s.sh target_ping.5s.sh
ARGOS = ~/.config/argos

install:
	cp ./bin/ezt_* $(ARGOS)
	chmod u+x $(ARGOS)/ezt_*
uninstall:
	rm $(ARGOS)/ezt_*

