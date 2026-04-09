#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\IMAGEHLP_MODULE64.ahk
#Include .\SYM_TYPE.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 */
class IMAGEHLP_MODULE64_EX extends Win32Struct {
    static sizeof => 1680

    static packingSize => 8

    /**
     * @type {IMAGEHLP_MODULE64}
     */
    Module {
        get {
            if(!this.HasProp("__Module"))
                this.__Module := IMAGEHLP_MODULE64(0, this)
            return this.__Module
        }
    }

    /**
     * @type {Integer}
     */
    RegionFlags {
        get => NumGet(this, 1672, "uint")
        set => NumPut("uint", value, this, 1672)
    }
}
