#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Stores an IPv6 address.
 * @remarks
 * The <b>IPV6_ADDRESS_EX</b> structure is a member of the 
 *      <a href="https://docs.microsoft.com/windows/desktop/api/ipexport/ns-ipexport-icmpv6_echo_reply_lh">ICMPV6_ECHO_REPLY</a> structure that is used by the 
 *      <a href="https://docs.microsoft.com/windows/desktop/api/icmpapi/nf-icmpapi-icmp6parsereplies">Icmp6ParseReplies</a> function. 
 * 
 * The <b>IPV6_ADDRESS_EX</b> structure is defined in public 
 *      header files included in the Microsoft Windows Software Development Kit (SDK), but this structure is used by the 
 *      <a href="https://docs.microsoft.com/windows/desktop/api/icmpapi/nf-icmpapi-icmp6parsereplies">Icmp6ParseReplies</a> function on 
 *      Windows XP and later. 
 * 
 * In the Windows SDK, the 
 *      <b>IPV6_ADDRESS_EX</b> is structure defined when compiling an 
 *      application if the target platform is Windows XP and later 
 *      (<c>NTDDI_VERSION &gt;= NTDDI_XP</c>, 
 *      <c>_WIN32_WINNT &gt;= 0x0501</c>, or 
 *      <c>WINVER &gt;= 0x0501</c>). When compiling an application if the target 
 *      platform is not Windows XP and later, the 
 *      <b>IPV6_ADDRESS_EX</b> structure is undefined.
 * 
 * This structure is defined in the Ipexport.h header file which is automatically included in the Iphlpapi.h 
 *      header file. The Ipexport.h header file should never be used directly.
 * @see https://learn.microsoft.com/windows/win32/api/ipexport/ns-ipexport-ipv6_address_ex
 * @namespace Windows.Win32.NetworkManagement.IpHelper
 */
export default struct IPV6_ADDRESS_EX {
    #StructPack 4

    /**
     * The IPv6 port number in network byte order.
     */
    sin6_port : UInt16

    /**
     * The IPv6 flowinfo value from the IPv6 header in network byte order.
     */
    sin6_flowinfo : UInt32

    /**
     * The IPv6 address in network byte order.
     */
    sin6_addr : UInt16[8]

    /**
     * The IPv6 scope ID in network byte order.
     */
    sin6_scope_id : UInt32

}
