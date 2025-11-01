#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class ISVGCircleElement extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISVGCircleElement
     * @type {Guid}
     */
    static IID => Guid("{30510514-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for SVGCircleElement
     * @type {Guid}
     */
    static CLSID => Guid("{30510578-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["putref_cx", "get_cx", "putref_cy", "get_cy", "putref_r", "get_r"]

    /**
     * 
     * @param {ISVGAnimatedLength} v 
     * @returns {HRESULT} 
     */
    putref_cx(v) {
        result := ComCall(7, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ISVGAnimatedLength>} p 
     * @returns {HRESULT} 
     */
    get_cx(p) {
        result := ComCall(8, this, "ptr*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ISVGAnimatedLength} v 
     * @returns {HRESULT} 
     */
    putref_cy(v) {
        result := ComCall(9, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ISVGAnimatedLength>} p 
     * @returns {HRESULT} 
     */
    get_cy(p) {
        result := ComCall(10, this, "ptr*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ISVGAnimatedLength} v 
     * @returns {HRESULT} 
     */
    putref_r(v) {
        result := ComCall(11, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ISVGAnimatedLength>} p 
     * @returns {HRESULT} 
     */
    get_r(p) {
        result := ComCall(12, this, "ptr*", p, "HRESULT")
        return result
    }
}
