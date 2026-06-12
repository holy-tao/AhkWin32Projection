#Requires AutoHotkey v2.1-alpha.30+ 64-bit

#Import ".\Yunit\Yunit.ahk" { Yunit}
#Import ".\YunitExtensions\Assert.ahk" { Assert }

#Import "../Windows/Win32/System/Com/Apis.ahk" as Com
#Import "../Windows/Win32/System/Com/COINIT.ahk" { COINIT }
#Import "../Windows/Win32/System/Com/IUri.ahk" { IUri }
#Import "../Windows/Win32/System/Com/IUriBuilder.ahk" { IUriBuilder }
#Import "../Windows/Win32/Foundation/BSTR.ahk" { BSTR }
#Import "../Windows/Win32/Data/Xml/MsXML/IXMLDOMDocument2.ahk" { IXMLDOMDocument2 }
#Import "../Windows/Win32/Data/Xml/MsXML/IXMLDOMElement.ahk" { IXMLDOMElement }
#Import "../Windows/Win32/Foundation/Constants.ahk" { VARIANT_TRUE, VARIANT_FALSE }
#Import "../Guid.ahk" { Guid }

#DllLoad Urlmon.dll

class GeneratedComInterfaceTests {

    VtblType_IsOverridden() {
        test := IUriBuilder()
        ; prevent auto-release in __Delete, which would throw since we have no actual implementation
        test.owned := true
        
        Assert.IsType(test.vtbl, IUriBuilder.Vtbl)
    }

    /**
     * Interface methods which return handles should return the actial handle
     */
    class OutputParameterMarshalling {
        InterfaceMethod_ReturningHandle_ReturnsHandle(){
            uri := Com.CreateUri("https://www.autohotkey.com/", 0x0101)

            Assert.Equals(type(uri), "IUri")

            domain := uri.GetDomain()
            ; GetDomain returns a caller-owned BSTR, now boxed as BSTR.Owned (a BSTR subclass)
            ; so it frees itself via SysFreeString instead of leaking.
            Assert.IsType(domain, BSTR)
            Assert.Equals(String(domain), "autohotkey.com")
        }

        InterfaceMethod_ReturningInterface_ReturnsInterface(){
            uri := Com.CreateUri("https://www.autohotkey.com", 0x0101)

            uriBuilder := Com.CreateIUriBuilder(uri, 0, 0)
            uriBuilder.SetPath("/docs/v2/lib/ComCall.htm")

            newUri := uriBuilder.CreateUri(-1, 0, 0)

            Assert.Equals(type(newUri), "IUri")
            Assert.Equals(String(newUri.GetDisplayUri()), "https://www.autohotkey.com/docs/v2/lib/ComCall.htm")
        }

        InterfaceMethod_ReturningPrimitive_ReturnsPrimitive(){
            uri1 := Com.CreateUri("https://www.autohotkey.com", 0x0101)
            uri2 := Com.CreateUri("https://www.autohotkey.com", 0x0101)
            
            ; returns a BOOL but in ahk we take it as an int
            val := uri1.IsEqual(uri2)
            Assert.Equals(type(val), "Integer")
            Assert.Equals(val, 1)
        }

        InterfaceMethod_OnFailure_ThrowsOSError(){
            uriBuilder := Com.CreateIUriBuilder(0, 0, 0)

            ; URI has path but no domain
            uriBuilder.SetPath("/docs/v2/lib/ComCall.htm")

            Assert.Throws(
                (*) => uriBuilder.CreateUri(-1, 0, 0),
                OSError
            )
        }
    }

    /**
     * Smoke tests for [propget]/[propout] properties (get_* and put_* methods as properties)
     */
    class PropGetOut {

        InterfaceProperty_Out_ReadOnlyInterface_ReturnsInterface(){
            comObjUnknown := ComObject("MSXML2.DOMDocument.6.0")
            pUnk := ComObjQuery(comObjUnknown, String(IXMLDOMDocument2.IID)).ptr

            ixmlDoc2 := IXMLDOMDocument2(pUnk)
            ixmlDoc2.AddRef()

            comObjUnknown.loadXml("<root/>")

            Assert.IsType(ixmlDoc2.documentElement, IXMLDOMElement)
        }

        InterfaceProperty_Set_SetsValue(){
            comObjUnknown := ComObject("MSXML2.DOMDocument.6.0", String(IXMLDOMDocument2.IID))
            pUnk := comObjUnknown.ptr

            ixmlDoc2 := IXMLDOMDocument2(pUnk)
            ixmlDoc2.AddRef()

            ; Also tests the getter
            ixmlDoc2.preserveWhiteSpace := VARIANT_TRUE
            Assert.Equals(ixmlDoc2.preserveWhiteSpace, VARIANT_TRUE)

            ixmlDoc2.preserveWhiteSpace := false
            Assert.Equals(ixmlDoc2.preserveWhiteSpace, false)
        }
    }
}
