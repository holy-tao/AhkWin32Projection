#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IHTMLElement4 extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHTMLElement4
     * @type {Guid}
     */
    static IID => Guid("{3050f80f-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["put_onmousewheel", "get_onmousewheel", "normalize", "getAttributeNode", "setAttributeNode", "removeAttributeNode", "put_onbeforeactivate", "get_onbeforeactivate", "put_onfocusin", "get_onfocusin", "put_onfocusout", "get_onfocusout"]

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onmousewheel(v) {
        result := ComCall(7, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} p 
     * @returns {HRESULT} 
     */
    get_onmousewheel(p) {
        result := ComCall(8, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    normalize() {
        result := ComCall(9, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrname 
     * @param {Pointer<IHTMLDOMAttribute>} ppAttribute 
     * @returns {HRESULT} 
     */
    getAttributeNode(bstrname, ppAttribute) {
        bstrname := bstrname is String ? BSTR.Alloc(bstrname).Value : bstrname

        result := ComCall(10, this, "ptr", bstrname, "ptr*", ppAttribute, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IHTMLDOMAttribute} pattr 
     * @param {Pointer<IHTMLDOMAttribute>} ppretAttribute 
     * @returns {HRESULT} 
     */
    setAttributeNode(pattr, ppretAttribute) {
        result := ComCall(11, this, "ptr", pattr, "ptr*", ppretAttribute, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IHTMLDOMAttribute} pattr 
     * @param {Pointer<IHTMLDOMAttribute>} ppretAttribute 
     * @returns {HRESULT} 
     */
    removeAttributeNode(pattr, ppretAttribute) {
        result := ComCall(12, this, "ptr", pattr, "ptr*", ppretAttribute, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onbeforeactivate(v) {
        result := ComCall(13, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} p 
     * @returns {HRESULT} 
     */
    get_onbeforeactivate(p) {
        result := ComCall(14, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onfocusin(v) {
        result := ComCall(15, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} p 
     * @returns {HRESULT} 
     */
    get_onfocusin(p) {
        result := ComCall(16, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onfocusout(v) {
        result := ComCall(17, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} p 
     * @returns {HRESULT} 
     */
    get_onfocusout(p) {
        result := ComCall(18, this, "ptr", p, "HRESULT")
        return result
    }
}
