#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include .\IXMLElement2.ahk
#Include ..\..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Data.Xml.MsXml
 * @version v4.0.30319
 */
class IXMLDocument2 extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IXMLDocument2
     * @type {Guid}
     */
    static IID => Guid("{2b8de2fe-8d2d-11d1-b2fc-00c04fd915a9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_root", "get_fileSize", "get_fileModifiedDate", "get_fileUpdatedDate", "get_URL", "put_URL", "get_mimeType", "get_readyState", "get_charset", "put_charset", "get_version", "get_doctype", "get_dtdURL", "createElement", "get_async", "put_async"]

    /**
     * 
     * @returns {IXMLElement2} 
     */
    get_root() {
        result := ComCall(7, this, "ptr*", &p := 0, "HRESULT")
        return IXMLElement2(p)
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_fileSize() {
        p := BSTR()
        result := ComCall(8, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_fileModifiedDate() {
        p := BSTR()
        result := ComCall(9, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_fileUpdatedDate() {
        p := BSTR()
        result := ComCall(10, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_URL() {
        p := BSTR()
        result := ComCall(11, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} p 
     * @returns {HRESULT} 
     */
    put_URL(p) {
        p := p is String ? BSTR.Alloc(p).Value : p

        result := ComCall(12, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_mimeType() {
        p := BSTR()
        result := ComCall(13, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_readyState() {
        result := ComCall(14, this, "int*", &pl := 0, "HRESULT")
        return pl
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_charset() {
        p := BSTR()
        result := ComCall(15, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} p 
     * @returns {HRESULT} 
     */
    put_charset(p) {
        p := p is String ? BSTR.Alloc(p).Value : p

        result := ComCall(16, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_version() {
        p := BSTR()
        result := ComCall(17, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_doctype() {
        p := BSTR()
        result := ComCall(18, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_dtdURL() {
        p := BSTR()
        result := ComCall(19, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} vType 
     * @param {VARIANT} var1 
     * @returns {IXMLElement2} 
     */
    createElement(vType, var1) {
        result := ComCall(20, this, "ptr", vType, "ptr", var1, "ptr*", &ppElem := 0, "HRESULT")
        return IXMLElement2(ppElem)
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_async() {
        result := ComCall(21, this, "short*", &pf := 0, "HRESULT")
        return pf
    }

    /**
     * 
     * @param {VARIANT_BOOL} f 
     * @returns {HRESULT} 
     */
    put_async(f) {
        result := ComCall(22, this, "short", f, "HRESULT")
        return result
    }
}
