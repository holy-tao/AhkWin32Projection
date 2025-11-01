#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class ISVGAnimatedRect extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISVGAnimatedRect
     * @type {Guid}
     */
    static IID => Guid("{305104d8-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for SVGAnimatedRect
     * @type {Guid}
     */
    static CLSID => Guid("{30510586-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["putref_baseVal", "get_baseVal", "putref_animVal", "get_animVal"]

    /**
     * 
     * @param {ISVGRect} v 
     * @returns {HRESULT} 
     */
    putref_baseVal(v) {
        result := ComCall(7, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ISVGRect>} p 
     * @returns {HRESULT} 
     */
    get_baseVal(p) {
        result := ComCall(8, this, "ptr*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ISVGRect} v 
     * @returns {HRESULT} 
     */
    putref_animVal(v) {
        result := ComCall(9, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ISVGRect>} p 
     * @returns {HRESULT} 
     */
    get_animVal(p) {
        result := ComCall(10, this, "ptr*", p, "HRESULT")
        return result
    }
}
