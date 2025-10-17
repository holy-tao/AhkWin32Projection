#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\DHCP_IPV6_ADDRESS.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 * @version v4.0.30319
 */
class SCOPE_MIB_INFO_V6 extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * @type {DHCP_IPV6_ADDRESS}
     */
    Subnet{
        get {
            if(!this.HasProp("__Subnet"))
                this.__Subnet := DHCP_IPV6_ADDRESS(0, this)
            return this.__Subnet
        }
    }

    /**
     * @type {Integer}
     */
    NumAddressesInuse {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    NumAddressesFree {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    NumPendingAdvertises {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }
}
