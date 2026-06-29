#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The DHCP_IP_ARRAY structure defines an array of IP addresses.
 * @see https://learn.microsoft.com/windows/win32/api/dhcpsapi/ns-dhcpsapi-dhcp_ip_array
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 */
export default struct DHCP_IP_ARRAY {
    #StructPack 8

    /**
     * Specifies the number of IP addresses in <b>Elements</b>.
     */
    NumElements : UInt32

    /**
     * Pointer to a list of <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dhcp/dhcp-server-management-type-definitions">DHCP_IP_ADDRESS</a> values.
     */
    Elements : IntPtr

}
