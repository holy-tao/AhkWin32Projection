#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.Dns
 * @version v4.0.30319
 */
class DNS_SVCB_PARAM_IPV4 extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * @type {Integer}
     */
    cIps {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * @type {Array<UInt32>}
     */
    rgIps{
        get {
            if(!this.HasProp("__rgIpsProxyArray"))
                this.__rgIpsProxyArray := Win32FixedArray(this.ptr + 4, 1, Primitive, "uint")
            return this.__rgIpsProxyArray
        }
    }
}
