#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ISVGTransformList.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class ISVGAnimatedTransformList extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISVGAnimatedTransformList
     * @type {Guid}
     */
    static IID => Guid("{305104f9-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for SVGAnimatedTransformList
     * @type {Guid}
     */
    static CLSID => Guid("{305105b1-98b5-11cf-bb82-00aa00bdce0b}")

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
     * @param {ISVGTransformList} v 
     * @returns {HRESULT} 
     */
    putref_baseVal(v) {
        result := ComCall(7, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {ISVGTransformList} 
     */
    get_baseVal() {
        result := ComCall(8, this, "ptr*", &p := 0, "HRESULT")
        return ISVGTransformList(p)
    }

    /**
     * 
     * @param {ISVGTransformList} v 
     * @returns {HRESULT} 
     */
    putref_animVal(v) {
        result := ComCall(9, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {ISVGTransformList} 
     */
    get_animVal() {
        result := ComCall(10, this, "ptr*", &p := 0, "HRESULT")
        return ISVGTransformList(p)
    }
}
