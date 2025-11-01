#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IHTMLStyleSheet extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHTMLStyleSheet
     * @type {Guid}
     */
    static IID => Guid("{3050f2e3-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for HTMLStyleSheet
     * @type {Guid}
     */
    static CLSID => Guid("{3050f2e4-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["put_title", "get_title", "get_parentStyleSheet", "get_owningElement", "put_disabled", "get_disabled", "get_readOnly", "get_imports", "put_href", "get_href", "get_type", "get_id", "addImport", "addRule", "removeImport", "removeRule", "put_media", "get_media", "put_cssText", "get_cssText", "get_rules"]

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_title(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(7, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_title(p) {
        result := ComCall(8, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IHTMLStyleSheet>} p 
     * @returns {HRESULT} 
     */
    get_parentStyleSheet(p) {
        result := ComCall(9, this, "ptr*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IHTMLElement>} p 
     * @returns {HRESULT} 
     */
    get_owningElement(p) {
        result := ComCall(10, this, "ptr*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} v 
     * @returns {HRESULT} 
     */
    put_disabled(v) {
        result := ComCall(11, this, "short", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} p 
     * @returns {HRESULT} 
     */
    get_disabled(p) {
        result := ComCall(12, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} p 
     * @returns {HRESULT} 
     */
    get_readOnly(p) {
        result := ComCall(13, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IHTMLStyleSheetsCollection>} p 
     * @returns {HRESULT} 
     */
    get_imports(p) {
        result := ComCall(14, this, "ptr*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_href(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(15, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_href(p) {
        result := ComCall(16, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_type(p) {
        result := ComCall(17, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_id(p) {
        result := ComCall(18, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrURL 
     * @param {Integer} lIndex 
     * @param {Pointer<Integer>} plIndex 
     * @returns {HRESULT} 
     */
    addImport(bstrURL, lIndex, plIndex) {
        bstrURL := bstrURL is String ? BSTR.Alloc(bstrURL).Value : bstrURL

        plIndexMarshal := plIndex is VarRef ? "int*" : "ptr"

        result := ComCall(19, this, "ptr", bstrURL, "int", lIndex, plIndexMarshal, plIndex, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrSelector 
     * @param {BSTR} bstrStyle 
     * @param {Integer} lIndex 
     * @param {Pointer<Integer>} plNewIndex 
     * @returns {HRESULT} 
     */
    addRule(bstrSelector, bstrStyle, lIndex, plNewIndex) {
        bstrSelector := bstrSelector is String ? BSTR.Alloc(bstrSelector).Value : bstrSelector
        bstrStyle := bstrStyle is String ? BSTR.Alloc(bstrStyle).Value : bstrStyle

        plNewIndexMarshal := plNewIndex is VarRef ? "int*" : "ptr"

        result := ComCall(20, this, "ptr", bstrSelector, "ptr", bstrStyle, "int", lIndex, plNewIndexMarshal, plNewIndex, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lIndex 
     * @returns {HRESULT} 
     */
    removeImport(lIndex) {
        result := ComCall(21, this, "int", lIndex, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lIndex 
     * @returns {HRESULT} 
     */
    removeRule(lIndex) {
        result := ComCall(22, this, "int", lIndex, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_media(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(23, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_media(p) {
        result := ComCall(24, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_cssText(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(25, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_cssText(p) {
        result := ComCall(26, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IHTMLStyleSheetRulesCollection>} p 
     * @returns {HRESULT} 
     */
    get_rules(p) {
        result := ComCall(27, this, "ptr*", p, "HRESULT")
        return result
    }
}
