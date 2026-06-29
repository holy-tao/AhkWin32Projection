#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\BIN_RANGE.ahk
#Include .\BIN_COUNT.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 */
class BIN_RESULTS extends Win32Struct {
    static sizeof => 32

    static packingSize => 8

    /**
     * @type {Integer}
     */
    NumberOfBins {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {BIN_COUNT}
     */
    BinCounts {
        get {
            if(!this.HasProp("__BinCountsProxyArray"))
                this.__BinCountsProxyArray := Win32FixedArray(this.ptr + 8, 1, BIN_COUNT, "")
            return this.__BinCountsProxyArray
        }
    }
}
