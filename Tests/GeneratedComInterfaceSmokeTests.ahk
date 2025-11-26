#Requires AutoHotkey v2.0

#Include .\Yunit\Yunit.ahk
#Include .\YunitExtensions\Assert.ahk

#Include ../Windows/Win32/System/Com/Apis.ahk
#Include ../Windows/Win32/System/Com/IUri.ahk
#Include ../Windows/Win32/System/Com/IUriBuilder.ahk
#Include ../Windows/Win32/Foundation/BSTR.ahk
#Include ../Windows/Win32/Data/Xml/MsXML/IXMLDOMDocument2.ahk
#Include ../Windows/Win32/Foundation/Apis.ahk
#Include ../Guid.ahk

#DllLoad Urlmon.dll

class GeneratedComInterfaceTests {

    /**
     * Interface methods which return handles should return the actial handle
     */
    class OutputParameterMarshalling {
        InterfaceMethod_ReturningHandle_ReturnsHandle(){
            uri := Com.CreateUri("https://www.autohotkey.com/", 0x0101)

            Assert.Equals(type(uri), "IUri")

            domain := uri.GetDomain()
            Assert.Equals(type(domain), "BSTR")
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
            comObjUnknown := ComObject("MSXML2.DOMDocument.6.0", String(IXMLDOMDocument2.IID))
            pUnk := comObjUnknown.ptr

            ixmlDoc2 := IXMLDOMDocument2(pUnk)

            Assert.IsType(ixmlDoc2.documentElement, IXMLDOMElement)
        }

        InterfaceProperty_Set_SetsValue(){
            comObjUnknown := ComObject("MSXML2.DOMDocument.6.0", String(IXMLDOMDocument2.IID))
            pUnk := comObjUnknown.ptr

            ixmlDoc2 := IXMLDOMDocument2(pUnk)

            ; Also tests the getter
            ixmlDoc2.preserveWhiteSpace := Foundation.VARIANT_TRUE
            Assert.Equals(ixmlDoc2.preserveWhiteSpace, Foundation.VARIANT_TRUE)

            ixmlDoc2.preserveWhiteSpace := False
            Assert.Equals(ixmlDoc2.preserveWhiteSpace, False)
        }
    }
}