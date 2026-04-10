#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\STORAGE_COUNTER.ahk
#Include .\STORAGE_COUNTER_TYPE.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 */
class STORAGE_COUNTERS extends Win32Struct {
    static sizeof => 32

    static packingSize => 8

    /**
     * @type {Integer}
     */
    Version {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Size {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    NumberOfCounters {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {STORAGE_COUNTER}
     */
    Counters {
        get {
            if(!this.HasProp("__CountersProxyArray"))
                this.__CountersProxyArray := Win32FixedArray(this.ptr + 16, 1, STORAGE_COUNTER, "")
            return this.__CountersProxyArray
        }
    }
}
