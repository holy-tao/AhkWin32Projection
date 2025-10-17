#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The LOCALGROUP_USERS_INFO_0 structure contains local group member information.
 * @remarks
 * 
  * User account names are limited to 20 characters and group names are limited to 256 characters. In addition, account names cannot be terminated by a period and they cannot include commas or any of the following printable characters: ", /, \, [, ], :, |, &lt;, &gt;, +, =, ;, ?, *. Names also cannot include characters in the range 1-31, which are nonprintable.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//lmaccess/ns-lmaccess-localgroup_users_info_0
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 * @version v4.0.30319
 */
class LOCALGROUP_USERS_INFO_0 extends Win32Struct
{
    static sizeof => 8

    static packingSize => 8

    /**
     * Pointer to a Unicode string specifying the name of a local group to which the user belongs.
     * @type {PWSTR}
     */
    lgrui0_name {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }
}
