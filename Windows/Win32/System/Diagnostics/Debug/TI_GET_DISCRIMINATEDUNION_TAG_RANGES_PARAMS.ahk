#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\DISCRIMINATEDUNION_TAG_VALUE.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @version v4.0.30319
 */
class TI_GET_DISCRIMINATEDUNION_TAG_RANGES_PARAMS extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {Integer}
     */
    Count {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Start {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Array<DISCRIMINATEDUNION_TAG_VALUE>}
     */
    Range{
        get {
            if(!this.HasProp("__RangeProxyArray"))
                this.__RangeProxyArray := Win32FixedArray(this.ptr + 8, 1, DISCRIMINATEDUNION_TAG_VALUE, "")
            return this.__RangeProxyArray
        }
    }
}
