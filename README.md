# SSCCE for `elm: Map.!` error

This repo demonstrates this ([hopefully-fixed-in-0.19.1](https://github.com/elm/compiler/issues/1851)) issue where the elm compiler sometimes shows this error:

> elm: Map.!: given key is not an element in the map

## Steps to reproduce

Assumes Elm 0.19.0 already installed.

### Get the Code

On a Mac, open `Terminal.app`. (Untested in other environments.)

``` sh
git clone https://github.com/clozach/sscce-for-elm-compiler-issue-1851.git
cd sscce-for-elm-compiler-issue-1851
```

### Compile without `elm-style-animation

``` sh
git checkout tags/noerror
elm make src/Main.elm --debug
open index.html
```

#### Expected

❓Compilation succeeds & index.html shows "Hi 👋🤓"

#### Actual

✅Compilation succeeds & index.html shows "Hi 👋🤓"

### Compile with `elm-style-animation`

``` sh
git checkout tags/error
elm make src/Main.elm --debug
open index.html
```

#### Expected

❓Compilation succeeds & index.html shows "Hi 👋🤓"

#### Actual

❌`elm make` fails & index.html is blank when opened in browser

Error from `elm make src/Main.elm --debug`:

``` sh
Success! Compiled 1 module.
elm: Map.!: given key is not an element in the map
CallStack (from HasCallStack):
  error, called at libraries/containers/Data/Map/Internal.hs:603:17 in containers-0.5.10.2:Data.Map.Internal
```
