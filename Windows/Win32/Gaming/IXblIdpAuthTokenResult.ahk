#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\System\Com\IUnknown.ahk

/**
 * Reserved for Microsoft use.
 * @see https://docs.microsoft.com/windows/win32/api//xblidpauthmanager/nn-xblidpauthmanager-ixblidpauthtokenresult
 * @namespace Windows.Win32.Gaming
 * @version v4.0.30319
 */
class IXblIdpAuthTokenResult extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IXblIdpAuthTokenResult
     * @type {Guid}
     */
    static IID => Guid("{46ce0225-f267-4d68-b299-b2762552dec1}")

    /**
     * The class identifier for XblIdpAuthTokenResult
     * @type {Guid}
     */
    static CLSID => Guid("{9f493441-744a-410c-ae2b-9a22f7c7731f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetStatus", "GetErrorCode", "GetToken", "GetSignature", "GetSandbox", "GetEnvironment", "GetMsaAccountId", "GetXuid", "GetGamertag", "GetAgeGroup", "GetPrivileges", "GetMsaTarget", "GetMsaPolicy", "GetMsaAppId", "GetRedirect", "GetMessage", "GetHelpId", "GetEnforcementBans", "GetRestrictions", "GetTitleRestrictions"]

    /**
     * Reserved for Microsoft use.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/xblidpauthmanager/ne-xblidpauthmanager-xbl_idp_auth_token_status">XBL_IDP_AUTH_TOKEN_STATUS</a>*</b>
     * @see https://docs.microsoft.com/windows/win32/api//xblidpauthmanager/nf-xblidpauthmanager-ixblidpauthtokenresult-getstatus
     */
    GetStatus() {
        result := ComCall(3, this, "int*", &status := 0, "HRESULT")
        return status
    }

    /**
     * Reserved for Microsoft use.
     * @returns {HRESULT} The error code.
     * @see https://docs.microsoft.com/windows/win32/api//xblidpauthmanager/nf-xblidpauthmanager-ixblidpauthtokenresult-geterrorcode
     */
    GetErrorCode() {
        result := ComCall(4, this, "int*", &errorCode := 0, "HRESULT")
        return errorCode
    }

    /**
     * Reserved for Microsoft use.
     * @returns {PWSTR} Type: <b>__RPC__deref_out_opt_string*</b>
     * @see https://docs.microsoft.com/windows/win32/api//xblidpauthmanager/nf-xblidpauthmanager-ixblidpauthtokenresult-gettoken
     */
    GetToken() {
        result := ComCall(5, this, "ptr*", &token := 0, "HRESULT")
        return token
    }

    /**
     * Reserved for Microsoft use.
     * @returns {PWSTR} Type: <b>__RPC__deref_out_opt_string*</b>
     * @see https://docs.microsoft.com/windows/win32/api//xblidpauthmanager/nf-xblidpauthmanager-ixblidpauthtokenresult-getsignature
     */
    GetSignature() {
        result := ComCall(6, this, "ptr*", &signature := 0, "HRESULT")
        return signature
    }

    /**
     * Reserved for Microsoft use.
     * @returns {PWSTR} Type: <b>__RPC__deref_out_opt_string*</b>
     * @see https://docs.microsoft.com/windows/win32/api//xblidpauthmanager/nf-xblidpauthmanager-ixblidpauthtokenresult-getsandbox
     */
    GetSandbox() {
        result := ComCall(7, this, "ptr*", &sandbox := 0, "HRESULT")
        return sandbox
    }

    /**
     * Reserved for Microsoft use.
     * @returns {PWSTR} Type: <b>__RPC__deref_out_opt_string*</b>
     * @see https://docs.microsoft.com/windows/win32/api//xblidpauthmanager/nf-xblidpauthmanager-ixblidpauthtokenresult-getenvironment
     */
    GetEnvironment() {
        result := ComCall(8, this, "ptr*", &environment := 0, "HRESULT")
        return environment
    }

    /**
     * Reserved for Microsoft use.
     * @returns {PWSTR} Type: <b>__RPC__deref_out_opt_string*</b>
     * @see https://docs.microsoft.com/windows/win32/api//xblidpauthmanager/nf-xblidpauthmanager-ixblidpauthtokenresult-getmsaaccountid
     */
    GetMsaAccountId() {
        result := ComCall(9, this, "ptr*", &msaAccountId := 0, "HRESULT")
        return msaAccountId
    }

    /**
     * Reserved for Microsoft use.
     * @returns {PWSTR} Type: <b>__RPC__deref_out_opt_string*</b>
     * @see https://docs.microsoft.com/windows/win32/api//xblidpauthmanager/nf-xblidpauthmanager-ixblidpauthtokenresult-getxuid
     */
    GetXuid() {
        result := ComCall(10, this, "ptr*", &xuid := 0, "HRESULT")
        return xuid
    }

    /**
     * Reserved for Microsoft use.
     * @returns {PWSTR} Type: <b>__RPC__deref_out_opt_string*</b>
     * @see https://docs.microsoft.com/windows/win32/api//xblidpauthmanager/nf-xblidpauthmanager-ixblidpauthtokenresult-getgamertag
     */
    GetGamertag() {
        result := ComCall(11, this, "ptr*", &gamertag := 0, "HRESULT")
        return gamertag
    }

    /**
     * Reserved for Microsoft use.
     * @returns {PWSTR} Type: <b>__RPC__deref_out_opt_string*</b>
     * @see https://docs.microsoft.com/windows/win32/api//xblidpauthmanager/nf-xblidpauthmanager-ixblidpauthtokenresult-getagegroup
     */
    GetAgeGroup() {
        result := ComCall(12, this, "ptr*", &ageGroup := 0, "HRESULT")
        return ageGroup
    }

    /**
     * Reserved for Microsoft use.
     * @returns {PWSTR} Type: <b>__RPC__deref_out_opt_string*</b>
     * @see https://docs.microsoft.com/windows/win32/api//xblidpauthmanager/nf-xblidpauthmanager-ixblidpauthtokenresult-getprivileges
     */
    GetPrivileges() {
        result := ComCall(13, this, "ptr*", &privileges := 0, "HRESULT")
        return privileges
    }

    /**
     * Reserved for Microsoft use.
     * @returns {PWSTR} Type: <b>__RPC__deref_out_opt_string*</b>
     * @see https://docs.microsoft.com/windows/win32/api//xblidpauthmanager/nf-xblidpauthmanager-ixblidpauthtokenresult-getmsatarget
     */
    GetMsaTarget() {
        result := ComCall(14, this, "ptr*", &msaTarget := 0, "HRESULT")
        return msaTarget
    }

    /**
     * Reserved for Microsoft use.
     * @returns {PWSTR} Type: <b>__RPC__deref_out_opt_string*</b>
     * @see https://docs.microsoft.com/windows/win32/api//xblidpauthmanager/nf-xblidpauthmanager-ixblidpauthtokenresult-getmsapolicy
     */
    GetMsaPolicy() {
        result := ComCall(15, this, "ptr*", &msaPolicy := 0, "HRESULT")
        return msaPolicy
    }

    /**
     * Reserved for Microsoft use.
     * @returns {PWSTR} Type: <b>__RPC__deref_out_opt_string*</b>
     * @see https://docs.microsoft.com/windows/win32/api//xblidpauthmanager/nf-xblidpauthmanager-ixblidpauthtokenresult-getmsaappid
     */
    GetMsaAppId() {
        result := ComCall(16, this, "ptr*", &msaAppId := 0, "HRESULT")
        return msaAppId
    }

    /**
     * Reserved for Microsoft use.
     * @returns {PWSTR} Type: <b>__RPC__deref_out_opt_string*</b>
     * @see https://docs.microsoft.com/windows/win32/api//xblidpauthmanager/nf-xblidpauthmanager-ixblidpauthtokenresult-getredirect
     */
    GetRedirect() {
        result := ComCall(17, this, "ptr*", &redirect := 0, "HRESULT")
        return redirect
    }

    /**
     * Reserved for Microsoft use.
     * @returns {PWSTR} Type: <b>__RPC__deref_out_opt_string*</b>
     * @see https://docs.microsoft.com/windows/win32/api//xblidpauthmanager/nf-xblidpauthmanager-ixblidpauthtokenresult-getmessage
     */
    GetMessage() {
        result := ComCall(18, this, "ptr*", &message := 0, "HRESULT")
        return message
    }

    /**
     * Reserved for Microsoft use.
     * @returns {PWSTR} Type: <b>__RPC__deref_out_opt_string*</b>
     * @see https://docs.microsoft.com/windows/win32/api//xblidpauthmanager/nf-xblidpauthmanager-ixblidpauthtokenresult-gethelpid
     */
    GetHelpId() {
        result := ComCall(19, this, "ptr*", &helpId := 0, "HRESULT")
        return helpId
    }

    /**
     * Reserved for Microsoft use.
     * @returns {PWSTR} Type: <b>__RPC__deref_out_opt_string*</b>
     * @see https://docs.microsoft.com/windows/win32/api//xblidpauthmanager/nf-xblidpauthmanager-ixblidpauthtokenresult-getenforcementbans
     */
    GetEnforcementBans() {
        result := ComCall(20, this, "ptr*", &enforcementBans := 0, "HRESULT")
        return enforcementBans
    }

    /**
     * Reserved for Microsoft use.
     * @returns {PWSTR} Type: <b>__RPC__deref_out_opt_string*</b>
     * @see https://docs.microsoft.com/windows/win32/api//xblidpauthmanager/nf-xblidpauthmanager-ixblidpauthtokenresult-getrestrictions
     */
    GetRestrictions() {
        result := ComCall(21, this, "ptr*", &restrictions := 0, "HRESULT")
        return restrictions
    }

    /**
     * Reserved for Microsoft use.
     * @returns {PWSTR} Type: <b>__RPC__deref_out_opt_string*</b>
     * @see https://docs.microsoft.com/windows/win32/api//xblidpauthmanager/nf-xblidpauthmanager-ixblidpauthtokenresult-gettitlerestrictions
     */
    GetTitleRestrictions() {
        result := ComCall(22, this, "ptr*", &titleRestrictions := 0, "HRESULT")
        return titleRestrictions
    }
}
