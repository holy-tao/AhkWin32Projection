#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\LSA_UNICODE_STRING.ahk

/**
 * The MSV1_0_INTERACTIVE_PROFILE structure contains information about an interactive logon profile. This structure is used by the LsaLogonUser function.
 * @see https://docs.microsoft.com/windows/win32/api//ntsecapi/ns-ntsecapi-msv1_0_interactive_profile
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class MSV1_0_INTERACTIVE_PROFILE extends Win32Struct
{
    static sizeof => 160

    static packingSize => 8

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/ne-ntsecapi-msv1_0_profile_buffer_type">MSV1_0_PROFILE_BUFFER_TYPE</a> value identifying the type of profile data being returned. This member must be set to <b>MsV1_0InteractiveProfile</b>.
     * @type {Integer}
     */
    MessageType {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
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
        get => NumGet(this, 4, "ushort")
        set => NumPut("ushort", value, this, 4)
    }

    /**
     * Number of times a password that is not valid was applied to the account since the last successful logon.
     * @type {Integer}
     */
    BadPasswordCount {
        get => NumGet(this, 6, "ushort")
        set => NumPut("ushort", value, this, 6)
    }

    /**
     * Time when the user last logged on. This is an absolute-format Windows standard time value.
     * @type {Integer}
     */
    LogonTime {
        get => NumGet(this, 8, "int64")
        set => NumPut("int64", value, this, 8)
    }

    /**
     * Time when the user should log off. This is an absolute-format Windows standard time value.
     * @type {Integer}
     */
    LogoffTime {
        get => NumGet(this, 16, "int64")
        set => NumPut("int64", value, this, 16)
    }

    /**
     * Time when the system should force the user to log off. This is an absolute-format Windows standard time value. Note that Windows users are not forced to log off interactively; however, their network connections may be closed.
     * @type {Integer}
     */
    KickOffTime {
        get => NumGet(this, 24, "int64")
        set => NumPut("int64", value, this, 24)
    }

    /**
     * Time and date the password was last changed. This is an absolute format Windows standard time value.
     * @type {Integer}
     */
    PasswordLastSet {
        get => NumGet(this, 32, "int64")
        set => NumPut("int64", value, this, 32)
    }

    /**
     * Time and date when the user should be reminded to change passwords. This is an absolute-format Windows standard time value. This member is used by the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/g-gly">GINA</a> to display the prompt asking whether the user wants to change the current password.
     * @type {Integer}
     */
    PasswordCanChange {
        get => NumGet(this, 40, "int64")
        set => NumPut("int64", value, this, 40)
    }

    /**
     * Time and date when the user must change the password. If the user can never change the password, this member is undefined. This is an absolute-format, Windows, standard time value.
     * @type {Integer}
     */
    PasswordMustChange {
        get => NumGet(this, 48, "int64")
        set => NumPut("int64", value, this, 48)
    }

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/subauth/ns-subauth-unicode_string">UNICODE_STRING</a> containing the relative path to the account's logon script.
     * @type {LSA_UNICODE_STRING}
     */
    LogonScript{
        get {
            if(!this.HasProp("__LogonScript"))
                this.__LogonScript := LSA_UNICODE_STRING(56, this)
            return this.__LogonScript
        }
    }

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/subauth/ns-subauth-unicode_string">UNICODE_STRING</a> containing the home directory for the user.
     * @type {LSA_UNICODE_STRING}
     */
    HomeDirectory{
        get {
            if(!this.HasProp("__HomeDirectory"))
                this.__HomeDirectory := LSA_UNICODE_STRING(72, this)
            return this.__HomeDirectory
        }
    }

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/subauth/ns-subauth-unicode_string">UNICODE_STRING</a> containing the full name of the user.
     * @type {LSA_UNICODE_STRING}
     */
    FullName{
        get {
            if(!this.HasProp("__FullName"))
                this.__FullName := LSA_UNICODE_STRING(88, this)
            return this.__FullName
        }
    }

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/subauth/ns-subauth-unicode_string">UNICODE_STRING</a> specifying the path to the user's roaming profile if the user has a roaming profile. For example: \\SomeServer\SomeShare\MyUserName
     * @type {LSA_UNICODE_STRING}
     */
    ProfilePath{
        get {
            if(!this.HasProp("__ProfilePath"))
                this.__ProfilePath := LSA_UNICODE_STRING(104, this)
            return this.__ProfilePath
        }
    }

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/subauth/ns-subauth-unicode_string">UNICODE_STRING</a> containing the drive letter (for example, C:\ or D:\) of the home directory.
     * @type {LSA_UNICODE_STRING}
     */
    HomeDirectoryDrive{
        get {
            if(!this.HasProp("__HomeDirectoryDrive"))
                this.__HomeDirectoryDrive := LSA_UNICODE_STRING(120, this)
            return this.__HomeDirectoryDrive
        }
    }

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/subauth/ns-subauth-unicode_string">UNICODE_STRING</a> containing the name of the server that processed the logon request.
     * @type {LSA_UNICODE_STRING}
     */
    LogonServer{
        get {
            if(!this.HasProp("__LogonServer"))
                this.__LogonServer := LSA_UNICODE_STRING(136, this)
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
     * The user logged on using extra <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security identifiers</a> (SIDs).
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    UserFlags {
        get => NumGet(this, 152, "uint")
        set => NumPut("uint", value, this, 152)
    }
}
