#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.IpHelper
 * @version v4.0.30319
 */
class MIBICMPSTATS_EX_XPSP1 extends Win32Struct
{
    static sizeof => 1032

    static packingSize => 4

    /**
     * @type {Integer}
     */
    dwMsgs {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    dwErrors {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Array<UInt32>}
     */
    rgdwTypeCount{
        get {
            if(!this.HasProp("__rgdwTypeCountProxyArray"))
                this.__rgdwTypeCountProxyArray := Win32FixedArray(this.ptr + 8, 256, Primitive, "uint")
            return this.__rgdwTypeCountProxyArray
        }
    }
}
