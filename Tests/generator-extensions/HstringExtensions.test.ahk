#Requires AutoHotkey v2.0


#Include ../Yunit/Yunit.ahk
#Include ../Yunit/Stdout.ahk
#Include ../YunitExtensions/BetterJUnit.ahk
#Include ../YunitExtensions/Assert.ahk

#Include ../../Windows/Win32/System/WinRT/HSTRING.ahk

class HSTRINGExtensionTests {

    Create_WithString_CreatesHSTRING() {
        hstr := HSTRING.Create("test string")

        Assert.IsType(hstr, HSTRING)
        Assert.Equals(String(hstr), "test string")
    }

    Create_WithEmptyString_CreatesHSTRING() {
        hstr := HSTRING.Create("")

        Assert.IsType(hstr, HSTRING)
        Assert.Equals(String(hstr), "")
    }

    Create_WithEmbeddedNulls_CreatesHSTRING() {
        testStr := "null" . Chr(0) . "between" . Chr(0) . "words"
        hstr := HSTRING.Create("null" . Chr(0) . "between" . Chr(0) . "words")

        Assert.IsType(hstr, HSTRING)
        Assert.Equals(String(hstr), "null" . Chr(0) . "between" . Chr(0) . "words")
    }

    Create_WithNullPointer_CreatesEmptyHSTRING() {
        hStr := HSTRING.Create(0)

        Assert.IsType(hstr, HSTRING)
        Assert.Equals(String(hstr), "")
    }

    Create_WithStringPointer_CreatesHSTRING() {
        hStr := HSTRING.Create(StrPtr("A different test string"), StrLen("A different test string"))

        Assert.IsType(hstr, HSTRING)
        Assert.Equals(String(hstr), "A different test string")
    }

    length_WithNonEmptyString_RetrievesLength() {
        hstr := HSTRING.Create("test string")
        Assert.Equals(hstr.length, StrLen("test string"))
    }

    length_WithEmptyString_RetrievesLength() {
        hstr := HSTRING.Create("")
        Assert.Equals(hstr.length, 0)
    }

    hasEmbeddedNull_WithEmbeddedNull_ReturnsTrue() {
        hstr := HSTRING.Create("null" . Chr(0) . "between" . Chr(0) . "words")
        YUnit.Assert(hstr.hasEmbeddedNull)
    }

    hasEmbeddedNull_WithoutEmbeddedNull_ReturnsFalse() {
        hstr := HSTRING.Create("test string")
        YUnit.Assert(!hstr.hasEmbeddedNull)
    }

    isEmpty_WithEmptyString_ReturnsTrue() {
        hstr := HSTRING.Create("")
        YUnit.Assert(hstr.isEmpty)
    }

    isEmpty_WithNonEmptyString_ReturnsFalse() {
        hstr := HSTRING.Create("test string")
        YUnit.Assert(!hstr.isEmpty)
    }

    GetRawBuffer_WithNoLenParam_ReturnsBuffer() {
        hstr := HSTRING.Create("test string")
        bufPtr := hstr.GetRawBuffer()
        YUnit.Assert(bufPtr != 0)
    }

    GetRawBuffer_WithLenParam_ReturnsBuffer() {
        hstr := HSTRING.Create("test string")
        bufPtr := hstr.GetRawBuffer(&length := 0)

        Assert.Equals(length, StrLen("test string"))
        YUnit.Assert(bufPtr != 0)
    }

    Clone_Always_ReturnsClone() {
        hstr := HSTRING.Create("test string")
        clone := hstr.Clone()

        ; A clone is actually a handle to the same underlying string, so Value is almost certainly the same
        Assert.IsType(clone, HSTRING)
        Assert.Equals(String(hstr), String(clone))
    }
}

if(A_ScriptName == "HstringExtensions.test.ahk") {
    YUnit.Use(YunitStdOut, BetterJUnit).Test(HSTRINGExtensionTests)
}