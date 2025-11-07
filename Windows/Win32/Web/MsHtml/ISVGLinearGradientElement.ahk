#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ISVGAnimatedLength.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class ISVGLinearGradientElement extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISVGLinearGradientElement
     * @type {Guid}
     */
    static IID => Guid("{30510529-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for SVGLinearGradientElement
     * @type {Guid}
     */
    static CLSID => Guid("{305105d2-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["putref_x1", "get_x1", "putref_y1", "get_y1", "putref_x2", "get_x2", "putref_y2", "get_y2"]

    /**
     * 
     * @param {ISVGAnimatedLength} v 
     * @returns {HRESULT} 
     */
    putref_x1(v) {
        result := ComCall(7, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {ISVGAnimatedLength} 
     */
    get_x1() {
        result := ComCall(8, this, "ptr*", &p := 0, "HRESULT")
        return ISVGAnimatedLength(p)
    }

    /**
     * 
     * @param {ISVGAnimatedLength} v 
     * @returns {HRESULT} 
     */
    putref_y1(v) {
        result := ComCall(9, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {ISVGAnimatedLength} 
     */
    get_y1() {
        result := ComCall(10, this, "ptr*", &p := 0, "HRESULT")
        return ISVGAnimatedLength(p)
    }

    /**
     * 
     * @param {ISVGAnimatedLength} v 
     * @returns {HRESULT} 
     */
    putref_x2(v) {
        result := ComCall(11, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {ISVGAnimatedLength} 
     */
    get_x2() {
        result := ComCall(12, this, "ptr*", &p := 0, "HRESULT")
        return ISVGAnimatedLength(p)
    }

    /**
     * 
     * @param {ISVGAnimatedLength} v 
     * @returns {HRESULT} 
     */
    putref_y2(v) {
        result := ComCall(13, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {ISVGAnimatedLength} 
     */
    get_y2() {
        result := ComCall(14, this, "ptr*", &p := 0, "HRESULT")
        return ISVGAnimatedLength(p)
    }
}
