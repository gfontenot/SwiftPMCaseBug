Sample library demonstrating a bug in `swift build`


```
❯ tree Sources
Sources
└── Bug
    ├── Bar
    │   └── Foo.swift
    └── Foo
        └── Foo.swift

3 directories, 2 files
❯ swift build
Compile Swift Module 'Bug' (2 sources)
<unknown>:0: error: filename "Foo.swift" used twice: '/Users/gordon/Code/gfontenot/SwiftPMCaseBug/Sources/Bug/Bar/Foo.swift' and '/Users/gordon/Code/gfontenot/SwiftPMCaseBug/Sources/Bug/Foo/Foo.swift'
<unknown>:0: note: filenames are used to distinguish private declarations with the same name
<unknown>:0: error: build had 1 command failures
error: exit(1): /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/swift-build-tool -f /Users/gordon/Code/gfontenot/SwiftPMCaseBug/.build/debug.yaml
❯ mv Sources/Bug/Bar/Foo.swift Sources/Bug/Bar/foo.swift
❯ tree Sources
Sources
└── Bug
    ├── Bar
    │   └── foo.swift
    └── Foo
        └── Foo.swift

3 directories, 2 files
❯ swift build
Compile Swift Module 'Bug' (2 sources)
❯
```
