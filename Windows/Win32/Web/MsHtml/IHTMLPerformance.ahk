#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IHTMLPerformance extends IDispatch{
    /**
     * The interface identifier for IHTMLPerformance
     * @type {Guid}
     */
    static IID => Guid("{3051074e-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for HTMLPerformance
     * @type {Guid}
     */
    static CLSID => Guid("{3051074f-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @param {Pointer<IHTMLPerformanceNavigation>} p 
     * @returns {HRESULT} 
     */
    get_navigation(p) {
        result := ComCall(7, this, "ptr", p, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IHTMLPerformanceTiming>} p 
     * @returns {HRESULT} 
     */
    get_timing(p) {
        result := ComCall(8, this, "ptr", p, "int")
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
