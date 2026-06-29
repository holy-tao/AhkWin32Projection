#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DHCP_IP_RANGE.ahk" { DHCP_IP_RANGE }

/**
 * The DHCP_IP_RANGE_ARRAY structure defines an array of DHCP IPv4 ranges.
 * @see https://learn.microsoft.com/windows/win32/api/dhcpsapi/ns-dhcpsapi-dhcp_ip_range_array
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 */
export default struct DHCP_IP_RANGE_ARRAY {
    #StructPack 8

    /**
     * Integer that specifies the number of DHCP IPv4 ranges in <b>Elements.</b>
     */
    NumElements : UInt32

    /**
     * Pointer to a list of <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_ip_range">DHCP_IP_RANGE</a>  structures.
     */
    Elements : DHCP_IP_RANGE.Ptr

}
