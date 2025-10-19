#Requires AutoHotkey v2.0

#Include ../Yunit/Yunit.ahk
#Include ../YunitExtensions/Assert.ahk

#Include ../../Windows/Win32/Foundation/COLORREF.ahk

class COLROREFExtensionTests {

    GetRed_Always_GetsRedPart(){
        Assert.Equals(COLORREF.GetRed(0x00112233), 0x33)
        Assert.Equals(COLORREF.GetRed(0x001122FF), 0xFF)
        Assert.Equals(COLORREF.GetRed(0x00112242), 0x42)
        Assert.Equals(COLORREF.GetRed(0), 0)
    }

    GetGreen_Always_GetsGreenPart(){
        Assert.Equals(COLORREF.GetGreen(0x00112233), 0x22)
        Assert.Equals(COLORREF.GetGreen(0x0011FF00), 0xFF)
        Assert.Equals(COLORREF.GetGreen(0x00114222), 0x42)
        Assert.Equals(COLORREF.GetGreen(0), 0)
    }

    GetBlue_Always_GetsBluePart(){
        Assert.Equals(COLORREF.GetBlue(0x00112233), 0x11)
        Assert.Equals(COLORREF.GetBlue(0x00FF1100), 0xFF)
        Assert.Equals(COLORREF.GetBlue(0x00421122), 0x42)
        Assert.Equals(COLORREF.GetBlue(0), 0)
    }

    SetRed_Always_SetsRed() {
        Assert.Equals(COLORREF.SetRed(0x00000000, 0x42), 0x00000042)
        Assert.Equals(COLORREF.SetRed(0xFFFFFFFF, 0), 0xFFFFFF00)
        Assert.Equals(COLORREF.SetRed(0x00000000, 0xFF), 0x000000FF)
    }

    SetGreen_Always_SetsGreen() {
        Assert.Equals(COLORREF.SetGreen(0x00000000, 0x42), 0x00004200)
        Assert.Equals(COLORREF.SetGreen(0xFFFFFFFF, 0), 0xFFFF00FF)
        Assert.Equals(COLORREF.SetGreen(0x00000000, 0xFF), 0x0000FF00)
    }

    SetBlue_Always_SetsBlue() {
        Assert.Equals(COLORREF.SetBlue(0x00000000, 0x42), 0x00420000)
        Assert.Equals(COLORREF.SetBlue(0xFFFFFFFF, 0), 0xFF00FFFF)
        Assert.Equals(COLORREF.SetBlue(0x00000000, 0xFF), 0x00FF0000)
    }

    ToRgbString_Always_ReturnsRgbString(){
        Assert.Equals(COLORREF.ToRGBString(0x00112233), "0x332211")
        Assert.Equals(COLORREF.ToRGBString(0x000000FF), "0xFF0000")
        Assert.Equals(COLORREF.ToRGBString(0x0000FF00), "0x00FF00")
        Assert.Equals(COLORREF.ToRGBString(0x00FF0000), "0x0000FF")
    }
}