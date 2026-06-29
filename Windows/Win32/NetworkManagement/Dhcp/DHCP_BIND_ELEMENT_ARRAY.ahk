#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DHCP_BIND_ELEMENT.ahk" { DHCP_BIND_ELEMENT }

/**
 * The DHCP_BIND_ELEMENT_ARRAY structure defines an array of network binding elements used by a DHCP server.
 * @see https://learn.microsoft.com/windows/win32/api/dhcpsapi/ns-dhcpsapi-dhcp_bind_element_array
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 */
export default struct DHCP_BIND_ELEMENT_ARRAY {
    #StructPack 8

    /**
     * Specifies the number of network binding elements listed in <i>Elements</i>.
     */
    NumElements : UInt32

    /**
     * Specifies an array of <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_bind_element">DHCP_BIND_ELEMENT</a> structures
     */
    Elements : DHCP_BIND_ELEMENT.Ptr

}
