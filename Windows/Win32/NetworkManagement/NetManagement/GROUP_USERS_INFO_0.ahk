#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * The GROUP_USERS_INFO_0 structure contains global group member information.
 * @remarks
 * If you are calling the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/nf-lmaccess-netgroupgetusers">NetGroupGetUsers</a> function or the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/nf-lmaccess-netgroupsetusers">NetGroupSetUsers</a> function, the <b>grui0_name</b> member contains the name of a user that is a member of the specified group.
 * 
 * If you are calling the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/nf-lmaccess-netusergetgroups">NetUserGetGroups</a> function or the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/nf-lmaccess-netusersetgroups">NetUserSetGroups</a> function, the <b>grui0_name</b> member contains the name of a global group to which the specified user belongs. 
 * 
 * User account names are limited to 20 characters and group names are limited to 256 characters. In addition, account names cannot be terminated by a period and they cannot include commas or any of the following printable characters: ", /, \, [, ], :, |, &lt;, &gt;, +, =, ;, ?, *. Names also cannot include characters in the range 1-31, which are nonprintable.
 * @see https://learn.microsoft.com/windows/win32/api/lmaccess/ns-lmaccess-group_users_info_0
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 */
export default struct GROUP_USERS_INFO_0 {
    #StructPack 8

    /**
     * A pointer to a null-terminated Unicode character string that specifies a name. For more information, see the Remarks section.
     */
    grui0_name : PWSTR

}
