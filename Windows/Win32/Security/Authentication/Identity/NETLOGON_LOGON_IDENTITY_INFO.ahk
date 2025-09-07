#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Foundation\PWSTR.ahk
#Include .\LSA_UNICODE_STRING.ahk

/**
 * Used to pass information about a user for logon subauthentication.
 * @see https://learn.microsoft.com/windows/win32/api/subauth/ns-subauth-netlogon_logon_identity_info
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class NETLOGON_LOGON_IDENTITY_INFO extends Win32Struct
{
    static sizeof => 64

    static packingSize => 8

    /**
     * Pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/subauth/ns-subauth-unicode_string">UNICODE_STRING</a> containing the name of the logon domain. The specified domain name must be a domain that is trusted by this machine. If the logon domain is unknown, such as a down-level client that does not supply this information, this member should be <b>NULL</b>.
     * @type {LSA_UNICODE_STRING}
     */
    LogonDomainName{
        get {
            if(!this.HasProp("__LogonDomainName"))
                this.__LogonDomainName := LSA_UNICODE_STRING(this.ptr + 0)
            return this.__LogonDomainName
        }
    }

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
     * @type {Integer}
     */
    ParameterControl {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Uniquely identifies the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/l-gly">logon session</a>.
     * @type {Integer}
     */
    LogonId {
        get => NumGet(this, 24, "int64")
        set => NumPut("int64", value, this, 24)
    }

    /**
     * Pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/subauth/ns-subauth-unicode_string">UNICODE_STRING</a> identifying the account name of the user attempting to log on.
     * @type {LSA_UNICODE_STRING}
     */
    UserName{
        get {
            if(!this.HasProp("__UserName"))
                this.__UserName := LSA_UNICODE_STRING(this.ptr + 32)
            return this.__UserName
        }
    }

    /**
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/subauth/ns-subauth-unicode_string">UNICODE_STRING</a> identifying the workstation from which the user is attempting to log on. <b>NULL</b> indicates that the workstation identity is unknown.
     * @type {LSA_UNICODE_STRING}
     */
    Workstation{
        get {
            if(!this.HasProp("__Workstation"))
                this.__Workstation := LSA_UNICODE_STRING(this.ptr + 48)
            return this.__Workstation
        }
    }
}
