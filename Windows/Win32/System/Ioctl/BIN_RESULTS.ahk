#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\BIN_RANGE.ahk
#Include .\BIN_COUNT.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class BIN_RESULTS extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {Integer}
     */
    NumberOfBins {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Array<BIN_COUNT>}
     */
    BinCounts{
        get {
            if(!this.HasProp("__BinCountsProxyArray"))
                this.__BinCountsProxyArray := Win32FixedArray(this.ptr + 8, 1, BIN_COUNT, "")
            return this.__BinCountsProxyArray
        }
    }
}
