#Requires AutoHotkey v2.0

#Include ./Yunit/Yunit.ahk
#Include ./Yunit/Junit.ahk
#Include ./Yunit/Stdout.ahk
#Include ./YunitExtensions/Assert.ahk
#Include ./YunitExtensions/ResultCounter.ahk
#Include ./YunitExtensions/BetterJUnit.ahk

#Include ./Win32Struct.test.ahk
#Include ./GeneratedStructSmokeTests.ahk
#Include ./GeneratedApiSmokeTests.ahk
#Include ./CStyleArrayTests.ahk
#Include ./Win32Handle.test.ahk
#Include ./generator-extensions/RectExtensions.test.ahk
#Include ./generator-extensions/ColorrrefExtensions.test.ahk
#Include ./generator-extensions/BstrExtensions.test.ahk

tester := Yunit.Use(YunitStdOut, BetterJUnit, YunitResultCounter).Test(
    Win32StructTest, 
    GeneratedStructSmokeTests, 
    GeneratedApiSmokeTests, 
    CStyleArrayListTests, 
    Win32HandleTests,
    RectExtensionTests,
    COLROREFExtensionTests,
    BSTRExtensionTests)

ExitApp(YunitResultCounter.failures == 0? 0 : 1)