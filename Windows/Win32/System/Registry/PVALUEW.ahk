#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * @namespace Windows.Win32.System.Registry
 * @version v4.0.30319
 * @charset Unicode
 */
class PVALUEW extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * @type {PWSTR}
     */
    pv_valuename{
        get {
            if(!this.HasProp("__pv_valuename"))
                this.__pv_valuename := PWSTR(this.ptr + 0)
            return this.__pv_valuename
        }
    }

    /**
     * @type {Integer}
     */
    pv_valuelen {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * @type {Pointer<Void>}
     */
    pv_value_context {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    pv_type {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }
}
