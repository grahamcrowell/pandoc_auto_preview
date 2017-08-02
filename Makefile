
readme.html:readme.md
	pandoc \
	--css=css/style.css -V lang=en -V highlighting-css= \
	--mathjax \
	--smart \
	--to=html5 readme.md -o readme.html