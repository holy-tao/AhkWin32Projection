#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IHTMLPerformanceTiming extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHTMLPerformanceTiming
     * @type {Guid}
     */
    static IID => Guid("{30510752-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for HTMLPerformanceTiming
     * @type {Guid}
     */
    static CLSID => Guid("{30510753-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_navigationStart", "get_unloadEventStart", "get_unloadEventEnd", "get_redirectStart", "get_redirectEnd", "get_fetchStart", "get_domainLookupStart", "get_domainLookupEnd", "get_connectStart", "get_connectEnd", "get_requestStart", "get_responseStart", "get_responseEnd", "get_domLoading", "get_domInteractive", "get_domContentLoadedEventStart", "get_domContentLoadedEventEnd", "get_domComplete", "get_loadEventStart", "get_loadEventEnd", "get_msFirstPaint", "toString", "toJSON"]

    /**
     * 
     * @param {Pointer<Integer>} p 
     * @returns {HRESULT} 
     */
    get_navigationStart(p) {
        result := ComCall(7, this, "uint*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} p 
     * @returns {HRESULT} 
     */
    get_unloadEventStart(p) {
        result := ComCall(8, this, "uint*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} p 
     * @returns {HRESULT} 
     */
    get_unloadEventEnd(p) {
        result := ComCall(9, this, "uint*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} p 
     * @returns {HRESULT} 
     */
    get_redirectStart(p) {
        result := ComCall(10, this, "uint*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} p 
     * @returns {HRESULT} 
     */
    get_redirectEnd(p) {
        result := ComCall(11, this, "uint*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} p 
     * @returns {HRESULT} 
     */
    get_fetchStart(p) {
        result := ComCall(12, this, "uint*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} p 
     * @returns {HRESULT} 
     */
    get_domainLookupStart(p) {
        result := ComCall(13, this, "uint*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} p 
     * @returns {HRESULT} 
     */
    get_domainLookupEnd(p) {
        result := ComCall(14, this, "uint*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} p 
     * @returns {HRESULT} 
     */
    get_connectStart(p) {
        result := ComCall(15, this, "uint*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} p 
     * @returns {HRESULT} 
     */
    get_connectEnd(p) {
        result := ComCall(16, this, "uint*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} p 
     * @returns {HRESULT} 
     */
    get_requestStart(p) {
        result := ComCall(17, this, "uint*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} p 
     * @returns {HRESULT} 
     */
    get_responseStart(p) {
        result := ComCall(18, this, "uint*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} p 
     * @returns {HRESULT} 
     */
    get_responseEnd(p) {
        result := ComCall(19, this, "uint*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} p 
     * @returns {HRESULT} 
     */
    get_domLoading(p) {
        result := ComCall(20, this, "uint*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} p 
     * @returns {HRESULT} 
     */
    get_domInteractive(p) {
        result := ComCall(21, this, "uint*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} p 
     * @returns {HRESULT} 
     */
    get_domContentLoadedEventStart(p) {
        result := ComCall(22, this, "uint*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} p 
     * @returns {HRESULT} 
     */
    get_domContentLoadedEventEnd(p) {
        result := ComCall(23, this, "uint*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} p 
     * @returns {HRESULT} 
     */
    get_domComplete(p) {
        result := ComCall(24, this, "uint*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} p 
     * @returns {HRESULT} 
     */
    get_loadEventStart(p) {
        result := ComCall(25, this, "uint*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} p 
     * @returns {HRESULT} 
     */
    get_loadEventEnd(p) {
        result := ComCall(26, this, "uint*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} p 
     * @returns {HRESULT} 
     */
    get_msFirstPaint(p) {
        result := ComCall(27, this, "uint*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} string 
     * @returns {HRESULT} 
     */
    toString(string) {
        result := ComCall(28, this, "ptr", string, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pVar 
     * @returns {HRESULT} 
     */
    toJSON(pVar) {
        result := ComCall(29, this, "ptr", pVar, "HRESULT")
        return result
    }
}
