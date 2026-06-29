#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DHCP_IPV6_ADDRESS.ahk" { DHCP_IPV6_ADDRESS }

/**
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 */
export default struct DHCP_RESERVED_SCOPE6 {
    #StructPack 8

    ReservedIpAddress : DHCP_IPV6_ADDRESS

    ReservedIpSubnetAddress : DHCP_IPV6_ADDRESS

}
