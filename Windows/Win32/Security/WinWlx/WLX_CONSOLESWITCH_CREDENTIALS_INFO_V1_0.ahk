#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\QUOTA_LIMITS.ahk" { QUOTA_LIMITS }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\LUID.ahk" { LUID }

/**
 * Contains the client credentials returned by a call to WlxGetConsoleSwitchCredentials.
 * @see https://learn.microsoft.com/windows/win32/api/winwlx/ns-winwlx-wlx_consoleswitch_credentials_info_v1_0
 * @namespace Windows.Win32.Security.WinWlx
 */
export default struct WLX_CONSOLESWITCH_CREDENTIALS_INFO_V1_0 {
    #StructPack 8

    /**
     * Identifies the type of credentials structure being allocated. Credential types are defined with the prefix WLX_CONSOLESWITCHCREDENTIAL_TYPE allowing Winlogon to typecast the structure so the remainder of the structure may be referenced.
     */
    dwType : UInt32

    /**
     * Handle of the users token.
     */
    UserToken : HANDLE

    /**
     * Unique logon identifier.
     */
    LogonId : LUID

    /**
     * QUOTA_LIMITS structure containing information on the amount of system resources available to a user.
     */
    Quotas : QUOTA_LIMITS

    /**
     * User's name as a string.
     */
    UserName : PWSTR

    /**
     * User's domain as a string.
     */
    Domain : PWSTR

    /**
     * Exact logon time.
     */
    LogonTime : Int64

    /**
     * <b>TRUE</b> if the logon was done by SmartCard.
     */
    SmartCardLogon : BOOL

    /**
     * Length of the user's profile in bytes.
     */
    ProfileLength : UInt32

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/ne-ntsecapi-msv1_0_profile_buffer_type">MSV1_0_PROFILE_BUFFER_TYPE</a> value identifying the type of profile data being returned. This member must be set to <b>MsV1_0InteractiveProfile</b>.
     */
    MessageType : UInt32

    /**
     * Number of times the user is currently logged on. 
     * 
     * 
     * 
     * 
     * <div class="alert"><b>Note</b>  This value is not guaranteed to be accurate because the domain controller is not notified of all logons and logoffs.</div>
     * <div> </div>
     */
    LogonCount : UInt16

    /**
     * Number of times a password that is not valid was applied to the account since the last successful logon.
     */
    BadPasswordCount : UInt16

    /**
     * Time when the user last logged on. This is an absolute-format Windows standard time value.
     */
    ProfileLogonTime : Int64

    /**
     * Time when user should log off. This is an absolute-format Windows standard time value.
     */
    LogoffTime : Int64

    /**
     * Time when system should force the user to log off. This is an absolute-format Windows standard time value. Note that Windows users are not forced to log off interactively; however, their network connections may be closed.
     */
    KickOffTime : Int64

    /**
     * Time and date the password was last changed. This is an absolute format Windows standard time value.
     */
    PasswordLastSet : Int64

    /**
     * Time and date when the user should be reminded to change passwords. This is an absolute-format Windows standard time value. This member is used by the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/g-gly">GINA</a> to display the prompt asking whether the user wants to change the current password.
     */
    PasswordCanChange : Int64

    /**
     * Time and date when the user must change the password. If the user can never change the password, this member is undefined. This is an absolute-format, Windows, standard time value.
     */
    PasswordMustChange : Int64

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/subauth/ns-subauth-unicode_string">UNICODE_STRING</a> containing the relative path to the account's logon script.
     */
    LogonScript : PWSTR

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/subauth/ns-subauth-unicode_string">UNICODE_STRING</a> containing the home directory for the user.
     */
    HomeDirectory : PWSTR

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/subauth/ns-subauth-unicode_string">UNICODE_STRING</a> containing the full name of the user.
     */
    FullName : PWSTR

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/subauth/ns-subauth-unicode_string">UNICODE_STRING</a> specifying the path to the user's roaming profile if the user has a roaming profile. For example: \\SomeServer\SomeShare\MyUserName
     */
    ProfilePath : PWSTR

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/subauth/ns-subauth-unicode_string">UNICODE_STRING</a> containing the drive letter (for example, C:\ or D:\) of the home directory.
     */
    HomeDirectoryDrive : PWSTR

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/subauth/ns-subauth-unicode_string">UNICODE_STRING</a> containing the name of the server that processed the logon request.
     */
    LogonServer : PWSTR

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
     */
    UserFlags : UInt32

    /**
     * Length in bytes of any GINA-specific data. Set to zero if there is no GINA specific data.
     */
    PrivateDataLen : UInt32

    /**
     * Buffer containing any GINA-specific data.
     */
    PrivateData : IntPtr

}
