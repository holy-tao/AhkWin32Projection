#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\USER_PRIV.ahk" { USER_PRIV }
#Import ".\USER_ACCOUNT_FLAGS.ahk" { USER_ACCOUNT_FLAGS }

/**
 * The USER_INFO_1 structure contains information about a user account, including account name, password data, privilege level, and the path to the user's home directory.
 * @remarks
 * User account names are limited to 20 characters and group names are limited to 256 characters. In addition, account names cannot be terminated by a period and they cannot include commas or any of the following printable characters: ", /, \, [, ], :, |, &lt;, &gt;, +, =, ;, ?, *. Names also cannot include characters in the range 1-31, which are nonprintable.
 * @see https://learn.microsoft.com/windows/win32/api/lmaccess/ns-lmaccess-user_info_1
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 */
export default struct USER_INFO_1 {
    #StructPack 8

    /**
     * Type: <b>LPWSTR</b>
     * 
     * A pointer to a Unicode string that specifies the name of the user account. For the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/nf-lmaccess-netusersetinfo">NetUserSetInfo</a> function, this member is ignored. For more information, see the following Remarks section.
     */
    usri1_name : PWSTR

    /**
     * Type: <b>LPWSTR</b>
     * 
     * A pointer to a Unicode string that specifies the password of the user indicated by the <b>usri1_name</b> member. The length cannot exceed PWLEN bytes. The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/nf-lmaccess-netuserenum">NetUserEnum</a> and 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/nf-lmaccess-netusergetinfo">NetUserGetInfo</a> functions return a <b>NULL</b> pointer to maintain password security. 
     * 
     * 
     * 
     * 
     * By convention, the length of passwords is limited to LM20_PWLEN characters.
     */
    usri1_password : PWSTR

    /**
     * Type: <b>DWORD</b>
     * 
     * The number of seconds that have elapsed since the <b>usri1_password</b> member was last changed. The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/nf-lmaccess-netuseradd">NetUserAdd</a> and 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/nf-lmaccess-netusersetinfo">NetUserSetInfo</a> functions ignore this member.
     */
    usri1_password_age : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The level of privilege assigned to the <b>usri1_name</b> member. When you call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/nf-lmaccess-netuseradd">NetUserAdd</a> function, this member must be USER_PRIV_USER. When you call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/nf-lmaccess-netusersetinfo">NetUserSetInfo</a> function, this member must be the value returned by the 
     * <b>NetUserGetInfo</b> function or the
     */
    usri1_priv : USER_PRIV

    /**
     * Type: <b>LPWSTR</b>
     * 
     * A pointer to a Unicode string specifying the path of the home directory for the user specified in the <b>usri1_name</b> member. The string can be <b>NULL</b>.
     */
    usri1_home_dir : PWSTR

    /**
     * Type: <b>LPWSTR</b>
     * 
     * A pointer to a Unicode string that contains a comment to associate with the user account. This string can be a <b>NULL</b> string, or it can have any number of characters before the terminating null character.
     */
    usri1_comment : PWSTR

    /**
     * Type: <b>DWORD</b>
     */
    usri1_flags : USER_ACCOUNT_FLAGS

    /**
     * Type: <b>LPWSTR</b>
     * 
     * A pointer to a Unicode string specifying the path for the user's logon script file. The script file can be a .CMD file, an .EXE file, or a .BAT file. The string can also be <b>NULL</b>.
     */
    usri1_script_path : PWSTR

}
