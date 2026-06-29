#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DHCP_BINARY_DATA.ahk" { DHCP_BINARY_DATA }

/**
 * The DHCP_IP_RESERVATION structure defines a client IP reservation.
 * @see https://learn.microsoft.com/windows/win32/api/dhcpsapi/ns-dhcpsapi-dhcp_ip_reservation
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 */
export default struct DHCP_IP_RESERVATION {
    #StructPack 8

    /**
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dhcp/dhcp-server-management-type-definitions">DHCP_IP_ADDRESS</a> value that contains the reserved IP address.
     */
    ReservedIpAddress : UInt32

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_binary_data">DHCP_CLIENT_UID</a> structure that contains information on the client holding this IP reservation.
     */
    ReservedForClient : DHCP_BINARY_DATA.Ptr

}
