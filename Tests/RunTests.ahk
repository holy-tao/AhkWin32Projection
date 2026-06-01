#Requires AutoHotkey v2.0

#Include ./Yunit/Yunit.ahk
#Include ./Yunit/Junit.ahk
#Include ./Yunit/Stdout.ahk
#Include ./YunitExtensions/Assert.ahk
#Include ./YunitExtensions/ResultCounter.ahk
#Include ./YunitExtensions/BetterJUnit.ahk

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
#Import "./generator-extensions/ValueAccessorOverrides.test.ahk" { ValueAccessorOverrideTests }

#Import "./HandleOwnership.test.ahk" { HandleOwnershipTests }

#Import "./Vector.test.ahk" { VectorTests }

Yunit.Use(YunitStdOut, BetterJUnit, YunitResultCounter).Test(
    GeneratedStructSmokeTests,
    GeneratedApiSmokeTests,
    GeneratedComInterfaceTests,
    GeneratedConstantSmokeTests,
    CStyleArrayListTests,
    Win32FixedArrayTests,
    Win32HandleTests,
    Win32ComInterfaceTests,
    RectExtensionTests,
    COLROREFExtensionTests,
    BSTRExtensionTests,
    GuidTests,
    Win32EnumTests,
    StringUtilExtensionTests,
    NTSTATUSExtensionTests,
    ValueAccessorOverrideTests,
    HandleOwnershipTests,
    VectorTests
)

ExitApp(YunitResultCounter.failures == 0? 0 : 1)