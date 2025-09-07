#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Stores information for a Proxy Address Resolution Protocol (PARP) entry.
 * @see https://learn.microsoft.com/windows/win32/api/iprtrmib/ns-iprtrmib-mib_proxyarp
 * @namespace Windows.Win32.NetworkManagement.IpHelper
 * @version v4.0.30319
 */
class MIB_PROXYARP extends Win32Struct
{
    static sizeof => 12

    static packingSize => 4

    /**
     * The IPv4 address for which to act as a proxy.
     * @type {Integer}
     */
    dwAddress {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The subnet mask for the IPv4 address specified by the <b>dwAddress</b> member.
     * @type {Integer}
     */
    dwMask {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * The index of the interface on which to act as a proxy for the address specified by the <b>dwAddress</b> member.
     * @type {Integer}
     */
    dwIfIndex {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}
