#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\PARSEACTION.ahk" { PARSEACTION }
#Import ".\QUERYOPTION.ahk" { QUERYOPTION }
#Import "..\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.Com.Urlmon
 */
export default struct IInternetProtocolInfo extends IUnknown {
    /**
     * The interface identifier for IInternetProtocolInfo
     * @type {Guid}
     */
    static IID := Guid("{79eac9ec-baf9-11ce-8c82-00aa004ba90b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IInternetProtocolInfo interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        ParseUrl   : IntPtr
        CombineUrl : IntPtr
        CompareUrl : IntPtr
        QueryInfo  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IInternetProtocolInfo.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {PWSTR} pwzUrl 
     * @param {PARSEACTION} _ParseAction 
     * @param {Integer} dwParseFlags 
     * @param {PWSTR} pwzResult 
     * @param {Integer} cchResult 
     * @param {Integer} dwReserved 
     * @returns {Integer} 
     */
    ParseUrl(pwzUrl, _ParseAction, dwParseFlags, pwzResult, cchResult, dwReserved) {
        pwzUrl := pwzUrl is String ? StrPtr(pwzUrl) : pwzUrl
        pwzResult := pwzResult is String ? StrPtr(pwzResult) : pwzResult

        result := ComCall(3, this, "ptr", pwzUrl, PARSEACTION, _ParseAction, "uint", dwParseFlags, "ptr", pwzResult, "uint", cchResult, "uint*", &pcchResult := 0, "uint", dwReserved, "HRESULT")
        return pcchResult
    }

    /**
     * 
     * @param {PWSTR} pwzBaseUrl 
     * @param {PWSTR} pwzRelativeUrl 
     * @param {Integer} dwCombineFlags 
     * @param {PWSTR} pwzResult 
     * @param {Integer} cchResult 
     * @param {Integer} dwReserved 
     * @returns {Integer} 
     */
    CombineUrl(pwzBaseUrl, pwzRelativeUrl, dwCombineFlags, pwzResult, cchResult, dwReserved) {
        pwzBaseUrl := pwzBaseUrl is String ? StrPtr(pwzBaseUrl) : pwzBaseUrl
        pwzRelativeUrl := pwzRelativeUrl is String ? StrPtr(pwzRelativeUrl) : pwzRelativeUrl
        pwzResult := pwzResult is String ? StrPtr(pwzResult) : pwzResult

        result := ComCall(4, this, "ptr", pwzBaseUrl, "ptr", pwzRelativeUrl, "uint", dwCombineFlags, "ptr", pwzResult, "uint", cchResult, "uint*", &pcchResult := 0, "uint", dwReserved, "HRESULT")
        return pcchResult
    }

    /**
     * 
     * @param {PWSTR} pwzUrl1 
     * @param {PWSTR} pwzUrl2 
     * @param {Integer} dwCompareFlags 
     * @returns {HRESULT} 
     */
    CompareUrl(pwzUrl1, pwzUrl2, dwCompareFlags) {
        pwzUrl1 := pwzUrl1 is String ? StrPtr(pwzUrl1) : pwzUrl1
        pwzUrl2 := pwzUrl2 is String ? StrPtr(pwzUrl2) : pwzUrl2

        result := ComCall(5, this, "ptr", pwzUrl1, "ptr", pwzUrl2, "uint", dwCompareFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pwzUrl 
     * @param {QUERYOPTION} OueryOption 
     * @param {Integer} dwQueryFlags 
     * @param {Pointer<Void>} pBuffer 
     * @param {Integer} cbBuffer 
     * @param {Pointer<Integer>} pcbBuf 
     * @param {Integer} dwReserved 
     * @returns {HRESULT} 
     */
    QueryInfo(pwzUrl, OueryOption, dwQueryFlags, pBuffer, cbBuffer, pcbBuf, dwReserved) {
        pwzUrl := pwzUrl is String ? StrPtr(pwzUrl) : pwzUrl

        pBufferMarshal := pBuffer is VarRef ? "ptr" : "ptr"
        pcbBufMarshal := pcbBuf is VarRef ? "uint*" : "ptr"

        result := ComCall(6, this, "ptr", pwzUrl, QUERYOPTION, OueryOption, "uint", dwQueryFlags, pBufferMarshal, pBuffer, "uint", cbBuffer, pcbBufMarshal, pcbBuf, "uint", dwReserved, "HRESULT")
        return result
    }

    Query(iid) {
        if (IInternetProtocolInfo.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.ParseUrl := CallbackCreate(GetMethod(implObj, "ParseUrl"), flags, 8)
        this.vtbl.CombineUrl := CallbackCreate(GetMethod(implObj, "CombineUrl"), flags, 8)
        this.vtbl.CompareUrl := CallbackCreate(GetMethod(implObj, "CompareUrl"), flags, 4)
        this.vtbl.QueryInfo := CallbackCreate(GetMethod(implObj, "QueryInfo"), flags, 8)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.ParseUrl)
        CallbackFree(this.vtbl.CombineUrl)
        CallbackFree(this.vtbl.CompareUrl)
        CallbackFree(this.vtbl.QueryInfo)
    }
}
