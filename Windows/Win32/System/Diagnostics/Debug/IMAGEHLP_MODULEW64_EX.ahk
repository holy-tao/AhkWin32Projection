#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\IMAGEHLP_MODULEW64.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @version v4.0.30319
 */
class IMAGEHLP_MODULEW64_EX extends Win32Struct
{
    static sizeof => 3264

    static packingSize => 8

    /**
     * @type {IMAGEHLP_MODULEW64}
     */
    Module{
        get {
            if(!this.HasProp("__Module"))
                this.__Module := IMAGEHLP_MODULEW64(0, this)
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
