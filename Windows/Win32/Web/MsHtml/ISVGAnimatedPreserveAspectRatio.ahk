#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ISVGPreserveAspectRatio.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class ISVGAnimatedPreserveAspectRatio extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISVGAnimatedPreserveAspectRatio
     * @type {Guid}
     */
    static IID => Guid("{305104fb-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for SVGAnimatedPreserveAspectRatio
     * @type {Guid}
     */
    static CLSID => Guid("{305105ce-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["putref_baseVal", "get_baseVal", "putref_animVal", "get_animVal"]

    /**
     * 
     * @param {ISVGPreserveAspectRatio} v 
     * @returns {HRESULT} 
     */
    putref_baseVal(v) {
        result := ComCall(7, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {ISVGPreserveAspectRatio} 
     */
    get_baseVal() {
        result := ComCall(8, this, "ptr*", &p := 0, "HRESULT")
        return ISVGPreserveAspectRatio(p)
    }

    /**
     * 
     * @param {ISVGPreserveAspectRatio} v 
     * @returns {HRESULT} 
     */
    putref_animVal(v) {
        result := ComCall(9, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {ISVGPreserveAspectRatio} 
     */
    get_animVal() {
        result := ComCall(10, this, "ptr*", &p := 0, "HRESULT")
        return ISVGPreserveAspectRatio(p)
    }
}
