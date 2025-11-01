#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IHTMLStyleSheet4 extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHTMLStyleSheet4
     * @type {Guid}
     */
    static IID => Guid("{305106f4-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_type", "get_href", "get_title", "get_ownerNode", "get_ownerRule", "get_cssRules", "get_media", "insertRule", "deleteRule"]

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_type(p) {
        result := ComCall(7, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} p 
     * @returns {HRESULT} 
     */
    get_href(p) {
        result := ComCall(8, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_title(p) {
        result := ComCall(9, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IHTMLElement>} p 
     * @returns {HRESULT} 
     */
    get_ownerNode(p) {
        result := ComCall(10, this, "ptr*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IHTMLCSSRule>} p 
     * @returns {HRESULT} 
     */
    get_ownerRule(p) {
        result := ComCall(11, this, "ptr*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IHTMLStyleSheetRulesCollection>} p 
     * @returns {HRESULT} 
     */
    get_cssRules(p) {
        result := ComCall(12, this, "ptr*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} p 
     * @returns {HRESULT} 
     */
    get_media(p) {
        result := ComCall(13, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrRule 
     * @param {Integer} lIndex 
     * @param {Pointer<Integer>} plNewIndex 
     * @returns {HRESULT} 
     */
    insertRule(bstrRule, lIndex, plNewIndex) {
        bstrRule := bstrRule is String ? BSTR.Alloc(bstrRule).Value : bstrRule

        plNewIndexMarshal := plNewIndex is VarRef ? "int*" : "ptr"

        result := ComCall(14, this, "ptr", bstrRule, "int", lIndex, plNewIndexMarshal, plNewIndex, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lIndex 
     * @returns {HRESULT} 
     */
    deleteRule(lIndex) {
        result := ComCall(15, this, "int", lIndex, "HRESULT")
        return result
    }
}
