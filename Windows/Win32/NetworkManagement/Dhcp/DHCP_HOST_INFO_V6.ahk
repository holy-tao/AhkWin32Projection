#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\DHCP_IPV6_ADDRESS.ahk

/**
 * Contains network information about a DHCPv6 server (host), such as its IPv6 address and name.
 * @remarks
 * 
  * When this structure is populated by the DHCP Server, the <b>HostName</b> and <b>NetBiosName</b> members may be set to <b>NULL</b>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//dhcpsapi/ns-dhcpsapi-dhcp_host_info_v6
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 * @version v4.0.30319
 */
class DHCP_HOST_INFO_V6 extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_ipv6_address">DHCP_IPV6_ADDRESS</a> structure that contains the IPv6 address of the DHCPv6 server.
     * @type {DHCP_IPV6_ADDRESS}
     */
    IpAddress{
        get {
            if(!this.HasProp("__IpAddress"))
                this.__IpAddress := DHCP_IPV6_ADDRESS(this.ptr + 0)
            return this.__IpAddress
        }
    }

    /**
     * Pointer to a Unicode string that contains the NetBIOS name of the DHCPv6 server.
     * @type {Pointer<Char>}
     */
    NetBiosName {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Pointer to a Unicode string that contains the network name of the DHCPv6 server.
     * @type {Pointer<Char>}
     */
    HostName {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }
}
