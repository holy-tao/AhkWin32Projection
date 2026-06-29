#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WTSSBX_ADDRESS_FAMILY.ahk" { WTSSBX_ADDRESS_FAMILY }

/**
 * Contains information about the IP address of a network resource.
 * @see https://learn.microsoft.com/windows/win32/api/tssbx/ns-tssbx-wtssbx_ip_address
 * @namespace Windows.Win32.System.RemoteDesktop
 */
export default struct WTSSBX_IP_ADDRESS {
    #StructPack 4

    /**
     * A value of the <a href="https://docs.microsoft.com/windows/win32/api/tssbx/ne-tssbx-wtssbx_address_family">WTSSBX_ADDRESS_FAMILY</a> enumeration type that indicates the address family of the network address.
     */
    AddressFamily : WTSSBX_ADDRESS_FAMILY

    /**
     * The network address of the resource.
     */
    Address : Int8[16]

    /**
     * The port number of the resource that is configured for Remote Desktop Protocol (RDP).
     */
    PortNumber : UInt16

    /**
     * The scope of the address. This member is used only for IPv6 addresses.
     */
    dwScope : UInt32

}
