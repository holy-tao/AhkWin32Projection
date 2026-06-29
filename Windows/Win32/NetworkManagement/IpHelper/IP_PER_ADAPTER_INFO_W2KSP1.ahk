#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\IP_ADDRESS_STRING.ahk" { IP_ADDRESS_STRING }
#Import ".\IP_ADDR_STRING.ahk" { IP_ADDR_STRING }
#Import "..\..\Foundation\CHAR.ahk" { CHAR }

/**
 * The IP_PER_ADAPTER_INFO structure contains information specific to a particular adapter.
 * @remarks
 * APIPA enables automatic IP address configuration on networks without DHCP servers, using the IANA-reserved Class B network 169.254.0.0, with a subnet mask of 255.255.0.0. Clients send ARP messages to ensure the selected address is not currently in use. Clients auto-configured in this fashion continue to poll for a valid DHCP server every five minutes, and if found, the DHCP server configuration overrides all auto-configuration settings.
 * @see https://learn.microsoft.com/windows/win32/api/iptypes/ns-iptypes-ip_per_adapter_info_w2ksp1
 * @namespace Windows.Win32.NetworkManagement.IpHelper
 */
export default struct IP_PER_ADAPTER_INFO_W2KSP1 {
    #StructPack 8

    /**
     * Specifies whether IP address auto-configuration (APIPA) is enabled on this adapter. See Remarks.
     */
    AutoconfigEnabled : UInt32

    /**
     * Specifies whether this adapter's IP address is currently auto-configured by APIPA.
     */
    AutoconfigActive : UInt32

    /**
     * Reserved. Use the <b>DnsServerList</b> member to obtain the DNS servers for the local computer.
     */
    CurrentDnsServer : IP_ADDR_STRING.Ptr

    /**
     * A linked list of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/iptypes/ns-iptypes-ip_addr_string">IP_ADDR_STRING</a> structures that specify the set of DNS servers used by the local computer.
     */
    DnsServerList : IP_ADDR_STRING

}
