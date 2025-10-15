#Requires AutoHotkey v2.0

#Include .\Yunit\Yunit.ahk
#Include .\YunitExtensions\Assert.ahk

#Include ../Windows/Win32/Networking/HttpServer/HTTP_REQUEST_HEADERS.ahk
#Include ../Windows/Win32/UI/Controls/NMCHAR.ahk
#Include ../Windows/Win32/UI/Controls/PROPSHEETHEADERW_V2.ahk
#Include ../Windows/Win32/Graphics/Gdi/LOGFONTA.ahk
#Include ../Windows/Win32/Graphics/Gdi/LOGFONTW.ahk
#Include ../Windows/Win32/UI/WindowsAndMessaging/ICONINFOEXW.ahk
#Include ../Windows/Win32/UI/WindowsAndMessaging/MENUBARINFO.ahk
#Include ../Windows/Win32/NetworkManagement/Ndis/NDIS_TCP_IP_CHECKSUM_OFFLOAD.ahk
#Include ../Windows/Win32/NetworkManagement/QoS/CONTROL_SERVICE.ahk
#Include ../Windows/Win32/Graphics/DirectDraw/DDMORESURFACECAPS.ahk
#Include ../Windows/Win32/System/Kernel/SLIST_HEADER.ahk
#Include ../Windows/Win32/System/Diagnostics/Debug/CONTEXT.ahk

/**
 * Tests of generated source code
 */
class GeneratedStructSmokeTests {
    
    class GettersAndAccessors {
        Get_EmbeddedStruct_CachesProxyObject(){
            test := NMCHAR()

            ref1 := test.hdr
            ref2 := test.hdr

            Yunit.Assert(ref1 == ref2)
        }

        Set_EmbeddedStruct_ThrowsPropertyError(){
            test := NMCHAR()
            Assert.Throws((*) => test.hdr := "something", Error)
        }

        Get_FixedArray_CachesProxyObject(){
            test := HTTP_REQUEST_HEADERS()

            ref1 := test.KnownHeaders
            ref2 := test.KnownHeaders

            Yunit.Assert(ref1 == ref2)
        }

        Set_FixedArray_ThrowsPropertyError(){
            test := HTTP_REQUEST_HEADERS()
            Assert.Throws((*) => test.KnownHeaders := "test", Error)
        }

        Set_LiteralUnicodeString_ConvertsCorrectly(){
            test := LOGFONTW()
            test.lfFaceName := "ooglyboogly"
            Yunit.Assert((str := StrGet(test.ptr + 28, 31, "UTF-16")) == "ooglyboogly", 
                Format("Expected '{1}' but got '{2}'", "ooglyboogly", str))
        }

        Get_UnicodeString_ReturnsStringObject(){
            test := LOGFONTW()
            StrPut("This is a test string", test.ptr + 28, 31, "UTF-16")

            str := test.lfFaceName

            Yunit.Assert(str is String)
            Yunit.Assert(str == "This is a test string", Format("Expected '{1}' but got '{2}'", "This is a test string", str))
        }

        Set_LiteralAnsiString_ConvertsCorrectly(){
            test := LOGFONTA()
            test.lfFaceName := "ooglyboogly"
            Yunit.Assert((str := StrGet(test.ptr + 28, 31, "CP0")) == "ooglyboogly", 
                Format("Expected '{1}' but got '{2}'", "ooglyboogly", str))
        }

        Get_AnsiString_ReturnsStringObject(){
            test := LOGFONTA()
            StrPut("This is a test string", test.ptr + 28, 31, "CP0")

            str := test.lfFaceName

            Yunit.Assert(str is String)
            Yunit.Assert(str == "This is a test string", Format("Expected '{1}' but got '{2}'", "This is a test string", str))
        }
    }

    class Constructors {

        New_WithStructSizeProperty_SetsIt() {
            test := ICONINFOEXW()
            Yunit.Assert(test.cbSize == ICONINFOEXW.sizeof, 
                Format("Expected cbSize to match ICONINFOEXW.sizeof ({1}), but it was {2}", ICONINFOEXW.sizeof, test.cbSize))
        }
    }

    class EmbeddedTypes {
        
        NonAnonymousEmbeddedStructs_Never_AreFlattened(){
            test := NDIS_TCP_IP_CHECKSUM_OFFLOAD()
            
            ; Also test that we correcly cut off the _e__Struct from the embedded class name
            Assert.HasProp(test, "IPv4Transmit", NDIS_TCP_IP_CHECKSUM_OFFLOAD._IPv4Transmit)
            Assert.HasProp(test, "IPv4Receive", NDIS_TCP_IP_CHECKSUM_OFFLOAD._IPv4Receive)
            Assert.HasProp(test, "IPv6Transmit", NDIS_TCP_IP_CHECKSUM_OFFLOAD._IPv6Transmit)
            Assert.HasProp(test, "IPv6Receive", NDIS_TCP_IP_CHECKSUM_OFFLOAD._IPv6Receive)
        }

        AnonymousUnions_Always_AreFlattened(){
            test := CONTROL_SERVICE()

            Assert.HasProp(test, "Guaranteed", AD_GUARANTEED)
            Assert.HasProp(test, "ParamBuffer", Win32FixedArray)
            Yunit.Assert(!test.HasProp("Anonymous1"), "CONTROL_SERVICE should not have a property Anonymous1")
        }

        ArraysOfEmbeddedStructs_Always_ReturnEmbeddedStruct(){
            test := DDMORESURFACECAPS()

            Yunit.Assert(test.ddsExtendedHeapRestrictions[1] is DDMORESURFACECAPS.ExtendedHeapRestrictions)
        }

        /**
         * Regression test for https://github.com/holy-tao/AhkWin32Projection/issues/35
         */
        SLIST_HEADER_NeststedStruct_WithMultipleArchVariants_AreResolved()
        {
            test := SLIST_HEADER()

            test.HeaderX64.depth := 42

            Assert.HasProp(test, "HeaderX64", SLIST_HEADER._HeaderX64)
            Yunit.Assert(test.HeaderX64._bitfield1 > 0, 
                Format("Expected setting test.HeaderX64.depth to affect _bitfield1, but _bitfield1 is 0x{1:0X}", test.HeaderX64._bitfield1))
        }

        /**
         * Regression test for https://github.com/holy-tao/AhkWin32Projection/issues/35
         */
        CONTEXT_NeststedStruct_WithMultipleArchVariants_AreResolved()
        {
            test := CONTEXT()
            
            test.Xmm0.Low := 128
            test.Xmm0.High := 9999

            Assert.HasProp(test, "Xmm0", M128A)
            Assert.HasProp(test, "Xmm1", M128A)
            Assert.HasProp(test, "Xmm2", M128A)
            Assert.HasProp(test, "Xmm3", M128A)

            Yunit.Assert((val := NumGet(test, 336, "uint")) == 128, Format("Expected 128 but got {1}", val))
            Yunit.Assert((val := NumGet(test, 344, "uint")) == 9999, Format("Expected 9999 but got {1}", val))
        }
    }

    /**
     * Tests for bitfield members
     */
    class Bitfields {

        ; One bit field
        SimpleBitfield_GetAndSet_GetsAndSetsBits() {
            mbi := MENUBARINFO()

            mbi.fFocused := 1
            Yunit.Assert(mbi._bitfield == 0x2, Format("Expected _bitfield to be 0x2 but got 0x{1:0X}", mbi._bitfield))
            Yunit.Assert(mbi.fFocused == 1)
        }

        SimpleBitfield_Set_Always_MasksInput(){
            mbi := MENUBARINFO()
            
            mbi.fFocused := 0xFFFFFFFF
            Yunit.Assert(mbi._bitfield == 0x2, Format("Expected _bitfield to be 0x2 but got 0x{1:0X}", mbi._bitfield))
            Yunit.Assert(mbi.fFocused == 1)
        }

        LongBitfield_Set_SetsBits(){
            mbi := MENUBARINFO()

            mbi.fUnused := -1
            Yunit.Assert(mbi._bitfield == 0xFFFFFFFFFFFFFFFC, Format("Expected _bitfield to be 0xFFFFFFFFFFFFFFFC but got 0x{1:0X}", mbi._bitfield))
        }

        LongBitfield_Get_GetsBits(){
            mbi := MENUBARINFO()

            mbi.fUnused := 42
            Yunit.Assert(mbi.fUnused == 42)
        }

        BitfieldProperties_Get_UseBackingField(){
            mbi := MENUBARINFO()
            mbi._bitfield := -1     ;Set all bits to 1

            Yunit.Assert(mbi.fFocused == 1)
            Yunit.Assert(mbi.fBarFocused == 1)
        }
    }

    class Unions {

        /**
         * Regression test for https://github.com/holy-tao/AhkWin32Structs-Generator/issues/11
         */
        Unions_WithMembersOfMixedWidths_AreProjectedCorrectly(){
            pshw := PROPSHEETHEADERW_V2()

            NumPut("ptr", -1, pshw, 40)             ;Max Int64, should not bleed into pStartPage
            NumPut("uint64", 123456789, pshw, 48)   ;pStartPage / nStartPage union
            NumPut("ptr", 42, pshw, 56)             ;phpage union

            Yunit.Assert(pshw.nPages == 0xFFFFFFFF, Format("Expected {1} but got {2}", -1, pshw.nPages))
            Yunit.Assert(pshw.pStartPage.value == 123456789, Format("Expected {1} but got {2}", 123456789, pshw.pStartPage.value))
            Yunit.Assert(pshw.phpage == 42, Format("Expected {1} but got {2}", 42, pshw.nPages))
        }
    }
}