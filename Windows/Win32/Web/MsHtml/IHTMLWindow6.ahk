#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IHTMLStorage.ahk" { IHTMLStorage }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct IHTMLWindow6 extends IDispatch {
    /**
     * The interface identifier for IHTMLWindow6
     * @type {Guid}
     */
    static IID := Guid("{30510453-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IHTMLWindow6 interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        put_XDomainRequest          : IntPtr
        get_XDomainRequest          : IntPtr
        get_sessionStorage          : IntPtr
        get_localStorage            : IntPtr
        put_onhashchange            : IntPtr
        get_onhashchange            : IntPtr
        get_maxConnectionsPerServer : IntPtr
        postMessage                 : IntPtr
        toStaticHTML                : IntPtr
        put_onmessage               : IntPtr
        get_onmessage               : IntPtr
        msWriteProfilerMark         : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IHTMLWindow6.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {VARIANT} 
     */
    XDomainRequest {
        get => this.get_XDomainRequest()
        set => this.put_XDomainRequest(value)
    }

    /**
     * @type {IHTMLStorage} 
     */
    sessionStorage {
        get => this.get_sessionStorage()
    }

    /**
     * @type {IHTMLStorage} 
     */
    localStorage {
        get => this.get_localStorage()
    }

    /**
     * @type {VARIANT} 
     */
    onhashchange {
        get => this.get_onhashchange()
        set => this.put_onhashchange(value)
    }

    /**
     * @type {Integer} 
     */
    maxConnectionsPerServer {
        get => this.get_maxConnectionsPerServer()
    }

    /**
     * @type {VARIANT} 
     */
    onmessage {
        get => this.get_onmessage()
        set => this.put_onmessage(value)
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_XDomainRequest(v) {
        result := ComCall(7, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_XDomainRequest() {
        p := VARIANT()
        result := ComCall(8, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {IHTMLStorage} 
     */
    get_sessionStorage() {
        result := ComCall(9, this, "ptr*", &p := 0, "HRESULT")
        return IHTMLStorage(p)
    }

    /**
     * 
     * @returns {IHTMLStorage} 
     */
    get_localStorage() {
        result := ComCall(10, this, "ptr*", &p := 0, "HRESULT")
        return IHTMLStorage(p)
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onhashchange(v) {
        result := ComCall(11, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onhashchange() {
        p := VARIANT()
        result := ComCall(12, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_maxConnectionsPerServer() {
        result := ComCall(13, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} _msg 
     * @param {VARIANT} targetOrigin 
     * @returns {HRESULT} 
     */
    postMessage(_msg, targetOrigin) {
        _msg := _msg is String ? BSTR.Alloc(_msg).Value : _msg

        result := ComCall(14, this, BSTR, _msg, VARIANT, targetOrigin, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrHTML 
     * @returns {BSTR} 
     */
    toStaticHTML(bstrHTML) {
        bstrHTML := bstrHTML is String ? BSTR.Alloc(bstrHTML).Value : bstrHTML

        pbstrStaticHTML := BSTR.Owned()
        result := ComCall(15, this, BSTR, bstrHTML, BSTR.Ptr, pbstrStaticHTML, "HRESULT")
        return pbstrStaticHTML
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onmessage(v) {
        result := ComCall(16, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onmessage() {
        p := VARIANT()
        result := ComCall(17, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} bstrProfilerMarkName 
     * @returns {HRESULT} 
     */
    msWriteProfilerMark(bstrProfilerMarkName) {
        bstrProfilerMarkName := bstrProfilerMarkName is String ? BSTR.Alloc(bstrProfilerMarkName).Value : bstrProfilerMarkName

        result := ComCall(18, this, BSTR, bstrProfilerMarkName, "HRESULT")
        return result
    }

    Query(iid) {
        if (IHTMLWindow6.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.put_XDomainRequest := CallbackCreate(GetMethod(implObj, "put_XDomainRequest"), flags, 2)
        this.vtbl.get_XDomainRequest := CallbackCreate(GetMethod(implObj, "get_XDomainRequest"), flags, 2)
        this.vtbl.get_sessionStorage := CallbackCreate(GetMethod(implObj, "get_sessionStorage"), flags, 2)
        this.vtbl.get_localStorage := CallbackCreate(GetMethod(implObj, "get_localStorage"), flags, 2)
        this.vtbl.put_onhashchange := CallbackCreate(GetMethod(implObj, "put_onhashchange"), flags, 2)
        this.vtbl.get_onhashchange := CallbackCreate(GetMethod(implObj, "get_onhashchange"), flags, 2)
        this.vtbl.get_maxConnectionsPerServer := CallbackCreate(GetMethod(implObj, "get_maxConnectionsPerServer"), flags, 2)
        this.vtbl.postMessage := CallbackCreate(GetMethod(implObj, "postMessage"), flags, 3)
        this.vtbl.toStaticHTML := CallbackCreate(GetMethod(implObj, "toStaticHTML"), flags, 3)
        this.vtbl.put_onmessage := CallbackCreate(GetMethod(implObj, "put_onmessage"), flags, 2)
        this.vtbl.get_onmessage := CallbackCreate(GetMethod(implObj, "get_onmessage"), flags, 2)
        this.vtbl.msWriteProfilerMark := CallbackCreate(GetMethod(implObj, "msWriteProfilerMark"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.put_XDomainRequest)
        CallbackFree(this.vtbl.get_XDomainRequest)
        CallbackFree(this.vtbl.get_sessionStorage)
        CallbackFree(this.vtbl.get_localStorage)
        CallbackFree(this.vtbl.put_onhashchange)
        CallbackFree(this.vtbl.get_onhashchange)
        CallbackFree(this.vtbl.get_maxConnectionsPerServer)
        CallbackFree(this.vtbl.postMessage)
        CallbackFree(this.vtbl.toStaticHTML)
        CallbackFree(this.vtbl.put_onmessage)
        CallbackFree(this.vtbl.get_onmessage)
        CallbackFree(this.vtbl.msWriteProfilerMark)
    }
}
