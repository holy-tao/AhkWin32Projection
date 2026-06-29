#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\LSA_UNICODE_STRING.ahk" { LSA_UNICODE_STRING }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\PSID.ahk" { PSID }
#Import "..\..\..\Foundation\LUID.ahk" { LUID }

/**
 * The SECPKG_PRIMARY_CRED structure contains the primary credentials. This structure is used by the LsaApLogonUserEx2 and SpAcceptCredentials functions.
 * @remarks
 * For cached logons, the RPC identifier of the package that performs the logon is identified by shifting the <b>Flags</b> member to the right by using the PRIMARY_CRED_LOGON_PACKAGE_SHIFT constant defined below.
 * 
 * 
 * ```cpp
 * @see https://learn.microsoft.com/windows/win32/api/ntsecpkg/ns-ntsecpkg-secpkg_primary_cred
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct SECPKG_PRIMARY_CRED {
    #StructPack 8

    /**
     * The <a href="https://docs.microsoft.com/windows/desktop/SecGloss/l-gly">logon identifier</a>.
     */
    LogonId : LUID

    /**
     * A 
     * <a href="https://docs.microsoft.com/windows/desktop/api/subauth/ns-subauth-unicode_string">UNICODE_STRING</a> structure that contains the Security Accounts Manager account name.
     */
    DownlevelName : LSA_UNICODE_STRING

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/subauth/ns-subauth-unicode_string">UNICODE_STRING</a> structure that contains the NetBIOS domain name where the account is located.
     */
    DomainName : LSA_UNICODE_STRING

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/subauth/ns-subauth-unicode_string">UNICODE_STRING</a> structure that contains the logon password. When you have finished using the password, remove the sensitive information from memory by calling <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa366877(v=vs.85)">SecureZeroMemory</a>. For more information on protecting the password, see <a href="https://docs.microsoft.com/windows/desktop/SecBP/handling-passwords">Handling Passwords</a>.
     */
    Password : LSA_UNICODE_STRING

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/subauth/ns-subauth-unicode_string">UNICODE_STRING</a> structure that contains the old password. When you have finished using the old password, remove the sensitive information from memory by calling <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa366877(v=vs.85)">SecureZeroMemory</a>.
     */
    OldPassword : LSA_UNICODE_STRING

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security identifier</a>.
     */
    UserSid : PSID

    /**
     * The set of <a href="https://docs.microsoft.com/windows/desktop/SecGloss/p-gly">primary credentials</a> flags. The following table lists the valid values for the <b>Flags</b> member.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PRIMARY_CRED_CLEAR_PASSWORD"></a><a id="primary_cred_clear_password"></a><dl>
     * <dt><b>PRIMARY_CRED_CLEAR_PASSWORD</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The passwords are in plaintext.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PRIMARY_CRED_OWF_PASSWORD"></a><a id="primary_cred_owf_password"></a><dl>
     * <dt><b>PRIMARY_CRED_OWF_PASSWORD</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The passwords are encrypted using a one-way function.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PRIMARY_CRED_UPDATE"></a><a id="primary_cred_update"></a><dl>
     * <dt><b>PRIMARY_CRED_UPDATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This is a change of existing credentials.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PRIMARY_CRED_CACHED_LOGON"></a><a id="primary_cred_cached_logon"></a><dl>
     * <dt><b>PRIMARY_CRED_CACHED_LOGON</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The credentials were obtained from a cached logon. For more information, see Remarks.
     * 
     * </td>
     * </tr>
     * </table>
     */
    Flags : UInt32

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/subauth/ns-subauth-unicode_string">UNICODE_STRING</a> structure that contains the DNS domain name where the user account is located, if known.
     */
    DnsDomainName : LSA_UNICODE_STRING

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/subauth/ns-subauth-unicode_string">UNICODE_STRING</a> structure that contains the user principal name (UPN), if known.
     */
    Upn : LSA_UNICODE_STRING

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/subauth/ns-subauth-unicode_string">UNICODE_STRING</a> structure that contains the name of the server that processed the logon.
     */
    LogonServer : LSA_UNICODE_STRING

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/subauth/ns-subauth-unicode_string">UNICODE_STRING</a> structure. Reserved.
     */
    Spare1 : LSA_UNICODE_STRING

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/subauth/ns-subauth-unicode_string">UNICODE_STRING</a> structure. Reserved.
     */
    Spare2 : LSA_UNICODE_STRING

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/subauth/ns-subauth-unicode_string">UNICODE_STRING</a> structure. Reserved.
     */
    Spare3 : LSA_UNICODE_STRING

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/subauth/ns-subauth-unicode_string">UNICODE_STRING</a> structure. Reserved.
     */
    Spare4 : LSA_UNICODE_STRING

}
