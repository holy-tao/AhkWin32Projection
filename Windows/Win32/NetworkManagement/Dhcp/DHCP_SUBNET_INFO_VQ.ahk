#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\DHCP_HOST_INFO.ahk

/**
 * Defines information that describes a subnet.
 * @see https://docs.microsoft.com/windows/win32/api//dhcpsapi/ns-dhcpsapi-dhcp_subnet_info_vq
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 * @version v4.0.30319
 */
class DHCP_SUBNET_INFO_VQ extends Win32Struct
{
    static sizeof => 80

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
     * Pointer to a Unicode string that specifies the network name of the subnet.
     * @type {Pointer<Char>}
     */
    SubnetName {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Pointer to a Unicode string that contains an optional comment particular to this subnet.
     * @type {Pointer<Char>}
     */
    SubnetComment {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
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

    /**
     * Integer value used as a BOOL to represent whether or not Quarantine is enabled for the subnet. If <b>TRUE</b> (0x00000001), Quarantine is turned ON on the DHCP server; if <b>FALSE</b> (0x00000000), it is turned OFF.
     * @type {Integer}
     */
    QuarantineOn {
        get => NumGet(this, 52, "uint")
        set => NumPut("uint", value, this, 52)
    }

    /**
     * Reserved for future use.
     * @type {Integer}
     */
    Reserved1 {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * Reserved for future use.
     * @type {Integer}
     */
    Reserved2 {
        get => NumGet(this, 60, "uint")
        set => NumPut("uint", value, this, 60)
    }

    /**
     * Reserved for future use.
     * @type {Integer}
     */
    Reserved3 {
        get => NumGet(this, 64, "int64")
        set => NumPut("int64", value, this, 64)
    }

    /**
     * Reserved for future use.
     * @type {Integer}
     */
    Reserved4 {
        get => NumGet(this, 72, "int64")
        set => NumPut("int64", value, this, 72)
    }
}
