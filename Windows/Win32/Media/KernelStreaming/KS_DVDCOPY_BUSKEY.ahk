#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 * @version v4.0.30319
 */
class KS_DVDCOPY_BUSKEY extends Win32Struct
{
    static sizeof => 6

    static packingSize => 1

    /**
     * @type {Array<Byte>}
     */
    BusKey{
        get {
            if(!this.HasProp("__BusKeyProxyArray"))
                this.__BusKeyProxyArray := Win32FixedArray(this.ptr + 0, 1, Primitive, "char")
            return this.__BusKeyProxyArray
        }
    }

    /**
     * @type {Array<Byte>}
     */
    Reserved{
        get {
            if(!this.HasProp("__ReservedProxyArray"))
                this.__ReservedProxyArray := Win32FixedArray(this.ptr + 5, 1, Primitive, "char")
            return this.__ReservedProxyArray
        }
    }
}
