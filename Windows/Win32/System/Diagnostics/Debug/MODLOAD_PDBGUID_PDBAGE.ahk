#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 */
class MODLOAD_PDBGUID_PDBAGE extends Win32Struct {
    static sizeof => 20

    static packingSize => 4

    /**
     * @type {Guid}
     */
    PdbGuid {
        get {
            if(!this.HasProp("__PdbGuid"))
                this.__PdbGuid := Guid(0, this)
            return this.__PdbGuid
        }
    }

    /**
     * @type {Integer}
     */
    PdbAge {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }
}
