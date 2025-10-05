#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The SERVER_INFO_1506 structure contains information about the maximum number of work items the specified server can allocate.
 * @see https://learn.microsoft.com/windows/win32/api/lmserver/ns-lmserver-server_info_1506
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 * @version v4.0.30319
 */
class SERVER_INFO_1506 extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * Specifies the maximum number of receive buffers, or work items, the server can allocate. If this limit is reached, the transport protocol must initiate flow control at a significant cost to performance.
     * @type {Integer}
     */
    sv1506_maxworkitems {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }
}
