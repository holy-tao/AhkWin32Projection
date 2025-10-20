#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IHTMLPerformanceNavigation extends IDispatch{
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
     * 
     * @param {Pointer<UInt32>} p 
     * @returns {HRESULT} 
     */
    get_type(p) {
        result := ComCall(7, this, "uint*", p, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} p 
     * @returns {HRESULT} 
     */
    get_redirectCount(p) {
        result := ComCall(8, this, "uint*", p, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} string 
     * @returns {HRESULT} 
     */
    toString(string) {
        result := ComCall(9, this, "ptr", string, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pVar 
     * @returns {HRESULT} 
     */
    toJSON(pVar) {
        result := ComCall(10, this, "ptr", pVar, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
