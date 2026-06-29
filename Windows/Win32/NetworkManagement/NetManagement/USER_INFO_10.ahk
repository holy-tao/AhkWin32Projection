#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * The USER_INFO_10 structure contains information about a user account, including the account name, comments associated with the account, and the user's full name.
 * @remarks
 * User account names are limited to 20 characters and group names are limited to 256 characters. In addition, account names cannot be terminated by a period and they cannot include commas or any of the following printable characters: ", /, \, [, ], :, |, &lt;, &gt;, +, =, ;, ?, *. Names also cannot include characters in the range 1-31, which are nonprintable.
 * @see https://learn.microsoft.com/windows/win32/api/lmaccess/ns-lmaccess-user_info_10
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 */
export default struct USER_INFO_10 {
    #StructPack 8

    /**
     * Pointer to a Unicode string that specifies the name of the user account. Calls to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/nf-lmaccess-netusersetinfo">NetUserSetInfo</a> function ignore this member. For more information, see the following Remarks section.
     */
    usri10_name : PWSTR

    /**
     * Pointer to a Unicode string that contains a comment associated with the user account. The string can be a null string, or can have any number of characters before the terminating null character.
     */
    usri10_comment : PWSTR

    /**
     * Pointer to a Unicode string that contains a user comment. This string can be a null string, or it can have any number of characters before the terminating null character.
     */
    usri10_usr_comment : PWSTR

    /**
     * Pointer to a Unicode string that contains the full name of the user. This string can be a null string, or it can have any number of characters before the terminating null character.
     */
    usri10_full_name : PWSTR

}
