#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\BDA_IPv6_ADDRESS.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow
 */
class BDA_IPv6_ADDRESS_LIST extends Win32Struct {
    static sizeof => 12

    static packingSize => 4

    /**
     * @type {Integer}
     */
    ulcAddresses {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {BDA_IPv6_ADDRESS}
     */
    rgAddressl {
        get {
            if(!this.HasProp("__rgAddresslProxyArray"))
                this.__rgAddresslProxyArray := Win32FixedArray(this.ptr + 4, 1, BDA_IPv6_ADDRESS, "")
            return this.__rgAddresslProxyArray
        }
    }
}
