#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\IP_ADDRESS_STRING.ahk
#Include .\IP_ADDR_STRING.ahk

/**
 * The IP_PER_ADAPTER_INFO structure contains information specific to a particular adapter.
 * @remarks
 * APIPA enables automatic IP address configuration on networks without DHCP servers, using the IANA-reserved Class B network 169.254.0.0, with a subnet mask of 255.255.0.0. Clients send ARP messages to ensure the selected address is not currently in use. Clients auto-configured in this fashion continue to poll for a valid DHCP server every five minutes, and if found, the DHCP server configuration overrides all auto-configuration settings.
 * @see https://learn.microsoft.com/windows/win32/api/iptypes/ns-iptypes-ip_per_adapter_info_w2ksp1
 * @namespace Windows.Win32.NetworkManagement.IpHelper
 * @version v4.0.30319
 */
class IP_PER_ADAPTER_INFO_W2KSP1 extends Win32Struct
{
    static sizeof => 96

    static packingSize => 8

    /**
     * Specifies whether IP address auto-configuration (APIPA) is enabled on this adapter. See Remarks.
     * @type {Integer}
     */
    AutoconfigEnabled {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Specifies whether this adapter's IP address is currently auto-configured by APIPA.
     * @type {Integer}
     */
    AutoconfigActive {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Reserved. Use the <b>DnsServerList</b> member to obtain the DNS servers for the local computer.
     * @type {Pointer<IP_ADDR_STRING>}
     */
    CurrentDnsServer {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * A linked list of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/iptypes/ns-iptypes-ip_addr_string">IP_ADDR_STRING</a> structures that specify the set of DNS servers used by the local computer.
     * @type {IP_ADDR_STRING}
     */
    DnsServerList{
        get {
            if(!this.HasProp("__DnsServerList"))
                this.__DnsServerList := IP_ADDR_STRING(this.ptr + 16)
            return this.__DnsServerList
        }
    }
}
