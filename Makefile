SRC     = src
DIST    = dist
PORT    = 8010
JEMDOC  = python3 jemdoc
CONF    = mysite.conf
SOURCES = index.jemdoc pub.jemdoc about.jemdoc
ASSETS  = jemdoc.css images files

.PHONY: all serve clean

# Build the site into $(DIST): HTML from the .jemdoc sources, plus static assets.
# Only $(DIST) is deployed, so the sources never become publicly accessible.
all:
	mkdir -p $(DIST)
	cd $(SRC) && $(JEMDOC) -c $(CONF) -o ../$(DIST)/ $(SOURCES)
	cd $(SRC) && cp -R $(ASSETS) ../$(DIST)/

# Build, then preview locally at http://localhost:$(PORT)
serve: all
	cd $(DIST) && python3 -m http.server $(PORT)

clean:
	rm -rf $(DIST)
