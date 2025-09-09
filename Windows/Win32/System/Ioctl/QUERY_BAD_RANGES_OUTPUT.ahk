#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\QUERY_BAD_RANGES_OUTPUT_RANGE.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class QUERY_BAD_RANGES_OUTPUT extends Win32Struct
{
    static sizeof => 24

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
    NumBadRanges {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    NextOffsetToLookUp {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Array<QUERY_BAD_RANGES_OUTPUT_RANGE>}
     */
    BadRanges{
        get {
            if(!this.HasProp("__BadRangesProxyArray"))
                this.__BadRangesProxyArray := Win32FixedArray(this.ptr + 16, 1, QUERY_BAD_RANGES_OUTPUT_RANGE, "")
            return this.__BadRangesProxyArray
        }
    }
}
