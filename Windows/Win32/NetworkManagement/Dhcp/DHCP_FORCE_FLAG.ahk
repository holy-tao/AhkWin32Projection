#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The DHCP_FORCE_FLAG enumeration defines the set of flags describing the force level of a DHCP subnet element deletion operation.
 * @see https://learn.microsoft.com/windows/win32/api/dhcpsapi/ne-dhcpsapi-dhcp_force_flag
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 * @version v4.0.30319
 */
class DHCP_FORCE_FLAG extends Win32Enum{

    /**
     * The operation deletes all client records affected by the element, and then deletes the element.
     * @type {Integer (Int32)}
     */
    static DhcpFullForce => 0

    /**
     * The operation only deletes the subnet element, leaving intact any client records impacted by the change.
     * @type {Integer (Int32)}
     */
    static DhcpNoForce => 1

    /**
     * The operation deletes all client records affected by the element, and then deletes the element from the DHCP server. But it does not delete any registered DNS records associated with the deleted client records from the DNS server. This flag is only valid when passed to <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dhcpsapi/nf-dhcpsapi-dhcpdeletesubnet">DhcpDeleteSubnet</a>. Note that the minimum server OS requirement for this value is Windows Server 2012 R2 with KB 3100473 installed.
     * @type {Integer (Int32)}
     */
    static DhcpFailoverForce => 2
}
