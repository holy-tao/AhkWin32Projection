#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Foundation\PSTR.ahk

/**
 * @namespace Windows.Win32.AI.MachineLearning.WinML
 * @version v4.0.30319
 */
class MLOperatorSetId extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {PSTR}
     */
    domain{
        get {
            if(!this.HasProp("__domain"))
                this.__domain := PSTR(this.ptr + 0)
            return this.__domain
        }
    }

    /**
     * @type {Integer}
     */
    version {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }
}
