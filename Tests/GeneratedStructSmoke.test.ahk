#Requires AutoHotkey v2.0

#Import ".\Yunit\Yunit.ahk" { Yunit }
#Import ".\YunitExtensions\Assert.ahk" { Assert }

#Import "../Windows/Win32/Networking/HttpServer/HTTP_REQUEST_HEADERS.ahk" { HTTP_REQUEST_HEADERS }
#Import "../Windows/Win32/UI/Controls/NMCHAR.ahk" { NMCHAR }
#Import "../Windows/Win32/UI/Controls/PROPSHEETHEADERW_V2.ahk" { PROPSHEETHEADERW_V2 }
#Import "../Windows/Win32/Graphics/Gdi/LOGFONTA.ahk" { LOGFONTA }
#Import "../Windows/Win32/Graphics/Gdi/LOGFONTW.ahk" { LOGFONTW }
#Import "../Windows/Win32/UI/WindowsAndMessaging/ICONINFOEXW.ahk" { ICONINFOEXW }
#Import "../Windows/Win32/UI/WindowsAndMessaging/MENUBARINFO.ahk" { MENUBARINFO }
#Import "../Windows/Win32/NetworkManagement/Ndis/NDIS_TCP_IP_CHECKSUM_OFFLOAD.ahk" { NDIS_TCP_IP_CHECKSUM_OFFLOAD }
#Import "../Windows/Win32/NetworkManagement/QoS/CONTROL_SERVICE.ahk" { CONTROL_SERVICE, AD_GUARANTEED }
#Import "../Windows/Win32/Graphics/DirectDraw/DDMORESURFACECAPS.ahk" { DDMORESURFACECAPS }
#Import "../Windows/Win32/System/Kernel/SLIST_HEADER.ahk" { SLIST_HEADER }
#Import "../Windows/Win32/System/Diagnostics/Debug/CONTEXT.ahk" { CONTEXT, M128A }
#Import "../Windows/Win32/Storage/FileSystem/BY_HANDLE_FILE_INFORMATION.ahk" { BY_HANDLE_FILE_INFORMATION }
#Import "../Windows/Win32/Storage/Nvme/NVME_OCP_DEVICE_CAPABILITIES_LOG.ahk" { NVME_OCP_DEVICE_CAPABILITIES_LOG }

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

            Assert.Equals(StrGet(test.ptr + 28, 31, "UTF-16"), "ooglyboogly")
        }

        ToString_UnicodeString_ReturnsStringObject(){
            test := LOGFONTW()
            StrPut("This is a test string", test.ptr + 28, 31, "UTF-16")

            str := String(test.lfFaceName)

            Assert.IsType(str, String)
            Assert.Equals(str, "This is a test string")
        }

        Set_LiteralAnsiString_ConvertsCorrectly(){
            test := LOGFONTA()
            test.lfFaceName := "ooglyboogly"

            Assert.Equals(StrGet(test.ptr + 28, 31, "CP0"), "ooglyboogly")
        }

        ToString_AnsiString_ReturnsStringObject(){
            test := LOGFONTA()
            StrPut("This is a test string", test.ptr + 28, 31, "CP0")

            str := String(test.lfFaceName)

            Assert.IsType(str, String)
            Assert.Equals(str, "This is a test string")
        }

        Item_UnicodeStringType_GetsTypedefType() {
            test := LOGFONTW()
            test.lfFaceName := "ooglyboogly"

            Assert.Equals(test.lfFaceName[4].value, Ord("l"))
        }

        Item_AnsiStringType_GetsTypedefType() {
            test := LOGFONTA()
            test.lfFaceName := "ooglyboogly"

            Assert.Equals(test.lfFaceName[4].value, Ord("l"))
        }
    }

    class Constructors {

        New_WithStructSizeProperty_SetsIt() {
            test := ICONINFOEXW()
            Yunit.Assert(test.cbSize == ObjGetDataSize(ICONINFOEXW()), 
                Format("Expected cbSize to match ICONINFOEXW.sizeof ({1}), but it was {2}", ObjGetDataSize(ICONINFOEXW()), test.cbSize))
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
            Assert.HasProp(test, "ParamBuffer", Any)
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

            Yunit.Assert((val := NumGet(test, 416, "uint")) == 128, Format("Expected 128 but got {1}", val))
            Yunit.Assert((val := NumGet(test, 424, "uint")) == 9999, Format("Expected 9999 but got {1}", val))
        }

        /**
         * Regression test for https://github.com/holy-tao/AhkWin32Projection/issues/109
         */
        EmbeddedStructs_WithPackingSizeLessThanParent_AreProjectedCorrectly(){
            test := BY_HANDLE_FILE_INFORMATION()
            NumPut("uint64", 0x12345678, test.ptr + 4) ; Set ftCreationTime.dwLowDateTime
            NumPut("uint64", 0x87654321, test.ptr + 8) ; Set ftCreationTime.dwHighDateTime

            Assert.Equals(test.ftCreationTime.ptr, test.ptr + 4)
            Assert.Equals(test.dwFileAttributes, 0)
            Assert.Equals(test.ftCreationTime.dwLowDateTime, 0x12345678)
            Assert.Equals(test.ftCreationTime.dwHighDateTime, 0x87654321)
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

            Assert.Equals(pshw.nPages, 0xFFFFFFFF)
            Assert.Equals(pshw.pStartPage.value, 123456789)
            Assert.Equals(pshw.phpage.ptr, 42)
        }

        ; https://github.com/holy-tao/AhkWin32Projection/issues/46
        NonAnonymousUnions_AreNotFlattened() {
            test := NVME_OCP_DEVICE_CAPABILITIES_LOG()

            Assert.Equals(type(test.OobMgmtSupport), "NVME_OCP_DEVICE_CAPABILITIES_LOG._OobMgmtSupport")
            Assert.Equals(type(test.WriteZeroesCommand), "NVME_OCP_DEVICE_CAPABILITIES_LOG._WriteZeroesCommand")
        }

        NonAnonymousUnions_AreProjectedCorrectly() {
            test := NVME_OCP_DEVICE_CAPABILITIES_LOG()

            NumPut("ushort", 0xFFFF, test, 2)
            Assert.Equals(test.OobMgmtSupport.AsUshort, 0xFFFF)
        }
    }
}