#Requires AutoHotkey v2.0

#Include ../Yunit/Yunit.ahk
#Include ../YunitExtensions/Assert.ahk

#Include ../../Windows/Win32/Foundation/BSTR.ahk

class BSTRExtensionTests {

    Alloc_Always_AllocatesStr(){
        test := BSTR.Alloc("Test String")
        empty := BSTR.Alloc("")
        unicode := BSTR.Alloc("This string has emojis 👀👀👀")

        Assert.Equals(StrGet(test.value), "Test String")
        Assert.Equals(StrGet(empty.value), "")
        Assert.Equals(StrGet(unicode.value), "This string has emojis 👀👀👀")
    }

    Length_Always_GetsLength(){
        test := BSTR.Alloc("Test String")
        empty := BSTR.Alloc("")
        unicode := BSTR.Alloc("This string has emojis 👀👀👀")

        Assert.Equals(test.length, StrLen("Test String"))
        Assert.Equals(empty.length, 0)
        Assert.Equals(unicode.length, StrLen("This string has emojis 👀👀👀"))
    }

    ByteLength_Always_GetsByteLength(){
        test := BSTR.Alloc("Test String")
        empty := BSTR.Alloc("")
        unicode := BSTR.Alloc("This string has emojis 👀👀👀")

        Assert.Equals(test.byteLength, 22)
        Assert.Equals(empty.byteLength, 0)
        Assert.Equals(unicode.byteLength, 58)
    }

    ReAlloc_Always_ReallocatesStr(){
        test := BSTR.Alloc("Test String")
        test.ReAlloc("Longer Test String")

        empty := BSTR.Alloc("This string did not start out empty")
        empty.ReAlloc("")

        unicode := BSTR.Alloc("This string has emojis 👀👀👀")
        unicode.ReAlloc("Now it has different ones 🥳🤖🍺😶‍🌫️")

        Assert.Equals(StrGet(test.value), "Longer Test String")
        Assert.Equals(StrGet(empty.value), "")
        Assert.Equals(StrGet(unicode.value), "Now it has different ones 🥳🤖🍺😶‍🌫️")
    }

    ToString_Always_ExtractsString(){
        test := BSTR.Alloc("Test String")
        empty := BSTR.Alloc("")
        unicode := BSTR.Alloc("This string has emojis 👀👀👀")

        Assert.Equals(String(test), "Test String")
        Assert.Equals(String(empty), "")
        Assert.Equals(String(unicode), "This string has emojis 👀👀👀")
    }
}