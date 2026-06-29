#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DHCP_IP_RESERVATION_V6.ahk" { DHCP_IP_RESERVATION_V6 }
#Import ".\DHCP_IP_RANGE_V6.ahk" { DHCP_IP_RANGE_V6 }
#Import ".\DHCP_SUBNET_ELEMENT_TYPE_V6.ahk" { DHCP_SUBNET_ELEMENT_TYPE_V6 }

/**
 * Contains definitions for the elements of the IPv6 prefix, such as IPv6 reservation, IPv6 exclusion range, and IPv6 range.
 * @see https://learn.microsoft.com/windows/win32/api/dhcpsapi/ns-dhcpsapi-dhcp_subnet_element_data_v6
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 */
export default struct DHCP_SUBNET_ELEMENT_DATA_V6 {
    #StructPack 8


    struct DHCP_SUBNET_ELEMENT_UNION_V6 {
        IpRange : DHCP_IP_RANGE_V6.Ptr

        static __New() {
            DefineProp(this.Prototype, 'ReservedIp', { type: DHCP_IP_RESERVATION_V6.Ptr, offset: 0 })
            DefineProp(this.Prototype, 'ExcludeIpRange', { type: DHCP_IP_RANGE_V6.Ptr, offset: 0 })
            this.DeleteProp("__New")
        }
    }

    /**
     * Defines the set of possible prefix element types. This value is used to determine which of the values are chosen from the subsequent union element.
     */
    ElementType : DHCP_SUBNET_ELEMENT_TYPE_V6

    /**
     * A union of different IPv6 prefix element types. The value of this union is dependent on the <b>ElementType</b> member.
     */
    Element : DHCP_SUBNET_ELEMENT_DATA_V6.DHCP_SUBNET_ELEMENT_UNION_V6

}
