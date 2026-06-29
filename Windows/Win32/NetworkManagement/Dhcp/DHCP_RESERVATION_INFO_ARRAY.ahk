#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DHCP_IP_RESERVATION_INFO.ahk" { DHCP_IP_RESERVATION_INFO }

/**
 * The DHCP_RESERVATION_INFO_ARRAY structure defines an array of IPv4 reservations for DHCPv4 clients.
 * @see https://learn.microsoft.com/windows/win32/api/dhcpsapi/ns-dhcpsapi-dhcp_reservation_info_array
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 */
export default struct DHCP_RESERVATION_INFO_ARRAY {
    #StructPack 8

    /**
     * Integer that specifies the number of IPv4 client reservations in <b>Elements</b>.
     */
    NumElements : UInt32

    /**
     * Pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_ip_reservation_info">DHCP_IP_RESERVATION_INFO</a> structures that contain IPv4 client reservations.
     */
    Elements : IntPtr

}
