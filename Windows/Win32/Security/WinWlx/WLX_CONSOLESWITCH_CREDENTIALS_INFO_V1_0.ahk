#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\HANDLE.ahk
#Include ..\..\Foundation\LUID.ahk
#Include ..\QUOTA_LIMITS.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * Contains the client credentials returned by a call to WlxGetConsoleSwitchCredentials.
 * @see https://learn.microsoft.com/windows/win32/api/winwlx/ns-winwlx-wlx_consoleswitch_credentials_info_v1_0
 * @namespace Windows.Win32.Security.WinWlx
 * @version v4.0.30319
 */
class WLX_CONSOLESWITCH_CREDENTIALS_INFO_V1_0 extends Win32Struct
{
    static sizeof => 224

    static packingSize => 8

    /**
     * Identifies the type of credentials structure being allocated. Credential types are defined with the prefix WLX_CONSOLESWITCHCREDENTIAL_TYPE allowing Winlogon to typecast the structure so the remainder of the structure may be referenced.
     * @type {Integer}
     */
    dwType {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Handle of the users token.
     * @type {HANDLE}
     */
    UserToken{
        get {
            if(!this.HasProp("__UserToken"))
                this.__UserToken := HANDLE(this.ptr + 8)
            return this.__UserToken
        }
    }

    /**
     * Unique logon identifier.
     * @type {LUID}
     */
    LogonId{
        get {
            if(!this.HasProp("__LogonId"))
                this.__LogonId := LUID(this.ptr + 16)
            return this.__LogonId
        }
    }

    /**
     * QUOTA_LIMITS structure containing information on the amount of system resources available to a user.
     * @type {QUOTA_LIMITS}
     */
    Quotas{
        get {
            if(!this.HasProp("__Quotas"))
                this.__Quotas := QUOTA_LIMITS(this.ptr + 24)
            return this.__Quotas
        }
    }

    /**
     * User's name as a string.
     * @type {PWSTR}
     */
    UserName{
        get {
            if(!this.HasProp("__UserName"))
                this.__UserName := PWSTR(this.ptr + 72)
            return this.__UserName
        }
    }

    /**
     * User's domain as a string.
     * @type {PWSTR}
     */
    Domain{
        get {
            if(!this.HasProp("__Domain"))
                this.__Domain := PWSTR(this.ptr + 80)
            return this.__Domain
        }
    }

    /**
     * Exact logon time.
     * @type {Integer}
     */
    LogonTime {
        get => NumGet(this, 88, "int64")
        set => NumPut("int64", value, this, 88)
    }

    /**
     * <b>TRUE</b> if the logon was done by SmartCard.
     * @type {Integer}
     */
    SmartCardLogon {
        get => NumGet(this, 96, "int")
        set => NumPut("int", value, this, 96)
    }

    /**
     * Length of the user's profile in bytes.
     * @type {Integer}
     */
    ProfileLength {
        get => NumGet(this, 100, "uint")
        set => NumPut("uint", value, this, 100)
    }

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/ne-ntsecapi-msv1_0_profile_buffer_type">MSV1_0_PROFILE_BUFFER_TYPE</a> value identifying the type of profile data being returned. This member must be set to <b>MsV1_0InteractiveProfile</b>.
     * @type {Integer}
     */
    MessageType {
        get => NumGet(this, 104, "uint")
        set => NumPut("uint", value, this, 104)
    }

    /**
     * Number of times the user is currently logged on. 
     * 
     * 
     * 
     * 
     * <div class="alert"><b>Note</b>  This value is not guaranteed to be accurate because the domain controller is not notified of all logons and logoffs.</div>
     * <div> </div>
     * @type {Integer}
     */
    LogonCount {
        get => NumGet(this, 108, "ushort")
        set => NumPut("ushort", value, this, 108)
    }

    /**
     * Number of times a password that is not valid was applied to the account since the last successful logon.
     * @type {Integer}
     */
    BadPasswordCount {
        get => NumGet(this, 110, "ushort")
        set => NumPut("ushort", value, this, 110)
    }

    /**
     * Time when the user last logged on. This is an absolute-format Windows standard time value.
     * @type {Integer}
     */
    ProfileLogonTime {
        get => NumGet(this, 112, "int64")
        set => NumPut("int64", value, this, 112)
    }

    /**
     * Time when user should log off. This is an absolute-format Windows standard time value.
     * @type {Integer}
     */
    LogoffTime {
        get => NumGet(this, 120, "int64")
        set => NumPut("int64", value, this, 120)
    }

    /**
     * Time when system should force the user to log off. This is an absolute-format Windows standard time value. Note that Windows users are not forced to log off interactively; however, their network connections may be closed.
     * @type {Integer}
     */
    KickOffTime {
        get => NumGet(this, 128, "int64")
        set => NumPut("int64", value, this, 128)
    }

    /**
     * Time and date the password was last changed. This is an absolute format Windows standard time value.
     * @type {Integer}
     */
    PasswordLastSet {
        get => NumGet(this, 136, "int64")
        set => NumPut("int64", value, this, 136)
    }

    /**
     * Time and date when the user should be reminded to change passwords. This is an absolute-format Windows standard time value. This member is used by the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/g-gly">GINA</a> to display the prompt asking whether the user wants to change the current password.
     * @type {Integer}
     */
    PasswordCanChange {
        get => NumGet(this, 144, "int64")
        set => NumPut("int64", value, this, 144)
    }

    /**
     * Time and date when the user must change the password. If the user can never change the password, this member is undefined. This is an absolute-format, Windows, standard time value.
     * @type {Integer}
     */
    PasswordMustChange {
        get => NumGet(this, 152, "int64")
        set => NumPut("int64", value, this, 152)
    }

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/subauth/ns-subauth-unicode_string">UNICODE_STRING</a> containing the relative path to the account's logon script.
     * @type {PWSTR}
     */
    LogonScript{
        get {
            if(!this.HasProp("__LogonScript"))
                this.__LogonScript := PWSTR(this.ptr + 160)
            return this.__LogonScript
        }
    }

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/subauth/ns-subauth-unicode_string">UNICODE_STRING</a> containing the home directory for the user.
     * @type {PWSTR}
     */
    HomeDirectory{
        get {
            if(!this.HasProp("__HomeDirectory"))
                this.__HomeDirectory := PWSTR(this.ptr + 168)
            return this.__HomeDirectory
        }
    }

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/subauth/ns-subauth-unicode_string">UNICODE_STRING</a> containing the full name of the user.
     * @type {PWSTR}
     */
    FullName{
        get {
            if(!this.HasProp("__FullName"))
                this.__FullName := PWSTR(this.ptr + 176)
            return this.__FullName
        }
    }

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/subauth/ns-subauth-unicode_string">UNICODE_STRING</a> specifying the path to the user's roaming profile if the user has a roaming profile. For example: \\SomeServer\SomeShare\MyUserName
     * @type {PWSTR}
     */
    ProfilePath{
        get {
            if(!this.HasProp("__ProfilePath"))
                this.__ProfilePath := PWSTR(this.ptr + 184)
            return this.__ProfilePath
        }
    }

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/subauth/ns-subauth-unicode_string">UNICODE_STRING</a> containing the drive letter (for example, C:\ or D:\) of the home directory.
     * @type {PWSTR}
     */
    HomeDirectoryDrive{
        get {
            if(!this.HasProp("__HomeDirectoryDrive"))
                this.__HomeDirectoryDrive := PWSTR(this.ptr + 192)
            return this.__HomeDirectoryDrive
        }
    }

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/subauth/ns-subauth-unicode_string">UNICODE_STRING</a> containing the name of the server that processed the logon request.
     * @type {PWSTR}
     */
    LogonServer{
        get {
            if(!this.HasProp("__LogonServer"))
                this.__LogonServer := PWSTR(this.ptr + 200)
            return this.__LogonServer
        }
    }

    /**
     * Specifies how this user established the session. This can be the following flag.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="LOGON_EXTRA_SIDS"></a><a id="logon_extra_sids"></a><dl>
     * <dt><b>LOGON_EXTRA_SIDS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The user logged on using extra <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">SIDs</a>.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    UserFlags {
        get => NumGet(this, 208, "uint")
        set => NumPut("uint", value, this, 208)
    }

    /**
     * Length in bytes of any GINA-specific data. Set to zero if there is no GINA specific data.
     * @type {Integer}
     */
    PrivateDataLen {
        get => NumGet(this, 212, "uint")
        set => NumPut("uint", value, this, 212)
    }

    /**
     * Buffer containing any GINA-specific data.
     * @type {Pointer<Byte>}
     */
    PrivateData {
        get => NumGet(this, 216, "ptr")
        set => NumPut("ptr", value, this, 216)
    }
}
