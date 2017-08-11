
index.html:readme.md target.md
	pandoc \
	--smart \
	--table-of-contents \
	--css=http://b.enjam.info/panam/styling.css -V lang=en -V highlighting-css= \
	--to=html5 readme.md target.md -o index.html