#Requires AutoHotkey v2.0

#Include ./Yunit/Yunit.ahk
#Include ./Yunit/Junit.ahk
#Include ./YunitExtensions/Assert.ahk
#Include ./YunitExtensions/ResultCounter.ahk
#Include ./YunitExtensions/BetterJUnit.ahk
#Include ./YunitExtensions/DetailedStdOut.ahk

#Include ./GeneratedStructSmoke.test.ahk
#Include ./GeneratedApiSmoke.test.ahk
#Include ./GeneratedComInterfaceSmoke.test.ahk
#Include ./GeneratedConstantSmoke.test.ahk
#Include ./GeneratedWinRTClass.test.ahk

#Include ./CStyleArray.test.ahk
#Include ./Win32Struct.test.ahk
#Include ./Win32Handle.test.ahk
#Include ./Win32ComInterface.test.ahk
#Include ./Win32Enum.test.ahk
#Include ./Guid.test.ahk

#Include ./generator-extensions/RectExtensions.test.ahk
#Include ./generator-extensions/ColorrrefExtensions.test.ahk
#Include ./generator-extensions/BstrExtensions.test.ahk
#Include ./generator-extensions/StringUtils.test.ahk
#Include ./generator-extensions/HStringExtensions.test.ahk

tester := Yunit.Use(DetailedStdOut, BetterJUnit, YunitResultCounter).Test(
    Win32StructTest, 
    GeneratedStructSmokeTests, 
    GeneratedApiSmokeTests,
    GeneratedComInterfaceTests,
    GeneratedConstantSmokeTests,
    GeneratedWinRTClassTests,
    CStyleArrayListTests, 
    Win32HandleTests,
    Win32ComInterfaceTests,
    RectExtensionTests,
    COLROREFExtensionTests,
    BSTRExtensionTests,
    GuidTests,
    Win32EnumTests,
    StringUtilExtensionTests,
    HSTRINGExtensionTests
)

ExitApp(YunitResultCounter.failures == 0? 0 : 1)