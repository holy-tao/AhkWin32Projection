#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DHCPDS_SERVER.ahk" { DHCPDS_SERVER }

/**
 * The DHCPDS_SERVERS structure defines a list of DHCP servers in the context of directory services.
 * @see https://learn.microsoft.com/windows/win32/api/dhcpsapi/ns-dhcpsapi-dhcpds_servers
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 */
export default struct DHCPDS_SERVERS {
    #StructPack 8

    /**
     * Reserved. This value should be 0.
     */
    Flags : UInt32

    /**
     * Specifies the number of elements in <b>Servers</b>.
     */
    NumElements : UInt32

    /**
     * Pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcpds_server">DHCPDS_SERVER</a> structures that contain information on individual DHCP servers.
     */
    Servers : DHCPDS_SERVER.Ptr

}
