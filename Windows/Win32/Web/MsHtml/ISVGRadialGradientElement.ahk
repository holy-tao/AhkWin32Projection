#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ISVGAnimatedLength.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class ISVGRadialGradientElement extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISVGRadialGradientElement
     * @type {Guid}
     */
    static IID => Guid("{3051052a-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for SVGRadialGradientElement
     * @type {Guid}
     */
    static CLSID => Guid("{305105d3-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["putref_cx", "get_cx", "putref_cy", "get_cy", "putref_r", "get_r", "putref_fx", "get_fx", "putref_fy", "get_fy"]

    /**
     * @type {ISVGAnimatedLength} 
     */
    cx {
        get => this.get_cx()
    }

    /**
     * @type {ISVGAnimatedLength} 
     */
    cy {
        get => this.get_cy()
    }

    /**
     * @type {ISVGAnimatedLength} 
     */
    r {
        get => this.get_r()
    }

    /**
     * @type {ISVGAnimatedLength} 
     */
    fx {
        get => this.get_fx()
    }

    /**
     * @type {ISVGAnimatedLength} 
     */
    fy {
        get => this.get_fy()
    }

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
     * @returns {ISVGAnimatedLength} 
     */
    get_cx() {
        result := ComCall(8, this, "ptr*", &p := 0, "HRESULT")
        return ISVGAnimatedLength(p)
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
     * @returns {ISVGAnimatedLength} 
     */
    get_cy() {
        result := ComCall(10, this, "ptr*", &p := 0, "HRESULT")
        return ISVGAnimatedLength(p)
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
     * @returns {ISVGAnimatedLength} 
     */
    get_r() {
        result := ComCall(12, this, "ptr*", &p := 0, "HRESULT")
        return ISVGAnimatedLength(p)
    }

    /**
     * 
     * @param {ISVGAnimatedLength} v 
     * @returns {HRESULT} 
     */
    putref_fx(v) {
        result := ComCall(13, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {ISVGAnimatedLength} 
     */
    get_fx() {
        result := ComCall(14, this, "ptr*", &p := 0, "HRESULT")
        return ISVGAnimatedLength(p)
    }

    /**
     * 
     * @param {ISVGAnimatedLength} v 
     * @returns {HRESULT} 
     */
    putref_fy(v) {
        result := ComCall(15, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {ISVGAnimatedLength} 
     */
    get_fy() {
        result := ComCall(16, this, "ptr*", &p := 0, "HRESULT")
        return ISVGAnimatedLength(p)
    }
}
