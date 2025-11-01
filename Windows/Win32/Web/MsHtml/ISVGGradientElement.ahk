#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * @param {Pointer<ISVGAnimatedEnumeration>} p 
     * @returns {HRESULT} 
     */
    get_gradientUnits(p) {
        result := ComCall(8, this, "ptr*", p, "HRESULT")
        return result
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
     * @param {Pointer<ISVGAnimatedTransformList>} p 
     * @returns {HRESULT} 
     */
    get_gradientTransform(p) {
        result := ComCall(10, this, "ptr*", p, "HRESULT")
        return result
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
     * @param {Pointer<ISVGAnimatedEnumeration>} p 
     * @returns {HRESULT} 
     */
    get_spreadMethod(p) {
        result := ComCall(12, this, "ptr*", p, "HRESULT")
        return result
    }
}
