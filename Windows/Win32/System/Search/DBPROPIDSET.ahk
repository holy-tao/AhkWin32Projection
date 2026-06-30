#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * @namespace Windows.Win32.System.Search
 * @architecture X64, Arm64
 */
class DBPROPIDSET extends Win32Struct {
    static sizeof => 32

    static packingSize => 8

    /**
     * @type {Pointer<Integer>}
     */
    rgPropertyIDs {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    cPropertyIDs {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Guid}
     */
    guidPropertySet {
        get {
            if(!this.HasProp("__guidPropertySet"))
                this.__guidPropertySet := Guid(12, this)
            return this.__guidPropertySet
        }
    }
}
