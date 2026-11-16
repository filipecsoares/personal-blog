.PHONY: run build clean new-post update-theme

run:
	hugo server --disableFastRender -D

build:
	hugo --minify

clean:
	rm -rf public resources/_gen

new-post:
	@test -n "$(name)" || (echo "Usage: make new-post name=my-post-slug" && exit 1)
	hugo new content/posts/$(name).md

update-theme:
	git submodule update --remote --merge themes/typo
