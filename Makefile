ARGOS = ~/.config/argos

install:
	cp ./bin/ezt_* $(ARGOS)
	chmod u+x $(ARGOS)/ezt_*
uninstall:
	rm $(ARGOS)/ezt_*

