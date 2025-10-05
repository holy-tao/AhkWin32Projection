#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The SERVER_INFO_1536 structure specifies whether the server allows clients to use opportunistic locks (oplocks) on files.
 * @see https://learn.microsoft.com/windows/win32/api/lmserver/ns-lmserver-server_info_1536
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 * @version v4.0.30319
 */
class SERVER_INFO_1536 extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * Specifies whether the server allows clients to use oplocks on files. Opportunistic locks are a significant performance enhancement, but have the potential to cause lost cached data on some networks, particularly wide-area networks.
     * @type {Integer}
     */
    sv1536_enableoplocks {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }
}
