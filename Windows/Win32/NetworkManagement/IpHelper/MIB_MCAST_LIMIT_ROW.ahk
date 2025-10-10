#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The MIB_MCAST_LIMIT_ROW structure contains the configurable limit information from a corresponding MIB_IPMCAST_IF_ENTRY structure.
 * @see https://docs.microsoft.com/windows/win32/api//iprtrmib/ns-iprtrmib-mib_mcast_limit_row
 * @namespace Windows.Win32.NetworkManagement.IpHelper
 * @version v4.0.30319
 */
class MIB_MCAST_LIMIT_ROW extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * The time-to-live value for a multicast interface.
     * @type {Integer}
     */
    dwTtl {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The rate limit for a multicast interface.
     * @type {Integer}
     */
    dwRateLimit {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }
}
