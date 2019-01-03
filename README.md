# SSCCE for this error:
> elm: Map.!: given key is not an element in the map

I first encountered the "not an element in the map" error while attempting to work with `mdgriffith/elm-style-animation`. Google got me to the [Meta issue](https://github.com/elm/compiler/issues/1851), at which point I decided to try a few different things in hopes of getting some sort of triangulation on the problem. In the end, I explored 4 scenarios with 2 different versions of _Main.elm_:

### Without `elm-style-animation`

```
git checkout tags/noerror
```

 | Scenario | Result
-|---------|--------
1| `elm reactor` (browse to src/Main.elm)                                                                  |  ✅ No error.
2| `elm make src/Main.elm` then `open index.html`                                                          |  ✅ No error.
3| Parcel (see below)                                                                                      |  ✅ No error.
4| Paste _Main.elm_ into Ellie ([demo](https://ellie-app.com/4mrN7hymNKja1)) |  ✅ No error.

### With `elm-style-animation`

```
git checkout tags/error
```

 | Scenario | Result
-|---------|--------
1| `elm reactor` (browse to src/Main.elm)                                                                 |  ✅ No error.
2| `elm make src/Main.elm` then `open index.html`                                                         |  ✅ No error.
3| Parcel (see below)                                                        |  ❌ Error: `elm: Map.!: given key is not an element in the map`
4| `git checkout tags/error` + paste _Main.elm_ into Ellie ([demo](https://ellie-app.com/4mrN7hymNKja1))  |  ❌ Error: `Uncaught ReferenceError: Elm is not defined`

---

## Reproducing the error with [Parcel](https://parceljs.org/) (Scenario 3)

First verify that Parcel works fine before we bring in the animation library:

1. `git checkout tags/noerror`
2. `npx parcel src/index.html`
3. Open http://localhost:1234

  ** ✅ No error. **

4. `git checkout tags/error`

  ** ❌ Error: **

        Server running at http://localhost:1234
        🚨  /Users/c/git/cv/src/Main.elm: Compilation failed
        Success! Compiled 1 module.                                          
        elm: Map.!: given key is not an element in the map
        CallStack (from HasCallStack):
          error, called at libraries/containers/Data/Map/Internal.hs:603:17 in containers-0.5.10.2:Data.Map.Internal

        Success! Compiled 1 module.                                          
        elm: Map.!: given key is not an element in the map
        CallStack (from HasCallStack):
          error, called at libraries/containers/Data/Map/Internal.hs:603:17 in containers-0.5.10.2:Data.Map.Internal

            at ChildProcess.<anonymous> (/Users/c/git/cv/node_modules/node-elm-compiler/index.js:149:27)
            at ChildProcess.emit (events.js:182:13)
            at maybeClose (internal/child_process.js:978:16)
            at Process.ChildProcess._handle.onexit (internal/child_process.js:265:5)
