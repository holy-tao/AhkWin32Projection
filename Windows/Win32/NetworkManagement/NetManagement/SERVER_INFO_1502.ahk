#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The SERVER_INFO_1502 structure specifies the maximum number of virtual circuits per client for the specified server.
 * @see https://learn.microsoft.com/windows/win32/api/lmserver/ns-lmserver-server_info_1502
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 * @version v4.0.30319
 */
class SERVER_INFO_1502 extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * Specifies the maximum number of virtual circuits permitted per client.
     * @type {Integer}
     */
    sv1502_sessvcs {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }
}
