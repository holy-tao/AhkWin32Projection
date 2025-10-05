#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The SERVER_INFO_1530 structure specifies the minimum number of available receive work items the server requires to begin processing a server message block.
 * @see https://learn.microsoft.com/windows/win32/api/lmserver/ns-lmserver-server_info_1530
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 * @version v4.0.30319
 */
class SERVER_INFO_1530 extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * Specifies the minimum number of available receive work items that the server requires to begin processing a server message block. A larger value for this member ensures that work items are available more frequently for nonblocking requests, but it also increases the likelihood that blocking requests will be rejected.
     * @type {Integer}
     */
    sv1530_minfreeworkitems {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }
}
