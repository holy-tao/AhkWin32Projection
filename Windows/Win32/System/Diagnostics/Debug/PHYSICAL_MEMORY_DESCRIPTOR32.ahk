#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\PHYSICAL_MEMORY_RUN32.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 */
class PHYSICAL_MEMORY_DESCRIPTOR32 extends Win32Struct {
    static sizeof => 16

    static packingSize => 4

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
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {PHYSICAL_MEMORY_RUN32}
     */
    Run {
        get {
            if(!this.HasProp("__RunProxyArray"))
                this.__RunProxyArray := Win32FixedArray(this.ptr + 8, 1, PHYSICAL_MEMORY_RUN32, "")
            return this.__RunProxyArray
        }
    }
}
