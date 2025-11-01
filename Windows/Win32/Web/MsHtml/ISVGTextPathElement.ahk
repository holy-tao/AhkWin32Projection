#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class ISVGTextPathElement extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISVGTextPathElement
     * @type {Guid}
     */
    static IID => Guid("{3051051f-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for SVGTextPathElement
     * @type {Guid}
     */
    static CLSID => Guid("{305105eb-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["putref_startOffset", "get_startOffset", "putref_method", "get_method", "putref_spacing", "get_spacing"]

    /**
     * 
     * @param {ISVGAnimatedLength} v 
     * @returns {HRESULT} 
     */
    putref_startOffset(v) {
        result := ComCall(7, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ISVGAnimatedLength>} p 
     * @returns {HRESULT} 
     */
    get_startOffset(p) {
        result := ComCall(8, this, "ptr*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ISVGAnimatedEnumeration} v 
     * @returns {HRESULT} 
     */
    putref_method(v) {
        result := ComCall(9, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ISVGAnimatedEnumeration>} p 
     * @returns {HRESULT} 
     */
    get_method(p) {
        result := ComCall(10, this, "ptr*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ISVGAnimatedEnumeration} v 
     * @returns {HRESULT} 
     */
    putref_spacing(v) {
        result := ComCall(11, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ISVGAnimatedEnumeration>} p 
     * @returns {HRESULT} 
     */
    get_spacing(p) {
        result := ComCall(12, this, "ptr*", p, "HRESULT")
        return result
    }
}
