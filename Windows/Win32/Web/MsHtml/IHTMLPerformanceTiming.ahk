#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct IHTMLPerformanceTiming extends IDispatch {
    /**
     * The interface identifier for IHTMLPerformanceTiming
     * @type {Guid}
     */
    static IID := Guid("{30510752-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for HTMLPerformanceTiming
     * @type {Guid}
     */
    static CLSID := Guid("{30510753-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IHTMLPerformanceTiming interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_navigationStart            : IntPtr
        get_unloadEventStart           : IntPtr
        get_unloadEventEnd             : IntPtr
        get_redirectStart              : IntPtr
        get_redirectEnd                : IntPtr
        get_fetchStart                 : IntPtr
        get_domainLookupStart          : IntPtr
        get_domainLookupEnd            : IntPtr
        get_connectStart               : IntPtr
        get_connectEnd                 : IntPtr
        get_requestStart               : IntPtr
        get_responseStart              : IntPtr
        get_responseEnd                : IntPtr
        get_domLoading                 : IntPtr
        get_domInteractive             : IntPtr
        get_domContentLoadedEventStart : IntPtr
        get_domContentLoadedEventEnd   : IntPtr
        get_domComplete                : IntPtr
        get_loadEventStart             : IntPtr
        get_loadEventEnd               : IntPtr
        get_msFirstPaint               : IntPtr
        toString                       : IntPtr
        toJSON                         : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IHTMLPerformanceTiming.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
        _string := BSTR.Owned()
        result := ComCall(28, this, BSTR.Ptr, _string, "HRESULT")
        return _string
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    toJSON() {
        pVar := VARIANT()
        result := ComCall(29, this, VARIANT.Ptr, pVar, "HRESULT")
        return pVar
    }

    Query(iid) {
        if (IHTMLPerformanceTiming.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_navigationStart := CallbackCreate(GetMethod(implObj, "get_navigationStart"), flags, 2)
        this.vtbl.get_unloadEventStart := CallbackCreate(GetMethod(implObj, "get_unloadEventStart"), flags, 2)
        this.vtbl.get_unloadEventEnd := CallbackCreate(GetMethod(implObj, "get_unloadEventEnd"), flags, 2)
        this.vtbl.get_redirectStart := CallbackCreate(GetMethod(implObj, "get_redirectStart"), flags, 2)
        this.vtbl.get_redirectEnd := CallbackCreate(GetMethod(implObj, "get_redirectEnd"), flags, 2)
        this.vtbl.get_fetchStart := CallbackCreate(GetMethod(implObj, "get_fetchStart"), flags, 2)
        this.vtbl.get_domainLookupStart := CallbackCreate(GetMethod(implObj, "get_domainLookupStart"), flags, 2)
        this.vtbl.get_domainLookupEnd := CallbackCreate(GetMethod(implObj, "get_domainLookupEnd"), flags, 2)
        this.vtbl.get_connectStart := CallbackCreate(GetMethod(implObj, "get_connectStart"), flags, 2)
        this.vtbl.get_connectEnd := CallbackCreate(GetMethod(implObj, "get_connectEnd"), flags, 2)
        this.vtbl.get_requestStart := CallbackCreate(GetMethod(implObj, "get_requestStart"), flags, 2)
        this.vtbl.get_responseStart := CallbackCreate(GetMethod(implObj, "get_responseStart"), flags, 2)
        this.vtbl.get_responseEnd := CallbackCreate(GetMethod(implObj, "get_responseEnd"), flags, 2)
        this.vtbl.get_domLoading := CallbackCreate(GetMethod(implObj, "get_domLoading"), flags, 2)
        this.vtbl.get_domInteractive := CallbackCreate(GetMethod(implObj, "get_domInteractive"), flags, 2)
        this.vtbl.get_domContentLoadedEventStart := CallbackCreate(GetMethod(implObj, "get_domContentLoadedEventStart"), flags, 2)
        this.vtbl.get_domContentLoadedEventEnd := CallbackCreate(GetMethod(implObj, "get_domContentLoadedEventEnd"), flags, 2)
        this.vtbl.get_domComplete := CallbackCreate(GetMethod(implObj, "get_domComplete"), flags, 2)
        this.vtbl.get_loadEventStart := CallbackCreate(GetMethod(implObj, "get_loadEventStart"), flags, 2)
        this.vtbl.get_loadEventEnd := CallbackCreate(GetMethod(implObj, "get_loadEventEnd"), flags, 2)
        this.vtbl.get_msFirstPaint := CallbackCreate(GetMethod(implObj, "get_msFirstPaint"), flags, 2)
        this.vtbl.toString := CallbackCreate(GetMethod(implObj, "toString"), flags, 2)
        this.vtbl.toJSON := CallbackCreate(GetMethod(implObj, "toJSON"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_navigationStart)
        CallbackFree(this.vtbl.get_unloadEventStart)
        CallbackFree(this.vtbl.get_unloadEventEnd)
        CallbackFree(this.vtbl.get_redirectStart)
        CallbackFree(this.vtbl.get_redirectEnd)
        CallbackFree(this.vtbl.get_fetchStart)
        CallbackFree(this.vtbl.get_domainLookupStart)
        CallbackFree(this.vtbl.get_domainLookupEnd)
        CallbackFree(this.vtbl.get_connectStart)
        CallbackFree(this.vtbl.get_connectEnd)
        CallbackFree(this.vtbl.get_requestStart)
        CallbackFree(this.vtbl.get_responseStart)
        CallbackFree(this.vtbl.get_responseEnd)
        CallbackFree(this.vtbl.get_domLoading)
        CallbackFree(this.vtbl.get_domInteractive)
        CallbackFree(this.vtbl.get_domContentLoadedEventStart)
        CallbackFree(this.vtbl.get_domContentLoadedEventEnd)
        CallbackFree(this.vtbl.get_domComplete)
        CallbackFree(this.vtbl.get_loadEventStart)
        CallbackFree(this.vtbl.get_loadEventEnd)
        CallbackFree(this.vtbl.get_msFirstPaint)
        CallbackFree(this.vtbl.toString)
        CallbackFree(this.vtbl.toJSON)
    }
}
