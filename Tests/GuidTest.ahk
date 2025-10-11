#Requires AutoHotkey v2.0

#Include .\Yunit\Yunit.ahk
#Include .\YunitExtensions\Assert.ahk

#Include ..\Guid.ahk

class GuidTests {

    Constructor_WithNullPtr_CreatesEmptyGuid(){
        test := Guid(0)

        Yunit.Assert(test.ptr != 0)
        Yunit.Assert(NumGet(test, 0, "uint64") == 0, "Guid is not empty`n" . test.HexDump())
        Yunit.Assert(NumGet(test, 8, "uint64") == 0, "Guid is not empty`n" . test.HexDump())
    }

    Constructor_WithNumericPtr_UsesIt(){
        testBuf := Buffer(16, 0)
        NumPut("uint64", 0x42, testBuf, 0)
        NumPut("uint64", 0x24, testBuf, 8)

        test := Guid(testBuf.ptr)

        Yunit.Assert(test.ptr == testBuf.ptr)
        Yunit.Assert(NumGet(test, 0, "uint64") == 0x42, "Unexpected value`n" . test.HexDump())
        Yunit.Assert(NumGet(test, 8, "uint64") == 0x24, "Unexpected value`n" . test.HexDump())
    }

    Constructor_WithStringValue_SetsBuffer(){
        test := Guid("{6B29FC40-CA47-1067-B31D-00DD010662DA}")

        Yunit.Assert(test.ptr != 0)

        Yunit.Assert(NumGet(test, 0, "uint64") != 0, "Low bits are empty`n" . test.HexDump())
        Yunit.Assert(NumGet(test, 8, "uint64") != 0, "High bits are empty`n" . test.HexDump())
    }

    ToString_WithEmptyGuid_ReturnsStringRepresentation(){
        expected := "{00000000-0000-0000-0000-000000000000}"
        test := Guid(0)

        Yunit.Assert(String(test) == expected, Format("{1} != {2}", String(test), expected))
    }

    ToString_WithNonEmptyGuid_ReturnsStringRepresentation(){
        expected := "{6B29FC40-CA47-1067-B31D-00DD010662DA}"
        test := Guid(expected)

        Yunit.Assert(String(test) == expected, Format("{1} != {2}", String(test), expected))
    }

    Create_Always_CreatesGuid(){
        empty := "{00000000-0000-0000-0000-000000000000}"

        newGuid := Guid.Create()
        Yunit.Assert(newGuid.ptr != 0)
        Yunit.Assert(String(newGuid) != empty)
    }
}