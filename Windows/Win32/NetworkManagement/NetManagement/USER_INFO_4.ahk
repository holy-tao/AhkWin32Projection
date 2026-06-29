#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\USER_PRIV.ahk" { USER_PRIV }
#Import ".\AF_OP.ahk" { AF_OP }
#Import "..\..\Security\PSID.ahk" { PSID }
#Import ".\USER_ACCOUNT_FLAGS.ahk" { USER_ACCOUNT_FLAGS }

/**
 * The USER_INFO_4 structure contains information about a user account, including the account name, password data, privilege level, the path to the user's home directory, security identifier (SID), and other user-related network statistics.
 * @remarks
 * The
 * 				<b>USER_INFO_4</b> structure can be used with the <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/nf-lmaccess-netuseradd">NetUserAdd</a>,
 * 			<a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/nf-lmaccess-netusersetinfo">NetUserSetInfo</a>, and
 * 			<a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/nf-lmaccess-netusergetinfo">NetUserGetInfo</a> functions.
 * 
 * User account names are limited to 20 characters and group names are limited to 256 characters. In addition, account names cannot be terminated by a period and they cannot include commas or any of the following printable characters: ", /, \, [, ], :, |, &lt;, &gt;, +, =, ;, ?, *. Names also cannot include characters in the range 1-31, which are nonprintable.
 * 
 * Note that the 
 * <b>USER_INFO_4</b> structure supersedes the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/ns-lmaccess-user_info_3">USER_INFO_3</a> structure on Windows XP and later. It is recommended that applications use 
 * the <b>USER_INFO_4</b> structure instead of the 
 * <b>USER_INFO_3</b> structure with the above functions on Windows XP and later.
 * @see https://learn.microsoft.com/windows/win32/api/lmaccess/ns-lmaccess-user_info_4
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 */
export default struct USER_INFO_4 {
    #StructPack 8

    /**
     * Type: <b>LPWSTR</b>
     * 
     * A pointer to a Unicode string that specifies the name of the user account. For the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/nf-lmaccess-netusersetinfo">NetUserSetInfo</a> function, this member is ignored.
     */
    usri4_name : PWSTR

    /**
     * Type: <b>LPWSTR</b>
     * 
     * A pointer to a Unicode string that specifies the password for the user identified by the <b>usri4_name</b> member. The length cannot exceed PWLEN bytes. The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/nf-lmaccess-netusergetinfo">NetUserGetInfo</a> function returns a <b>NULL</b> pointer to maintain password security. 
     * 
     * 
     * 
     * 
     * By convention, the length of passwords is limited to LM20_PWLEN characters.
     */
    usri4_password : PWSTR

    /**
     * Type: <b>DWORD</b>
     * 
     * The number of seconds that have elapsed since the <b>usri4_password</b> member was last changed. The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/nf-lmaccess-netuseradd">NetUserAdd</a> and 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/nf-lmaccess-netusersetinfo">NetUserSetInfo</a> functions ignore this member.
     */
    usri4_password_age : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The level of privilege assigned to the <b>usri4_name</b> member. The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/nf-lmaccess-netuseradd">NetUserAdd</a> and
     */
    usri4_priv : USER_PRIV

    /**
     * Type: <b>LPWSTR</b>
     * 
     * A pointer to a Unicode string specifying the path of the home directory of the user specified by the <b>usri4_name</b> member. The string can be <b>NULL</b>.
     */
    usri4_home_dir : PWSTR

    /**
     * Type: <b>LPWSTR</b>
     * 
     * A pointer to a Unicode string that contains a comment to associate with the user account. The string can be a <b>NULL</b> string, or it can have any number of characters before the terminating null character.
     */
    usri4_comment : PWSTR

    /**
     * Type: <b>DWORD</b>
     */
    usri4_flags : USER_ACCOUNT_FLAGS

    /**
     * Type: <b>LPWSTR</b>
     * 
     * A pointer to a Unicode string specifying the path for the user's logon script file. The script file can be a .CMD file, an .EXE file, or a .BAT file. The string can also be <b>NULL</b>.
     */
    usri4_script_path : PWSTR

    /**
     * Type: <b>DWORD</b>
     * 
     * The user's operator privileges. 
     * 
     * 
     * 
     * 
     * For the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/nf-lmaccess-netusergetinfo">NetUserGetInfo</a> function, the appropriate value is returned based on the local group membership. If the user is a member of Print Operators, AF_OP_PRINT is set. If the user is a member of Server Operators, AF_OP_SERVER is set. If the user is a member of the Account Operators, AF_OP_ACCOUNTS is set. AF_OP_COMM is never set.
     * 
     * The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/nf-lmaccess-netuseradd">NetUserAdd</a> and 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/nf-lmaccess-netusersetinfo">NetUserSetInfo</a> functions ignore this member.
     */
    usri4_auth_flags : AF_OP

    /**
     * Type: <b>LPWSTR</b>
     * 
     * A pointer to a Unicode string that contains the full name of the user. This string can be a <b>NULL</b> string, or it can have any number of characters before the terminating null character.
     */
    usri4_full_name : PWSTR

    /**
     * Type: <b>LPWSTR</b>
     * 
     * A pointer to a Unicode string that contains a user comment. This string can be a <b>NULL</b> string, or it can have any number of characters before the terminating null character.
     */
    usri4_usr_comment : PWSTR

    /**
     * Type: <b>LPWSTR</b>
     * 
     * A pointer to a Unicode string that is reserved for use by applications. This string can be a <b>NULL</b> string, or it can have any number of characters before the terminating null character. Microsoft products use this member to store user configuration information. Do not modify this information.
     */
    usri4_parms : PWSTR

    /**
     * Type: <b>LPWSTR</b>
     * 
     * > [!IMPORTANT]
     * > You should no longer use **usri4_workstations**. Instead, you can control sign-in access to workstations by configuring the User Rights Assignment settings (**Allow log on locally** and **Deny log on locally**, or **Allow log on through Remote Desktop Services** and **Deny log on through Remote Desktop Services**).
     * 
     * A pointer to a Unicode string that contains the names of workstations from which the user can log on. As many as eight workstations can be specified; the names must be separated by commas. If you do not want to restrict the number of workstations, use a <b>NULL</b> string. To disable logons from all workstations to this account, set the UF_ACCOUNTDISABLE value in the <b>usri4_flags</b> member.
     */
    usri4_workstations : PWSTR

    /**
     * Type: <b>DWORD</b>
     * 
     * The date and time when the last logon occurred. This value is stored as the number of seconds that have elapsed since 00:00:00, January 1, 1970, GMT. This member is ignored by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/nf-lmaccess-netuseradd">NetUserAdd</a> and 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/nf-lmaccess-netusersetinfo">NetUserSetInfo</a> functions. 
     * 
     * 
     * 
     * 
     * This member is maintained separately on each backup domain controller (BDC) in the domain. To obtain an accurate value, you must query each BDC in the domain. The last logon occurred at the time indicated by the largest retrieved value.
     */
    usri4_last_logon : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * This member is currently not used. 
     * 
     * 
     * 
     * 
     * The date and time when the last logoff occurred. This value is stored as the number of seconds that have elapsed since 00:00:00, January 1, 1970, GMT. A value of zero indicates that the last logoff time is unknown.
     * 
     * This member is maintained separately on each backup domain controller (BDC) in the domain. To obtain an accurate value, you must query each BDC in the domain. The last logoff occurred at the time indicated by the largest retrieved value.
     */
    usri4_last_logoff : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The date and time when the account expires. This value is stored as the number of seconds elapsed since 00:00:00, January 1, 1970, GMT. A value of TIMEQ_FOREVER indicates that the account never expires.
     */
    usri4_acct_expires : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The maximum amount of disk space the user can use. Specify USER_MAXSTORAGE_UNLIMITED to use all available disk space.
     */
    usri4_max_storage : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The number of equal-length time units into which the week is divided. This value is required to compute the length of the bit string in the <b>usri4_logon_hours</b> member. 
     * 
     * 
     * 
     * 
     * This value must be UNITS_PER_WEEK for LAN Manager 2.0. This element is ignored by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/nf-lmaccess-netuseradd">NetUserAdd</a> and 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/nf-lmaccess-netusersetinfo">NetUserSetInfo</a> functions.
     */
    usri4_units_per_week : UInt32

    /**
     * Type: <b>PBYTE</b>
     * 
     * A pointer to a 21-byte (168 bits) bit string that specifies the times during which the user can log on. Each bit represents a unique hour in the week, in Greenwich Mean Time (GMT). 
     * 
     * 
     * 
     * 
     * The first bit (bit 0, word 0) is Sunday, 0:00 to 0:59; the second bit (bit 1, word 0) is Sunday, 1:00 to 1:59; and so on. Note that bit 0 in word 0 represents Sunday from 0:00 to 0:59 only if you are in the GMT time zone. In all other cases you must adjust the bits according to your time zone offset (for example, GMT minus 8 hours for Pacific Standard Time).
     * 
     * Specify a <b>NULL</b> pointer in this member when calling the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/nf-lmaccess-netuseradd">NetUserAdd</a> function to indicate no time restriction. Specify a <b>NULL</b> pointer when calling the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/nf-lmaccess-netusersetinfo">NetUserSetInfo</a> function to indicate that no change is to be made to the times during which the user can log on.
     */
    usri4_logon_hours : IntPtr

    /**
     * Type: <b>DWORD</b>
     * 
     * The number of times the user tried to log on to the account using an incorrect password. A value of – 1 indicates that the value is unknown. Calls to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/nf-lmaccess-netuseradd">NetUserAdd</a> and 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/nf-lmaccess-netusersetinfo">NetUserSetInfo</a> functions ignore this member. 
     * 
     * 
     * 
     * 
     * This member is replicated from the primary domain controller (PDC); it is also maintained on each backup domain controller (BDC) in the domain. To obtain an accurate value, you must query each BDC in the domain. The number of times the user tried to log on using an incorrect password is the largest value retrieved.
     */
    usri4_bad_pw_count : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The number of times the user logged on successfully to this account. A value of – 1 indicates that the value is unknown. Calls to the 
     * <b>NetUserAdd</b> and 
     * <b>NetUserSetInfo</b> functions ignore this member. 
     * 
     * 
     * 
     * 
     * This member is maintained separately on each backup domain controller (BDC) in the domain. To obtain an accurate value, you must query each BDC in the domain. The number of times the user logged on successfully is the sum of the retrieved values.
     */
    usri4_num_logons : UInt32

    /**
     * Type: <b>LPWSTR</b>
     * 
     * A pointer to a Unicode string that contains the name of the server to which logon requests are sent. Server names should be preceded by two backslashes (\\). To indicate that the logon request can be handled by any logon server, specify an asterisk (\\*) for the server name. A <b>NULL</b> string indicates that requests should be sent to the domain controller.
     * 
     * For Windows servers, 
     * the <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/nf-lmaccess-netusergetinfo">NetUserGetInfo</a> function returns \\*. 
     * 
     * The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/nf-lmaccess-netuseradd">NetUserAdd</a> and 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/nf-lmaccess-netusersetinfo">NetUserSetInfo</a> functions ignore this member.
     */
    usri4_logon_server : PWSTR

    /**
     * Type: <b>DWORD</b>
     * 
     * The country/region code for the user's language of choice.
     */
    usri4_country_code : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The code page for the user's language of choice.
     */
    usri4_code_page : UInt32

    /**
     * Type: <b>PSID</b>
     * 
     * A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid">SID</a> structure that contains the security identifier (SID) that uniquely identifies the user. The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/nf-lmaccess-netuseradd">NetUserAdd</a> and 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/nf-lmaccess-netusersetinfo">NetUserSetInfo</a> functions ignore this member.
     */
    usri4_user_sid : PSID

    /**
     * Type: <b>DWORD</b>
     * 
     * The relative identifier (RID) of the Primary Global Group for the user. When you call the 
     * <b>NetUserAdd</b> function, this member must be DOMAIN_GROUP_RID_USERS (defined in WinNT.h). When you call 
     * <b>NetUserSetInfo</b>, this member must be the RID of a global group in which the user is enrolled. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/well-known-sids">Well-Known SIDs</a> and 
     * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/sid-components">SID Components</a>.
     */
    usri4_primary_group_id : UInt32

    /**
     * Type: <b>LPWSTR</b>
     * 
     * A pointer to a Unicode string that specifies a path to the user's profile. This value can be a <b>NULL</b> string, a local absolute path, or a UNC path.
     */
    usri4_profile : PWSTR

    /**
     * Type: <b>LPWSTR</b>
     * 
     * A pointer to a Unicode string that specifies the drive letter assigned to the user's home directory for logon purposes.
     */
    usri4_home_dir_drive : PWSTR

    /**
     * Type: <b>DWORD</b>
     * 
     * The password expiration information. 
     * 
     * 
     * 
     * 
     * The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/nf-lmaccess-netusergetinfo">NetUserGetInfo</a> function return zero if the password has not expired (and nonzero if it has).
     * 
     * When you call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/nf-lmaccess-netuseradd">NetUserAdd</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/nf-lmaccess-netusersetinfo">NetUserSetInfo</a>, specify a nonzero value in this member to inform users that they must change their password at the next logon. To turn off this message, call 
     * <b>NetUserSetInfo</b> and specify zero in this member. Note that you cannot specify zero to negate the expiration of a password that has already expired.
     */
    usri4_password_expired : UInt32

}
