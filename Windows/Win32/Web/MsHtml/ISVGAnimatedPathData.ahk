#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class ISVGAnimatedPathData extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISVGAnimatedPathData
     * @type {Guid}
     */
    static IID => Guid("{30510511-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["putref_pathSegList", "get_pathSegList", "putref_normalizedPathSegList", "get_normalizedPathSegList", "putref_animatedPathSegList", "get_animatedPathSegList", "putref_animatedNormalizedPathSegList", "get_animatedNormalizedPathSegList"]

    /**
     * 
     * @param {ISVGPathSegList} v 
     * @returns {HRESULT} 
     */
    putref_pathSegList(v) {
        result := ComCall(7, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ISVGPathSegList>} p 
     * @returns {HRESULT} 
     */
    get_pathSegList(p) {
        result := ComCall(8, this, "ptr*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ISVGPathSegList} v 
     * @returns {HRESULT} 
     */
    putref_normalizedPathSegList(v) {
        result := ComCall(9, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ISVGPathSegList>} p 
     * @returns {HRESULT} 
     */
    get_normalizedPathSegList(p) {
        result := ComCall(10, this, "ptr*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ISVGPathSegList} v 
     * @returns {HRESULT} 
     */
    putref_animatedPathSegList(v) {
        result := ComCall(11, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ISVGPathSegList>} p 
     * @returns {HRESULT} 
     */
    get_animatedPathSegList(p) {
        result := ComCall(12, this, "ptr*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ISVGPathSegList} v 
     * @returns {HRESULT} 
     */
    putref_animatedNormalizedPathSegList(v) {
        result := ComCall(13, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ISVGPathSegList>} p 
     * @returns {HRESULT} 
     */
    get_animatedNormalizedPathSegList(p) {
        result := ComCall(14, this, "ptr*", p, "HRESULT")
        return result
    }
}
