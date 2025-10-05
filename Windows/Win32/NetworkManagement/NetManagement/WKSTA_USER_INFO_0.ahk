#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The WKSTA_USER_INFO_0 structure contains the name of the user on a specified workstation.
 * @see https://learn.microsoft.com/windows/win32/api/lmwksta/ns-lmwksta-wksta_user_info_0
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 * @version v4.0.30319
 */
class WKSTA_USER_INFO_0 extends Win32Struct
{
    static sizeof => 8

    static packingSize => 8

    /**
     * Specifies the name of the user currently logged on to the workstation.
     * 
     * This string is Unicode if  <b>_WIN32_WINNT</b> or <b>FORCE_UNICODE</b> are defined.
     * @type {Pointer<Char>}
     */
    wkui0_username {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }
}
