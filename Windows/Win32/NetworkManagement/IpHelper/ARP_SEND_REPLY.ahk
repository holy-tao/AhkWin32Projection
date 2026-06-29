#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The ARP_SEND_REPLY structure stores information about an Address Resolution Protocol (ARP) reply messages.
 * @see https://learn.microsoft.com/windows/win32/api/ipexport/ns-ipexport-arp_send_reply
 * @namespace Windows.Win32.NetworkManagement.IpHelper
 */
export default struct ARP_SEND_REPLY {
    #StructPack 4

    /**
     * The destination  IPv4 address to which the ARP message is sent, in the form of an <a href="https://docs.microsoft.com/windows/desktop/api/inaddr/ns-inaddr-in_addr">IPAddr</a> structure.
     */
    DestAddress : UInt32

    /**
     * The source IPv4 address from which the ARP message is being transmitted, in the form of an <a href="https://docs.microsoft.com/windows/desktop/api/inaddr/ns-inaddr-in_addr">IPAddr</a> structure.
     */
    SrcAddress : UInt32

}
