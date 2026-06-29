#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DHCP_SCAN_FLAG.ahk" { DHCP_SCAN_FLAG }

/**
 * The DHCP_SCAN_ITEM structure defines a desynchronized client lease address stored on a DHCPv4 server, and the location in which it should be fixed (in-memory cache or database).
 * @see https://learn.microsoft.com/windows/win32/api/dhcpsapi/ns-dhcpsapi-dhcp_scan_item
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 */
export default struct DHCP_SCAN_ITEM {
    #StructPack 4

    /**
     * DHCP_IP_ADDRESS value that specifies the address whose lease status was changed during a scan operation.
     */
    IpAddress : UInt32

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ne-dhcpsapi-dhcp_scan_flag">DHCP_SCAN_FLAG</a> enumeration value that indicates whether the supplied client lease IP address will be fixed in the DHCPv4 server's  in-memory client lease cache or the client lease database proper.
     */
    ScanFlag : DHCP_SCAN_FLAG

}
