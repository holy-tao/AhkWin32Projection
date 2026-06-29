#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\LSA_UNICODE_STRING.ahk" { LSA_UNICODE_STRING }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * Used to pass information about a user for logon subauthentication.
 * @see https://learn.microsoft.com/windows/win32/api/subauth/ns-subauth-netlogon_logon_identity_info
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct NETLOGON_LOGON_IDENTITY_INFO {
    #StructPack 8

    /**
     * Pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/subauth/ns-subauth-unicode_string">UNICODE_STRING</a> containing the name of the logon domain. The specified domain name must be a domain that is trusted by this machine. If the logon domain is unknown, such as a down-level client that does not supply this information, this member should be <b>NULL</b>.
     */
    LogonDomainName : LSA_UNICODE_STRING

    /**
     * Specifies attributes of the other function parameters. 
     * 
     * 
     * 
     * 
     * 					
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CLEARTEXT_PASSWORD_ALLOWED"></a><a id="cleartext_password_allowed"></a><dl>
     * <dt><b>CLEARTEXT_PASSWORD_ALLOWED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Specifies that <b>CaseSensitiveChallengeResponse</b> and <b>CaseInsensitiveChallengeResponse</b> are allowed to be the user's <a href="https://docs.microsoft.com/windows/desktop/SecGloss/p-gly">plaintext</a> password.
     * 
     * </td>
     * </tr>
     * </table>
     */
    ParameterControl : UInt32

    /**
     * Uniquely identifies the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/l-gly">logon session</a>.
     */
    LogonId : Int64

    /**
     * Pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/subauth/ns-subauth-unicode_string">UNICODE_STRING</a> identifying the account name of the user attempting to log on.
     */
    UserName : LSA_UNICODE_STRING

    /**
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/subauth/ns-subauth-unicode_string">UNICODE_STRING</a> identifying the workstation from which the user is attempting to log on. <b>NULL</b> indicates that the workstation identity is unknown.
     */
    Workstation : LSA_UNICODE_STRING

}
