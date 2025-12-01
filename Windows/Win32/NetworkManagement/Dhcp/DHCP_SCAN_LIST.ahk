#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Defines a list of all desynchronized client lease IP address on a DHCPv4 server that must be fixed.
 * @see https://learn.microsoft.com/windows/win32/api/dhcpsapi/ns-dhcpsapi-dhcp_scan_list
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 * @version v4.0.30319
 */
class DHCP_SCAN_LIST extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Specifies the number of <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_scan_item">DHCP_SCAN_ITEM</a> structures listed in <i>ScanItems</i>.
     * @type {Integer}
     */
    NumScanItems {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Pointer to a list of <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_scan_item">DHCP_SCAN_ITEM</a> structures that contain the specific client IP addresses whose leases differed between the in-memory cache of client leases and the subnet client lease database during a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dhcpsapi/nf-dhcpsapi-dhcpscandatabase">DhcpScanDatabase</a> operation.
     * @type {Pointer<DHCP_SCAN_ITEM>}
     */
    ScanItems {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
