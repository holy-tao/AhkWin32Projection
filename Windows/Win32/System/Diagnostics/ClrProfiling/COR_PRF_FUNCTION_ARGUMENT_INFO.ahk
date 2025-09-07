#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\COR_PRF_FUNCTION_ARGUMENT_RANGE.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.ClrProfiling
 * @version v4.0.30319
 */
class COR_PRF_FUNCTION_ARGUMENT_INFO extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {Integer}
     */
    numRanges {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    totalArgumentSize {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Array<COR_PRF_FUNCTION_ARGUMENT_RANGE>}
     */
    ranges{
        get {
            if(!this.HasProp("__rangesProxyArray"))
                this.__rangesProxyArray := Win32FixedArray(this.ptr + 8, 8, COR_PRF_FUNCTION_ARGUMENT_RANGE, "")
            return this.__rangesProxyArray
        }
    }
}
