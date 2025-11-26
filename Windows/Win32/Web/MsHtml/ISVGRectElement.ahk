#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ISVGAnimatedLength.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class ISVGRectElement extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISVGRectElement
     * @type {Guid}
     */
    static IID => Guid("{30510513-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for SVGRectElement
     * @type {Guid}
     */
    static CLSID => Guid("{30510577-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["putref_x", "get_x", "putref_y", "get_y", "putref_width", "get_width", "putref_height", "get_height", "putref_rx", "get_rx", "putref_ry", "get_ry"]

    /**
     * @type {ISVGAnimatedLength} 
     */
    x {
        get => this.get_x()
    }

    /**
     * @type {ISVGAnimatedLength} 
     */
    y {
        get => this.get_y()
    }

    /**
     * @type {ISVGAnimatedLength} 
     */
    width {
        get => this.get_width()
    }

    /**
     * @type {ISVGAnimatedLength} 
     */
    height {
        get => this.get_height()
    }

    /**
     * @type {ISVGAnimatedLength} 
     */
    rx {
        get => this.get_rx()
    }

    /**
     * @type {ISVGAnimatedLength} 
     */
    ry {
        get => this.get_ry()
    }

    /**
     * 
     * @param {ISVGAnimatedLength} v 
     * @returns {HRESULT} 
     */
    putref_x(v) {
        result := ComCall(7, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {ISVGAnimatedLength} 
     */
    get_x() {
        result := ComCall(8, this, "ptr*", &p := 0, "HRESULT")
        return ISVGAnimatedLength(p)
    }

    /**
     * 
     * @param {ISVGAnimatedLength} v 
     * @returns {HRESULT} 
     */
    putref_y(v) {
        result := ComCall(9, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {ISVGAnimatedLength} 
     */
    get_y() {
        result := ComCall(10, this, "ptr*", &p := 0, "HRESULT")
        return ISVGAnimatedLength(p)
    }

    /**
     * 
     * @param {ISVGAnimatedLength} v 
     * @returns {HRESULT} 
     */
    putref_width(v) {
        result := ComCall(11, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {ISVGAnimatedLength} 
     */
    get_width() {
        result := ComCall(12, this, "ptr*", &p := 0, "HRESULT")
        return ISVGAnimatedLength(p)
    }

    /**
     * 
     * @param {ISVGAnimatedLength} v 
     * @returns {HRESULT} 
     */
    putref_height(v) {
        result := ComCall(13, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {ISVGAnimatedLength} 
     */
    get_height() {
        result := ComCall(14, this, "ptr*", &p := 0, "HRESULT")
        return ISVGAnimatedLength(p)
    }

    /**
     * 
     * @param {ISVGAnimatedLength} v 
     * @returns {HRESULT} 
     */
    putref_rx(v) {
        result := ComCall(15, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {ISVGAnimatedLength} 
     */
    get_rx() {
        result := ComCall(16, this, "ptr*", &p := 0, "HRESULT")
        return ISVGAnimatedLength(p)
    }

    /**
     * 
     * @param {ISVGAnimatedLength} v 
     * @returns {HRESULT} 
     */
    putref_ry(v) {
        result := ComCall(17, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {ISVGAnimatedLength} 
     */
    get_ry() {
        result := ComCall(18, this, "ptr*", &p := 0, "HRESULT")
        return ISVGAnimatedLength(p)
    }
}
