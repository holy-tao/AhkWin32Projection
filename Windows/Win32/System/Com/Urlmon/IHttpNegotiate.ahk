#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.Com.Urlmon
 */
export default struct IHttpNegotiate extends IUnknown {
    /**
     * The interface identifier for IHttpNegotiate
     * @type {Guid}
     */
    static IID := Guid("{79eac9d2-baf9-11ce-8c82-00aa004ba90b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IHttpNegotiate interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        BeginningTransaction : IntPtr
        OnResponse           : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IHttpNegotiate.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {PWSTR} szURL 
     * @param {PWSTR} szHeaders 
     * @param {Integer} dwReserved 
     * @returns {PWSTR} 
     */
    BeginningTransaction(szURL, szHeaders, dwReserved) {
        szURL := szURL is String ? StrPtr(szURL) : szURL
        szHeaders := szHeaders is String ? StrPtr(szHeaders) : szHeaders

        result := ComCall(3, this, "ptr", szURL, "ptr", szHeaders, "uint", dwReserved, PWSTR.Ptr, &pszAdditionalHeaders := 0, "HRESULT")
        return pszAdditionalHeaders
    }

    /**
     * 
     * @param {Integer} dwResponseCode 
     * @param {PWSTR} szResponseHeaders 
     * @param {PWSTR} szRequestHeaders 
     * @returns {PWSTR} 
     */
    OnResponse(dwResponseCode, szResponseHeaders, szRequestHeaders) {
        szResponseHeaders := szResponseHeaders is String ? StrPtr(szResponseHeaders) : szResponseHeaders
        szRequestHeaders := szRequestHeaders is String ? StrPtr(szRequestHeaders) : szRequestHeaders

        result := ComCall(4, this, "uint", dwResponseCode, "ptr", szResponseHeaders, "ptr", szRequestHeaders, PWSTR.Ptr, &pszAdditionalRequestHeaders := 0, "HRESULT")
        return pszAdditionalRequestHeaders
    }

    Query(iid) {
        if (IHttpNegotiate.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.BeginningTransaction := CallbackCreate(GetMethod(implObj, "BeginningTransaction"), flags, 5)
        this.vtbl.OnResponse := CallbackCreate(GetMethod(implObj, "OnResponse"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.BeginningTransaction)
        CallbackFree(this.vtbl.OnResponse)
    }
}
