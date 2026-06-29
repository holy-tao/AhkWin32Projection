#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DHCPV6_BIND_ELEMENT.ahk" { DHCPV6_BIND_ELEMENT }

/**
 * Specifies an array of DHCPV6_BIND_ELEMENT structures that contain DHCPv6 interface bindings.
 * @see https://learn.microsoft.com/windows/win32/api/dhcpsapi/ns-dhcpsapi-dhcpv6_bind_element_array
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 */
export default struct DHCPV6_BIND_ELEMENT_ARRAY {
    #StructPack 8

    /**
     * Integer that contains the total number of elements in the array pointed to by <b>Elements</b>.
     */
    NumElements : UInt32

    /**
     * Pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcpv6_bind_element">DHCPV6_BIND_ELEMENT</a> structures that contains the DHCPv6 interface bindings.
     */
    Elements : DHCPV6_BIND_ELEMENT.Ptr

}
