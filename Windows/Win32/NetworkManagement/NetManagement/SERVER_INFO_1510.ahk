#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The SERVER_INFO_1510 structure specifies the maximum number of users that can be logged on to the specified server using a single virtual circuit.
 * @see https://docs.microsoft.com/windows/win32/api//lmserver/ns-lmserver-server_info_1510
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 * @version v4.0.30319
 */
class SERVER_INFO_1510 extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * Specifies the maximum number of users that can be logged on to a server using a single virtual circuit.
     * @type {Integer}
     */
    sv1510_sessusers {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }
}
