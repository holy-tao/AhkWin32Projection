#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\LSA_UNICODE_STRING.ahk" { LSA_UNICODE_STRING }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\KERB_PROFILE_BUFFER_TYPE.ahk" { KERB_PROFILE_BUFFER_TYPE }

/**
 * The KERB_INTERACTIVE_PROFILE structure contains information about an interactive logon profile. This structure is used by the LsaLogonUser function.
 * @see https://learn.microsoft.com/windows/win32/api/ntsecapi/ns-ntsecapi-kerb_interactive_profile
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct KERB_INTERACTIVE_PROFILE {
    #StructPack 8

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/ne-ntsecapi-kerb_profile_buffer_type">KERB_PROFILE_BUFFER_TYPE</a> value identifying the type of logon request being made. This member can be set to <b>KerbInteractiveProfile</b>.
     */
    MessageType : KERB_PROFILE_BUFFER_TYPE

    /**
     * Number of times the user is currently logged on.
     */
    LogonCount : UInt16

    /**
     * Number of times a bad password was applied to the account since the last successful logon.
     */
    BadPasswordCount : UInt16

    /**
     * Time when the user last logged on. This is an absolute-format standard time value.
     */
    LogonTime : Int64

    /**
     * Time when user should log off. This is an absolute-format standard time value.
     */
    LogoffTime : Int64

    /**
     * Time when system should force user logoff. This is an absolute-format standard time value.
     */
    KickOffTime : Int64

    /**
     * Time and date the password was last set. This is an absolute-format standard time value.
     */
    PasswordLastSet : Int64

    /**
     * Time and date when the user can change the password. This is an absolute-format standard time value. To prevent a password from ever changing, set this member to a date very far into the future.
     */
    PasswordCanChange : Int64

    /**
     * Time and date when the user must change the password. If the user can never change the password, this member is undefined. This is an absolute-format standard time value.
     */
    PasswordMustChange : Int64

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/subauth/ns-subauth-unicode_string">UNICODE_STRING</a> containing the relative path to the account's logon script.
     */
    LogonScript : LSA_UNICODE_STRING

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/subauth/ns-subauth-unicode_string">UNICODE_STRING</a> containing the user's home directory.
     */
    HomeDirectory : LSA_UNICODE_STRING

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/subauth/ns-subauth-unicode_string">UNICODE_STRING</a> containing the user's full name.
     */
    FullName : LSA_UNICODE_STRING

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/subauth/ns-subauth-unicode_string">UNICODE_STRING</a> containing the path to a user's roaming profile. This is used only if the user has a roaming profile.
     */
    ProfilePath : LSA_UNICODE_STRING

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/subauth/ns-subauth-unicode_string">UNICODE_STRING</a> containing the drive containing the user's home directory.
     */
    HomeDirectoryDrive : LSA_UNICODE_STRING

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/subauth/ns-subauth-unicode_string">UNICODE_STRING</a> containing the name of the server that processed the logon request.
     */
    LogonServer : LSA_UNICODE_STRING

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
     */
    UserFlags : UInt32

}
