#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\IMAGEHLP_MODULE64.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @version v4.0.30319
 */
class IMAGEHLP_MODULE64_EX extends Win32Struct
{
    static sizeof => 3264

    static packingSize => 8

    /**
     * @type {IMAGEHLP_MODULE64}
     */
    Module{
        get {
            if(!this.HasProp("__Module"))
                this.__Module := IMAGEHLP_MODULE64(this.ptr + 0)
            return this.__Module
        }
    }

    /**
     * @type {Integer}
     */
    RegionFlags {
        get => NumGet(this, 3256, "uint")
        set => NumPut("uint", value, this, 3256)
    }
}
