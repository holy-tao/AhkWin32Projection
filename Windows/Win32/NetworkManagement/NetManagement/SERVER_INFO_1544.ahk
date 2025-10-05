#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The SERVER_INFO_1544 structure specifies the initial number of tree connections to be allocated in the connection table.
 * @see https://learn.microsoft.com/windows/win32/api/lmserver/ns-lmserver-server_info_1544
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 * @version v4.0.30319
 */
class SERVER_INFO_1544 extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * Specifies the initial number of tree connections to be allocated in the connection table. The server automatically increases the table as necessary, so setting the member to a higher value is an optimization.
     * @type {Integer}
     */
    sv1544_initconntable {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }
}
