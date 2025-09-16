#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

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
 * @version v4.0.30319
 */
class IPV6_ADDRESS_EX extends Win32Struct
{
    static sizeof => 28

    static packingSize => 4

    /**
     * The IPv6 port number in network byte order.
     * @type {Integer}
     */
    sin6_port {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * The IPv6 flowinfo value from the IPv6 header in network byte order.
     * @type {Integer}
     */
    sin6_flowinfo {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * The IPv6 address in network byte order.
     * @type {Array<UInt16>}
     */
    sin6_addr{
        get {
            if(!this.HasProp("__sin6_addrProxyArray"))
                this.__sin6_addrProxyArray := Win32FixedArray(this.ptr + 8, 8, Primitive, "ushort")
            return this.__sin6_addrProxyArray
        }
    }

    /**
     * The IPv6 scope ID in network byte order.
     * @type {Integer}
     */
    sin6_scope_id {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }
}
