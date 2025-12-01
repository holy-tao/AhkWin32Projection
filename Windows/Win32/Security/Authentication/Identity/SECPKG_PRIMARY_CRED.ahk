#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Foundation\LUID.ahk
#Include .\LSA_UNICODE_STRING.ahk

/**
 * The SECPKG_PRIMARY_CRED structure contains the primary credentials. This structure is used by the LsaApLogonUserEx2 and SpAcceptCredentials functions.
 * @remarks
 * For cached logons, the RPC identifier of the package that performs the logon is identified by shifting the <b>Flags</b> member to the right by using the PRIMARY_CRED_LOGON_PACKAGE_SHIFT constant defined below.
 * 
 * 
 * ```cpp
 * @see https://learn.microsoft.com/windows/win32/api/ntsecpkg/ns-ntsecpkg-secpkg_primary_cred
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class SECPKG_PRIMARY_CRED extends Win32Struct
{
    static sizeof => 200

    static packingSize => 8

    /**
     * The <a href="https://docs.microsoft.com/windows/desktop/SecGloss/l-gly">logon identifier</a>.
     * @type {LUID}
     */
    LogonId{
        get {
            if(!this.HasProp("__LogonId"))
                this.__LogonId := LUID(0, this)
            return this.__LogonId
        }
    }

    /**
     * A 
     * <a href="https://docs.microsoft.com/windows/desktop/api/subauth/ns-subauth-unicode_string">UNICODE_STRING</a> structure that contains the Security Accounts Manager account name.
     * @type {LSA_UNICODE_STRING}
     */
    DownlevelName{
        get {
            if(!this.HasProp("__DownlevelName"))
                this.__DownlevelName := LSA_UNICODE_STRING(8, this)
            return this.__DownlevelName
        }
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/subauth/ns-subauth-unicode_string">UNICODE_STRING</a> structure that contains the NetBIOS domain name where the account is located.
     * @type {LSA_UNICODE_STRING}
     */
    DomainName{
        get {
            if(!this.HasProp("__DomainName"))
                this.__DomainName := LSA_UNICODE_STRING(24, this)
            return this.__DomainName
        }
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/subauth/ns-subauth-unicode_string">UNICODE_STRING</a> structure that contains the logon password. When you have finished using the password, remove the sensitive information from memory by calling <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa366877(v=vs.85)">SecureZeroMemory</a>. For more information on protecting the password, see <a href="https://docs.microsoft.com/windows/desktop/SecBP/handling-passwords">Handling Passwords</a>.
     * @type {LSA_UNICODE_STRING}
     */
    Password{
        get {
            if(!this.HasProp("__Password"))
                this.__Password := LSA_UNICODE_STRING(40, this)
            return this.__Password
        }
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/subauth/ns-subauth-unicode_string">UNICODE_STRING</a> structure that contains the old password. When you have finished using the old password, remove the sensitive information from memory by calling <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa366877(v=vs.85)">SecureZeroMemory</a>.
     * @type {LSA_UNICODE_STRING}
     */
    OldPassword{
        get {
            if(!this.HasProp("__OldPassword"))
                this.__OldPassword := LSA_UNICODE_STRING(56, this)
            return this.__OldPassword
        }
    }

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security identifier</a>.
     * @type {PSID}
     */
    UserSid {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }

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
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 80, "uint")
        set => NumPut("uint", value, this, 80)
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/subauth/ns-subauth-unicode_string">UNICODE_STRING</a> structure that contains the DNS domain name where the user account is located, if known.
     * @type {LSA_UNICODE_STRING}
     */
    DnsDomainName{
        get {
            if(!this.HasProp("__DnsDomainName"))
                this.__DnsDomainName := LSA_UNICODE_STRING(88, this)
            return this.__DnsDomainName
        }
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/subauth/ns-subauth-unicode_string">UNICODE_STRING</a> structure that contains the user principal name (UPN), if known.
     * @type {LSA_UNICODE_STRING}
     */
    Upn{
        get {
            if(!this.HasProp("__Upn"))
                this.__Upn := LSA_UNICODE_STRING(104, this)
            return this.__Upn
        }
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/subauth/ns-subauth-unicode_string">UNICODE_STRING</a> structure that contains the name of the server that processed the logon.
     * @type {LSA_UNICODE_STRING}
     */
    LogonServer{
        get {
            if(!this.HasProp("__LogonServer"))
                this.__LogonServer := LSA_UNICODE_STRING(120, this)
            return this.__LogonServer
        }
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/subauth/ns-subauth-unicode_string">UNICODE_STRING</a> structure. Reserved.
     * @type {LSA_UNICODE_STRING}
     */
    Spare1{
        get {
            if(!this.HasProp("__Spare1"))
                this.__Spare1 := LSA_UNICODE_STRING(136, this)
            return this.__Spare1
        }
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/subauth/ns-subauth-unicode_string">UNICODE_STRING</a> structure. Reserved.
     * @type {LSA_UNICODE_STRING}
     */
    Spare2{
        get {
            if(!this.HasProp("__Spare2"))
                this.__Spare2 := LSA_UNICODE_STRING(152, this)
            return this.__Spare2
        }
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/subauth/ns-subauth-unicode_string">UNICODE_STRING</a> structure. Reserved.
     * @type {LSA_UNICODE_STRING}
     */
    Spare3{
        get {
            if(!this.HasProp("__Spare3"))
                this.__Spare3 := LSA_UNICODE_STRING(168, this)
            return this.__Spare3
        }
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/subauth/ns-subauth-unicode_string">UNICODE_STRING</a> structure. Reserved.
     * @type {LSA_UNICODE_STRING}
     */
    Spare4{
        get {
            if(!this.HasProp("__Spare4"))
                this.__Spare4 := LSA_UNICODE_STRING(184, this)
            return this.__Spare4
        }
    }
}
