#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class ISVGPatternElement extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISVGPatternElement
     * @type {Guid}
     */
    static IID => Guid("{3051052c-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for SVGPatternElement
     * @type {Guid}
     */
    static CLSID => Guid("{305105d4-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["putref_patternUnits", "get_patternUnits", "putref_patternContentUnits", "get_patternContentUnits", "putref_patternTransform", "get_patternTransform", "putref_x", "get_x", "putref_y", "get_y", "putref_width", "get_width", "putref_height", "get_height"]

    /**
     * 
     * @param {ISVGAnimatedEnumeration} v 
     * @returns {HRESULT} 
     */
    putref_patternUnits(v) {
        result := ComCall(7, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ISVGAnimatedEnumeration>} p 
     * @returns {HRESULT} 
     */
    get_patternUnits(p) {
        result := ComCall(8, this, "ptr*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ISVGAnimatedEnumeration} v 
     * @returns {HRESULT} 
     */
    putref_patternContentUnits(v) {
        result := ComCall(9, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ISVGAnimatedEnumeration>} p 
     * @returns {HRESULT} 
     */
    get_patternContentUnits(p) {
        result := ComCall(10, this, "ptr*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ISVGAnimatedTransformList} v 
     * @returns {HRESULT} 
     */
    putref_patternTransform(v) {
        result := ComCall(11, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ISVGAnimatedTransformList>} p 
     * @returns {HRESULT} 
     */
    get_patternTransform(p) {
        result := ComCall(12, this, "ptr*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ISVGAnimatedLength} v 
     * @returns {HRESULT} 
     */
    putref_x(v) {
        result := ComCall(13, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ISVGAnimatedLength>} p 
     * @returns {HRESULT} 
     */
    get_x(p) {
        result := ComCall(14, this, "ptr*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ISVGAnimatedLength} v 
     * @returns {HRESULT} 
     */
    putref_y(v) {
        result := ComCall(15, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ISVGAnimatedLength>} p 
     * @returns {HRESULT} 
     */
    get_y(p) {
        result := ComCall(16, this, "ptr*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ISVGAnimatedLength} v 
     * @returns {HRESULT} 
     */
    putref_width(v) {
        result := ComCall(17, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ISVGAnimatedLength>} p 
     * @returns {HRESULT} 
     */
    get_width(p) {
        result := ComCall(18, this, "ptr*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ISVGAnimatedLength} v 
     * @returns {HRESULT} 
     */
    putref_height(v) {
        result := ComCall(19, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ISVGAnimatedLength>} p 
     * @returns {HRESULT} 
     */
    get_height(p) {
        result := ComCall(20, this, "ptr*", p, "HRESULT")
        return result
    }
}
