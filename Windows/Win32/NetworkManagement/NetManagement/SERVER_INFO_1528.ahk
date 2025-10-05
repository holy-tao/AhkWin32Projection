#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The SERVER_INFO_1528 structure specifies the period of time that the scavenger remains idle before waking up to service requests.
 * @see https://learn.microsoft.com/windows/win32/api/lmserver/ns-lmserver-server_info_1528
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 * @version v4.0.30319
 */
class SERVER_INFO_1528 extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * Specifies the period of time, in seconds, that the scavenger remains idle before waking up to service requests. A smaller value for this member improves the response of the server to various events but costs CPU cycles.
     * @type {Integer}
     */
    sv1528_scavtimeout {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }
}
