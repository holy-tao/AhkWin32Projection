#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DHCPV4_FAILOVER_CLIENT_INFO.ahk" { DHCPV4_FAILOVER_CLIENT_INFO }

/**
 * The DHCPV4_FAILOVER_CLIENT_INFO_ARRAY structure defines an array of DHCP server scope statistics that are part of a failover relationship.
 * @see https://learn.microsoft.com/windows/win32/api/dhcpsapi/ns-dhcpsapi-dhcpv4_failover_client_info_array
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 */
export default struct DHCPV4_FAILOVER_CLIENT_INFO_ARRAY {
    #StructPack 8

    /**
     * Integer that specifies the number of DHCP server scope statistics in <b>Clients</b>.
     */
    NumElements : UInt32

    /**
     * Pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcpv4_failover_client_info">DHCPV4_FAILOVER_CLIENT_INFO</a>  structures.
     */
    Clients : IntPtr

}
