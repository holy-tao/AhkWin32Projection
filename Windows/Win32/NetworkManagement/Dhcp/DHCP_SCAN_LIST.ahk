#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DHCP_SCAN_ITEM.ahk" { DHCP_SCAN_ITEM }

/**
 * Defines a list of all desynchronized client lease IP address on a DHCPv4 server that must be fixed.
 * @see https://learn.microsoft.com/windows/win32/api/dhcpsapi/ns-dhcpsapi-dhcp_scan_list
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 */
export default struct DHCP_SCAN_LIST {
    #StructPack 8

    /**
     * Specifies the number of <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_scan_item">DHCP_SCAN_ITEM</a> structures listed in <i>ScanItems</i>.
     */
    NumScanItems : UInt32

    /**
     * Pointer to a list of <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_scan_item">DHCP_SCAN_ITEM</a> structures that contain the specific client IP addresses whose leases differed between the in-memory cache of client leases and the subnet client lease database during a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dhcpsapi/nf-dhcpsapi-dhcpscandatabase">DhcpScanDatabase</a> operation.
     */
    ScanItems : DHCP_SCAN_ITEM.Ptr

}
