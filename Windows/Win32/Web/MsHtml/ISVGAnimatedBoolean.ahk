#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class ISVGAnimatedBoolean extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISVGAnimatedBoolean
     * @type {Guid}
     */
    static IID => Guid("{305104c6-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for SVGAnimatedBoolean
     * @type {Guid}
     */
    static CLSID => Guid("{3051058b-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["put_baseVal", "get_baseVal", "put_animVal", "get_animVal"]

    /**
     * 
     * @param {VARIANT_BOOL} v 
     * @returns {HRESULT} 
     */
    put_baseVal(v) {
        result := ComCall(7, this, "short", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} p 
     * @returns {HRESULT} 
     */
    get_baseVal(p) {
        result := ComCall(8, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} v 
     * @returns {HRESULT} 
     */
    put_animVal(v) {
        result := ComCall(9, this, "short", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} p 
     * @returns {HRESULT} 
     */
    get_animVal(p) {
        result := ComCall(10, this, "ptr", p, "HRESULT")
        return result
    }
}
