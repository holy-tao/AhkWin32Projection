#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Struct.ahk
#Include ..\..\..\Guid.ahk

/**
 * @namespace Windows.Win32.Foundation
 */
class DEVPROPKEY extends Win32Struct {
    static sizeof => 20

    static packingSize => 4

    /**
     * @type {Guid}
     */
    fmtid {
        get {
            if(!this.HasProp("__fmtid"))
                this.__fmtid := Guid(0, this)
            return this.__fmtid
        }
    }

    /**
     * @type {Integer}
     */
    pid {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }
}
