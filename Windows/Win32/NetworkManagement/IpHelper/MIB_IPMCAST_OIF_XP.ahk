#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.IpHelper
 * @version v4.0.30319
 */
class MIB_IPMCAST_OIF_XP extends Win32Struct
{
    static sizeof => 16

    static packingSize => 4

    /**
     * @type {Integer}
     */
    dwOutIfIndex {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    dwNextHopAddr {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    dwReserved {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    dwReserved1 {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }
}
