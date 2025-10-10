#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Defines an element that describes a feature or restriction of a subnet.
 * @see https://docs.microsoft.com/windows/win32/api//dhcpsapi/ns-dhcpsapi-dhcp_subnet_element_data_v4
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 * @version v4.0.30319
 */
class DHCP_SUBNET_ELEMENT_DATA_V4 extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    class DHCP_SUBNET_ELEMENT_UNION_V4 extends Win32Struct {
        static sizeof => 48
        static packingSize => 8

        /**
         * @type {Pointer<DHCP_IP_RANGE>}
         */
        IpRange {
            get => NumGet(this, 0, "ptr")
            set => NumPut("ptr", value, this, 0)
        }
    
        /**
         * @type {Pointer<DHCP_HOST_INFO>}
         */
        SecondaryHost {
            get => NumGet(this, 0, "ptr")
            set => NumPut("ptr", value, this, 0)
        }
    
        /**
         * @type {Pointer<DHCP_IP_RESERVATION_V4>}
         */
        ReservedIp {
            get => NumGet(this, 0, "ptr")
            set => NumPut("ptr", value, this, 0)
        }
    
        /**
         * @type {Pointer<DHCP_IP_RANGE>}
         */
        ExcludeIpRange {
            get => NumGet(this, 0, "ptr")
            set => NumPut("ptr", value, this, 0)
        }
    
        /**
         * @type {Pointer<DHCP_IP_CLUSTER>}
         */
        IpUsedCluster {
            get => NumGet(this, 0, "ptr")
            set => NumPut("ptr", value, this, 0)
        }
    
    }

    /**
     * <a href="https://docs.microsoft.com/windows/win32/api/dhcpsapi/ne-dhcpsapi-dhcp_subnet_element_type">DHCP_SUBNET_ELEMENT_TYPE</a> enumeration value describing the type of element in the subsequent field.
     * @type {Integer}
     */
    ElementType {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * 
     * @type {DHCP_SUBNET_ELEMENT_UNION_V4}
     */
    Element{
        get {
            if(!this.HasProp("__Element"))
                this.__Element := %this.__Class%.DHCP_SUBNET_ELEMENT_UNION_V4(this.ptr + 8)
            return this.__Element
        }
    }
}
