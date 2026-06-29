#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DHCP_IP_CLUSTER.ahk" { DHCP_IP_CLUSTER }
#Import ".\DHCP_BOOTP_IP_RANGE.ahk" { DHCP_BOOTP_IP_RANGE }
#Import ".\DHCP_SUBNET_ELEMENT_TYPE.ahk" { DHCP_SUBNET_ELEMENT_TYPE }
#Import ".\DHCP_IP_RESERVATION_V4.ahk" { DHCP_IP_RESERVATION_V4 }
#Import ".\DHCP_IP_RANGE.ahk" { DHCP_IP_RANGE }
#Import ".\DHCP_HOST_INFO.ahk" { DHCP_HOST_INFO }

/**
 * The DHCP_SUBNET_ELEMENT_DATA_V5 structure defines an element that describes a feature or restriction of a subnet.
 * @see https://learn.microsoft.com/windows/win32/api/dhcpsapi/ns-dhcpsapi-dhcp_subnet_element_data_v5
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 */
export default struct DHCP_SUBNET_ELEMENT_DATA_V5 {
    #StructPack 8


    struct _DHCP_SUBNET_ELEMENT_UNION_V5 {
        IpRange : DHCP_BOOTP_IP_RANGE.Ptr

        static __New() {
            DefineProp(this.Prototype, 'SecondaryHost', { type: DHCP_HOST_INFO.Ptr, offset: 0 })
            DefineProp(this.Prototype, 'ReservedIp', { type: DHCP_IP_RESERVATION_V4.Ptr, offset: 0 })
            DefineProp(this.Prototype, 'ExcludeIpRange', { type: DHCP_IP_RANGE.Ptr, offset: 0 })
            DefineProp(this.Prototype, 'IpUsedCluster', { type: DHCP_IP_CLUSTER.Ptr, offset: 0 })
            this.DeleteProp("__New")
        }
    }

    /**
     * <a href="https://docs.microsoft.com/windows/win32/api/dhcpsapi/ne-dhcpsapi-dhcp_subnet_element_type">DHCP_SUBNET_ELEMENT_TYPE</a> enumeration value describing the type of element in the subsequent field.
     */
    ElementType : DHCP_SUBNET_ELEMENT_TYPE

    Element : DHCP_SUBNET_ELEMENT_DATA_V5._DHCP_SUBNET_ELEMENT_UNION_V5

}
