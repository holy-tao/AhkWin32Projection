#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The SERVER_INFO_1016 structure contains information about whether the server is visible to other computers in the same network domain.
 * @see https://learn.microsoft.com/windows/win32/api/lmserver/ns-lmserver-server_info_1016
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 * @version v4.0.30319
 */
class SERVER_INFO_1016 extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * 
     * @type {Integer}
     */
    sv1016_hidden {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }
}
