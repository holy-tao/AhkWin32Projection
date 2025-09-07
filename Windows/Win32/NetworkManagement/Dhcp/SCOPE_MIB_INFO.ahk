#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Defines information about an available scope for use within returned DHCP-specific SNMP Management Information Block (MIB) data.
 * @see https://learn.microsoft.com/windows/win32/api/dhcpsapi/ns-dhcpsapi-scope_mib_info
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 * @version v4.0.30319
 */
class SCOPE_MIB_INFO extends Win32Struct
{
    static sizeof => 16

    static packingSize => 4

    /**
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dhcp/dhcp-server-management-type-definitions">DHCP_IP_ADDRESS</a> value that specifies the subnet mask for this scope.
     * @type {Integer}
     */
    Subnet {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Contains the number of IP addresses currently in use for this scope.
     * @type {Integer}
     */
    NumAddressesInuse {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Contains the number of IP addresses currently available for this scope.
     * @type {Integer}
     */
    NumAddressesFree {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Contains the number of IP addresses currently in the offer state for this scope.
     * @type {Integer}
     */
    NumPendingOffers {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }
}
