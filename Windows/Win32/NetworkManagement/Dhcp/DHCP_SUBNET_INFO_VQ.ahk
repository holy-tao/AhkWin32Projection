#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\DHCP_HOST_INFO.ahk" { DHCP_HOST_INFO }
#Import ".\DHCP_SUBNET_STATE.ahk" { DHCP_SUBNET_STATE }

/**
 * Defines information that describes a subnet.
 * @see https://learn.microsoft.com/windows/win32/api/dhcpsapi/ns-dhcpsapi-dhcp_subnet_info_vq
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 */
export default struct DHCP_SUBNET_INFO_VQ {
    #StructPack 8

    /**
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dhcp/dhcp-server-management-type-definitions">DHCP_IP_ADDRESS</a> value that specifies the subnet ID.
     */
    SubnetAddress : UInt32

    /**
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dhcp/dhcp-server-management-type-definitions">DHCP_IP_MASK</a> value that specifies the subnet IP mask.
     */
    SubnetMask : UInt32

    /**
     * Pointer to a Unicode string that specifies the network name of the subnet.
     */
    SubnetName : PWSTR

    /**
     * Pointer to a Unicode string that contains an optional comment particular to this subnet.
     */
    SubnetComment : PWSTR

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_host_info">DHCP_HOST_INFO</a> structure that contains information about the DHCP server servicing this subnet.
     */
    PrimaryHost : DHCP_HOST_INFO

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ne-dhcpsapi-dhcp_subnet_state">DHCP_SUBNET_STATE</a> enumeration value indicating the current state of the subnet (enabled/disabled).
     */
    SubnetState : DHCP_SUBNET_STATE

    /**
     * Integer value used as a BOOL to represent whether or not Quarantine is enabled for the subnet. If <b>TRUE</b> (0x00000001), Quarantine is turned ON on the DHCP server; if <b>FALSE</b> (0x00000000), it is turned OFF.
     */
    QuarantineOn : UInt32

    /**
     * Reserved for future use.
     */
    Reserved1 : UInt32

    /**
     * Reserved for future use.
     */
    Reserved2 : UInt32

    /**
     * Reserved for future use.
     */
    Reserved3 : Int64

    /**
     * Reserved for future use.
     */
    Reserved4 : Int64

}
