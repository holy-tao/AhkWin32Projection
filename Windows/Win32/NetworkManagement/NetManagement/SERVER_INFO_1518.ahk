#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The SERVER_INFO_1518 structure specifies whether the server is visible to LAN Manager 2.x clients.
 * @see https://learn.microsoft.com/windows/win32/api/lmserver/ns-lmserver-server_info_1518
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 * @version v4.0.30319
 */
class SERVER_INFO_1518 extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * Specifies whether the server is visible to LAN Manager 2.<i>x</i> clients.
     * @type {Integer}
     */
    sv1518_lmannounce {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }
}
