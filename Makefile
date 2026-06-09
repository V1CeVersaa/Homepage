SRC     = src
PORT    = 8010
JEMDOC  = python3 jemdoc
CONF    = mysite.conf
SOURCES = index.jemdoc pub.jemdoc about.jemdoc
OUTPUTS = $(SOURCES:.jemdoc=.html)

.PHONY: all serve clean

# Regenerate all HTML pages from the .jemdoc sources (inside src/).
all:
	cd $(SRC) && $(JEMDOC) -c $(CONF) $(SOURCES)

# Build, then preview locally at http://localhost:$(PORT)
serve: all
	cd $(SRC) && python3 -m http.server $(PORT)

clean:
	cd $(SRC) && rm -f $(OUTPUTS)
