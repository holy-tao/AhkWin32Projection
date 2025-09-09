#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\PHYSICAL_MEMORY_RUN64.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @version v4.0.30319
 */
class PHYSICAL_MEMORY_DESCRIPTOR64 extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {Integer}
     */
    NumberOfRuns {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    NumberOfPages {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Array<PHYSICAL_MEMORY_RUN64>}
     */
    Run{
        get {
            if(!this.HasProp("__RunProxyArray"))
                this.__RunProxyArray := Win32FixedArray(this.ptr + 16, 1, PHYSICAL_MEMORY_RUN64, "")
            return this.__RunProxyArray
        }
    }
}
