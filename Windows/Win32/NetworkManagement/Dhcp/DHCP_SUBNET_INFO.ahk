#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk
#Include .\DHCP_HOST_INFO.ahk

/**
 * The DHCP_SUBNET_INFO structure defines information describing a subnet.
 * @see https://learn.microsoft.com/windows/win32/api/dhcpsapi/ns-dhcpsapi-dhcp_subnet_info
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 * @version v4.0.30319
 */
class DHCP_SUBNET_INFO extends Win32Struct
{
    static sizeof => 56

    static packingSize => 8

    /**
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dhcp/dhcp-server-management-type-definitions">DHCP_IP_ADDRESS</a> value that specifies the subnet ID.
     * @type {Integer}
     */
    SubnetAddress {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dhcp/dhcp-server-management-type-definitions">DHCP_IP_MASK</a> value that specifies the subnet IP mask.
     * @type {Integer}
     */
    SubnetMask {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Unicode string that specifies the network name of the subnet.
     * @type {PWSTR}
     */
    SubnetName{
        get {
            if(!this.HasProp("__SubnetName"))
                this.__SubnetName := PWSTR(this.ptr + 8)
            return this.__SubnetName
        }
    }

    /**
     * Unicode string that contains an optional comment particular to this subnet.
     * @type {PWSTR}
     */
    SubnetComment{
        get {
            if(!this.HasProp("__SubnetComment"))
                this.__SubnetComment := PWSTR(this.ptr + 16)
            return this.__SubnetComment
        }
    }

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_host_info">DHCP_HOST_INFO</a> structure that contains information about the DHCP server servicing this subnet.
     * @type {DHCP_HOST_INFO}
     */
    PrimaryHost{
        get {
            if(!this.HasProp("__PrimaryHost"))
                this.__PrimaryHost := DHCP_HOST_INFO(this.ptr + 24)
            return this.__PrimaryHost
        }
    }

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ne-dhcpsapi-dhcp_subnet_state">DHCP_SUBNET_STATE</a> enumeration value indicating the current state of the subnet (enabled/disabled).
     * @type {Integer}
     */
    SubnetState {
        get => NumGet(this, 48, "int")
        set => NumPut("int", value, this, 48)
    }
}
