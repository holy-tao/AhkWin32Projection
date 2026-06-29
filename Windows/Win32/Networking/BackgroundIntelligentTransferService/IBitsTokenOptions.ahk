#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\BG_TOKEN.ahk" { BG_TOKEN }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Use IBitsTokenOptions to associate and manage a pair of security tokens for a Background Intelligent Transfer Service (BITS) transfer job.
 * @see https://learn.microsoft.com/windows/win32/api/bits4_0/nn-bits4_0-ibitstokenoptions
 * @namespace Windows.Win32.Networking.BackgroundIntelligentTransferService
 */
export default struct IBitsTokenOptions extends IUnknown {
    /**
     * The interface identifier for IBitsTokenOptions
     * @type {Guid}
     */
    static IID := Guid("{9a2584c3-f7d2-457a-9a5e-22b67bffc7d2}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IBitsTokenOptions interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetHelperTokenFlags : IntPtr
        GetHelperTokenFlags : IntPtr
        SetHelperToken      : IntPtr
        ClearHelperToken    : IntPtr
        GetHelperTokenSid   : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IBitsTokenOptions.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Sets the usage flags for a token that is associated with a BITS transfer job.
     * @remarks
     * The helper token usage flags specify which resources are to be accessed using the helper token’s security context. BITS will access all other resources using the job owner’s security context. For example, the client certificate is accessed by using the job owner identity.
     * 
     * If a client certificate is specified and the owner of the BITS job is not the LocalSystem account, setting the <i>UsageFlag</i> parameter to <b>BG_TOKEN_NETWORK</b> will cause the job to fail with the error code 0x80072f9a (<b>ERROR_WINHTTP_CLIENT_CERT_NO_ACCESS_PRIVATE_KEY</b>). 
     * 
     * Older implementations effectively required that BITS users have  administrator privileges in order to set helper token usage flags with this method. Starting with Windows 10, version 1607, non-administrator BITS users can use this method to set non-administrator helper token usage flags on BITS jobs they own. This change enables non-administrator BITS users (such as background downloader services running under the <a href="https://docs.microsoft.com/windows/desktop/Services/networkservice-account">NetworkService account</a>) to use helper tokens effectively. 
     * 
     * Specifically, the implementation has been changed to allow users without administrator privileges to set helper token usage flags, as long as the SID of the  caller's thread's token is the same as the SID of the job owner's user account during the <a href="https://docs.microsoft.com/windows/desktop/api/bits/nn-bits-ibackgroundcopyjob">IBackgroundCopyJob::QueryInterface</a> call, and the helper token that is currently set (if any) does not have the administrator SID (<b>DOMAIN_ALIAS_RID_ADMINS</b>) enabled.
     * @param {BG_TOKEN} UsageFlags 
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/bits4_0/nf-bits4_0-ibitstokenoptions-sethelpertokenflags
     */
    SetHelperTokenFlags(UsageFlags) {
        result := ComCall(3, this, BG_TOKEN, UsageFlags, "HRESULT")
        return result
    }

    /**
     * Returns the usage flags for a token that is associated with a BITS transfer job.
     * @remarks
     * Older implementations effectively required that BITS users have  administrator privileges in order to get helper token flags with this method. Starting with Windows 10, version 1607, non-administrator BITS users can use this method to get helper token usage flags on BITS jobs they own. This change enables non-administrator BITS users (such as background downloader services running under the <a href="https://docs.microsoft.com/windows/desktop/Services/networkservice-account">NetworkService account</a>) to use helper tokens effectively. 
     * 
     * Specifically, the implementation has been changed to allow users without administrator privileges to get helper token flags, as long as the SID of the  caller's thread's token is the same as the SID of the job owner's user account during the <a href="https://docs.microsoft.com/windows/desktop/api/bits/nn-bits-ibackgroundcopyjob">IBackgroundCopyJob::QueryInterface</a> call.
     * @returns {BG_TOKEN} 
     * @see https://learn.microsoft.com/windows/win32/api/bits4_0/nf-bits4_0-ibitstokenoptions-gethelpertokenflags
     */
    GetHelperTokenFlags() {
        result := ComCall(4, this, "uint*", &pFlags := 0, "HRESULT")
        return pFlags
    }

    /**
     * Sets the helper token to impersonate the token of the COM client.
     * @remarks
     * The helper token does not need to represent an administrator.
     * 
     * The impersonation level for the proxy blanket must be set to either <b>RPC_C_IMP_LEVEL_IMPERSONATE</b> or <b>RPC_C_IMP_LEVEL_DELEGATE</b>. For more information, see <a href="https://docs.microsoft.com/windows/win32/com/security-blanket-negotiation">Security Blanket Negotiation</a>.
     * 
     * The cloaking flag should be set to <b>EOAC_DYNAMIC_CLOAKING</b>, which enables the COM server to use the thread token as the client's identity. For more information, see <a href="https://docs.microsoft.com/windows/win32/com/cloaking">Cloaking</a> and <a href="https://docs.microsoft.com/windows/win32/api/objidlbase/ne-objidlbase-eole_authentication_capabilities">EOLE_AUTHENTICATION_CAPABILITIES Enumeration</a>.
     * 
     * Older implementations effectively required that BITS users have  administrator privileges in order to set helper tokens. Starting with Windows 10, version 1607, non-administrator BITS users can use <b>IBitsTokenOptions::SetHelperToken</b> to set non-administrator helper tokens on BITS jobs they own. This change enables non-administrator BITS users (such as background downloader services running under the <a href="https://docs.microsoft.com/windows/desktop/Services/networkservice-account">NetworkService account</a>) to set helper tokens. 
     * 
     * Specifically, the implementation has been changed to allow users without administrator privileges to set helper tokens, as long as the SID of the  caller's thread's token is the same as the SID of the job owner's user account during the <a href="https://docs.microsoft.com/windows/desktop/api/bits/nn-bits-ibackgroundcopyjob">IBackgroundCopyJob::QueryInterface</a> call, and the helper token being set does not have the administrator SID (<b>DOMAIN_ALIAS_RID_ADMINS</b>) enabled.
     * @returns {HRESULT} The following value might be returned:
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>CO_E_FAILEDTOIMPERSONATE</b></dt>
     * <dt>0x80010123</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * COM settings on the client do not allow impersonate-level access to the client token.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_ACCESSDENIED</b></dt>
     * <dt>0x80070005</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <ul>
     * <li>In versions prior to Windows 10, version 1607, the job is not owned by an administrator. In those versions of Windows, only administrator-owned jobs may set helper tokens.
     * </li>
     * <li>In Windows 10, version 1607 and newer versions, this error indicates that the helper token has administrator privileges, but the caller does not have administrator privileges.</li>
     * </ul>
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/bits4_0/nf-bits4_0-ibitstokenoptions-sethelpertoken
     */
    SetHelperToken() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * Discards the helper token, and does not change the usage flags.
     * @remarks
     * Older implementations effectively required that BITS users have  administrator privileges in order to clear a helper token with this method. Starting with Windows 10, version 1607, non-administrator BITS users can use this method to clear helper tokens on BITS jobs they own. This change enables non-administrator BITS users (such as background downloader services running under the <a href="https://docs.microsoft.com/windows/desktop/Services/networkservice-account">NetworkService account</a>) to use helper tokens effectively. 
     * 
     * Specifically, the implementation has been changed to allow users without administrator privileges to clear a helper token, as long as the SID of the  caller's thread's token is the same as the SID of the job owner's user account during the <a href="https://docs.microsoft.com/windows/desktop/api/bits/nn-bits-ibackgroundcopyjob">IBackgroundCopyJob::QueryInterface</a> call.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/bits4_0/nf-bits4_0-ibitstokenoptions-clearhelpertoken
     */
    ClearHelperToken() {
        result := ComCall(6, this, "HRESULT")
        return result
    }

    /**
     * Returns the SID of the helper token if one is set.
     * @remarks
     * Older implementations effectively required that BITS users have  administrator privileges in order to get the helper token SID with this method. Starting with Windows 10, version 1607, non-administrator BITS users can use this method to get the helper token SID on BITS jobs they own. This change enables non-administrator BITS users (such as background downloader services running under the <a href="https://docs.microsoft.com/windows/desktop/Services/networkservice-account">NetworkService account</a>) to use helper tokens effectively. 
     * 
     * Specifically, the implementation has been changed to allow users without administrator privileges to get the helper token SID, as long as the SID of the  caller's thread's token is the same as the SID of the job owner's user account during the <a href="https://docs.microsoft.com/windows/desktop/api/bits/nn-bits-ibackgroundcopyjob">IBackgroundCopyJob::QueryInterface</a> call.
     * @returns {PWSTR} Returns the SID that is retrieved from the <i>TokenInformation</i> parameter of the <a href="https://docs.microsoft.com/windows/win32/api/securitybaseapi/nf-securitybaseapi-gettokeninformation">GetTokenInformation</a> function.  If no SID is retrieved, this parameter is set to <b>NULL</b>.
     * @see https://learn.microsoft.com/windows/win32/api/bits4_0/nf-bits4_0-ibitstokenoptions-gethelpertokensid
     */
    GetHelperTokenSid() {
        result := ComCall(7, this, PWSTR.Ptr, &_pSid := 0, "HRESULT")
        return _pSid
    }

    Query(iid) {
        if (IBitsTokenOptions.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetHelperTokenFlags := CallbackCreate(GetMethod(implObj, "SetHelperTokenFlags"), flags, 2)
        this.vtbl.GetHelperTokenFlags := CallbackCreate(GetMethod(implObj, "GetHelperTokenFlags"), flags, 2)
        this.vtbl.SetHelperToken := CallbackCreate(GetMethod(implObj, "SetHelperToken"), flags, 1)
        this.vtbl.ClearHelperToken := CallbackCreate(GetMethod(implObj, "ClearHelperToken"), flags, 1)
        this.vtbl.GetHelperTokenSid := CallbackCreate(GetMethod(implObj, "GetHelperTokenSid"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetHelperTokenFlags)
        CallbackFree(this.vtbl.GetHelperTokenFlags)
        CallbackFree(this.vtbl.SetHelperToken)
        CallbackFree(this.vtbl.ClearHelperToken)
        CallbackFree(this.vtbl.GetHelperTokenSid)
    }
}
