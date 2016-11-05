.PHONY: build slides shell

build:
	@docker build --rm -t lballabio/revealjs:test .

slides: build
	@docker run -it --rm \
		-p 8000:8000 \
		lballabio/revealjs:test

dev: build
	echo $(shell pwd)
	@docker run -it --rm \
		-p 8000:8000 \
		-v "$(shell pwd)"/slides.md:/revealjs/md/slides.md \
		-v "$(shell pwd)"/images:/revealjs/images \
		-v "$(shell pwd)"/custom.css:/revealjs/css/custom.css \
		lballabio/revealjs:test

shell:
	@docker run -it --rm \
		-p 8000:8000 \
		fschl/revealjs \
		/bin/bash
