#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The DHCP_BOOTP_IP_RANGE structure defines a suite of IPs for lease to BOOTP-specific clients.
 * @see https://docs.microsoft.com/windows/win32/api//dhcpsapi/ns-dhcpsapi-dhcp_bootp_ip_range
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 * @version v4.0.30319
 */
class DHCP_BOOTP_IP_RANGE extends Win32Struct
{
    static sizeof => 16

    static packingSize => 4

    /**
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dhcp/dhcp-server-management-type-definitions">DHCP_IP_ADDRESS</a> value that specifies the start of the IP range used for BOOTP service.
     * @type {Integer}
     */
    StartAddress {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dhcp/dhcp-server-management-type-definitions">DHCP_IP_ADDRESS</a> value that specifies the end of the IP range used for BOOTP service.
     * @type {Integer}
     */
    EndAddress {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Specifies the number of BOOTP clients with addresses served from this range.
     * @type {Integer}
     */
    BootpAllocated {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Specifies the maximum number of BOOTP clients this range is allowed to serve.
     * @type {Integer}
     */
    MaxBootpAllowed {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }
}
