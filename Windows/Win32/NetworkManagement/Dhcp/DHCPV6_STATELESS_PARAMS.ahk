#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * The DHCPV6_STATELESS_PARAMS structure defines the DHCPv6 stateless client inventory configuration settings at server and scope level.
 * @see https://learn.microsoft.com/windows/win32/api/dhcpsapi/ns-dhcpsapi-dhcpv6_stateless_params
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 */
export default struct DHCPV6_STATELESS_PARAMS {
    #StructPack 4

    /**
     * If <b>TRUE</b> the stateless client inventory is maintained by the DHCPv6 server. Otherwise, it is  <b>FALSE</b>. The default value is <b>FALSE</b>, which indicates that the stateless client inventory is disabled and is not maintained the by the server.
     */
    Status : BOOL

    /**
     * Integer that specifies the maximum time interval, in hours, that stateless IPv6 DHCP client lease records can persist before being deleted from the DHCP server database.
     */
    PurgeInterval : UInt32

}
