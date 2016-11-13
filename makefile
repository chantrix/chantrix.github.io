CHANTRIX_PATH=~/prj/chantrix

default: \
   docs/codox/index.html \
   docs/marginalia/uberdoc.html \
   deploy

clean:
	rm -r docs/codox
	rm -r docs/marginalia

docs/codox/index.html: $(CHANTRIX_PATH)/project.clj
	mkdir -p docs/codox
	(cd $(CHANTRIX_PATH); lein codox)
	cp -R $(CHANTRIX_PATH)/target/doc/* docs/codox

docs/marginalia/uberdoc.html: $(CHANTRIX_PATH)/project.clj
	mkdir -p docs/marginalia
	(cd $(CHANTRIX_PATH); lein marg -d target)
	cp -R $(CHANTRIX_PATH)/target/uberdoc.html docs/marginalia
