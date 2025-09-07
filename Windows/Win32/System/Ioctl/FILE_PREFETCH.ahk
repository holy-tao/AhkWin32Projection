#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class FILE_PREFETCH extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {Integer}
     */
    Type {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Count {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Array<UInt64>}
     */
    Prefetch{
        get {
            if(!this.HasProp("__PrefetchProxyArray"))
                this.__PrefetchProxyArray := Win32FixedArray(this.ptr + 8, 8, Primitive, "uint")
            return this.__PrefetchProxyArray
        }
    }
}
