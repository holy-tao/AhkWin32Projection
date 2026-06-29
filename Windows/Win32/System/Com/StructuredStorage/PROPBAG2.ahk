#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Foundation\PWSTR.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\Variant\VARENUM.ahk

/**
 * @namespace Windows.Win32.System.Com.StructuredStorage
 */
class PROPBAG2 extends Win32Struct {
    static sizeof => 40

    static packingSize => 8

    /**
     * @type {Integer}
     */
    dwType {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {VARENUM}
     */
    vt {
        get => NumGet(this, 4, "ushort")
        set => NumPut("ushort", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    cfType {
        get => NumGet(this, 6, "ushort")
        set => NumPut("ushort", value, this, 6)
    }

    /**
     * @type {Integer}
     */
    dwHint {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {PWSTR}
     */
    pstrName {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Guid}
     */
    clsid {
        get {
            if(!this.HasProp("__clsid"))
                this.__clsid := Guid(24, this)
            return this.__clsid
        }
    }
}
