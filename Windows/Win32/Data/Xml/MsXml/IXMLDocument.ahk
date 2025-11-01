#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
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
     * @param {Pointer<IXMLElement>} p 
     * @returns {HRESULT} 
     */
    get_root(p) {
        result := ComCall(7, this, "ptr*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_fileSize(p) {
        result := ComCall(8, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_fileModifiedDate(p) {
        result := ComCall(9, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_fileUpdatedDate(p) {
        result := ComCall(10, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_URL(p) {
        result := ComCall(11, this, "ptr", p, "HRESULT")
        return result
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
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_mimeType(p) {
        result := ComCall(13, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pl 
     * @returns {HRESULT} 
     */
    get_readyState(pl) {
        plMarshal := pl is VarRef ? "int*" : "ptr"

        result := ComCall(14, this, plMarshal, pl, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_charset(p) {
        result := ComCall(15, this, "ptr", p, "HRESULT")
        return result
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
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_version(p) {
        result := ComCall(17, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_doctype(p) {
        result := ComCall(18, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_dtdURL(p) {
        result := ComCall(19, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} vType 
     * @param {VARIANT} var1 
     * @param {Pointer<IXMLElement>} ppElem 
     * @returns {HRESULT} 
     */
    createElement(vType, var1, ppElem) {
        result := ComCall(20, this, "ptr", vType, "ptr", var1, "ptr*", ppElem, "HRESULT")
        return result
    }
}
