#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DHCP_IPV6_ADDRESS.ahk" { DHCP_IPV6_ADDRESS }

/**
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 */
export default struct SCOPE_MIB_INFO_V6 {
    #StructPack 8

    Subnet : DHCP_IPV6_ADDRESS

    NumAddressesInuse : Int64

    NumAddressesFree : Int64

    NumPendingAdvertises : Int64

}
