#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The USER_INFO_1008 structure contains a set of bit flags defining several user network account parameters. This information level is valid only when you call the NetUserSetInfo function.
 * @see https://learn.microsoft.com/windows/win32/api/lmaccess/ns-lmaccess-user_info_1008
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 * @version v4.0.30319
 */
class USER_INFO_1008 extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * The features to associate with the user account specified in the <i>username</i> parameter to the
     * @type {Integer}
     */
    usri1008_flags {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }
}
