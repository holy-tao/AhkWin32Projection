#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\DEVICE_STORAGE_RANGE_ATTRIBUTES.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 */
class DEVICE_DSM_RANGE_ERROR_INFO extends Win32Struct {
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
    Flags {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    TotalNumberOfRanges {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    NumberOfRangesReturned {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * @type {DEVICE_STORAGE_RANGE_ATTRIBUTES}
     */
    Ranges {
        get {
            if(!this.HasProp("__RangesProxyArray"))
                this.__RangesProxyArray := Win32FixedArray(this.ptr + 16, 1, DEVICE_STORAGE_RANGE_ATTRIBUTES, "")
            return this.__RangesProxyArray
        }
    }
}
