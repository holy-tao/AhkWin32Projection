#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains information about a specific DHCP scope.
 * @see https://docs.microsoft.com/windows/win32/api//dhcpsapi/ns-dhcpsapi-scope_mib_info_v5
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 * @version v4.0.30319
 */
class SCOPE_MIB_INFO_V5 extends Win32Struct
{
    static sizeof => 16

    static packingSize => 4

    /**
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dhcp/dhcp-server-management-type-definitions">DHCP_IP_ADDRESS</a> value that contains the IP address of the subnet gateway that defines the scope.
     * @type {Integer}
     */
    Subnet {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The number of IP addresses in the scope that are currently assigned to DHCP clients.
     * @type {Integer}
     */
    NumAddressesInuse {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * The number of IP addresses in the scope that are not currently  assigned to DHCP clients.
     * @type {Integer}
     */
    NumAddressesFree {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * The number of IP addresses in the scope that have been offered to DHCP clients but have not yet received REQUEST messages.
     * @type {Integer}
     */
    NumPendingOffers {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }
}
