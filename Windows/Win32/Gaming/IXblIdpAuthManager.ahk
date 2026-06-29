#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\Guid.ahk" { Guid }
#Import "..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Foundation\BOOL.ahk" { BOOL }
#Import "..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\IXblIdpAuthTokenResult.ahk" { IXblIdpAuthTokenResult }

/**
 * Reserved for Microsoft use. (IXblIdpAuthManager)
 * @see https://learn.microsoft.com/windows/win32/api/xblidpauthmanager/nn-xblidpauthmanager-ixblidpauthmanager
 * @namespace Windows.Win32.Gaming
 */
export default struct IXblIdpAuthManager extends IUnknown {
    /**
     * The interface identifier for IXblIdpAuthManager
     * @type {Guid}
     */
    static IID := Guid("{eb5ddb08-8bbf-449b-ac21-b02ddeb3b136}")

    /**
     * The class identifier for XblIdpAuthManager
     * @type {Guid}
     */
    static CLSID := Guid("{ce23534b-56d8-4978-86a2-7ee570640468}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IXblIdpAuthManager interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetGamerAccount                     : IntPtr
        GetGamerAccount                     : IntPtr
        SetAppViewInitialized               : IntPtr
        GetEnvironment                      : IntPtr
        GetSandbox                          : IntPtr
        GetTokenAndSignatureWithTokenResult : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IXblIdpAuthManager.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Reserved for Microsoft use. (IXblIdpAuthManager.SetGamerAccount)
     * @param {PWSTR} msaAccountId Type: <b>__RPC__in_opt_string</b>
     * @param {PWSTR} xuid Type: <b>__RPC__in_opt_string</b>
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/xblidpauthmanager/nf-xblidpauthmanager-ixblidpauthmanager-setgameraccount
     */
    SetGamerAccount(msaAccountId, xuid) {
        msaAccountId := msaAccountId is String ? StrPtr(msaAccountId) : msaAccountId
        xuid := xuid is String ? StrPtr(xuid) : xuid

        result := ComCall(3, this, "ptr", msaAccountId, "ptr", xuid, "HRESULT")
        return result
    }

    /**
     * Reserved for Microsoft use. (IXblIdpAuthManager.GetGamerAccount)
     * @param {Pointer<PWSTR>} msaAccountId Type: <b>__RPC__deref_out_opt_string*</b>
     * @param {Pointer<PWSTR>} xuid Type: <b>__RPC__deref_out_opt_string*</b>
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/xblidpauthmanager/nf-xblidpauthmanager-ixblidpauthmanager-getgameraccount
     */
    GetGamerAccount(msaAccountId, xuid) {
        msaAccountIdMarshal := msaAccountId is VarRef ? "ptr*" : "ptr"
        xuidMarshal := xuid is VarRef ? "ptr*" : "ptr"

        result := ComCall(4, this, msaAccountIdMarshal, msaAccountId, xuidMarshal, xuid, "HRESULT")
        return result
    }

    /**
     * Reserved for Microsoft use. (IXblIdpAuthManager.SetAppViewInitialized)
     * @param {PWSTR} appSid Type: <b>__RPC__in_string</b>
     * @param {PWSTR} msaAccountId Type: <b>__RPC__in_string</b>
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/xblidpauthmanager/nf-xblidpauthmanager-ixblidpauthmanager-setappviewinitialized
     */
    SetAppViewInitialized(appSid, msaAccountId) {
        appSid := appSid is String ? StrPtr(appSid) : appSid
        msaAccountId := msaAccountId is String ? StrPtr(msaAccountId) : msaAccountId

        result := ComCall(5, this, "ptr", appSid, "ptr", msaAccountId, "HRESULT")
        return result
    }

    /**
     * Reserved for Microsoft use. (IXblIdpAuthManager.GetEnvironment)
     * @returns {PWSTR} Type: <b>__RPC__deref_out_opt_string*</b>
     * @see https://learn.microsoft.com/windows/win32/api/xblidpauthmanager/nf-xblidpauthmanager-ixblidpauthmanager-getenvironment
     */
    GetEnvironment() {
        result := ComCall(6, this, PWSTR.Ptr, &environment := 0, "HRESULT")
        return environment
    }

    /**
     * Reserved for Microsoft use. (IXblIdpAuthManager.GetSandbox)
     * @returns {PWSTR} Type: <b>__RPC__deref_out_opt_string*</b>
     * @see https://learn.microsoft.com/windows/win32/api/xblidpauthmanager/nf-xblidpauthmanager-ixblidpauthmanager-getsandbox
     */
    GetSandbox() {
        result := ComCall(7, this, PWSTR.Ptr, &sandbox := 0, "HRESULT")
        return sandbox
    }

    /**
     * Reserved for Microsoft use. (IXblIdpAuthManager.GetTokenAndSignatureWithTokenResult)
     * @param {PWSTR} msaAccountId Type: <b>__RPC__in_opt_string</b>
     * @param {PWSTR} appSid Type: <b>__RPC__in_string</b>
     * @param {PWSTR} msaTarget Type: <b>__RPC__in_string</b>
     * @param {PWSTR} msaPolicy Type: <b>__RPC__in_string</b>
     * @param {PWSTR} httpMethod Type: <b>__RPC__in_string</b>
     * @param {PWSTR} uri Type: <b>__RPC__in_string</b>
     * @param {PWSTR} headers Type: <b>__RPC__in_opt_string</b>
     * @param {Pointer<Integer>} body Type: <b>BYTE*</b>
     * @param {Integer} bodySize Type: <b>__RPC__in_ecount_full_opt</b>
     * @param {BOOL} forceRefresh Type: <b>BOOL</b>
     * @returns {IXblIdpAuthTokenResult} Type: <b>IXblIdpAuthTokenResult**</b>
     * @see https://learn.microsoft.com/windows/win32/api/xblidpauthmanager/nf-xblidpauthmanager-ixblidpauthmanager-gettokenandsignaturewithtokenresult
     */
    GetTokenAndSignatureWithTokenResult(msaAccountId, appSid, msaTarget, msaPolicy, httpMethod, uri, headers, body, bodySize, forceRefresh) {
        msaAccountId := msaAccountId is String ? StrPtr(msaAccountId) : msaAccountId
        appSid := appSid is String ? StrPtr(appSid) : appSid
        msaTarget := msaTarget is String ? StrPtr(msaTarget) : msaTarget
        msaPolicy := msaPolicy is String ? StrPtr(msaPolicy) : msaPolicy
        httpMethod := httpMethod is String ? StrPtr(httpMethod) : httpMethod
        uri := uri is String ? StrPtr(uri) : uri
        headers := headers is String ? StrPtr(headers) : headers

        bodyMarshal := body is VarRef ? "char*" : "ptr"

        result := ComCall(8, this, "ptr", msaAccountId, "ptr", appSid, "ptr", msaTarget, "ptr", msaPolicy, "ptr", httpMethod, "ptr", uri, "ptr", headers, bodyMarshal, body, "uint", bodySize, BOOL, forceRefresh, "ptr*", &result := 0, "HRESULT")
        return IXblIdpAuthTokenResult(result)
    }

    Query(iid) {
        if (IXblIdpAuthManager.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetGamerAccount := CallbackCreate(GetMethod(implObj, "SetGamerAccount"), flags, 3)
        this.vtbl.GetGamerAccount := CallbackCreate(GetMethod(implObj, "GetGamerAccount"), flags, 3)
        this.vtbl.SetAppViewInitialized := CallbackCreate(GetMethod(implObj, "SetAppViewInitialized"), flags, 3)
        this.vtbl.GetEnvironment := CallbackCreate(GetMethod(implObj, "GetEnvironment"), flags, 2)
        this.vtbl.GetSandbox := CallbackCreate(GetMethod(implObj, "GetSandbox"), flags, 2)
        this.vtbl.GetTokenAndSignatureWithTokenResult := CallbackCreate(GetMethod(implObj, "GetTokenAndSignatureWithTokenResult"), flags, 12)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetGamerAccount)
        CallbackFree(this.vtbl.GetGamerAccount)
        CallbackFree(this.vtbl.SetAppViewInitialized)
        CallbackFree(this.vtbl.GetEnvironment)
        CallbackFree(this.vtbl.GetSandbox)
        CallbackFree(this.vtbl.GetTokenAndSignatureWithTokenResult)
    }
}
