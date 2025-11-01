#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IHTMLPerformanceNavigation extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHTMLPerformanceNavigation
     * @type {Guid}
     */
    static IID => Guid("{30510750-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for HTMLPerformanceNavigation
     * @type {Guid}
     */
    static CLSID => Guid("{30510751-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_type", "get_redirectCount", "toString", "toJSON"]

    /**
     * 
     * @param {Pointer<Integer>} p 
     * @returns {HRESULT} 
     */
    get_type(p) {
        result := ComCall(7, this, "uint*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} p 
     * @returns {HRESULT} 
     */
    get_redirectCount(p) {
        result := ComCall(8, this, "uint*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} string 
     * @returns {HRESULT} 
     */
    toString(string) {
        result := ComCall(9, this, "ptr", string, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pVar 
     * @returns {HRESULT} 
     */
    toJSON(pVar) {
        result := ComCall(10, this, "ptr", pVar, "HRESULT")
        return result
    }
}
