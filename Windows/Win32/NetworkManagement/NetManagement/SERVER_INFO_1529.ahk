#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The SERVER_INFO_1529 structure specifies the minimum number of free receive work items the server requires before it begins allocating more items.
 * @see https://learn.microsoft.com/windows/win32/api/lmserver/ns-lmserver-server_info_1529
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 * @version v4.0.30319
 */
class SERVER_INFO_1529 extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * Specifies the minimum number of free receive work items the server requires before it begins allocating more. A larger value for this member helps ensure that there will always be work items available, but a value that is too large is inefficient.
     * @type {Integer}
     */
    sv1529_minrcvqueue {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }
}
