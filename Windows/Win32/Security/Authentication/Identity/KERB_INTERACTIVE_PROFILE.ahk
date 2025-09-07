#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Foundation\PWSTR.ahk
#Include .\LSA_UNICODE_STRING.ahk

/**
 * The KERB_INTERACTIVE_PROFILE structure contains information about an interactive logon profile. This structure is used by the LsaLogonUser function.
 * @see https://learn.microsoft.com/windows/win32/api/ntsecapi/ns-ntsecapi-kerb_interactive_profile
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class KERB_INTERACTIVE_PROFILE extends Win32Struct
{
    static sizeof => 160

    static packingSize => 8

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/ne-ntsecapi-kerb_profile_buffer_type">KERB_PROFILE_BUFFER_TYPE</a> value identifying the type of logon request being made. This member can be set to <b>KerbInteractiveProfile</b>.
     * @type {Integer}
     */
    MessageType {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * Number of times the user is currently logged on.
     * @type {Integer}
     */
    LogonCount {
        get => NumGet(this, 4, "ushort")
        set => NumPut("ushort", value, this, 4)
    }

    /**
     * Number of times a bad password was applied to the account since the last successful logon.
     * @type {Integer}
     */
    BadPasswordCount {
        get => NumGet(this, 6, "ushort")
        set => NumPut("ushort", value, this, 6)
    }

    /**
     * Time when the user last logged on. This is an absolute-format standard time value.
     * @type {Integer}
     */
    LogonTime {
        get => NumGet(this, 8, "int64")
        set => NumPut("int64", value, this, 8)
    }

    /**
     * Time when user should log off. This is an absolute-format standard time value.
     * @type {Integer}
     */
    LogoffTime {
        get => NumGet(this, 16, "int64")
        set => NumPut("int64", value, this, 16)
    }

    /**
     * Time when system should force user logoff. This is an absolute-format standard time value.
     * @type {Integer}
     */
    KickOffTime {
        get => NumGet(this, 24, "int64")
        set => NumPut("int64", value, this, 24)
    }

    /**
     * Time and date the password was last set. This is an absolute-format standard time value.
     * @type {Integer}
     */
    PasswordLastSet {
        get => NumGet(this, 32, "int64")
        set => NumPut("int64", value, this, 32)
    }

    /**
     * Time and date when the user can change the password. This is an absolute-format standard time value. To prevent a password from ever changing, set this member to a date very far into the future.
     * @type {Integer}
     */
    PasswordCanChange {
        get => NumGet(this, 40, "int64")
        set => NumPut("int64", value, this, 40)
    }

    /**
     * Time and date when the user must change the password. If the user can never change the password, this member is undefined. This is an absolute-format standard time value.
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
                this.__LogonScript := LSA_UNICODE_STRING(this.ptr + 56)
            return this.__LogonScript
        }
    }

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/subauth/ns-subauth-unicode_string">UNICODE_STRING</a> containing the user's home directory.
     * @type {LSA_UNICODE_STRING}
     */
    HomeDirectory{
        get {
            if(!this.HasProp("__HomeDirectory"))
                this.__HomeDirectory := LSA_UNICODE_STRING(this.ptr + 72)
            return this.__HomeDirectory
        }
    }

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/subauth/ns-subauth-unicode_string">UNICODE_STRING</a> containing the user's full name.
     * @type {LSA_UNICODE_STRING}
     */
    FullName{
        get {
            if(!this.HasProp("__FullName"))
                this.__FullName := LSA_UNICODE_STRING(this.ptr + 88)
            return this.__FullName
        }
    }

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/subauth/ns-subauth-unicode_string">UNICODE_STRING</a> containing the path to a user's roaming profile. This is used only if the user has a roaming profile.
     * @type {LSA_UNICODE_STRING}
     */
    ProfilePath{
        get {
            if(!this.HasProp("__ProfilePath"))
                this.__ProfilePath := LSA_UNICODE_STRING(this.ptr + 104)
            return this.__ProfilePath
        }
    }

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/subauth/ns-subauth-unicode_string">UNICODE_STRING</a> containing the drive containing the user's home directory.
     * @type {LSA_UNICODE_STRING}
     */
    HomeDirectoryDrive{
        get {
            if(!this.HasProp("__HomeDirectoryDrive"))
                this.__HomeDirectoryDrive := LSA_UNICODE_STRING(this.ptr + 120)
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
                this.__LogonServer := LSA_UNICODE_STRING(this.ptr + 136)
            return this.__LogonServer
        }
    }

    /**
     * Specifies how this user established the session. This can be one or more of the following flags.
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
     * <tr>
     * <td width="40%"><a id="LOGON_RESOURCE_GROUPS"></a><a id="logon_resource_groups"></a><dl>
     * <dt><b>LOGON_RESOURCE_GROUPS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The user logged on using a domain local group.
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
