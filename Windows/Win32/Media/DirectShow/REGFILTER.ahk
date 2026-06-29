#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow
 */
class REGFILTER extends Win32Struct {
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {Guid}
     */
    Clsid {
        get {
            if(!this.HasProp("__Clsid"))
                this.__Clsid := Guid(0, this)
            return this.__Clsid
        }
    }

    /**
     * @type {PWSTR}
     */
    Name {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }
}
