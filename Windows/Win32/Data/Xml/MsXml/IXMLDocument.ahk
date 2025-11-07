#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include .\IXMLElement.ahk
#Include ..\..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Data.Xml.MsXml
 * @version v4.0.30319
 */
class IXMLDocument extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IXMLDocument
     * @type {Guid}
     */
    static IID => Guid("{f52e2b61-18a1-11d1-b105-00805f49916b}")

    /**
     * The class identifier for XMLDocument
     * @type {Guid}
     */
    static CLSID => Guid("{cfc399af-d876-11d0-9c10-00c04fc99c8e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_root", "get_fileSize", "get_fileModifiedDate", "get_fileUpdatedDate", "get_URL", "put_URL", "get_mimeType", "get_readyState", "get_charset", "put_charset", "get_version", "get_doctype", "get_dtdURL", "createElement"]

    /**
     * 
     * @returns {IXMLElement} 
     */
    get_root() {
        result := ComCall(7, this, "ptr*", &p := 0, "HRESULT")
        return IXMLElement(p)
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
     * @returns {IXMLElement} 
     */
    createElement(vType, var1) {
        result := ComCall(20, this, "ptr", vType, "ptr", var1, "ptr*", &ppElem := 0, "HRESULT")
        return IXMLElement(ppElem)
    }
}
