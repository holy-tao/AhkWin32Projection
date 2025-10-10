#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The USER_INFO_1053 structure contains user information for network accounts. This information level is valid only when you call the NetUserSetInfo function.
 * @see https://docs.microsoft.com/windows/win32/api//lmaccess/ns-lmaccess-user_info_1053
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 * @version v4.0.30319
 */
class USER_INFO_1053 extends Win32Struct
{
    static sizeof => 8

    static packingSize => 8

    /**
     * Specifies the drive letter to assign to the user's home directory for logon purposes. The user is specified in the <i>username</i> parameter to the 
     * <b>NetUserSetInfo</b> function.
     * @type {Pointer<Char>}
     */
    usri1053_home_dir_drive {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }
}
