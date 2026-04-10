#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\BIN_RANGE.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 */
class PERF_BIN extends Win32Struct {
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {Integer}
     */
    NumberOfBins {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    TypeOfBin {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {BIN_RANGE}
     */
    BinsRanges {
        get {
            if(!this.HasProp("__BinsRangesProxyArray"))
                this.__BinsRangesProxyArray := Win32FixedArray(this.ptr + 8, 1, BIN_RANGE, "")
            return this.__BinsRangesProxyArray
        }
    }
}
