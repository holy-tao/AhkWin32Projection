#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\QUERY_BAD_RANGES_INPUT_RANGE.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class QUERY_BAD_RANGES_INPUT extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    NumRanges {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Array<QUERY_BAD_RANGES_INPUT_RANGE>}
     */
    Ranges{
        get {
            if(!this.HasProp("__RangesProxyArray"))
                this.__RangesProxyArray := Win32FixedArray(this.ptr + 8, 1, QUERY_BAD_RANGES_INPUT_RANGE, "")
            return this.__RangesProxyArray
        }
    }
}
