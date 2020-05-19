#!/bin/bash

rm -rf build
mkdir build

/usr/bin/swiftc -whole-module-optimization -module-name library -Onone \
-sdk /Applications/Xcode.11.2.1.11B500.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.15.sdk/ \
-target x86_64-apple-macosx10.10 -swift-version 5 -enable-library-evolution -c -parse-as-library library/Printer.swift \
-o build/library.o -emit-module -emit-module-path build/library.swiftmodule


/usr/bin/swiftc -whole-module-optimization -Onone \
-I build/ \
-sdk /Applications/Xcode.11.2.1.11B500.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.15.sdk/ \
-target x86_64-apple-macosx10.10 -swift-version 5 -c main/Main.swift -o build/main.o


xcrun --sdk macosx ld \
-L/usr/lib/swift \
-L/Applications/Xcode.11.2.1.11B500.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/macosx/ \
-lswiftCompatibility50 -lpthread -rpath /usr/lib/swift \
build/library.o build/main.o -o build/main
