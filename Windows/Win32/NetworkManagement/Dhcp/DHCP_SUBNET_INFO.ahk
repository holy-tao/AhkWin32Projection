#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\DHCP_HOST_INFO.ahk" { DHCP_HOST_INFO }
#Import ".\DHCP_SUBNET_STATE.ahk" { DHCP_SUBNET_STATE }

/**
 * The DHCP_SUBNET_INFO structure defines information describing a subnet.
 * @see https://learn.microsoft.com/windows/win32/api/dhcpsapi/ns-dhcpsapi-dhcp_subnet_info
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 */
export default struct DHCP_SUBNET_INFO {
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
     * Unicode string that specifies the network name of the subnet.
     */
    SubnetName : PWSTR

    /**
     * Unicode string that contains an optional comment particular to this subnet.
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

}
