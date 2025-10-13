#Requires AutoHotkey v2.0

#Include ./Yunit/Yunit.ahk
#Include ./YunitExtensions/Assert.ahk

#Include ../Win32Struct.ahk
#Include ../Windows/Win32/Foundation/RECT.ahk
#Include ../Windows/Win32/Networking/HttpServer/HTTP_REQUEST_HEADERS.ahk
#Include ../Windows/Win32/UI/Controls/NMCHAR.ahk

class Win32StructTest {

    PtrIsZero_CreatesNewBuffer(){
        test := RECT(0)
        Yunit.Assert(test.__buf is Buffer, "Expected a buffer but got a(n) " . Type(test.__buf))
    }

    PtrUnset_CreatesNewBuffer(){
        test := RECT()
        Yunit.Assert(test.__buf is Buffer, "Expected a buffer but got a(n) " . Type(test.__buf))
    }

    PtrNotZero_DoesNotCreateBuffer(){
        test := RECT(1)
        Yunit.Assert(!(test.__buf is Buffer), "Expected a plain Object but got a(n) " . Type(test.__buf))
    }

    Always_TakesSizeFromClass(){
        test := RECT()
        Yunit.Assert(test.size == 16, "Expected size of 16 but got " . test.size)

        test := RECT(9999)
        Yunit.Assert(test.size == 16, "Expected size of 16 but got " . test.size)
    }

    Clone_Always_CreatesCopy(){
        test := RECT()
        test.top := 5
        test.bottom := -9999
        test.left := 42
        test.right := -1

        clone := test.Clone()

        Yunit.Assert(clone.ptr != test.ptr, "Clone's pointer equals source's pointer")

        Yunit.Assert(clone.top == 5, "Clone and source values are not equal")
        Yunit.Assert(clone.bottom == -9999, "Clone and source values are not equal")
        Yunit.Assert(clone.left == 42, "Clone and source are values not equal")
        Yunit.Assert(clone.right == -1, "Clone and source are values not equal")
    }

    CopyTo_WithStruct_CopiesData(){
        test := RECT()
        test.top := 1
        test.bottom := 2
        test.left := 3
        test.right := 4

        copy := RECT()

        test.CopyTo(copy)

        Yunit.Assert(copy.ptr != test.ptr, "CopyTo changed a pointer!")
        Yunit.Assert(copy.top == 1, "Copy's values are not equal")
        Yunit.Assert(copy.bottom == 2, "Copy's values are not equal")
        Yunit.Assert(copy.left == 3, "Copy's values are not equal")
        Yunit.Assert(copy.right == 4, "Copy's values are not equal")
    }

    CopyTo_WithBuffer_CopiesData(){
        test := RECT()
        test.left := 1
        test.top := 2
        test.right := 3
        test.bottom := 4

        copy := Buffer(16, 0)

        test.CopyTo(copy)

        Yunit.Assert((val := NumGet(copy, 0, "int")) == 1, val . " != " . 1)
        Yunit.Assert((val := NumGet(copy, 4, "int")) == 2, val . " != " . 2)
        Yunit.Assert((val := NumGet(copy, 8, "int")) == 3, val . " != " . 3)
        Yunit.Assert((val := NumGet(copy, 12, "int")) == 4, val . " != " . 4)
    }

    CopyTo_WithPureInteger_CopiesData(){
        test := RECT()
        test.left := 1
        test.top := 2
        test.right := 3
        test.bottom := 4

        copy := Buffer(16, 0)

        test.CopyTo(copy.ptr)

        Yunit.Assert((val := NumGet(copy, 0, "int")) == 1, val . " != " . 1)
        Yunit.Assert((val := NumGet(copy, 4, "int")) == 2, val . " != " . 2)
        Yunit.Assert((val := NumGet(copy, 8, "int")) == 3, val . " != " . 3)
        Yunit.Assert((val := NumGet(copy, 12, "int")) == 4, val . " != " . 4)
    }

    CopyTo_WithUndersizeBuffer_CopiesData(){
        test := RECT()
        test.left := 1
        test.top := 2
        test.right := 3
        test.bottom := 4

        copy := Buffer(8, 0)

        test.CopyTo(copy)

        Yunit.Assert((val := NumGet(copy, 0, "int")) == 1, val . " != " . 1)
        Yunit.Assert((val := NumGet(copy, 4, "int")) == 2, val . " != " . 2)
    }

    CopyTo_WithInvalidTarget_ThrowsError(){
        test := RECT()

        Assert.Throws((*) => test.CopyTo("invalid"), TypeError)
        Assert.Throws((*) => test.CopyTo({obj: "not buffer-like"}), TypeError)
    }

    MemoryEquals_WithEqualStucts_ReturnsTrue(){
        left := RECT(), right := RECT()
        left.left := 1, right.left := 1
        left.top := 2, right.top := 2
        left.right := 3, right.right := 3
        left.bottom := 4, right.bottom := 4

        Yunit.Assert(left.MemoryEquals(right), "Structs are equal but MemoryEquals() returned false")
    }

    MemoryEquals_WithEqualBuffer_ReturnsTrue(){
        left := RECT(), right := RECT()
        left.left := 1, right.left := 1
        left.top := 2, right.top := 2
        left.right := 3, right.right := 3
        left.bottom := 4, right.bottom := 4

        Yunit.Assert(left.MemoryEquals(right.__buf), "Structs are equal but MemoryEquals() returned false")
    }

    MemoryEquals_WithRawPtrToEqualBuffer_ReturnsTrue(){
        left := RECT(), right := RECT()
        left.left := 1, right.left := 1
        left.top := 2, right.top := 2
        left.right := 3, right.right := 3
        left.bottom := 4, right.bottom := 4

        Yunit.Assert(left.MemoryEquals(right.__buf.ptr), "Structs are equal but MemoryEquals() returned false")
    }

    MemoryEquals_WithDifferingStucts_ReturnsFalse(){
        left := RECT(), right := RECT()
        left.left := 1, right.left := 1
        left.top := 2, right.top := 2
        left.right := 3, right.right := 5
        left.bottom := 4, right.bottom := 6

        Yunit.Assert(!left.MemoryEquals(right, &diffOffset), "Structs are equal but MemoryEquals() returned false")
        Yunit.Assert(diffOffset == 8, "MemoryEquals returned an incorrect diff offset. Expected 8, got " . diffOffset)
    }

    MemoryEquals_WithStructsOfDifferingSize_ReturnsFalse(){
        test := RECT()
        diff := HTTP_REQUEST_HEADERS()

        Yunit.Assert(!test.MemoryEquals(diff), "MemoryEquals() should return false for structs of differing length")
    }

    Fill_Always_FillsAllBytes(){
        test := RECT()
        test.Fill(0x42)
        loop(test.size){
            Yunit.Assert((val := NumGet(test, A_Index - 1, "char") & 0xFF) == 0x42, 
                Format("Byte at offset {1} is {2}, expected 0xFF`n{3}`n", A_Index, val, test.HexDump()))
        }
    }

    HexDump_Always_ReturnsCorrectDump(){
        test := RECT()
        test.left := Ord("@")
        test.top := 0xFFFFFFFF
        test.right := 0
        test.bottom := 0x1A2B3C4D

        expected := "40 00 00 00 FF FF FF FF  00 00 00 00 4D 3C 2B 1A  |@...........M<+.|`n"
        actual := test.HexDump()
        Yunit.Assert(actual == expected, "HexDump is incorect. Expected `n'" . expected . "'but got `n'" . actual . "'")
    }

    FromObject_WithNoEmbeddedElements_PopulatesValues(){
        test := RECT.FromObject({ top: 0, bottom: 100, left: 0, right: 100 })

        Yunit.Assert(test.top == 0)
        Yunit.Assert(test.bottom == 100)
        Yunit.Assert(test.left == 0)
        Yunit.Assert(test.right == 100)
    }

    FromObject_WithEmbeddedStruct_PopulatesValues(){
        test := NMCHAR.FromObject({
            hdr: {
                hwndFrom: { value: 0xFF00FFAA },
                idFrom: 0x1A2B3C4D,
                code: 0xABCD
            },
            ch: Ord("A"),
            dwItemPrev: 42,
            dwItemNext: 43
        })

        dump := "`n" . test.HexDump()

        Yunit.Assert(test.hdr.hwndFrom.value == 0xFF00FFAA, dump)
        Yunit.Assert(test.hdr.idFrom == 0x1A2B3C4D, dump)
        Yunit.Assert(test.hdr.code == 0xABCD, dump)
        Yunit.Assert(test.ch = Ord("A"), dump)
        Yunit.Assert(test.dwItemPrev == 42, dump)
        Yunit.Assert(test.dwItemNext == 43, dump)
    }

    FromObject_WithArray_PopulatesValues(){
        Hdr1 := "Content-Type: application/json"
        Hdr2 := "Accept: application/json"
        headers := HTTP_REQUEST_HEADERS.FromObject({
            KnownHeaders: [
                { RawValueLength: StrLen(Hdr1), pRawValue: { value: StrPtr(Hdr1) } },
                { RawValueLength: StrLen(Hdr2), pRawValue: { value: StrPtr(Hdr2) } }
            ]
        })

        Yunit.Assert(headers.KnownHeaders[1].RawValueLength == StrLen(Hdr1))
        Yunit.Assert(headers.KnownHeaders[1].pRawValue.Value == StrPtr(Hdr1))
        Yunit.Assert(headers.KnownHeaders[2].RawValueLength == StrLen(Hdr2))
        Yunit.Assert(headers.KnownHeaders[2].pRawValue.Value == StrPtr(Hdr2))
    }

    FromObject_WithUnknownValue_ThrowsPropertyError(){
        Assert.Throws((*) => RECT.FromObject({badproperty: "test"}), PropertyError)
    }

    FromObject_WithClass_ThrowsPropertyError(){
        Assert.Throws((*) => RECT.FromObject({__Class: "test"}), PropertyError)
    }

    FromObject_OnWin32Struct_ThrowsTypeError(){
        Assert.Throws((*) => Win32Struct.FromObject({}), TypeError)
    }
}