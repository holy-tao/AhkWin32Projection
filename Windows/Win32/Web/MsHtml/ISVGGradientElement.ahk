#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ISVGAnimatedEnumeration.ahk
#Include .\ISVGAnimatedTransformList.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class ISVGGradientElement extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISVGGradientElement
     * @type {Guid}
     */
    static IID => Guid("{30510528-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for SVGGradientElement
     * @type {Guid}
     */
    static CLSID => Guid("{305105d6-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["putref_gradientUnits", "get_gradientUnits", "putref_gradientTransform", "get_gradientTransform", "putref_spreadMethod", "get_spreadMethod"]

    /**
     * 
     * @param {ISVGAnimatedEnumeration} v 
     * @returns {HRESULT} 
     */
    putref_gradientUnits(v) {
        result := ComCall(7, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {ISVGAnimatedEnumeration} 
     */
    get_gradientUnits() {
        result := ComCall(8, this, "ptr*", &p := 0, "HRESULT")
        return ISVGAnimatedEnumeration(p)
    }

    /**
     * 
     * @param {ISVGAnimatedTransformList} v 
     * @returns {HRESULT} 
     */
    putref_gradientTransform(v) {
        result := ComCall(9, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {ISVGAnimatedTransformList} 
     */
    get_gradientTransform() {
        result := ComCall(10, this, "ptr*", &p := 0, "HRESULT")
        return ISVGAnimatedTransformList(p)
    }

    /**
     * 
     * @param {ISVGAnimatedEnumeration} v 
     * @returns {HRESULT} 
     */
    putref_spreadMethod(v) {
        result := ComCall(11, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {ISVGAnimatedEnumeration} 
     */
    get_spreadMethod() {
        result := ComCall(12, this, "ptr*", &p := 0, "HRESULT")
        return ISVGAnimatedEnumeration(p)
    }
}
