#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Foundation\PSTR.ahk
#Include .\KERB_NET_ADDRESS.ahk

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class KERB_NET_ADDRESSES extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {Integer}
     */
    Number {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Array<KERB_NET_ADDRESS>}
     */
    Addresses{
        get {
            if(!this.HasProp("__AddressesProxyArray"))
                this.__AddressesProxyArray := Win32FixedArray(this.ptr + 8, 1, KERB_NET_ADDRESS, "")
            return this.__AddressesProxyArray
        }
    }
}
