#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\DHCP_IPV6_ADDRESS.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 * @version v4.0.30319
 */
class DHCP_RESERVED_SCOPE6 extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * @type {DHCP_IPV6_ADDRESS}
     */
    ReservedIpAddress{
        get {
            if(!this.HasProp("__ReservedIpAddress"))
                this.__ReservedIpAddress := DHCP_IPV6_ADDRESS(0, this)
            return this.__ReservedIpAddress
        }
    }

    /**
     * @type {DHCP_IPV6_ADDRESS}
     */
    ReservedIpSubnetAddress{
        get {
            if(!this.HasProp("__ReservedIpSubnetAddress"))
                this.__ReservedIpSubnetAddress := DHCP_IPV6_ADDRESS(16, this)
            return this.__ReservedIpSubnetAddress
        }
    }
}
