#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The ARP_SEND_REPLY structure stores information about an Address Resolution Protocol (ARP) reply messages.
 * @see https://learn.microsoft.com/windows/win32/api/ipexport/ns-ipexport-arp_send_reply
 * @namespace Windows.Win32.NetworkManagement.IpHelper
 * @version v4.0.30319
 */
class ARP_SEND_REPLY extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * The destination  IPv4 address to which the ARP message is sent, in the form of an <a href="https://docs.microsoft.com/windows/desktop/api/inaddr/ns-inaddr-in_addr">IPAddr</a> structure.
     * @type {Integer}
     */
    DestAddress {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The source IPv4 address from which the ARP message is being transmitted, in the form of an <a href="https://docs.microsoft.com/windows/desktop/api/inaddr/ns-inaddr-in_addr">IPAddr</a> structure.
     * @type {Integer}
     */
    SrcAddress {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }
}
