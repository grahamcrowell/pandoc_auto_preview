# Auto preview latex/markdown on save with VS Code

test

$$
\exp(i\theta)+1=0
$$

very similar to [this walk through](http://thisdavej.com/build-an-amazing-markdown-editor-using-visual-studio-code-and-pandoc/)

## configure build task

- configure build with `tasks.json`:

``` {.json}
{
  // See https://go.microsoft.com/fwlink/?LinkId=733558
  // for the documentation about the tasks.json format
  "version": "2.0.0",
  "tasks": [
    {
      "taskName": "echo",
      "command": "make",
      "type": "process",
      "presentation": {
        "echo": false,
        "reveal": "silent",
        "focus": false,
        "panel": "shared"
      },
      "group": {
        "kind": "build",
        "isDefault": true
      }
    }
  ]
}
```

## pandoc via make

- use `pandoc` with this [`css` style sheet](http://benjam.info/panam/)
- use simple `Makefile` to call `pandoc`

``` {.makefile}
readme.html:readme.md
  pandoc \
  --css=css/style.css -V lang=en -V highlighting-css= \
  --mathjax \
  --smart \
  --to=html5 readme.md -o readme.html
```

## auto refresh preview on build

- use [Live Server extension](https://marketplace.visualstudio.com/items?itemName=ritwickdey.LiveServer) to get a single HTML preview in browser (no duplicates)

## auto build on save

- execute `tasks.json` on each save by adding this to `keybindings.json` in workspace

``` {.json}
[
  {
    "key": "cmd+s",
    "command": "workbench.action.tasks.build"
  }
]
```
