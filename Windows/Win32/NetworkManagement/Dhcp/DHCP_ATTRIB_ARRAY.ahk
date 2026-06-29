#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DHCP_ATTRIB.ahk" { DHCP_ATTRIB }

/**
 * Defines a set of DHCP server attributes.
 * @see https://learn.microsoft.com/windows/win32/api/dhcpsapi/ns-dhcpsapi-dhcp_attrib_array
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 */
export default struct DHCP_ATTRIB_ARRAY {
    #StructPack 8

    /**
     * Specifies the number of attributes listed in <b>DhcpAttribs</b>.
     */
    NumElements : UInt32

    /**
     * Pointer to a list of <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_attrib">DHCP_ATTRIB</a> structures that contain the DHCP server attributes.
     */
    DhcpAttribs : DHCP_ATTRIB.Ptr

}
