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

To see the bug as it presents itself to a consumer:

```
❯ cd test
❯ swift build
Compile Swift Module 'Test' (1 sources)
/Users/gordon/Code/gfontenot/SwiftPMCaseBug/test/Sources/main.swift:3:1: error: ambiguous use of 'foo()'
foo()
^
Bug.foo:1:13: note: found this candidate
public func foo()
            ^
Bug.foo:1:13: note: found this candidate
public func foo()
            ^
<unknown>:0: error: build had 1 command failures
error: exit(1): /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/swift-build-tool -f /Users/gordon/Code/gfontenot/SwiftPMCaseBug/test/.build/debug.yaml
```
