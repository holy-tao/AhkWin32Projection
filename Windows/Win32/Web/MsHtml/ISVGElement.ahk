#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class ISVGElement extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISVGElement
     * @type {Guid}
     */
    static IID => Guid("{305104c5-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for SVGElement
     * @type {Guid}
     */
    static CLSID => Guid("{30510564-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["put_xmlbase", "get_xmlbase", "putref_ownerSVGElement", "get_ownerSVGElement", "putref_viewportElement", "get_viewportElement", "putref_focusable", "get_focusable"]

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_xmlbase(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(7, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_xmlbase(p) {
        result := ComCall(8, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ISVGSVGElement} v 
     * @returns {HRESULT} 
     */
    putref_ownerSVGElement(v) {
        result := ComCall(9, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ISVGSVGElement>} p 
     * @returns {HRESULT} 
     */
    get_ownerSVGElement(p) {
        result := ComCall(10, this, "ptr*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ISVGElement} v 
     * @returns {HRESULT} 
     */
    putref_viewportElement(v) {
        result := ComCall(11, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ISVGElement>} p 
     * @returns {HRESULT} 
     */
    get_viewportElement(p) {
        result := ComCall(12, this, "ptr*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ISVGAnimatedEnumeration} v 
     * @returns {HRESULT} 
     */
    putref_focusable(v) {
        result := ComCall(13, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ISVGAnimatedEnumeration>} p 
     * @returns {HRESULT} 
     */
    get_focusable(p) {
        result := ComCall(14, this, "ptr*", p, "HRESULT")
        return result
    }
}
