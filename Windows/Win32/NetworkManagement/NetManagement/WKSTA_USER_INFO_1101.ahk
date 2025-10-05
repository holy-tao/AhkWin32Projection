#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The WKSTA_USER_INFO_1101 structure contains information about the domains accessed by a workstation.
 * @see https://learn.microsoft.com/windows/win32/api/lmwksta/ns-lmwksta-wksta_user_info_1101
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 * @version v4.0.30319
 */
class WKSTA_USER_INFO_1101 extends Win32Struct
{
    static sizeof => 8

    static packingSize => 8

    /**
     * Specifies the list of operating system domains browsed by the workstation. The domain names are separated by blanks.
     * 
     * This string is Unicode if  <b>_WIN32_WINNT</b> or <b>FORCE_UNICODE</b> are defined.
     * @type {Pointer<Char>}
     */
    wkui1101_oth_domains {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }
}
