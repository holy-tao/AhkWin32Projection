#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The USER_INFO_1005 structure contains a privilege level to assign to a user network account. This information level is valid only when you call the NetUserSetInfo function.
 * @see https://learn.microsoft.com/windows/win32/api/lmaccess/ns-lmaccess-user_info_1005
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 * @version v4.0.30319
 */
class USER_INFO_1005 extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * Specifies a <b>DWORD</b> value that indicates the level of privilege to assign for the user account specified in the <i>username</i> parameter to the
     * @type {Integer}
     */
    usri1005_priv {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }
}
