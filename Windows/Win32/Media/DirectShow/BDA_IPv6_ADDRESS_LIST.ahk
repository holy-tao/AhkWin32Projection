#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\BDA_IPv6_ADDRESS.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class BDA_IPv6_ADDRESS_LIST extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {Integer}
     */
    ulcAddresses {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Array<BDA_IPv6_ADDRESS>}
     */
    rgAddressl{
        get {
            if(!this.HasProp("__rgAddresslProxyArray"))
                this.__rgAddresslProxyArray := Win32FixedArray(this.ptr + 8, 8, BDA_IPv6_ADDRESS, "")
            return this.__rgAddresslProxyArray
        }
    }
}
