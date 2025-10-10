#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Foundation\LUID.ahk
#Include .\LSA_UNICODE_STRING.ahk
#Include .\LSA_LAST_INTER_LOGON_INFO.ahk

/**
 * Contains information about a logon session.
 * @remarks
 * 
  * This structure is allocated by the LSA. When the structure is no longer required, free it by using the 
  * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/nf-ntsecapi-lsafreereturnbuffer">LSAFreeReturnBuffer</a> function.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//ntsecapi/ns-ntsecapi-security_logon_session_data
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class SECURITY_LOGON_SESSION_DATA extends Win32Struct
{
    static sizeof => 272

    static packingSize => 8

    /**
     * The size of the structure, in bytes.
     * @type {Integer}
     */
    Size {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/SecGloss/l-gly">locally unique identifier</a> (LUID) that identifies a logon session.
     * @type {LUID}
     */
    LogonId{
        get {
            if(!this.HasProp("__LogonId"))
                this.__LogonId := LUID(this.ptr + 8)
            return this.__LogonId
        }
    }

    /**
     * An 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lsalookup/ns-lsalookup-lsa_unicode_string">LSA_UNICODE_STRING</a> structure that contains the account name of the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security principal</a> that owns the logon session.
     * @type {LSA_UNICODE_STRING}
     */
    UserName{
        get {
            if(!this.HasProp("__UserName"))
                this.__UserName := LSA_UNICODE_STRING(this.ptr + 16)
            return this.__UserName
        }
    }

    /**
     * An <a href="https://docs.microsoft.com/windows/desktop/api/lsalookup/ns-lsalookup-lsa_unicode_string">LSA_UNICODE_STRING</a> structure that contains the name of the domain used to authenticate the owner of the logon session.
     * @type {LSA_UNICODE_STRING}
     */
    LogonDomain{
        get {
            if(!this.HasProp("__LogonDomain"))
                this.__LogonDomain := LSA_UNICODE_STRING(this.ptr + 32)
            return this.__LogonDomain
        }
    }

    /**
     * An <a href="https://docs.microsoft.com/windows/desktop/api/lsalookup/ns-lsalookup-lsa_unicode_string">LSA_UNICODE_STRING</a> structure that contains the name of the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/a-gly">authentication package</a> used to authenticate the owner of the logon session.
     * @type {LSA_UNICODE_STRING}
     */
    AuthenticationPackage{
        get {
            if(!this.HasProp("__AuthenticationPackage"))
                this.__AuthenticationPackage := LSA_UNICODE_STRING(this.ptr + 48)
            return this.__AuthenticationPackage
        }
    }

    /**
     * A 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/ne-ntsecapi-security_logon_type">SECURITY_LOGON_TYPE</a> value that identifies the logon method.
     * @type {Integer}
     */
    LogonType {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }

    /**
     * A Terminal Services session identifier. This member may be zero.
     * @type {Integer}
     */
    Session {
        get => NumGet(this, 68, "uint")
        set => NumPut("uint", value, this, 68)
    }

    /**
     * A pointer to the user's <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security identifier</a> (SID).
     * @type {Pointer<Void>}
     */
    Sid {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }

    /**
     * The time the session owner logged on.
     * @type {Integer}
     */
    LogonTime {
        get => NumGet(this, 80, "int64")
        set => NumPut("int64", value, this, 80)
    }

    /**
     * An <a href="https://docs.microsoft.com/windows/desktop/api/lsalookup/ns-lsalookup-lsa_unicode_string">LSA_UNICODE_STRING</a> structure  that contains the name of the server used to authenticate the owner of the logon session.
     * @type {LSA_UNICODE_STRING}
     */
    LogonServer{
        get {
            if(!this.HasProp("__LogonServer"))
                this.__LogonServer := LSA_UNICODE_STRING(this.ptr + 88)
            return this.__LogonServer
        }
    }

    /**
     * An <a href="https://docs.microsoft.com/windows/desktop/api/lsalookup/ns-lsalookup-lsa_unicode_string">LSA_UNICODE_STRING</a> structure  that contains the DNS name for the owner of the logon session.
     * @type {LSA_UNICODE_STRING}
     */
    DnsDomainName{
        get {
            if(!this.HasProp("__DnsDomainName"))
                this.__DnsDomainName := LSA_UNICODE_STRING(this.ptr + 104)
            return this.__DnsDomainName
        }
    }

    /**
     * An <a href="https://docs.microsoft.com/windows/desktop/api/lsalookup/ns-lsalookup-lsa_unicode_string">LSA_UNICODE_STRING</a> structure  that contains the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/u-gly">user principal name</a> (UPN) for the owner of the logon session.
     * @type {LSA_UNICODE_STRING}
     */
    Upn{
        get {
            if(!this.HasProp("__Upn"))
                this.__Upn := LSA_UNICODE_STRING(this.ptr + 120)
            return this.__Upn
        }
    }

    /**
     * The user flags for the logon session.
     * 
     * <b>Windows Server 2003 R2, Windows XP with SP1 and earlier, Windows Server 2003 and Windows XP:  </b>This member is not supported.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="LOGON_OPTIMIZED"></a><a id="logon_optimized"></a><dl>
     * <dt><b>LOGON_OPTIMIZED</b></dt>
     * <dt>0x4000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The logon is an optimized logon session.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="LOGON_WINLOGON"></a><a id="logon_winlogon"></a><dl>
     * <dt><b>LOGON_WINLOGON</b></dt>
     * <dt>0x8000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The logon was created for Winlogon. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="LOGON_PKINIT"></a><a id="logon_pkinit"></a><dl>
     * <dt><b>LOGON_PKINIT</b></dt>
     * <dt>0x10000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The Kerberos PKINIT extension was used to authenticate the user in this logon session.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="LOGON_NOT_OPTIMIZED"></a><a id="logon_not_optimized"></a><dl>
     * <dt><b>LOGON_NOT_OPTIMIZED</b></dt>
     * <dt>0x20000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Optimized logon has been disabled for this account.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    UserFlags {
        get => NumGet(this, 136, "uint")
        set => NumPut("uint", value, this, 136)
    }

    /**
     * An <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/ns-ntsecapi-lsa_last_inter_logon_info">LSA_LAST_INTER_LOGON_INFO</a> structure that contains the information on the last logon session.
     * 
     * <b>Windows Server 2003 R2, Windows XP with SP1 and earlier, Windows Server 2003 and Windows XP:  </b>This member is not supported.
     * @type {LSA_LAST_INTER_LOGON_INFO}
     */
    LastLogonInfo{
        get {
            if(!this.HasProp("__LastLogonInfo"))
                this.__LastLogonInfo := LSA_LAST_INTER_LOGON_INFO(this.ptr + 144)
            return this.__LastLogonInfo
        }
    }

    /**
     * An <a href="https://docs.microsoft.com/windows/desktop/api/lsalookup/ns-lsalookup-lsa_unicode_string">LSA_UNICODE_STRING</a> structure  that contains the script used for logging on.
     * 
     * <b>Windows Server 2003 R2, Windows XP with SP1 and earlier, Windows Server 2003 and Windows XP:  </b>This member is not supported.
     * @type {LSA_UNICODE_STRING}
     */
    LogonScript{
        get {
            if(!this.HasProp("__LogonScript"))
                this.__LogonScript := LSA_UNICODE_STRING(this.ptr + 168)
            return this.__LogonScript
        }
    }

    /**
     * An <a href="https://docs.microsoft.com/windows/desktop/api/lsalookup/ns-lsalookup-lsa_unicode_string">LSA_UNICODE_STRING</a> structure  that contains the path to the user's profile.
     * 
     * <b>Windows Server 2003 R2, Windows XP with SP1 and earlier, Windows Server 2003 and Windows XP:  </b>This member is not supported.
     * @type {LSA_UNICODE_STRING}
     */
    ProfilePath{
        get {
            if(!this.HasProp("__ProfilePath"))
                this.__ProfilePath := LSA_UNICODE_STRING(this.ptr + 184)
            return this.__ProfilePath
        }
    }

    /**
     * An <a href="https://docs.microsoft.com/windows/desktop/api/lsalookup/ns-lsalookup-lsa_unicode_string">LSA_UNICODE_STRING</a> structure  that contains the home directory for the logon session.
     * 
     * <b>Windows Server 2003 R2, Windows XP with SP1 and earlier, Windows Server 2003 and Windows XP:  </b>This member is not supported.
     * @type {LSA_UNICODE_STRING}
     */
    HomeDirectory{
        get {
            if(!this.HasProp("__HomeDirectory"))
                this.__HomeDirectory := LSA_UNICODE_STRING(this.ptr + 200)
            return this.__HomeDirectory
        }
    }

    /**
     * An <a href="https://docs.microsoft.com/windows/desktop/api/lsalookup/ns-lsalookup-lsa_unicode_string">LSA_UNICODE_STRING</a> structure  that contains the drive location of the home directory of the logon session.
     * 
     * <b>Windows Server 2003 R2, Windows XP with SP1 and earlier, Windows Server 2003 and Windows XP:  </b>This member is not supported.
     * @type {LSA_UNICODE_STRING}
     */
    HomeDirectoryDrive{
        get {
            if(!this.HasProp("__HomeDirectoryDrive"))
                this.__HomeDirectoryDrive := LSA_UNICODE_STRING(this.ptr + 216)
            return this.__HomeDirectoryDrive
        }
    }

    /**
     * The time stamp of when the session user logged off.
     * 
     * <b>Windows Server 2003 R2, Windows XP with SP1 and earlier, Windows Server 2003 and Windows XP:  </b>This member is not supported.
     * @type {Integer}
     */
    LogoffTime {
        get => NumGet(this, 232, "int64")
        set => NumPut("int64", value, this, 232)
    }

    /**
     * The time that the logon session must end.
     * 
     * <b>Windows Server 2003 R2, Windows XP with SP1 and earlier, Windows Server 2003 and Windows XP:  </b>This member is not supported.
     * @type {Integer}
     */
    KickOffTime {
        get => NumGet(this, 240, "int64")
        set => NumPut("int64", value, this, 240)
    }

    /**
     * The time  when the user last changed the password.
     * 
     * <b>Windows Server 2003 R2, Windows XP with SP1 and earlier, Windows Server 2003 and Windows XP:  </b>This member is not supported.
     * @type {Integer}
     */
    PasswordLastSet {
        get => NumGet(this, 248, "int64")
        set => NumPut("int64", value, this, 248)
    }

    /**
     * The password can be changed during the logon session.
     * 
     * <b>Windows Server 2003 R2, Windows XP with SP1 and earlier, Windows Server 2003 and Windows XP:  </b>This member is not supported.
     * @type {Integer}
     */
    PasswordCanChange {
        get => NumGet(this, 256, "int64")
        set => NumPut("int64", value, this, 256)
    }

    /**
     * The password must be changed during the logon session.
     * 
     * <b>Windows Server 2003 R2, Windows XP with SP1 and earlier, Windows Server 2003 and Windows XP:  </b>This member is not supported.
     * @type {Integer}
     */
    PasswordMustChange {
        get => NumGet(this, 264, "int64")
        set => NumPut("int64", value, this, 264)
    }
}
