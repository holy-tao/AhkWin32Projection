#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The DHCP_RESERVED_SCOPE structure defines a reserved DHCP scope.
 * @see https://learn.microsoft.com/windows/win32/api/dhcpsapi/ns-dhcpsapi-dhcp_reserved_scope
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 * @version v4.0.30319
 */
class DHCP_RESERVED_SCOPE extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dhcp/dhcp-server-management-type-definitions">DHCP_IP_ADDRESS</a> value that contains an IP address used to identify the reservation.
     * @type {Integer}
     */
    ReservedIpAddress {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dhcp/dhcp-server-management-type-definitions">DHCP_IP_ADDRESS</a> value that specifies the subnet ID of the subnet containing the reservation.
     * @type {Integer}
     */
    ReservedIpSubnetAddress {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }
}
