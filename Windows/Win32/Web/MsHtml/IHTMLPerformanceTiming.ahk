#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Variant\VARIANT.ahk
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
     * @type {Integer} 
     */
    navigationStart {
        get => this.get_navigationStart()
    }

    /**
     * @type {Integer} 
     */
    unloadEventStart {
        get => this.get_unloadEventStart()
    }

    /**
     * @type {Integer} 
     */
    unloadEventEnd {
        get => this.get_unloadEventEnd()
    }

    /**
     * @type {Integer} 
     */
    redirectStart {
        get => this.get_redirectStart()
    }

    /**
     * @type {Integer} 
     */
    redirectEnd {
        get => this.get_redirectEnd()
    }

    /**
     * @type {Integer} 
     */
    fetchStart {
        get => this.get_fetchStart()
    }

    /**
     * @type {Integer} 
     */
    domainLookupStart {
        get => this.get_domainLookupStart()
    }

    /**
     * @type {Integer} 
     */
    domainLookupEnd {
        get => this.get_domainLookupEnd()
    }

    /**
     * @type {Integer} 
     */
    connectStart {
        get => this.get_connectStart()
    }

    /**
     * @type {Integer} 
     */
    connectEnd {
        get => this.get_connectEnd()
    }

    /**
     * @type {Integer} 
     */
    requestStart {
        get => this.get_requestStart()
    }

    /**
     * @type {Integer} 
     */
    responseStart {
        get => this.get_responseStart()
    }

    /**
     * @type {Integer} 
     */
    responseEnd {
        get => this.get_responseEnd()
    }

    /**
     * @type {Integer} 
     */
    domLoading {
        get => this.get_domLoading()
    }

    /**
     * @type {Integer} 
     */
    domInteractive {
        get => this.get_domInteractive()
    }

    /**
     * @type {Integer} 
     */
    domContentLoadedEventStart {
        get => this.get_domContentLoadedEventStart()
    }

    /**
     * @type {Integer} 
     */
    domContentLoadedEventEnd {
        get => this.get_domContentLoadedEventEnd()
    }

    /**
     * @type {Integer} 
     */
    domComplete {
        get => this.get_domComplete()
    }

    /**
     * @type {Integer} 
     */
    loadEventStart {
        get => this.get_loadEventStart()
    }

    /**
     * @type {Integer} 
     */
    loadEventEnd {
        get => this.get_loadEventEnd()
    }

    /**
     * @type {Integer} 
     */
    msFirstPaint {
        get => this.get_msFirstPaint()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_navigationStart() {
        result := ComCall(7, this, "uint*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_unloadEventStart() {
        result := ComCall(8, this, "uint*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_unloadEventEnd() {
        result := ComCall(9, this, "uint*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_redirectStart() {
        result := ComCall(10, this, "uint*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_redirectEnd() {
        result := ComCall(11, this, "uint*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_fetchStart() {
        result := ComCall(12, this, "uint*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_domainLookupStart() {
        result := ComCall(13, this, "uint*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_domainLookupEnd() {
        result := ComCall(14, this, "uint*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_connectStart() {
        result := ComCall(15, this, "uint*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_connectEnd() {
        result := ComCall(16, this, "uint*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_requestStart() {
        result := ComCall(17, this, "uint*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_responseStart() {
        result := ComCall(18, this, "uint*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_responseEnd() {
        result := ComCall(19, this, "uint*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_domLoading() {
        result := ComCall(20, this, "uint*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_domInteractive() {
        result := ComCall(21, this, "uint*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_domContentLoadedEventStart() {
        result := ComCall(22, this, "uint*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_domContentLoadedEventEnd() {
        result := ComCall(23, this, "uint*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_domComplete() {
        result := ComCall(24, this, "uint*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_loadEventStart() {
        result := ComCall(25, this, "uint*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_loadEventEnd() {
        result := ComCall(26, this, "uint*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_msFirstPaint() {
        result := ComCall(27, this, "uint*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    toString() {
        string := BSTR()
        result := ComCall(28, this, "ptr", string, "HRESULT")
        return string
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    toJSON() {
        pVar := VARIANT()
        result := ComCall(29, this, "ptr", pVar, "HRESULT")
        return pVar
    }
}
