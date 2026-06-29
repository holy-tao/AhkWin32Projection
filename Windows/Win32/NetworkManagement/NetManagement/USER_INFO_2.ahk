#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\USER_PRIV.ahk" { USER_PRIV }
#Import ".\AF_OP.ahk" { AF_OP }
#Import ".\USER_ACCOUNT_FLAGS.ahk" { USER_ACCOUNT_FLAGS }

/**
 * The USER_INFO_2 structure contains information about a user account, including the account name, password data, privilege level, the path to the user's home directory, and other user-related network statistics.
 * @remarks
 * For more information about user and group account rights, see 
 * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/privileges">Privileges</a>.
 * 
 * User account names are limited to 20 characters and group names are limited to 256 characters. In addition, account names cannot be terminated by a period and they cannot include commas or any of the following printable characters: ", /, \, [, ], :, |, &lt;, &gt;, +, =, ;, ?, *. Names also cannot include characters in the range 1-31, which are nonprintable.
 * @see https://learn.microsoft.com/windows/win32/api/lmaccess/ns-lmaccess-user_info_2
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 */
export default struct USER_INFO_2 {
    #StructPack 8

    /**
     * Type: <b>LPWSTR</b>
     * 
     * A pointer to a Unicode string that specifies the name of the user account. Calls to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/nf-lmaccess-netusersetinfo">NetUserSetInfo</a> function ignore this member. For more information, see the following Remarks section.
     */
    usri2_name : PWSTR

    /**
     * Type: <b>LPWSTR</b>
     * 
     * A pointer to a Unicode string that specifies the password for the user identified by the <b>usri2_name</b> member. The length cannot exceed PWLEN bytes. The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/nf-lmaccess-netuserenum">NetUserEnum</a> and 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/nf-lmaccess-netusergetinfo">NetUserGetInfo</a> functions return a <b>NULL</b> pointer to maintain password security. 
     * 
     * 
     * 
     * 
     * By convention, the length of passwords is limited to LM20_PWLEN characters.
     */
    usri2_password : PWSTR

    /**
     * Type: <b>DWORD</b>
     * 
     * The number of seconds that have elapsed since the <b>usri2_password</b> member was last changed. The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/nf-lmaccess-netuseradd">NetUserAdd</a> and 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/nf-lmaccess-netusersetinfo">NetUserSetInfo</a> functions ignore this member.
     */
    usri2_password_age : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The level of privilege assigned to the <b>usri2_name</b> member. For calls to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/nf-lmaccess-netuseradd">NetUserAdd</a> function, this member must be USER_PRIV_USER. For the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/nf-lmaccess-netusersetinfo">NetUserSetInfo</a> function, this member must be the value returned by the 
     * <b>NetUserGetInfo</b> function or the
     */
    usri2_priv : USER_PRIV

    /**
     * Type: <b>LPWSTR</b>
     * 
     * A  pointer to a Unicode string specifying the path of the home directory for the user specified by the <b>usri2_name</b> member. The string can be <b>NULL</b>.
     */
    usri2_home_dir : PWSTR

    /**
     * Type: <b>LPWSTR</b>
     * 
     * A pointer to a Unicode string that contains a comment to associate with the user account. The string can be a <b>NULL</b> string, or it can have any number of characters before the terminating null character.
     */
    usri2_comment : PWSTR

    /**
     * Type: <b>DWORD</b>
     */
    usri2_flags : USER_ACCOUNT_FLAGS

    /**
     * Type: <b>LPWSTR</b>
     * 
     * A pointer to a Unicode string specifying the path for the user's logon script file. The script file can be a .CMD file, an .EXE file, or a .BAT file. The string can also be <b>NULL</b>.
     */
    usri2_script_path : PWSTR

    /**
     * Type: <b>DWORD</b>
     * 
     * The user's operator privileges. 
     * 
     * 
     * 
     * 
     * Calls to the 
     * <b>NetUserGetInfo</b> and 
     * <b>NetUserEnum</b> functions return a value based on the user's local group membership. If the user is a member of Print Operators, AF_OP_PRINT is set. If the user is a member of Server Operators, AF_OP_SERVER is set. If the user is a member of the Account Operators, AF_OP_ACCOUNTS is set. AF_OP_COMM is never set. For more information about user and group account rights, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/privileges">Privileges</a>.
     * 
     * The following restrictions apply:
     * 
     * <ul>
     * <li>When you call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/nf-lmaccess-netuseradd">NetUserAdd</a> function, this member must be zero.</li>
     * <li>When you call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/nf-lmaccess-netusersetinfo">NetUserSetInfo</a> function, this member must be the value returned from a call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/nf-lmaccess-netusergetinfo">NetUserGetInfo</a> or to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/nf-lmaccess-netuserenum">NetUserEnum</a>.</li>
     * </ul>
     */
    usri2_auth_flags : AF_OP

    /**
     * Type: <b>LPWSTR</b>
     * 
     * A pointer to a Unicode string that contains the full name of the user. This string can be a <b>NULL</b> string, or it can have any number of characters before the terminating null character.
     */
    usri2_full_name : PWSTR

    /**
     * Type: <b>LPWSTR</b>
     * 
     *  A pointer to a Unicode string that contains a user comment. This string can be a <b>NULL</b> string, or it can have any number of characters before the terminating null character.
     */
    usri2_usr_comment : PWSTR

    /**
     * Type: <b>LPWSTR</b>
     * 
     * A pointer to a Unicode string that is reserved for use by applications. This string can be a <b>NULL</b> string, or it can have any number of characters before the terminating null character. Microsoft products use this member to store user configuration information. Do not modify this information.
     */
    usri2_parms : PWSTR

    /**
     * Type: <b>LPWSTR</b>
     * 
     * > [!IMPORTANT]
     * > You should no longer use **usri2_workstations**. Instead, you can control sign-in access to workstations by configuring the User Rights Assignment settings (**Allow log on locally** and **Deny log on locally**, or **Allow log on through Remote Desktop Services** and **Deny log on through Remote Desktop Services**).
     * 
     * A pointer to a Unicode string that contains the names of workstations from which the user can log on. As many as eight workstations can be specified; the names must be separated by commas. A <b>NULL</b> string indicates that there is no restriction. To disable logons from all workstations to this account, set the UF_ACCOUNTDISABLE value in the <b>usri2_flags</b> member.
     */
    usri2_workstations : PWSTR

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
    usri2_last_logon : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * This member is currently not used.
     * 
     * Indicates when the last logoff occurred. This value is stored as the number of seconds that have elapsed since 00:00:00, January 1, 1970, GMT. A value of zero indicates that the last logoff time is unknown.
     * 
     * This member is maintained separately on each backup domain controller (BDC) in the domain. To obtain an accurate value, you must query each BDC in the domain. The last logoff occurred at the time indicated by the largest retrieved value.
     */
    usri2_last_logoff : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The date and time when the account expires. This value is stored as the number of seconds elapsed since 00:00:00, January 1, 1970, GMT. A value of TIMEQ_FOREVER indicates that the account never expires.
     */
    usri2_acct_expires : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The maximum amount of disk space the user can use. Specify USER_MAXSTORAGE_UNLIMITED to use all available disk space.
     */
    usri2_max_storage : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The number of equal-length time units into which the week is divided. This value is required to compute the length of the bit string in the <b>usri2_logon_hours</b> member. 
     * 
     * 
     * 
     * 
     * This value must be UNITS_PER_WEEK for LAN Manager 2.0. This element is ignored by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/nf-lmaccess-netuseradd">NetUserAdd</a> and 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/nf-lmaccess-netusersetinfo">NetUserSetInfo</a> functions.
     */
    usri2_units_per_week : UInt32

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
    usri2_logon_hours : IntPtr

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
    usri2_bad_pw_count : UInt32

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
    usri2_num_logons : UInt32

    /**
     * Type: <b>LPWSTR</b>
     * 
     * A pointer to a Unicode string that contains the name of the server to which logon requests are sent. Server names should be preceded by two backslashes (\\). To indicate that the logon request can be handled by any logon server, specify an asterisk (\\*) for the server name. A <b>NULL</b> string indicates that requests should be sent to the domain controller. 
     * 
     * 
     * 
     * 
     * For Windows servers, 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/nf-lmaccess-netusergetinfo">NetUserGetInfo</a> and 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/nf-lmaccess-netuserenum">NetUserEnum</a> return \\*. The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/nf-lmaccess-netuseradd">NetUserAdd</a> and 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/nf-lmaccess-netusersetinfo">NetUserSetInfo</a> functions ignore this member.
     */
    usri2_logon_server : PWSTR

    /**
     * Type: <b>DWORD</b>
     * 
     * The country/region code for the user's language of choice.
     */
    usri2_country_code : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The code page for the user's language of choice.
     */
    usri2_code_page : UInt32

}
