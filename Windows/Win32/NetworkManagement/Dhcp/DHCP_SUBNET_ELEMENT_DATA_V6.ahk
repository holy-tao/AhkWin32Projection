#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains definitions for the elements of the IPv6 prefix, such as IPv6 reservation, IPv6 exclusion range, and IPv6 range.
 * @see https://learn.microsoft.com/windows/win32/api/dhcpsapi/ns-dhcpsapi-dhcp_subnet_element_data_v6
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 * @version v4.0.30319
 */
class DHCP_SUBNET_ELEMENT_DATA_V6 extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    class DHCP_SUBNET_ELEMENT_UNION_V6 extends Win32Struct {
        static sizeof => 32
        static packingSize => 8

        /**
         * @type {Pointer<DHCP_IP_RANGE_V6>}
         */
        IpRange {
            get => NumGet(this, 0, "ptr")
            set => NumPut("ptr", value, this, 0)
        }
    
        /**
         * @type {Pointer<DHCP_IP_RESERVATION_V6>}
         */
        ReservedIp {
            get => NumGet(this, 0, "ptr")
            set => NumPut("ptr", value, this, 0)
        }
    
        /**
         * @type {Pointer<DHCP_IP_RANGE_V6>}
         */
        ExcludeIpRange {
            get => NumGet(this, 0, "ptr")
            set => NumPut("ptr", value, this, 0)
        }
    
    }

    /**
     * Defines the set of possible prefix element types. This value is used to determine which of the values are chosen from the subsequent union element.
     * @type {Integer}
     */
    ElementType {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * A union of different IPv6 prefix element types. The value of this union is dependent on the <b>ElementType</b> member.
     * @type {DHCP_SUBNET_ELEMENT_UNION_V6}
     */
    Element{
        get {
            if(!this.HasProp("__Element"))
                this.__Element := %this.__Class%.DHCP_SUBNET_ELEMENT_UNION_V6(this.ptr + 8)
            return this.__Element
        }
    }
}
