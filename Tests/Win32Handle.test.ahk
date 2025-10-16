#Requires AutoHotkey v2.0

#Include ./Yunit/Yunit.ahk
#Include ./YunitExtensions/Assert.ahk

#Include ../Win32Handle.ahk
#Include ../Windows/Win32/Foundation/HGLOBAL.ahk
#Include ../Windows/Win32/Foundation/HWND.ahk

class Win32HandleTests {

    Constructor_Always_SetsOwned(){
        ; Smoke test that the two-parameter constructor always works

        YUnit.Assert(HWND().owned)
        YUnit.Assert(HWND(0, false).owned == false)
    }

    Invalid_WithInvalidValues_ReturnsInvalidHandle(){
        test := HGLOBAL.Invalid()

        Assert.IsType(test, HGLOBAL)
        YUnit.Assert(test.valid == false, "Expected IsValid to be false but it was " . test.valid)
    }

    Invalid_WithNoInvalidValues_SetsHandleTo0(){
        test := HWND.Invalid()

        Assert.IsType(test, HWND)
        Yunit.Assert((val := test.Value) == 0, Format("Expected 0 but got {1}", val))
    }

}