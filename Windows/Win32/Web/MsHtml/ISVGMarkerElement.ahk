#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class ISVGMarkerElement extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISVGMarkerElement
     * @type {Guid}
     */
    static IID => Guid("{30510525-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for SVGMarkerElement
     * @type {Guid}
     */
    static CLSID => Guid("{305105de-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["putref_refX", "get_refX", "putref_refY", "get_refY", "putref_markerUnits", "get_markerUnits", "putref_markerWidth", "get_markerWidth", "putref_markerHeight", "get_markerHeight", "putref_orientType", "get_orientType", "putref_orientAngle", "get_orientAngle", "setOrientToAuto", "setOrientToAngle"]

    /**
     * 
     * @param {ISVGAnimatedLength} v 
     * @returns {HRESULT} 
     */
    putref_refX(v) {
        result := ComCall(7, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ISVGAnimatedLength>} p 
     * @returns {HRESULT} 
     */
    get_refX(p) {
        result := ComCall(8, this, "ptr*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ISVGAnimatedLength} v 
     * @returns {HRESULT} 
     */
    putref_refY(v) {
        result := ComCall(9, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ISVGAnimatedLength>} p 
     * @returns {HRESULT} 
     */
    get_refY(p) {
        result := ComCall(10, this, "ptr*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ISVGAnimatedEnumeration} v 
     * @returns {HRESULT} 
     */
    putref_markerUnits(v) {
        result := ComCall(11, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ISVGAnimatedEnumeration>} p 
     * @returns {HRESULT} 
     */
    get_markerUnits(p) {
        result := ComCall(12, this, "ptr*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ISVGAnimatedLength} v 
     * @returns {HRESULT} 
     */
    putref_markerWidth(v) {
        result := ComCall(13, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ISVGAnimatedLength>} p 
     * @returns {HRESULT} 
     */
    get_markerWidth(p) {
        result := ComCall(14, this, "ptr*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ISVGAnimatedLength} v 
     * @returns {HRESULT} 
     */
    putref_markerHeight(v) {
        result := ComCall(15, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ISVGAnimatedLength>} p 
     * @returns {HRESULT} 
     */
    get_markerHeight(p) {
        result := ComCall(16, this, "ptr*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ISVGAnimatedEnumeration} v 
     * @returns {HRESULT} 
     */
    putref_orientType(v) {
        result := ComCall(17, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ISVGAnimatedEnumeration>} p 
     * @returns {HRESULT} 
     */
    get_orientType(p) {
        result := ComCall(18, this, "ptr*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ISVGAnimatedAngle} v 
     * @returns {HRESULT} 
     */
    putref_orientAngle(v) {
        result := ComCall(19, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ISVGAnimatedAngle>} p 
     * @returns {HRESULT} 
     */
    get_orientAngle(p) {
        result := ComCall(20, this, "ptr*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    setOrientToAuto() {
        result := ComCall(21, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ISVGAngle} pSVGAngle 
     * @returns {HRESULT} 
     */
    setOrientToAngle(pSVGAngle) {
        result := ComCall(22, this, "ptr", pSVGAngle, "HRESULT")
        return result
    }
}
