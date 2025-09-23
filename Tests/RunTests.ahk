#Requires AutoHotkey v2.0

#Include ./Yunit/Yunit.ahk
#Include ./Yunit/Junit.ahk
#Include ./Yunit/Stdout.ahk
#Include ./YunitExtensions/Assert.ahk
#Include ./YunitExtensions/ResultCounter.ahk

#Include ./Win32Struct.test.ahk
#Include ./GeneratedStructSmokeTests.ahk

tester := Yunit.Use(YunitStdOut, YunitJUnit, YunitResultCounter)
tester.Test(Win32StructTest, GeneratedStructSmokeTests)

ExitApp(YunitResultCounter.failures == 0? 0 : 1)