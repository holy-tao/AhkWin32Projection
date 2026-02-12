#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Use IBitsTokenOptions to associate and manage a pair of security tokens for a Background Intelligent Transfer Service (BITS) transfer job.
 * @see https://learn.microsoft.com/windows/win32/api//content/bits4_0/nn-bits4_0-ibitstokenoptions
 * @namespace Windows.Win32.Networking.BackgroundIntelligentTransferService
 * @version v4.0.30319
 */
class IBitsTokenOptions extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBitsTokenOptions
     * @type {Guid}
     */
    static IID => Guid("{9a2584c3-f7d2-457a-9a5e-22b67bffc7d2}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetHelperTokenFlags", "GetHelperTokenFlags", "SetHelperToken", "ClearHelperToken", "GetHelperTokenSid"]

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
     * @param {Integer} UsageFlags 
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/bits4_0/nf-bits4_0-ibitstokenoptions-sethelpertokenflags
     */
    SetHelperTokenFlags(UsageFlags) {
        result := ComCall(3, this, "uint", UsageFlags, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Returns the usage flags for a token that is associated with a BITS transfer job.
     * @remarks
     * Older implementations effectively required that BITS users have  administrator privileges in order to get helper token flags with this method. Starting with Windows 10, version 1607, non-administrator BITS users can use this method to get helper token usage flags on BITS jobs they own. This change enables non-administrator BITS users (such as background downloader services running under the <a href="https://docs.microsoft.com/windows/desktop/Services/networkservice-account">NetworkService account</a>) to use helper tokens effectively. 
     * 
     * Specifically, the implementation has been changed to allow users without administrator privileges to get helper token flags, as long as the SID of the  caller's thread's token is the same as the SID of the job owner's user account during the <a href="https://docs.microsoft.com/windows/desktop/api/bits/nn-bits-ibackgroundcopyjob">IBackgroundCopyJob::QueryInterface</a> call.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api//content/bits4_0/nf-bits4_0-ibitstokenoptions-gethelpertokenflags
     */
    GetHelperTokenFlags() {
        result := ComCall(4, this, "uint*", &pFlags := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
     * @see https://learn.microsoft.com/windows/win32/api//content/bits4_0/nf-bits4_0-ibitstokenoptions-sethelpertoken
     */
    SetHelperToken() {
        result := ComCall(5, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Discards the helper token, and does not change the usage flags.
     * @remarks
     * Older implementations effectively required that BITS users have  administrator privileges in order to clear a helper token with this method. Starting with Windows 10, version 1607, non-administrator BITS users can use this method to clear helper tokens on BITS jobs they own. This change enables non-administrator BITS users (such as background downloader services running under the <a href="https://docs.microsoft.com/windows/desktop/Services/networkservice-account">NetworkService account</a>) to use helper tokens effectively. 
     * 
     * Specifically, the implementation has been changed to allow users without administrator privileges to clear a helper token, as long as the SID of the  caller's thread's token is the same as the SID of the job owner's user account during the <a href="https://docs.microsoft.com/windows/desktop/api/bits/nn-bits-ibackgroundcopyjob">IBackgroundCopyJob::QueryInterface</a> call.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/bits4_0/nf-bits4_0-ibitstokenoptions-clearhelpertoken
     */
    ClearHelperToken() {
        result := ComCall(6, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Returns the SID of the helper token if one is set.
     * @remarks
     * Older implementations effectively required that BITS users have  administrator privileges in order to get the helper token SID with this method. Starting with Windows 10, version 1607, non-administrator BITS users can use this method to get the helper token SID on BITS jobs they own. This change enables non-administrator BITS users (such as background downloader services running under the <a href="https://docs.microsoft.com/windows/desktop/Services/networkservice-account">NetworkService account</a>) to use helper tokens effectively. 
     * 
     * Specifically, the implementation has been changed to allow users without administrator privileges to get the helper token SID, as long as the SID of the  caller's thread's token is the same as the SID of the job owner's user account during the <a href="https://docs.microsoft.com/windows/desktop/api/bits/nn-bits-ibackgroundcopyjob">IBackgroundCopyJob::QueryInterface</a> call.
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/windows/win32/api//content/bits4_0/nf-bits4_0-ibitstokenoptions-gethelpertokensid
     */
    GetHelperTokenSid() {
        result := ComCall(7, this, "ptr*", &pSid_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pSid_
    }
}
