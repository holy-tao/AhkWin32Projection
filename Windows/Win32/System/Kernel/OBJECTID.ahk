#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * @namespace Windows.Win32.System.Kernel
 */
class OBJECTID extends Win32Struct {
    static sizeof => 20

    static packingSize => 4

    /**
     * @type {Guid}
     */
    Lineage {
        get {
            if(!this.HasProp("__Lineage"))
                this.__Lineage := Guid(0, this)
            return this.__Lineage
        }
    }

    /**
     * @type {Integer}
     */
    Uniquifier {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }
}
