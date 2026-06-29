#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\Guid.ahk" { Guid }
#Import "..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\XBL_IDP_AUTH_TOKEN_STATUS.ahk" { XBL_IDP_AUTH_TOKEN_STATUS }
#Import "..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Reserved for Microsoft use. (IXblIdpAuthTokenResult)
 * @see https://learn.microsoft.com/windows/win32/api/xblidpauthmanager/nn-xblidpauthmanager-ixblidpauthtokenresult
 * @namespace Windows.Win32.Gaming
 */
export default struct IXblIdpAuthTokenResult extends IUnknown {
    /**
     * The interface identifier for IXblIdpAuthTokenResult
     * @type {Guid}
     */
    static IID := Guid("{46ce0225-f267-4d68-b299-b2762552dec1}")

    /**
     * The class identifier for XblIdpAuthTokenResult
     * @type {Guid}
     */
    static CLSID := Guid("{9f493441-744a-410c-ae2b-9a22f7c7731f}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IXblIdpAuthTokenResult interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetStatus            : IntPtr
        GetErrorCode         : IntPtr
        GetToken             : IntPtr
        GetSignature         : IntPtr
        GetSandbox           : IntPtr
        GetEnvironment       : IntPtr
        GetMsaAccountId      : IntPtr
        GetXuid              : IntPtr
        GetGamertag          : IntPtr
        GetAgeGroup          : IntPtr
        GetPrivileges        : IntPtr
        GetMsaTarget         : IntPtr
        GetMsaPolicy         : IntPtr
        GetMsaAppId          : IntPtr
        GetRedirect          : IntPtr
        GetMessage           : IntPtr
        GetHelpId            : IntPtr
        GetEnforcementBans   : IntPtr
        GetRestrictions      : IntPtr
        GetTitleRestrictions : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IXblIdpAuthTokenResult.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Reserved for Microsoft use. (IXblIdpAuthTokenResult.GetStatus)
     * @returns {XBL_IDP_AUTH_TOKEN_STATUS} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/xblidpauthmanager/ne-xblidpauthmanager-xbl_idp_auth_token_status">XBL_IDP_AUTH_TOKEN_STATUS</a>*</b>
     * @see https://learn.microsoft.com/windows/win32/api/xblidpauthmanager/nf-xblidpauthmanager-ixblidpauthtokenresult-getstatus
     */
    GetStatus() {
        result := ComCall(3, this, "int*", &_status := 0, "HRESULT")
        return _status
    }

    /**
     * Reserved for Microsoft use. (IXblIdpAuthTokenResult.GetErrorCode)
     * @returns {HRESULT} The error code.
     * @see https://learn.microsoft.com/windows/win32/api/xblidpauthmanager/nf-xblidpauthmanager-ixblidpauthtokenresult-geterrorcode
     */
    GetErrorCode() {
        result := ComCall(4, this, "int*", &errorCode := 0, "HRESULT")
        return errorCode
    }

    /**
     * Reserved for Microsoft use. (IXblIdpAuthTokenResult.GetToken)
     * @returns {PWSTR} Type: <b>__RPC__deref_out_opt_string*</b>
     * @see https://learn.microsoft.com/windows/win32/api/xblidpauthmanager/nf-xblidpauthmanager-ixblidpauthtokenresult-gettoken
     */
    GetToken() {
        result := ComCall(5, this, PWSTR.Ptr, &token := 0, "HRESULT")
        return token
    }

    /**
     * Reserved for Microsoft use. (IXblIdpAuthTokenResult.GetSignature)
     * @returns {PWSTR} Type: <b>__RPC__deref_out_opt_string*</b>
     * @see https://learn.microsoft.com/windows/win32/api/xblidpauthmanager/nf-xblidpauthmanager-ixblidpauthtokenresult-getsignature
     */
    GetSignature() {
        result := ComCall(6, this, PWSTR.Ptr, &signature := 0, "HRESULT")
        return signature
    }

    /**
     * Reserved for Microsoft use. (IXblIdpAuthTokenResult.GetSandbox)
     * @returns {PWSTR} Type: <b>__RPC__deref_out_opt_string*</b>
     * @see https://learn.microsoft.com/windows/win32/api/xblidpauthmanager/nf-xblidpauthmanager-ixblidpauthtokenresult-getsandbox
     */
    GetSandbox() {
        result := ComCall(7, this, PWSTR.Ptr, &sandbox := 0, "HRESULT")
        return sandbox
    }

    /**
     * Reserved for Microsoft use. (IXblIdpAuthTokenResult.GetEnvironment)
     * @returns {PWSTR} Type: <b>__RPC__deref_out_opt_string*</b>
     * @see https://learn.microsoft.com/windows/win32/api/xblidpauthmanager/nf-xblidpauthmanager-ixblidpauthtokenresult-getenvironment
     */
    GetEnvironment() {
        result := ComCall(8, this, PWSTR.Ptr, &environment := 0, "HRESULT")
        return environment
    }

    /**
     * Reserved for Microsoft use. (IXblIdpAuthTokenResult.GetMsaAccountId)
     * @returns {PWSTR} Type: <b>__RPC__deref_out_opt_string*</b>
     * @see https://learn.microsoft.com/windows/win32/api/xblidpauthmanager/nf-xblidpauthmanager-ixblidpauthtokenresult-getmsaaccountid
     */
    GetMsaAccountId() {
        result := ComCall(9, this, PWSTR.Ptr, &msaAccountId := 0, "HRESULT")
        return msaAccountId
    }

    /**
     * Reserved for Microsoft use. (IXblIdpAuthTokenResult.GetXuid)
     * @returns {PWSTR} Type: <b>__RPC__deref_out_opt_string*</b>
     * @see https://learn.microsoft.com/windows/win32/api/xblidpauthmanager/nf-xblidpauthmanager-ixblidpauthtokenresult-getxuid
     */
    GetXuid() {
        result := ComCall(10, this, PWSTR.Ptr, &xuid := 0, "HRESULT")
        return xuid
    }

    /**
     * Reserved for Microsoft use. (IXblIdpAuthTokenResult.GetGamertag)
     * @returns {PWSTR} Type: <b>__RPC__deref_out_opt_string*</b>
     * @see https://learn.microsoft.com/windows/win32/api/xblidpauthmanager/nf-xblidpauthmanager-ixblidpauthtokenresult-getgamertag
     */
    GetGamertag() {
        result := ComCall(11, this, PWSTR.Ptr, &gamertag := 0, "HRESULT")
        return gamertag
    }

    /**
     * Reserved for Microsoft use. (IXblIdpAuthTokenResult.GetAgeGroup)
     * @returns {PWSTR} Type: <b>__RPC__deref_out_opt_string*</b>
     * @see https://learn.microsoft.com/windows/win32/api/xblidpauthmanager/nf-xblidpauthmanager-ixblidpauthtokenresult-getagegroup
     */
    GetAgeGroup() {
        result := ComCall(12, this, PWSTR.Ptr, &ageGroup := 0, "HRESULT")
        return ageGroup
    }

    /**
     * Reserved for Microsoft use. (IXblIdpAuthTokenResult.GetPrivileges)
     * @returns {PWSTR} Type: <b>__RPC__deref_out_opt_string*</b>
     * @see https://learn.microsoft.com/windows/win32/api/xblidpauthmanager/nf-xblidpauthmanager-ixblidpauthtokenresult-getprivileges
     */
    GetPrivileges() {
        result := ComCall(13, this, PWSTR.Ptr, &privileges := 0, "HRESULT")
        return privileges
    }

    /**
     * Reserved for Microsoft use. (IXblIdpAuthTokenResult.GetMsaTarget)
     * @returns {PWSTR} Type: <b>__RPC__deref_out_opt_string*</b>
     * @see https://learn.microsoft.com/windows/win32/api/xblidpauthmanager/nf-xblidpauthmanager-ixblidpauthtokenresult-getmsatarget
     */
    GetMsaTarget() {
        result := ComCall(14, this, PWSTR.Ptr, &msaTarget := 0, "HRESULT")
        return msaTarget
    }

    /**
     * Reserved for Microsoft use. (IXblIdpAuthTokenResult.GetMsaPolicy)
     * @returns {PWSTR} Type: <b>__RPC__deref_out_opt_string*</b>
     * @see https://learn.microsoft.com/windows/win32/api/xblidpauthmanager/nf-xblidpauthmanager-ixblidpauthtokenresult-getmsapolicy
     */
    GetMsaPolicy() {
        result := ComCall(15, this, PWSTR.Ptr, &msaPolicy := 0, "HRESULT")
        return msaPolicy
    }

    /**
     * Reserved for Microsoft use. (IXblIdpAuthTokenResult.GetMsaAppId)
     * @returns {PWSTR} Type: <b>__RPC__deref_out_opt_string*</b>
     * @see https://learn.microsoft.com/windows/win32/api/xblidpauthmanager/nf-xblidpauthmanager-ixblidpauthtokenresult-getmsaappid
     */
    GetMsaAppId() {
        result := ComCall(16, this, PWSTR.Ptr, &msaAppId := 0, "HRESULT")
        return msaAppId
    }

    /**
     * Reserved for Microsoft use. (IXblIdpAuthTokenResult.GetRedirect)
     * @returns {PWSTR} Type: <b>__RPC__deref_out_opt_string*</b>
     * @see https://learn.microsoft.com/windows/win32/api/xblidpauthmanager/nf-xblidpauthmanager-ixblidpauthtokenresult-getredirect
     */
    GetRedirect() {
        result := ComCall(17, this, PWSTR.Ptr, &redirect := 0, "HRESULT")
        return redirect
    }

    /**
     * Reserved for Microsoft use. (IXblIdpAuthTokenResult.GetMessage)
     * @returns {PWSTR} Type: <b>__RPC__deref_out_opt_string*</b>
     * @see https://learn.microsoft.com/windows/win32/api/xblidpauthmanager/nf-xblidpauthmanager-ixblidpauthtokenresult-getmessage
     */
    GetMessage() {
        result := ComCall(18, this, PWSTR.Ptr, &message := 0, "HRESULT")
        return message
    }

    /**
     * Reserved for Microsoft use. (IXblIdpAuthTokenResult.GetHelpId)
     * @returns {PWSTR} Type: <b>__RPC__deref_out_opt_string*</b>
     * @see https://learn.microsoft.com/windows/win32/api/xblidpauthmanager/nf-xblidpauthmanager-ixblidpauthtokenresult-gethelpid
     */
    GetHelpId() {
        result := ComCall(19, this, PWSTR.Ptr, &helpId := 0, "HRESULT")
        return helpId
    }

    /**
     * Reserved for Microsoft use. (IXblIdpAuthTokenResult.GetEnforcementBans)
     * @returns {PWSTR} Type: <b>__RPC__deref_out_opt_string*</b>
     * @see https://learn.microsoft.com/windows/win32/api/xblidpauthmanager/nf-xblidpauthmanager-ixblidpauthtokenresult-getenforcementbans
     */
    GetEnforcementBans() {
        result := ComCall(20, this, PWSTR.Ptr, &enforcementBans := 0, "HRESULT")
        return enforcementBans
    }

    /**
     * Reserved for Microsoft use. (IXblIdpAuthTokenResult.GetRestrictions)
     * @returns {PWSTR} Type: <b>__RPC__deref_out_opt_string*</b>
     * @see https://learn.microsoft.com/windows/win32/api/xblidpauthmanager/nf-xblidpauthmanager-ixblidpauthtokenresult-getrestrictions
     */
    GetRestrictions() {
        result := ComCall(21, this, PWSTR.Ptr, &_restrictions := 0, "HRESULT")
        return _restrictions
    }

    /**
     * Reserved for Microsoft use. (IXblIdpAuthTokenResult.GetTitleRestrictions)
     * @returns {PWSTR} Type: <b>__RPC__deref_out_opt_string*</b>
     * @see https://learn.microsoft.com/windows/win32/api/xblidpauthmanager/nf-xblidpauthmanager-ixblidpauthtokenresult-gettitlerestrictions
     */
    GetTitleRestrictions() {
        result := ComCall(22, this, PWSTR.Ptr, &titleRestrictions := 0, "HRESULT")
        return titleRestrictions
    }

    Query(iid) {
        if (IXblIdpAuthTokenResult.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetStatus := CallbackCreate(GetMethod(implObj, "GetStatus"), flags, 2)
        this.vtbl.GetErrorCode := CallbackCreate(GetMethod(implObj, "GetErrorCode"), flags, 2)
        this.vtbl.GetToken := CallbackCreate(GetMethod(implObj, "GetToken"), flags, 2)
        this.vtbl.GetSignature := CallbackCreate(GetMethod(implObj, "GetSignature"), flags, 2)
        this.vtbl.GetSandbox := CallbackCreate(GetMethod(implObj, "GetSandbox"), flags, 2)
        this.vtbl.GetEnvironment := CallbackCreate(GetMethod(implObj, "GetEnvironment"), flags, 2)
        this.vtbl.GetMsaAccountId := CallbackCreate(GetMethod(implObj, "GetMsaAccountId"), flags, 2)
        this.vtbl.GetXuid := CallbackCreate(GetMethod(implObj, "GetXuid"), flags, 2)
        this.vtbl.GetGamertag := CallbackCreate(GetMethod(implObj, "GetGamertag"), flags, 2)
        this.vtbl.GetAgeGroup := CallbackCreate(GetMethod(implObj, "GetAgeGroup"), flags, 2)
        this.vtbl.GetPrivileges := CallbackCreate(GetMethod(implObj, "GetPrivileges"), flags, 2)
        this.vtbl.GetMsaTarget := CallbackCreate(GetMethod(implObj, "GetMsaTarget"), flags, 2)
        this.vtbl.GetMsaPolicy := CallbackCreate(GetMethod(implObj, "GetMsaPolicy"), flags, 2)
        this.vtbl.GetMsaAppId := CallbackCreate(GetMethod(implObj, "GetMsaAppId"), flags, 2)
        this.vtbl.GetRedirect := CallbackCreate(GetMethod(implObj, "GetRedirect"), flags, 2)
        this.vtbl.GetMessage := CallbackCreate(GetMethod(implObj, "GetMessage"), flags, 2)
        this.vtbl.GetHelpId := CallbackCreate(GetMethod(implObj, "GetHelpId"), flags, 2)
        this.vtbl.GetEnforcementBans := CallbackCreate(GetMethod(implObj, "GetEnforcementBans"), flags, 2)
        this.vtbl.GetRestrictions := CallbackCreate(GetMethod(implObj, "GetRestrictions"), flags, 2)
        this.vtbl.GetTitleRestrictions := CallbackCreate(GetMethod(implObj, "GetTitleRestrictions"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetStatus)
        CallbackFree(this.vtbl.GetErrorCode)
        CallbackFree(this.vtbl.GetToken)
        CallbackFree(this.vtbl.GetSignature)
        CallbackFree(this.vtbl.GetSandbox)
        CallbackFree(this.vtbl.GetEnvironment)
        CallbackFree(this.vtbl.GetMsaAccountId)
        CallbackFree(this.vtbl.GetXuid)
        CallbackFree(this.vtbl.GetGamertag)
        CallbackFree(this.vtbl.GetAgeGroup)
        CallbackFree(this.vtbl.GetPrivileges)
        CallbackFree(this.vtbl.GetMsaTarget)
        CallbackFree(this.vtbl.GetMsaPolicy)
        CallbackFree(this.vtbl.GetMsaAppId)
        CallbackFree(this.vtbl.GetRedirect)
        CallbackFree(this.vtbl.GetMessage)
        CallbackFree(this.vtbl.GetHelpId)
        CallbackFree(this.vtbl.GetEnforcementBans)
        CallbackFree(this.vtbl.GetRestrictions)
        CallbackFree(this.vtbl.GetTitleRestrictions)
    }
}
