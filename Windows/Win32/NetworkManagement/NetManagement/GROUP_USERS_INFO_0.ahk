#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The GROUP_USERS_INFO_0 structure contains global group member information.
 * @remarks
 * 
  * If you are calling the 
  * <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/nf-lmaccess-netgroupgetusers">NetGroupGetUsers</a> function or the 
  * <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/nf-lmaccess-netgroupsetusers">NetGroupSetUsers</a> function, the <b>grui0_name</b> member contains the name of a user that is a member of the specified group.
  * 
  * If you are calling the 
  * <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/nf-lmaccess-netusergetgroups">NetUserGetGroups</a> function or the 
  * <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/nf-lmaccess-netusersetgroups">NetUserSetGroups</a> function, the <b>grui0_name</b> member contains the name of a global group to which the specified user belongs. 
  * 
  * User account names are limited to 20 characters and group names are limited to 256 characters. In addition, account names cannot be terminated by a period and they cannot include commas or any of the following printable characters: ", /, \, [, ], :, |, &lt;, &gt;, +, =, ;, ?, *. Names also cannot include characters in the range 1-31, which are nonprintable.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//lmaccess/ns-lmaccess-group_users_info_0
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 * @version v4.0.30319
 */
class GROUP_USERS_INFO_0 extends Win32Struct
{
    static sizeof => 8

    static packingSize => 8

    /**
     * A pointer to a null-terminated Unicode character string that specifies a name. For more information, see the Remarks section.
     * @type {PWSTR}
     */
    grui0_name {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }
}
