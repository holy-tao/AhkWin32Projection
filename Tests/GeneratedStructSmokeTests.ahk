#Requires AutoHotkey v2.0

#Include .\Yunit\Yunit.ahk
#Include .\YunitExtensions\Assert.ahk

#Include ../Windows/Win32/Networking/HttpServer/HTTP_REQUEST_HEADERS.ahk
#Include ../Windows/Win32/UI/Controls/NMCHAR.ahk
#Include ../Windows/Win32/Graphics/Gdi/LOGFONTA.ahk
#Include ../Windows/Win32/Graphics/Gdi/LOGFONTW.ahk
#Include ../Windows/Win32/UI/WindowsAndMessaging/ICONINFOEXW.ahk

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
}