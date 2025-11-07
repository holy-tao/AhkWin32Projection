#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Specifies an IPv6 address and mask.
 * @remarks
 * 
 * The mask is specified by the width in bits. For
 * example, a prefixLength of 16 specifies a mask consisting of 16 1's followed
 * by 112 0's.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//fwptypes/ns-fwptypes-fwp_v6_addr_and_mask
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 * @version v4.0.30319
 */
class FWP_V6_ADDR_AND_MASK extends Win32Struct
{
    static sizeof => 17

    static packingSize => 1

    /**
     * An array of size <b>FWP_V6_ADDR_SIZE</b> bytes containing an IPv6 address. <b>FWP_V6_ADDR_SIZE</b> maps to 16.
     * @type {Array<Byte>}
     */
    addr{
        get {
            if(!this.HasProp("__addrProxyArray"))
                this.__addrProxyArray := Win32FixedArray(this.ptr + 0, 16, Primitive, "char")
            return this.__addrProxyArray
        }
    }

    /**
     * Value specifying the prefix length of the IPv6 address.
     * @type {Integer}
     */
    prefixLength {
        get => NumGet(this, 16, "char")
        set => NumPut("char", value, this, 16)
    }
}
