#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
class KS_DVDCOPY_BUSKEY extends Win32Struct {
    static sizeof => 6

    static packingSize => 1

    /**
     * @type {Array<Integer>}
     */
    BusKey {
        get {
            if(!this.HasProp("__BusKeyProxyArray"))
                this.__BusKeyProxyArray := Win32FixedArray(this.ptr + 0, 5, Primitive, "char")
            return this.__BusKeyProxyArray
        }
    }

    /**
     * @type {Array<Integer>}
     */
    Reserved {
        get {
            if(!this.HasProp("__ReservedProxyArray"))
                this.__ReservedProxyArray := Win32FixedArray(this.ptr + 5, 1, Primitive, "char")
            return this.__ReservedProxyArray
        }
    }
}
