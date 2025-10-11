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
#Include ./GuidTest.ahk

tester := Yunit.Use(YunitStdOut, BetterJUnit, YunitResultCounter)
tester.Test(Win32StructTest, GeneratedStructSmokeTests, GeneratedApiSmokeTests, CStyleArrayListTests, GuidTests)

ExitApp(YunitResultCounter.failures == 0? 0 : 1)