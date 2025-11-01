#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class ISVGTextPositioningElement extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISVGTextPositioningElement
     * @type {Guid}
     */
    static IID => Guid("{3051051b-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for SVGTextPositioningElement
     * @type {Guid}
     */
    static CLSID => Guid("{305105e0-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["putref_x", "get_x", "putref_y", "get_y", "putref_dx", "get_dx", "putref_dy", "get_dy", "putref_rotate", "get_rotate"]

    /**
     * 
     * @param {ISVGAnimatedLengthList} v 
     * @returns {HRESULT} 
     */
    putref_x(v) {
        result := ComCall(7, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ISVGAnimatedLengthList>} p 
     * @returns {HRESULT} 
     */
    get_x(p) {
        result := ComCall(8, this, "ptr*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ISVGAnimatedLengthList} v 
     * @returns {HRESULT} 
     */
    putref_y(v) {
        result := ComCall(9, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ISVGAnimatedLengthList>} p 
     * @returns {HRESULT} 
     */
    get_y(p) {
        result := ComCall(10, this, "ptr*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ISVGAnimatedLengthList} v 
     * @returns {HRESULT} 
     */
    putref_dx(v) {
        result := ComCall(11, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ISVGAnimatedLengthList>} p 
     * @returns {HRESULT} 
     */
    get_dx(p) {
        result := ComCall(12, this, "ptr*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ISVGAnimatedLengthList} v 
     * @returns {HRESULT} 
     */
    putref_dy(v) {
        result := ComCall(13, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ISVGAnimatedLengthList>} p 
     * @returns {HRESULT} 
     */
    get_dy(p) {
        result := ComCall(14, this, "ptr*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ISVGAnimatedNumberList} v 
     * @returns {HRESULT} 
     */
    putref_rotate(v) {
        result := ComCall(15, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ISVGAnimatedNumberList>} p 
     * @returns {HRESULT} 
     */
    get_rotate(p) {
        result := ComCall(16, this, "ptr*", p, "HRESULT")
        return result
    }
}
