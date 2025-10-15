#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Foundation\PSTR.ahk

/**
 * @namespace Windows.Win32.AI.MachineLearning.WinML
 * @version v4.0.30319
 */
class MLOperatorAttribute extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {PSTR}
     */
    name{
        get {
            if(!this.HasProp("__name"))
                this.__name := PSTR(this.ptr + 0)
            return this.__name
        }
    }

    /**
     * @type {Integer}
     */
    type {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    required {
        get => NumGet(this, 12, "char")
        set => NumPut("char", value, this, 12)
    }
}
