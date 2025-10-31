#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IHTMLCSSImportRule extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHTMLCSSImportRule
     * @type {Guid}
     */
    static IID => Guid("{305106ea-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for HTMLCSSImportRule
     * @type {Guid}
     */
    static CLSID => Guid("{305106f0-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_href", "put_media", "get_media", "get_styleSheet"]

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_href(p) {
        result := ComCall(7, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_media(v) {
        result := ComCall(8, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} p 
     * @returns {HRESULT} 
     */
    get_media(p) {
        result := ComCall(9, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IHTMLStyleSheet>} p 
     * @returns {HRESULT} 
     */
    get_styleSheet(p) {
        result := ComCall(10, this, "ptr*", p, "HRESULT")
        return result
    }
}
