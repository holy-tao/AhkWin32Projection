#Requires AutoHotkey v2.0

#Include ../Yunit/Yunit.ahk
#Include ../YunitExtensions/Assert.ahk

#Include ../../Windows/Win32/Foundation/PWSTR.ahk
#Include ../../Windows/Win32/Foundation/PSTR.ahk

class StringUtilExtensionTests {

    class PWSTR {
        Alloc_Basic() => Assert.Equals(StrGet(PWSTR.Alloc("Basic Test"), "UTF-16"), "Basic Test")
        Alloc_Emojis() => Assert.Equals(StrGet(PWSTR.Alloc("Emojis ✨🎇😐🧑🏿‍🧑🏽‍🧒🏾"), "UTF-16"), "Emojis ✨🎇😐🧑🏿‍🧑🏽‍🧒🏾")
        Alloc_Empty() => Assert.Equals(StrGet(PWSTR.Alloc(""), "UTF-16"), "")

        Alloc_WithSizeGreaterThanStringLength_UsesIt() {
            buf := PWSTR.Alloc("AAA", 32)
            Assert.Equals(buf.Size, 32)
        }

        Alloc_WithSizeLessThanStringLength_ThrowsMemoryError() {
            Assert.Throws((*) => PWSTR.Alloc("ABCDEF", 2), MemoryError)
        }
    }

    class PSTR {
        Alloc_Basic() => Assert.Equals(StrGet(PSTR.Alloc("Basic Test"), "CP0"), "Basic Test")
        Alloc_Empty() => Assert.Equals(StrGet(PSTR.Alloc(""), "CP0"), "")

        Alloc_WithSizeGreaterThanStringLength_UsesIt() {
            buf := PSTR.Alloc("AAA", 32)
            Assert.Equals(buf.Size, 32)
        }

        Alloc_WithSizeLessThanStringLength_ThrowsMemoryError() {
            Assert.Throws((*) => PSTR.Alloc("ABCDEF", 2), MemoryError)
        }
    }
}