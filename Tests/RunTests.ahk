#Requires AutoHotkey v2.0

#Import "./Yunit/Yunit.ahk" { Yunit }
#Import "./Yunit/Stdout.ahk" { YunitStdOut }
#Import "./YunitExtensions/ResultCounter.ahk" { YunitResultCounter }
#Import "./YunitExtensions/BetterJUnit.ahk" { BetterJUnit }

#Import "./GeneratedStructSmoke.test.ahk" { GeneratedStructSmokeTests }
#Import "./GeneratedApiSmoke.test.ahk" { GeneratedApiSmokeTests }
#Import "./GeneratedComInterfaceSmoke.test.ahk" { GeneratedComInterfaceTests }
#Import "./GeneratedConstantSmoke.test.ahk" { GeneratedConstantSmokeTests }
#Import "./Win32ComInterface.test.ahk" { Win32ComInterfaceTests }
#Import "./generator-extensions/RectExtensions.test.ahk" { RectExtensionTests }
#Import "./generator-extensions/ColorrrefExtensions.test.ahk" { COLROREFExtensionTests }
#Import "./generator-extensions/BstrExtensions.test.ahk" { BSTRExtensionTests }
#Import "./generator-extensions/StringUtils.test.ahk" { StringUtilExtensionTests }
#Import "./generator-extensions/NTSTATUSExtensions.test.ahk" { NTSTATUSExtensionTests }

#Import "./Vector.test.ahk" { VectorTests }

Yunit.Use(YunitStdOut, BetterJUnit, YunitResultCounter).Test(
    GeneratedStructSmokeTests,
    GeneratedApiSmokeTests,
    GeneratedComInterfaceTests,
    GeneratedConstantSmokeTests,
    Win32ComInterfaceTests,
    RectExtensionTests,
    COLROREFExtensionTests,
    BSTRExtensionTests,
    StringUtilExtensionTests,
    NTSTATUSExtensionTests,
    VectorTests
)

ExitApp(YunitResultCounter.failures == 0? 0 : 1)