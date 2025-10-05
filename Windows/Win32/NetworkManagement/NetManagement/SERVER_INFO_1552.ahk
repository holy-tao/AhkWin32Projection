#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The SERVER_INFO_1552 structure specifies the maximum time allowed for a link delay.
 * @see https://learn.microsoft.com/windows/win32/api/lmserver/ns-lmserver-server_info_1552
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 * @version v4.0.30319
 */
class SERVER_INFO_1552 extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * Specifies the maximum time allowed for a link delay, in seconds. If delays exceed this number, the server disables raw I/O for this connection.
     * @type {Integer}
     */
    sv1552_maxlinkdelay {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }
}
