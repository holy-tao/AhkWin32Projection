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
        pMarshal := p is VarRef ? "uint*" : "ptr"

        result := ComCall(7, this, pMarshal, p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} p 
     * @returns {HRESULT} 
     */
    get_unloadEventStart(p) {
        pMarshal := p is VarRef ? "uint*" : "ptr"

        result := ComCall(8, this, pMarshal, p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} p 
     * @returns {HRESULT} 
     */
    get_unloadEventEnd(p) {
        pMarshal := p is VarRef ? "uint*" : "ptr"

        result := ComCall(9, this, pMarshal, p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} p 
     * @returns {HRESULT} 
     */
    get_redirectStart(p) {
        pMarshal := p is VarRef ? "uint*" : "ptr"

        result := ComCall(10, this, pMarshal, p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} p 
     * @returns {HRESULT} 
     */
    get_redirectEnd(p) {
        pMarshal := p is VarRef ? "uint*" : "ptr"

        result := ComCall(11, this, pMarshal, p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} p 
     * @returns {HRESULT} 
     */
    get_fetchStart(p) {
        pMarshal := p is VarRef ? "uint*" : "ptr"

        result := ComCall(12, this, pMarshal, p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} p 
     * @returns {HRESULT} 
     */
    get_domainLookupStart(p) {
        pMarshal := p is VarRef ? "uint*" : "ptr"

        result := ComCall(13, this, pMarshal, p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} p 
     * @returns {HRESULT} 
     */
    get_domainLookupEnd(p) {
        pMarshal := p is VarRef ? "uint*" : "ptr"

        result := ComCall(14, this, pMarshal, p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} p 
     * @returns {HRESULT} 
     */
    get_connectStart(p) {
        pMarshal := p is VarRef ? "uint*" : "ptr"

        result := ComCall(15, this, pMarshal, p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} p 
     * @returns {HRESULT} 
     */
    get_connectEnd(p) {
        pMarshal := p is VarRef ? "uint*" : "ptr"

        result := ComCall(16, this, pMarshal, p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} p 
     * @returns {HRESULT} 
     */
    get_requestStart(p) {
        pMarshal := p is VarRef ? "uint*" : "ptr"

        result := ComCall(17, this, pMarshal, p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} p 
     * @returns {HRESULT} 
     */
    get_responseStart(p) {
        pMarshal := p is VarRef ? "uint*" : "ptr"

        result := ComCall(18, this, pMarshal, p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} p 
     * @returns {HRESULT} 
     */
    get_responseEnd(p) {
        pMarshal := p is VarRef ? "uint*" : "ptr"

        result := ComCall(19, this, pMarshal, p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} p 
     * @returns {HRESULT} 
     */
    get_domLoading(p) {
        pMarshal := p is VarRef ? "uint*" : "ptr"

        result := ComCall(20, this, pMarshal, p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} p 
     * @returns {HRESULT} 
     */
    get_domInteractive(p) {
        pMarshal := p is VarRef ? "uint*" : "ptr"

        result := ComCall(21, this, pMarshal, p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} p 
     * @returns {HRESULT} 
     */
    get_domContentLoadedEventStart(p) {
        pMarshal := p is VarRef ? "uint*" : "ptr"

        result := ComCall(22, this, pMarshal, p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} p 
     * @returns {HRESULT} 
     */
    get_domContentLoadedEventEnd(p) {
        pMarshal := p is VarRef ? "uint*" : "ptr"

        result := ComCall(23, this, pMarshal, p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} p 
     * @returns {HRESULT} 
     */
    get_domComplete(p) {
        pMarshal := p is VarRef ? "uint*" : "ptr"

        result := ComCall(24, this, pMarshal, p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} p 
     * @returns {HRESULT} 
     */
    get_loadEventStart(p) {
        pMarshal := p is VarRef ? "uint*" : "ptr"

        result := ComCall(25, this, pMarshal, p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} p 
     * @returns {HRESULT} 
     */
    get_loadEventEnd(p) {
        pMarshal := p is VarRef ? "uint*" : "ptr"

        result := ComCall(26, this, pMarshal, p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} p 
     * @returns {HRESULT} 
     */
    get_msFirstPaint(p) {
        pMarshal := p is VarRef ? "uint*" : "ptr"

        result := ComCall(27, this, pMarshal, p, "HRESULT")
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
