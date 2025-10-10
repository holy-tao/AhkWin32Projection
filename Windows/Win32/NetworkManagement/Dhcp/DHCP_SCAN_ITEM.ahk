#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The DHCP_SCAN_ITEM structure defines a desynchronized client lease address stored on a DHCPv4 server, and the location in which it should be fixed (in-memory cache or database).
 * @see https://docs.microsoft.com/windows/win32/api//dhcpsapi/ns-dhcpsapi-dhcp_scan_item
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 * @version v4.0.30319
 */
class DHCP_SCAN_ITEM extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * DHCP_IP_ADDRESS value that specifies the address whose lease status was changed during a scan operation.
     * @type {Integer}
     */
    IpAddress {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ne-dhcpsapi-dhcp_scan_flag">DHCP_SCAN_FLAG</a>enumeration value that indicates whether the supplied client lease IP address will be fixed in the DHCPv4 server's  in-memory client lease cache or the client lease database proper.
     * @type {Integer}
     */
    ScanFlag {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }
}
