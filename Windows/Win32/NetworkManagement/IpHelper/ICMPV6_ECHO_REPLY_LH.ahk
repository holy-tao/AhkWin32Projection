#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\IPV6_ADDRESS_EX.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.IpHelper
 * @version v4.0.30319
 */
class ICMPV6_ECHO_REPLY_LH extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * @type {IPV6_ADDRESS_EX}
     */
    Address{
        get {
            if(!this.HasProp("__Address"))
                this.__Address := IPV6_ADDRESS_EX(this.ptr + 0)
            return this.__Address
        }
    }

    /**
     * @type {Integer}
     */
    Status {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * @type {Integer}
     */
    RoundTripTime {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }
}
